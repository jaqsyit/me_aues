// import 'package:flutter/material.dart';
// import 'package:ala/constants/styles.dart';
// import 'package:ala/constants/urls.dart';
// import 'package:ala/features/bottom/bottom_bar.dart';
// import 'package:ala/generated/l10n.dart';
// import 'package:ala/services/network_helper.dart';

// class ChangepassScreen extends StatefulWidget {
//   final String? title;
//   final String? selectedDay;

//   const ChangepassScreen({Key? key, this.title, this.selectedDay})
//       : super(key: key);

//   @override
//   ChangepassScreenState createState() => ChangepassScreenState();
// }

// class ChangepassScreenState extends State<ChangepassScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   final TextEditingController curPassController = TextEditingController();
//   final TextEditingController newPassController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   Future<void> _changePassRepo() async {
//     final curPass = curPassController.text;
//     final newPass = newPassController.text;

//     final response = await NetworkHelper().post(
//         url: CHANGE_PASS_URL,
//         withToken: true,
//         body: {'cur_password': curPass, 'new_password': newPass});
//     navigateLogic(response.statusCode);
//   }

//   void navigateLogic(int responseStatesCode) {
//     if (responseStatesCode == 200) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const MainBar(),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(S.of(context).wrongPass)),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           S.of(context).settings,
//           style: CustomTextStyles.s20w500cb,
//         ),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       // bottomNavigationBar: MainBar(),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               Theme.of(context).colorScheme.primary,
//               Theme.of(context).colorScheme.secondary,
//             ],
//           ),
//         ),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: TextFormField(
//                   controller: curPassController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: S.of(context).curPass,
//                     fillColor: Colors.white,
//                     filled: true,
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 20),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return S.of(context).nullPass;
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: TextFormField(
//                   controller: newPassController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: S.of(context).newPass,
//                     fillColor: Colors.white,
//                     filled: true,
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 20),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return S.of(context).nullPass;
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               const SizedBox(height: 40),
//               SizedBox(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _changePassRepo();
//                     }
//                   },
//                   style: AppStyles.yellowButtonStyle,
//                   child: Text(
//                     S.of(context).changePass,
//                     style: AppStyles.customTextStyle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
