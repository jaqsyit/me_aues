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
            style: CustomTextStyles.s20w600cb,
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
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return journalCard(state.data, index);
                          },
                        ),
                      ),
                    ),
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

  Widget journalCard(List<TotalData> totalData, int index) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            color: int.parse(totalData[index].exams[5].mark) != 0
                ? double.parse(totalData[index].centerMark) < 50
                    ? Colors.red
                    : int.parse(totalData[index].centerMark) > 50 &&
                            int.parse(totalData[index].centerMark) < 70
                        ? Colors.blue
                        : Colors.green
                : Colors.black26,
          ),
          child: Text(
            totalData[index].subjectName,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding:
              const EdgeInsets.only(bottom: 15, right: 15, left: 15, top: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Column(
            children: [
              Text(totalData[index].tutorList),
              Padding(
                padding: const EdgeInsets.all(20),
                child: getMarkText(totalData[index].centerMark),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          getMarkText(totalData[index].exams.elementAt(0).mark),
                          Text(totalData[index].exams.elementAt(0).name),
                        ],
                      ),
                      Column(
                        children: [
                          getMarkText(totalData[index].exams.elementAt(1).mark),
                          Text(totalData[index].exams.elementAt(1).name),
                        ],
                      ),
                      Column(
                        children: [
                          getMarkText(totalData[index].exams.elementAt(2).mark),
                          Text(totalData[index].exams.elementAt(2).name),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          getMarkText(totalData[index].exams.elementAt(3).mark),
                          Text(totalData[index].exams.elementAt(3).name),
                        ],
                      ),
                      Column(
                        children: [
                          getMarkText(totalData[index].exams.elementAt(4).mark),
                          Text(totalData[index].exams.elementAt(4).name),
                        ],
                      ),
                      Column(
                        children: [
                          getMarkText(totalData[index].exams.elementAt(5).mark),
                          Text(totalData[index].exams.elementAt(5).name),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getMarkText(String mark) {
    double parsedMark = double.parse(mark);
    TextStyle style;

    if (parsedMark == 0) {
      style = CustomTextStyles.s20w400cg;
    } else if (parsedMark < 50) {
      style = CustomTextStyles.s20w400cr;
    } else if (parsedMark >= 50 && parsedMark < 70) {
      style = CustomTextStyles.s20w400cbl;
    } else {
      style = CustomTextStyles.s20w400cgrn;
    }

    return Text(mark, style: style);
  }
}
