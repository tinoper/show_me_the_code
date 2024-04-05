import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectApiKeyWidget extends StatefulWidget {
  const SelectApiKeyWidget({super.key});

  @override
  State<SelectApiKeyWidget> createState() => _SelectApiKeyWidgetState();
}

class _SelectApiKeyWidgetState extends State<SelectApiKeyWidget> {
  late TextEditingController _geminiKeyController;

  @override
  void initState() {
    super.initState();
    _geminiKeyController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cubit = context.read<HomePageCubit>();
    _geminiKeyController.text = cubit.state.geminiApiKey ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Ingresar APIKEY'),
        ],
      ),
    );
  }
}
