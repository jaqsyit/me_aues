// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:ala/constants/styles.dart';
// import 'package:ala/constants/urls.dart';
// import 'package:ala/features/settings/change_pass_screen.dart';
// // import 'package:ala/services/faceid.dart';
// import 'package:ala/services/network_helper.dart';
// import 'package:ala/services/storage_helper.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key, this.title}) : super(key: key);
//   final String? title;

//   @override
//   SettingsScreenState createState() => SettingsScreenState();
// }

// class SettingsScreenState extends State<SettingsScreen> {
//   bool valueState = false;
//   final storage = StorageManager();

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> _logout() async {
//     try {
//       await NetworkHelper().get(url: LOGOUT_URL);
//       storage.deleteTokens();
//     } catch (error) {
//       // Обработка других исключений, которые могут возникнуть
//       // print('Произошла ошибка: $error');
//     }
//     if (mounted) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginScreen(),
//         ),
//         (route) => false,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(
//           onPressed: () async {
//             const storage = FlutterSecureStorage();
//             final locale = await storage.read(key: 'locale');
//             if (mounted) {
//               Navigator.pop(context, locale);
//             }
//           },
//         ),
//         centerTitle: true,
//         title: Text(
//           S.of(context).settings,
//           style: CustomTextStyles.s20w500cb,
//         ),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(S.of(context).push_on_off),
//                 const Spacer(),
//                 CupertinoSwitch(
//                   value: valueState,
//                   onChanged: (newValue) async {
//                     FirebaseMessaging messaging = FirebaseMessaging.instance;
//                     final NotificationSettings settings =
//                         await messaging.requestPermission(
//                       alert: true,
//                       announcement: false,
//                       badge: true,
//                       carPlay: false,
//                       criticalAlert: false,
//                       provisional: false,
//                       sound: true,
//                     );
//                     if (settings.authorizationStatus ==
//                         AuthorizationStatus.authorized) {
//                       setState(() {
//                         valueState = newValue;
//                       });
//                     } else {}
//                   },
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 Text(
//                   S.of(context).sms_on_off,
//                   style: CustomTextStyles.s14w400cb,
//                 ),
//                 const Spacer(),
//                 CupertinoSwitch(
//                   value: true, // Здесь должно быть значение из состояния
//                   onChanged: (bool value) {
//                     // Обработчик изменения состояния
//                   },
//                 ),
//               ],
//             ),
//             ListTile(
//               title: Text(
//                 S.of(context).lang_change,
//                 style: CustomTextStyles.s14w400cb,
//               ),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const LanguageSelectionSetting(),
//                   ),
//                 ).then(
//                   (value) => {
//                     if (value != null)
//                       {
//                         // print('setState'),
//                         setState(() {}),
//                       },
//                   },
//                 );
//               },
//             ),
//             ListTile(
//               title: Text(
//                 S.of(context).pass_change,
//                 style: CustomTextStyles.s14w400cb,
//               ),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ChangepassScreen(),
//                   ),
//                 );
//               },
//             ),
//             ListTile(
//               title: Text(
//                 S.of(context).faq,
//                 style: CustomTextStyles.s14w400cb,
//               ),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // final ws = WebSocketHelper();
//                 // ws.webSocketConnect();
//               },
//             ),
//             ListTile(
//               title: Text(
//                 S.of(context).support,
//                 style: CustomTextStyles.s14w400cb,
//               ),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () async {
//                 final Uri url = Uri.parse('https://support.edus.kz');
//                 if (!await launchUrl(url)) {
//                   throw Exception('Could not launch $url');
//                 }
//               },
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: _logout,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 minimumSize: Size(
//                   MediaQuery.of(context).size.width * 0.9,
//                   50,
//                 ),
//               ),
//               child: Text(
//                 S.of(context).logout,
//                 style: CustomTextStyles.s18w500cw,
//               ),
//             ),
//             // ElevatedButton(
//             //   onPressed: () async {
//             //     await AuthWithFaceid().authenticate();
//             //   },
//             //   child: Text('Войти с помощью биометрии'),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
