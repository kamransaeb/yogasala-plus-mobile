import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

/// A module for Firebase dependencies.
@module
abstract class FirebaseModule {
  @lazySingleton
  /// The Firebase Auth instance.
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
