import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_bloc.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_item.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_state.dart';

class DeletedCasinumList extends StatelessWidget {
  const DeletedCasinumList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeletedCasinumBloc, DeletedCasinumState>(builder: (context, state) {
      return Expanded(
        child: ListView.builder(
          itemCount: state.casinums.length,
          itemBuilder: (context, index) => DeletedCasinumItem(casinumIndex: index),
        ),
      );
    });
  }
}