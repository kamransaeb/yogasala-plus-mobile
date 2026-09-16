import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

/// A module for Firebase dependencies.
@module
abstract class FirebaseModule {
  /// The Firebase Auth instance.
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
