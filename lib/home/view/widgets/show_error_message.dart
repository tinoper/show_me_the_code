import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowErrorMessage extends StatelessWidget {
  const ShowErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error Message:  ${state.errorMessage}'),
            ],
          ),
        );
      },
    );
  }
}
