import 'package:code_my_screen/core/constants.dart';
import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectApiKeyWidget extends StatefulWidget {
  const SelectApiKeyWidget({super.key});

  @override
  State<SelectApiKeyWidget> createState() => _SelectApiKeyWidgetState();
}

class _SelectApiKeyWidgetState extends State<SelectApiKeyWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final imageBytes = cubit.state.file!;

    return Row(
      children: [
        Container(
          width: size.width * 0.5,
          height: size.height,
          color: theme.colorScheme.inversePrimary.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.memory(
              imageBytes,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.5,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: size.width * Constants.textSizeFactor,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Type your Gemini API Key',
                  ),
                  onChanged: cubit.setApiKey,
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: size.width * 0.5,
                      child: FilledButton.icon(
                        onPressed: state.geminiApiKey != null
                            ? cubit.generateCode
                            : null,
                        icon: const Icon(
                          Icons.generating_tokens,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Generate Code',
                            style: TextStyle(
                              fontSize: size.width * Constants.textSizeFactor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
