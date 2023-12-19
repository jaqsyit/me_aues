import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

import '../../constants/urls.dart';
import '../../models/login_data.dart';
import '../../services/json_decoder.dart';
import '../../services/network_helper.dart';
import '../../services/storage_helper.dart';
import '../../widgets/loading_dialog.dart';
import '../bottom/bottom_bar.dart';

class LoginCubit extends Cubit<bool> {
  StorageManager storage = StorageManager();
  final BuildContext context;
  LoginCubit({required this.context}) : super(false);

  Future<void> login({required String login, required String password}) async {
    LoadingDialog.show(context);
    final response = await NetworkHelper().post(
        url: URL_LOGIN_POST,
        withToken: false,
        body: {'login': login, 'password': password}).whenComplete(() {
      LoadingDialog.hide(context);
    });

    if (response is Response) {
      final decodedResponse = JsonDecoder().responseToMap(response);
      if (decodedResponse.containsKey('auth_token')) {
        await storage.setLogin(login);
        await storage.setPassword(password);
        if (response.headers.containsKey('set-cookie')) {
          var rawCookies = response.headers['set-cookie'];
          if (rawCookies != null) {
            String cleanedCookies = rawCookies
                .replaceAll(' Path=/; HttpOnly,', '')
                .replaceAll(' Path=/,', '')
                .replaceAll(' Path=/', '');
            await storage.setCookie(cleanedCookies);
          }
        }
        final LoginData loginData = LoginData.fromJson(decodedResponse);
        await storage.setSid(loginData.sid);
        await storage.setToken(loginData.authToken);
        await getPersonType();
        await getPersonId().whenComplete(
          () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainBar(),
            ),
            (route) => false,
          ),
        );
      } else {
        var responseUtf8 = utf8.decode(response.bodyBytes);
        var responseData = jsonDecode(responseUtf8);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Қате'),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> getPersonType() async {
    LoadingDialog.show(context);
    final response = await NetworkHelper()
        .get(url: URL_PERSONTYPE_GET, withToken: true)
        .whenComplete(() {
      LoadingDialog.hide(context);
    });

    if (response is Response) {
      final decodedResponse = JsonDecoder().responseToMap(response);
      if (decodedResponse.containsKey('personType')) {
        StorageManager storage = StorageManager();
        await storage.setPersonType(decodedResponse['personType'].toString());
      }
    }
  }

  Future<void> getPersonId() async {
    LoadingDialog.show(context);
    final response = await NetworkHelper()
        .get(url: URL_PERSONID_GET, withToken: true)
        .whenComplete(() {
      LoadingDialog.hide(context);
    });

    if (response is Response) {
      final decodedResponse = JsonDecoder().responseToMap(response);
      if (decodedResponse.containsKey('personID')) {
        StorageManager storage = StorageManager();
        await storage.setPersonId(decodedResponse['personID'].toString());
      }
    }
  }

  Future<void> checkAuth() async {
    String? storageLogin = await storage.getLogin();
    String? storagePassword = await storage.getPassword();

    if (storageLogin is String && storagePassword is String) {
      login(login: storageLogin, password: storagePassword);
    }
  }

  void enableAutoValidate() {
    if (!state) {
      emit(true);
    }
  }
}
