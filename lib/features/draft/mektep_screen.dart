// import 'package:flutter/material.dart';
// import 'package:ala/constants/styles.dart';
// import 'package:ala/features/info/info_screen.dart';

// class MektepScreen extends StatelessWidget {
//   final String? title;
//   final String? selectedDay;

//   const MektepScreen({Key? key, this.title, this.selectedDay}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           S.of(context).school,
//           style: CustomTextStyles.s20w500cb,
//         ),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       // bottomNavigationBar: MainBar(),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 const SizedBox(width: 15),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/calendar.svg'),
//                   label: S.of(context).scheduleTitle,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const ScheduleScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const Spacer(),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/journal.svg'),
//                   label: S.of(context).journal,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const JurnalScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const Spacer(),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/subjects.svg'),
//                   label: S.of(context).subjects,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SubjectsScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const Spacer(),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/homework.svg'),
//                   label: S.of(context).homework,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const HomeworksScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(width: 15),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 const SizedBox(width: 15),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/person.svg'),
//                   label: S.of(context).birlestik,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const BirlestikScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const Spacer(),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/materials.svg'),
//                   label: S.of(context).materials_title,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const RecourcesScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const Spacer(),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/info.svg'),
//                   label: S.of(context).info,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const InfoScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 5),
//                 const Spacer(),
//                 Container(
//                   width: 65,
//                   height: 65,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//               ],
//             ),
//             const SizedBox(height: 30),
//             Row(
//               children: [
//                 Text(
//                   S.of(context).kosymsha,
//                   style: CustomTextStyles.s20w500cw,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//             Row(
//               children: [
//                 const SizedBox(width: 15),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/test.svg'),
//                   label: S.of(context).test,
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => SchedulePage(),
//                     //   ),
//                     // );
//                   },
//                 ),
//                 const Spacer(),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/video.svg'),
//                   label: S.of(context).videouroki,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const VideoLessonsScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const Spacer(),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/quiz.svg'),
//                   label: 'Quiz',
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => SchedulePage(),
//                     //   ),
//                     // );
//                   },
//                 ),
//                 const Spacer(),
//                 IconButtonWithText(
//                   icon: SvgPicture.asset('assets/icons/note.svg'),
//                   label: S.of(context).note,
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => SchedulePage(),
//                     //   ),
//                     // );
//                   },
//                 ),
//                 const SizedBox(width: 15),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
