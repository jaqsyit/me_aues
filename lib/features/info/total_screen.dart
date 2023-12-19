import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_aues/constants/styles.dart';

import '../../models/total_data.dart';
import '../../widgets/error_column.dart';
import '../../widgets/loading_widget.dart';
import 'total_cubit.dart';
import 'total_state.dart';

class TotalScreen extends StatelessWidget {
  const TotalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TotalCubit(context: context)..getTotal(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Журнал',
            style: CustomTextStyles.s10w600cb,
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: BlocBuilder<TotalCubit, TotalState>(
            builder: (context, state) {
              final totalCubit = BlocProvider.of<TotalCubit>(context);
              if (state is TotalLoading) {
                return const LoadingWidget();
              } else if (state is TotalLoaded) {
                return Column(
                  children: [
                    Container(
                        decoration: const BoxDecoration(),
                        child: _buildTotalUI(state.data, context)),
                  ],
                );
              } else if (state is TotalError) {
                return ErrorColumn(
                  errMsg: state.errMsg,
                  onRetry: () async {
                    await totalCubit.getTotal();
                  },
                );
              } else {
                return const ErrorColumn();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTotalUI(List<TotalData> totalData, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: totalData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            width: 160,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    totalData[index].subjectName,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(totalData[index].centerMark),
                  // Text(totalData[index].color),
                  Text(totalData[index].totalMark),
                  // Text(totalData[index].tutorList),
                  Text(
                      '${totalData[index].exams.first.name}: ${totalData[index].exams.first.mark}'),
                  Text(
                      '${totalData[index].exams.elementAt(2).name}: ${totalData[index].exams.elementAt(2).mark}'),
                  Text(
                      '${totalData[index].exams.elementAt(3).name}: ${totalData[index].exams.elementAt(3).mark}'),
                  Text(
                      '${totalData[index].exams.elementAt(4).name}: ${totalData[index].exams.elementAt(4).mark}'),
                  Text(
                      '${totalData[index].exams.elementAt(5).name}: ${totalData[index].exams.elementAt(5).mark}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
