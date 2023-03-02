import 'package:adopt_app/models/users.dart';
import 'package:adopt_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";
  late User user;

  void logout() {
    token = "";
    notifyListeners();
  }

  void signup(User user) async {
    token = await AuthServices().signup(user: user);
    print("you have benn signed up with token$token");
    notifyListeners();
  }

  void signin(User user) async {
    token = await AuthServices().signin(user: user);
    print(token);
  }

  bool get isAuth {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      user = User.fromJson(Jwt.parseJwt(token));
      return true;
    }
    return false;
  }
}
