import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/Models/http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _tokenDur;
  String? _userId;
  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_tokenDur != null &&
        _tokenDur!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> authenticate(
      String email, String password, String urlSegment) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyB2BbHhhhAolL0zXOcMlfQEIBu3CyA6Pqs';

    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = jsonDecode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']["message"]);
      }
      print(response.body);
      debugPrint(responseData.toString());
      print(responseData['expiresIn']);
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _tokenDur = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    return authenticate(email, password, 'signInWithPassword');
  }

  Future<void> signUp(String email, String password) async {
    return authenticate(email, password, 'signUp');
  }
}
