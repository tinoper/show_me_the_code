import 'package:code_my_screen/core/constants.dart';
import 'package:code_my_screen/core/enums/generate_status.dart';
import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:code_my_screen/home/view/widgets/generating_code.dart';
import 'package:code_my_screen/home/view/widgets/select_apikey.dart';
import 'package:code_my_screen/home/view/widgets/select_screenshot.dart';
import 'package:code_my_screen/home/view/widgets/show_error_message.dart';
import 'package:code_my_screen/home/view/widgets/show_generated_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
        title: Text(
          Constants.title,
          style: TextStyle(
            color: Colors.red.shade900,
          ),
        ),
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        buildWhen: (final previous, final current) =>
            previous.generateStatus != current.generateStatus,
        builder: (context, state) {
          switch (state.generateStatus) {
            case GenerateStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case GenerateStatus.selectScreenshot:
              return const SelectScreenshotWidget();
            case GenerateStatus.selectApiKey:
              return const SelectApiKeyWidget();
            case GenerateStatus.generating:
              return const GeneratingCode();
            case GenerateStatus.generated:
              return const ShowGeneratedCode();
            case GenerateStatus.error:
              return const ShowErrorMessage();
            default:
              return const Placeholder();
          }
        },
      ),
    );
  }
}
