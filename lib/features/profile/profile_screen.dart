// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../constants/styles.dart';
// import '../../widgets/error_column.dart';
// import '../../widgets/loading_widget.dart';
// import 'profile_cubit.dart';
// import 'profile_state.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ProfileCubit(context: context)..getProfile(),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           centerTitle: true,
//           // actions: [
//           //   Padding(
//           //     padding: const EdgeInsets.symmetric(horizontal: 5),
//           //     child: IconButton(
//           //       onPressed: () {
//           //         Navigator.push(
//           //           context,
//           //           MaterialPageRoute(
//           //             builder: (context) => const SettingsScreen(),
//           //           ),
//           //         ).then((value) => {if (value != null) setState(() {})});
//           //       },
//           //       icon: const Icon(Icons.settings_outlined),
//           //     ),
//           //   )
//           // ],
//           title: const Text(
//             'Профиль',
//             style: CustomTextStyles.s20w600cb,
//           ),
//           backgroundColor: Colors.white,
//           iconTheme: const IconThemeData(color: Colors.black),
//         ),
//         body: SafeArea(
//           child: BlocBuilder<ProfileCubit, ProfileState>(
//             builder: (context, state) {
//               final profileCubit = BlocProvider.of<ProfileCubit>(context);
//               if (state is ProfileLoading) {
//                 return const LoadingWidget();
//               } else if (state is ProfileLoaded) {
//                 return Column(
//                   children: [
//                     Expanded(
//                       child: _buildProfileUI(state.data, context),
//                     ),
//                   ],
//                 );
//               } else if (state is ProfileError) {
//                 return ErrorColumn(
//                   errMsg: state.errMsg,
//                   onRetry: () async {
//                     await profileCubit.getProfile();
//                   },
//                 );
//               } else {
//                 return const ErrorColumn();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileUI(ProfileData profileData, BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 10),
//             CardInfo(
//               title: 'Аты:',
//               value: profileData.name,
//             ),
//             const SizedBox(height: 10),
//             CardInfo(
//               title: 'Филиал:',
//               value: profileData.filial,
//             ),
//             Container(
//               margin: const EdgeInsets.all(20),
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.red)),
//                 onPressed: () {
//                   // ProfileCubit(context: context).logout();
//                 },
//                 child: const Text('Шығу'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardInfo extends StatelessWidget {
//   final String title;
//   final String value;

//   const CardInfo({super.key, required this.title, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.9,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: CustomTextStyles.s16w400cb,
//               maxLines: null,
//             ),
//             const SizedBox(height: 5),
//             Text(
//               value,
//               style: CustomTextStyles.s20w400cb,
//               maxLines: null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
