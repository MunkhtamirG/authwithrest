import 'package:authwithrest/bloc/login_bloc/login_bloc.dart';
import 'package:authwithrest/repositories/repositories.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authwithrest/style/theme.dart' as Style;

class LoginForm extends StatefulWidget {
  final UserRepositories userRepositories;
  const LoginForm({super.key, required this.userRepositories})
      : assert(userRepositories != null);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepositories);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepositories userRepositories;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _LoginFormState(this.userRepositories);

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of(context).add(LoginButtonPressed(
          _emailController.toString(), _passwordController.toString()));
    }

    return BlocListener(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Login Failed.'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 80),
            child: Form(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    padding: EdgeInsets.only(bottom: 20, top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AUTH WITH REST',
                          style: TextStyle(
                              color: Style.Colors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Login app using BLOC pattern and REST API',
                          style: TextStyle(fontSize: 10, color: Colors.black38),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(EvaIcons.emailOutline, color: Colors.black26),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30)),
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        labelText: 'E-Mail',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _passwordController,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(EvaIcons.emailOutline, color: Colors.black26),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30)),
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        )),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.black45, fontSize: 12),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 45,
                          child: state is LoginLoding
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: CupertinoActivityIndicator(),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : ElevatedButton(
                                  onPressed: _onLoginButtonPressed,
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Or connect using',
                          style: TextStyle(color: Colors.black26, fontSize: 12))
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(EvaIcons.facebook, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 180,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(EvaIcons.google, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                'Google',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: Row(
                        children: [
                          Text("Don't have an account?",
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 5),
                          Text("Register",
                              style: TextStyle(
                                  color: Style.Colors.mainColor,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  )),
                  SizedBox(height: 30)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
