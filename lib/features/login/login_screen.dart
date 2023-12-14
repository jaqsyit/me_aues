import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_cubit.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final passwordFocus = FocusNode();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(context: context),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<LoginCubit, bool>(
            builder: (context, state) {
              final loginCubit = BlocProvider.of<LoginCubit>(context);
              loginController.text = 'Исатаева_А';
              passwordController.text = '9\$A4@W';
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                          key: _formKey,
                          autovalidateMode: state
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: loginController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Логин',
                                ),
                                maxLines: 1,
                                onEditingComplete: () {
                                  FocusScope.of(context)
                                      .requestFocus(passwordFocus);
                                },
                                validator: (text) {
                                  if (text != null) {
                                    if (text.isEmpty) {
                                      return 'Логин еңгізіңіз';
                                    } else if (text.length < 4) {
                                      return 'Кемінде 4 символ';
                                    }
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Пароль',
                                ),
                                maxLines: 1,
                                focusNode: passwordFocus,
                                validator: (text) {
                                  if (text != null) {
                                    if (text.isEmpty) {
                                      return 'Құпиясөз енгізіңіз';
                                    } else if (text.length < 6) {
                                      return 'Кемінде 6 символ';
                                    }
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
                                  ),
                                  child: const Text(
                                    'Кіру',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState != null) {
                                      if (_formKey.currentState!.validate()) {
                                        await loginCubit.login(
                                            login: loginController.value.text,
                                            password:
                                                passwordController.value.text);
                                      } else {
                                        loginCubit.enableAutoValidate();
                                      }
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              // TextButton(
                              //   onPressed: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => ChangePassScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: const Text('Құпиясөзді ауыстыру'),
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
