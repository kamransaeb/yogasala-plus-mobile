import 'dart:async';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

/// Params for [UploadProfileImageUseCase].
class UploadProfileImageParams extends Equatable {
  /// Creates params.
  const UploadProfileImageParams({
    required this.bytes,
    required this.fileName,
    required this.contentType,
  });

  /// Image bytes to upload.
  final List<int> bytes;

  /// Original / display file name (sanitized before upload).
  final String fileName;

  /// MIME type for the object.
  final String contentType;

  @override
  List<Object?> get props => [fileName, contentType, bytes.length];
}

/// Uploads a profile image to Firebase Storage and returns its download URL.
@injectable
class UploadProfileImageUseCase
    extends BaseUseCase<String, UploadProfileImageParams> {
  /// Creates an [UploadProfileImageUseCase].
  UploadProfileImageUseCase(this._storage, this._auth, this._errorHandler);

  final FirebaseStorage _storage;
  final FirebaseAuth _auth;
  final ErrorHandler _errorHandler;

  /// Allowed image extensions.
  static const allowedExtensions = {'jpg', 'jpeg', 'png', 'webp', 'gif'};

  static const _uploadTimeout = Duration(seconds: 60);

  /// Resolves a MIME type from [fileName] or [extension].
  static String? contentTypeFor({
    String? fileName,
    String? extension,
  }) {
    final fromName = fileName != null && fileName.contains('.')
        ? fileName.split('.').last
        : '';
    final ext = (extension ?? fromName).toLowerCase();
    return switch (ext) {
      'jpg' || 'jpeg' => 'image/jpeg',
      'png' => 'image/png',
      'webp' => 'image/webp',
      'gif' => 'image/gif',
      _ => null,
    };
  }

  @override
  FutureOr<Either<Failure, String>> call(
    UploadProfileImageParams params,
  ) async {
    try {
      if (params.bytes.isEmpty) {
        return Left(
          _errorHandler.handleError(
            StateError('Empty image bytes'),
            reason: 'uploadProfileImage',
          ),
        );
      }
      if (_auth.currentUser == null) {
        return Left(
          _errorHandler.handleError(
            StateError('Not signed in to Firebase'),
            reason: 'uploadProfileImage',
          ),
        );
      }
      // Refresh token so Storage requests include a valid auth header.
      await _auth.currentUser!.getIdToken(true);

      final safeName = params.fileName.replaceAll(
        RegExp(r'[^a-zA-Z0-9._-]'),
        '_',
      );
      final uid = _auth.currentUser!.uid;
      final path =
          'mobile/users/$uid/profile/'
          '${DateTime.now().millisecondsSinceEpoch}_$safeName';
      final ref = _storage.ref(path);
      final data = params.bytes is Uint8List
          ? params.bytes as Uint8List
          : Uint8List.fromList(params.bytes);

      await ref
          .putData(
            data,
            SettableMetadata(contentType: params.contentType),
          )
          .timeout(_uploadTimeout);
      final url = await ref.getDownloadURL().timeout(_uploadTimeout);
      return Right(url);
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'uploadProfileImage',
        ),
      );
    }
  }
}
