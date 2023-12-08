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
          title: Text(
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
                    Expanded(
                      child: Container(
                          decoration: const BoxDecoration(),
                          child: _buildTotalUI(state.data, context)),
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

  Widget _buildTotalUI(TotalData totalData, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
