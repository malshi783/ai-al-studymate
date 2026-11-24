import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../core/navigation/auth_router_refresh.dart';

class AuthService extends ChangeNotifier {
  AuthService({FirebaseAuth? firebaseAuth})
    : _auth = firebaseAuth ?? FirebaseAuth.instance {
    _subscription = _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
      AuthRouterRefresh.refresh();
    });
    _user = _auth.currentUser;
  }

  final FirebaseAuth _auth;
  StreamSubscription<User?>? _subscription;
  User? _user;

  User? get currentUser => _user;
  String? get uid => _user?.uid;
  bool get isSignedIn => _user != null;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
