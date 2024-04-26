import 'package:code_my_screen/core/constants.dart';
import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectScreenshotWidget extends StatelessWidget {
  const SelectScreenshotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size.width * 0.5,
            child: FilledButton.icon(
              onPressed: cubit.selectFilePressed,
              icon: Icon(
                Icons.file_upload,
                size: size.width * Constants.textSizeFactor,
              ),
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select screenshot',
                  style: TextStyle(
                    fontSize: size.width * Constants.textSizeFactor,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
