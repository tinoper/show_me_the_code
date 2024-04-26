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
    final cubit = context.read<HomePageCubit>();
    final ThemeData theme = Theme.of(context);

    final widgetsMap = {
      GenerateStatus.loading: const Center(child: CircularProgressIndicator()),
      GenerateStatus.selectScreenshot: const SelectScreenshotWidget(),
      GenerateStatus.selectApiKey: const SelectApiKeyWidget(),
      GenerateStatus.generating: const GeneratingCode(),
      GenerateStatus.generated: const ShowGeneratedCode(),
      GenerateStatus.error: const ShowErrorMessage(),
    };

    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (final previous, final current) =>
          previous.generateStatus != current.generateStatus,
      builder: (context, state) {
        final Widget? bodyWidget = widgetsMap[state.generateStatus];

        Widget? leadingWidget;
        if (state.generateStatus == GenerateStatus.selectApiKey) {
          leadingWidget = IconButton(
            onPressed: cubit.onBackButtonPressed,
            icon: Icon(
              Icons.arrow_back,
              color: theme.primaryColor,
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            leading: leadingWidget,
            centerTitle: true,
            backgroundColor: theme.colorScheme.inversePrimary.withOpacity(0.2),
            title: Text(
              Constants.title,
              style: TextStyle(
                color: theme.primaryColor,
              ),
            ),
          ),
          body: bodyWidget ?? const Placeholder(),
        );
      },
    );
  }
}
