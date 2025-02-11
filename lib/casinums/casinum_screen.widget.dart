import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/casinums/casinum_bloc.dart';
import 'package:learning_bloc/casinums/casinum_list.widget.dart';

class CasinumScreen extends StatelessWidget {
  const CasinumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CasinumBloc()),
      ], 
      child: Scaffold(
        appBar: AppBar(title: Text("Casinums"),),
        body: CasinumList()
      )
    );
  }
}