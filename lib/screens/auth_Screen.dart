import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/http_exception.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/screens/product_overview.dart';

enum AuthMode { Login, SignUp }

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;

  var loading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // var usernameController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: deviceSize.width,
            height: deviceSize.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.pink.shade900.withOpacity(0.5),
                  Colors.amber.withOpacity(0.7)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    //margin: EdgeInsets.only(left: 20),
                    height: deviceSize.height * 0.1,
                    width: deviceSize.width * 0.9,
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 60),
                    transform: Matrix4.rotationZ(-9 * pi / 180),
                    //..translate(-10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(10, -9),
                            blurRadius: 2,
                            color: Colors.grey.shade900)
                      ],
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Center(
                      child: Text(
                        'My Shop',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.only(left: 50),
                  height: _authMode == AuthMode.Login
                      ? deviceSize.height * 0.4
                      : deviceSize.height * .52,
                  width: deviceSize.width * 0.8,
                  // transform: Matrix4.rotationZ(8 * pi / 180),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: Offset(2, 3),
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child: _authMode == AuthMode.Login
                                ? Column(
                                    children: [
                                      TextFormField(
                                          controller: emailController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Email!';
                                            }
                                            if (!value.contains('@') ||
                                                !value.endsWith('.com')) {
                                              return 'Invalid Email!';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'Email',
                                            ),
                                          )),
                                      TextFormField(
                                          controller: passwordController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please fill this blank!';
                                            }
                                            if (value.length < 8) {
                                              return 'too short!';
                                            }
                                            return null;
                                          },
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            label: Text('Password'),
                                          ))
                                    ],
                                  )
                                : Column(
                                    children: [
                                      // TextFormField(
                                      //   controller: usernameController,
                                      //   textCapitalization:
                                      //       TextCapitalization.words,
                                      //   validator: (value) {
                                      //     if (value!.isEmpty) {
                                      //       return 'Please fill this blank!';
                                      //     }
                                      //     return null;
                                      //   },
                                      //   decoration: const InputDecoration(
                                      //     label: Text(
                                      //       'Username',
                                      //     ),
                                      //   ),
                                      // ),
                                      TextFormField(
                                        controller: emailController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Email!';
                                          }
                                          if (!value.contains('@') ||
                                              !value.endsWith('.com')) {
                                            return 'Invalid Email!';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          label: Text(
                                            'Email',
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please fill this blank!';
                                          }
                                          if (value.length < 8) {
                                            return 'too short!';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          label: Text(
                                            'Password',
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please fill this blank!';
                                          }
                                          if (passwordController.text !=
                                              value) {
                                            return 'Passwords dont match!';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          label: Text(
                                            'Confirm Password',
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: loading
                              ? Center(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: LoadingIndicator(
                                        colors: [
                                          Colors.deepOrange,
                                          Colors.deepPurple,
                                          Colors.blue
                                        ],
                                        indicatorType:
                                            Indicator.ballClipRotateMultiple),
                                  ),
                                )
                              : Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            loading = true;
                                          });
                                          try {
                                            if (_authMode == AuthMode.SignUp) {
                                              await Provider.of<Auth>(context,
                                                      listen: false)
                                                  .signUp(emailController.text,
                                                      passwordController.text)
                                                  .then((value) => setState(() {
                                                        _authMode =
                                                            AuthMode.Login;
                                                      }));
                                            }
                                            if (_authMode == AuthMode.Login) {
                                              await Provider.of<Auth>(context,
                                                      listen: false)
                                                  .login(emailController.text,
                                                      passwordController.text);
                                            }
                                          } on HttpException catch (error) {
                                            var errorMessage =
                                                'Authentication failed';
                                            if (error
                                                .toString()
                                                .contains('EMAIL_EXISTS')) {
                                              errorMessage =
                                                  'This email address is already in use.';
                                            } else if (error
                                                .toString()
                                                .contains('INVALID_EMAIL')) {
                                              errorMessage =
                                                  'This is not a valid email address';
                                            } else if (error
                                                .toString()
                                                .contains('WEAK_PASSWORD')) {
                                              errorMessage =
                                                  'This password is too weak.';
                                            } else if (error
                                                .toString()
                                                .contains('EMAIL_NOT_FOUND')) {
                                              errorMessage =
                                                  'Could not find a user with that email.';
                                            } else if (error
                                                .toString()
                                                .contains('INVALID_PASSWORD')) {
                                              errorMessage =
                                                  'Invalid password.';
                                            }
                                            _showErrorDialog(errorMessage);
                                          } catch (error) {
                                            const errorMessage =
                                                'Could not authenticate you. Please try again later.';
                                            _showErrorDialog(errorMessage);
                                          }
                                          setState(() {
                                            loading = false;
                                          });
                                        }
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey.shade800),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.lightBlue.shade700),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  vertical: 11,
                                                  horizontal: 25))),
                                      child: _authMode == AuthMode.Login
                                          ? const Text(
                                              'Login',
                                              style: TextStyle(fontSize: 20),
                                            )
                                          : const Text(
                                              'Sign Up',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                    ),
                                    TextButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey.shade800)),
                                        onPressed: () {
                                          _formKey.currentState!.reset();
                                          if (_authMode == AuthMode.Login) {
                                            setState(() {
                                              _authMode = AuthMode.SignUp;
                                            });
                                          } else {
                                            setState(() {
                                              _authMode = AuthMode.Login;
                                            });
                                          }
                                        },
                                        child: _authMode == AuthMode.Login
                                            ? const Text(
                                                'Sign Up?',
                                                style: TextStyle(fontSize: 20),
                                              )
                                            : const Text(
                                                'Login?',
                                                style: TextStyle(fontSize: 20),
                                              ))
                                  ],
                                ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

