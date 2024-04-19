import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowGeneratedCode extends StatelessWidget {
  const ShowGeneratedCode({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (final previous, final current) =>
          previous.generatedCode != current.generatedCode,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            state.generatedCode.isEmpty
                ? const Text('Generating')
                : Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                        horizontal: size.width * 0.3,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SelectableText(
                          state.generatedCode,
                        ),
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: state.generatedCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Code copied to clipboard'),
                        ),
                      );
                    },
                    label: const Text('Copy Code'),
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
