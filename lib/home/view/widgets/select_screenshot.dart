import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectScreenshotWidget extends StatelessWidget {
  const SelectScreenshotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilledButton.icon(
            onPressed: cubit.selectFilePressed,
            icon: const Icon(Icons.file_upload),
            label: const Text('Select screenshot...'),
          ),
        ],
      ),
    );
  }
}