// class AuthCard extends StatefulWidget {
//   const AuthCard({super.key});

//   @override
//   State<AuthCard> createState() => _AuthCardState();
// }

// class _AuthCardState extends State<AuthCard> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   AuthMode _authMode = AuthMode.Login;
//   var buttonTitle = ['Login', 'Sign Up'];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Form(
//               child: _authMode == AuthMode.Login
//                   ? Column(
//                       //shrinkWrap: true,
//                       children: [
//                         TextFormField(
//                             decoration: InputDecoration(
//                           label: Text(
//                             'Email',
//                           ),
//                         )),
//                         TextFormField(
//                             decoration: InputDecoration(
//                           label: Text('Password'),
//                         ))
//                       ],
//                     )
//                   : Column(
//                       children: [
//                         TextFormField(
//                           decoration: InputDecoration(
//                             label: Text(
//                               'Name',
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             label: Text(
//                               'Email',
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             label: Text(
//                               'Password',
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             label: Text(
//                               'Confirm Password',
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//           Padding(
//             padding: const EdgeInsets.only(top: 50),
//             child: Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: _authMode == AuthMode.Login
//                       ? Text(
//                           'Login',
//                           style: TextStyle(fontSize: 20),
//                         )
//                       : Text(
//                           'Sign Up',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                   style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Colors.grey.shade800),
//                       overlayColor:
//                           MaterialStateProperty.all(Colors.lightBlue.shade700),
//                       shape: MaterialStateProperty.all(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                       padding: MaterialStateProperty.all(
//                           EdgeInsets.symmetric(vertical: 11, horizontal: 25))),
//                 ),
//                 TextButton(
//                     style: ButtonStyle(
//                         foregroundColor:
//                             MaterialStateProperty.all(Colors.grey.shade800)),
//                     onPressed: () {
//                       if (_authMode == AuthMode.Login) {
//                         setState(() {
//                           _authMode = AuthMode.SignUp;
//                         });
//                       } else {
//                         setState(() {
//                           _authMode = AuthMode.Login;
//                         });
//                       }
//                     },
//                     child: _authMode == AuthMode.Login
//                         ? Text(
//                             'Sign Up?',
//                             style: TextStyle(fontSize: 20),
//                           )
//                         : Text(
//                             'Login?',
//                             style: TextStyle(fontSize: 20),
//                           ))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
