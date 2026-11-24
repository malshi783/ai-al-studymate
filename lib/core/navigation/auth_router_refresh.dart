import 'package:flutter/foundation.dart';

class AuthRouterRefresh extends ChangeNotifier {
  AuthRouterRefresh._();

  static final AuthRouterRefresh instance = AuthRouterRefresh._();

  static void refresh() => instance.notifyListeners();
}
