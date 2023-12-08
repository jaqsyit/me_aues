import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_aues/constants/urls.dart';
import 'package:me_aues/models/total_data.dart';
import '../../services/json_decoder.dart';
import '../../services/network_helper.dart';
import 'total_state.dart';

class TotalCubit extends Cubit<TotalState> {
  final BuildContext context;
  TotalCubit({required this.context}) : super(TotalLoading());

  Future<void> getTotal() async {
    if (state is! TotalLoading) {
      emit(TotalLoading());
    }

    final response = await NetworkHelper().get(url: URL_JOURNAL_GET);

    if (response is Response) {
      final decodedResponse = JsonDecoder().responseToMap(response);
      final TotalData dataDecoded = TotalData.fromJson(decodedResponse);

      emit(TotalLoaded(data: dataDecoded));
    } else if (response is String) {
      emit(TotalError(errMsg: response));
    } else {
      emit(TotalError(errMsg: 'Unknown error!'));
    }
  }
}
