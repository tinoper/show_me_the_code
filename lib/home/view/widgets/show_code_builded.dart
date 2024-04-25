import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowCodeBuilded extends StatelessWidget {
  const ShowCodeBuilded({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return state.generatedCode.isNotEmpty
            ? Text(state.generatedCode)
            : const Text('No code generated yet');
      },
    );
  }
}
