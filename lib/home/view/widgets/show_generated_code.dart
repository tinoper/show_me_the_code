import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowGeneratedCode extends StatefulWidget {
  const ShowGeneratedCode({super.key});

  @override
  State<ShowGeneratedCode> createState() => _ShowGeneratedCodeState();
}

class _ShowGeneratedCodeState extends State<ShowGeneratedCode>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (final previous, final current) =>
          previous.generatedCode != current.generatedCode,
      builder: (context, state) {
        _controller.forward(from: 0.0);
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.05,
                    horizontal: size.width > size.height
                        ? size.width * 0.25
                        : size.width * 0.05,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      color: Colors.grey[100],
                      child: SelectableText(
                        '''
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
            backgroundColor:
                Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
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
''',
                        // state.generatedCode,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.05,
                      horizontal: size.width > size.height
                          ? size.width * 0.35
                          : size.width * 0.05,
                    ),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: state.generatedCode),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Code copied to clipboard'),
                          ),
                        );
                      },
                      label: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Copy Code'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
