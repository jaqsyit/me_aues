import 'package:me_aues/models/total_data.dart';

abstract class TotalState {}

class TotalLoading extends TotalState {}

class TotalLoaded extends TotalState {
  final List<TotalData> data;

  TotalLoaded({required this.data});

  // TotalData get profileData => null;
}

class TotalError extends TotalState {
  final String? errMsg;

  TotalError({this.errMsg});
}
