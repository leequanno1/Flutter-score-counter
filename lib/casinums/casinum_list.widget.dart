import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/casinums/casinum_bloc.dart';
import 'package:learning_bloc/casinums/casinum_item.widget.dart';
import 'package:learning_bloc/casinums/casinum_state.dart';

class CasinumList extends StatelessWidget {
  const CasinumList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CasinumBloc, CasinumsState>(builder: (context, state) {
      print(state.casinums.length);
      return ListView.builder(
        itemCount: state.casinums.length,
        itemBuilder: (context, index) => CasinumItem(casinumIndex: index),
      );
    });
  }
}