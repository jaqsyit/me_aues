// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../constants/urls.dart';
// import '../../services/json_decoder.dart';
// import '../../services/network_helper.dart';
// import 'profile_state.dart';

// class ProfileCubit extends Cubit<ProfileState> {
//   final BuildContext context;
//   ProfileCubit({required this.context}) : super(ProfileLoading());

//   Future<void> getProfile() async {
//     if (state is! ProfileLoading) {
//       emit(ProfileLoading());
//     }

//     final response = await NetworkHelper().get(url: URL_ME_GET);

//     if (response is Response) {
//       final decodedResponse = JsonDecoder().responseToMap(response);
      
//       final ProfileData dataDecoded = ProfileData.fromJson(decodedResponse);

//       if (decodedResponse.containsKey('remember_token')) {
//         emit(ProfileLoaded(data: dataDecoded));
//       }
//     } else if (response is String) {
//       emit(ProfileError(errMsg: response));
//     } else {
//       emit(ProfileError(errMsg: 'Unknown error!'));
//     }
//   }
// }
