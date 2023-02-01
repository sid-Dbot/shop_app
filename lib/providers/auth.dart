import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _tokenDur;
  String? _userId;

  Future<void> signUp(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB2BbHhhhAolL0zXOcMlfQEIBu3CyA6Pqs';
    await http.post(Uri.parse(url),
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
  }
}
