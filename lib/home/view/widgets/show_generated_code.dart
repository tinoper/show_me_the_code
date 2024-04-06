import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowGeneratedCode extends StatelessWidget {
  const ShowGeneratedCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SelectableText(
              state.generatedCode ?? 'No code to show',
            ),
          );
        },
      );
    });
  }
}
