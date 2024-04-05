import 'package:code_my_screen/core/constants.dart';
import 'package:code_my_screen/core/enums/generate_status.dart';
import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:code_my_screen/home/view/widgets/select_apikey.dart';
import 'package:code_my_screen/home/view/widgets/select_screenshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(Constants.title),
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          switch (state.generateStatus) {
            case GenerateStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case GenerateStatus.selectScreenshot:
              return const SelectScreenshotWidget();
            case GenerateStatus.selectApiKey:
              return const SelectApiKeyWidget();
            case GenerateStatus.generating:
              return const Placeholder();
            case GenerateStatus.generated:
              return const Placeholder();
            case GenerateStatus.error:
              return const Placeholder();
            default:
              return const Placeholder();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          cubit.generateCode();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
