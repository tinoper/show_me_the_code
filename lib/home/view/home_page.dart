import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:code_my_screen/home/view/home_page_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(
        FilePicker.platform,
      ),
      child: const HomePageView(),
    );
  }
}
