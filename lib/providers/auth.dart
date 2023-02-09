import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/Models/http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _tokenDur;
  String? _userId;
  String? _refreshToken;
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

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _refreshToken = responseData['refreshToken'];
      _tokenDur = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      final prefs = await SharedPreferences.getInstance();
      final userData = jsonEncode({
        'token': _token,
        'userID': _userId,
        'refreshToken': _refreshToken,
        'expiryDate': _tokenDur!.toIso8601String(),
      });
      prefs.setString('userData', userData);
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

  Future<bool> stayLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final userData = jsonDecode(prefs.getString('userData').toString())
        as Map<String, Object>;
    final expiryDate = DateTime.parse(userData['expiryDate'].toString());
    final refreshToken = userData['refreshToken'];
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    final newResponse = await http.post(
        Uri.parse(
            'https://securetoken.googleapis.com/v1/token?key=AIzaSyB2BbHhhhAolL0zXOcMlfQEIBu3CyA6Pqs'),
        body: jsonEncode(
            {'grant_type': "refresh_token", 'refresh_token': refreshToken}));
    final newUserData = jsonDecode(newResponse.body);
    print(newResponse);
    _token = newUserData['idToken'];
    _userId = newUserData['localId'];
    _refreshToken = newUserData['refreshToken'];
    _tokenDur = DateTime.now().add(Duration(
      seconds: int.parse(
        newUserData['expiresIn'],
      ),
    ));
    notifyListeners();
    return true;
  }

  void logout() {
    _token = null;
    _tokenDur = null;
    _userId = null;
    notifyListeners();
  }
}
