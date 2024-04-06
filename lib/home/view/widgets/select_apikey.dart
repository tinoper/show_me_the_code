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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 250,
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Type your Gemini API Key',
              ),
              onChanged: cubit.setApiKey,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              return FilledButton.icon(
                onPressed:
                    state.geminiApiKey != null ? cubit.generateCode : null,
                icon: const Icon(Icons.generating_tokens),
                label: const Text('Generate Code'),
              );
            },
          ),
        ],
      ),
    );
  }
}
