import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_bloc.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_event.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_state.dart';
import 'package:learning_bloc/dialog/remove_casinum_dialog.dart';

class DeletedCasinumAppbar extends StatelessWidget {
  const DeletedCasinumAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeletedCasinumBloc, DeletedCasinumState>(
        builder: (context, state) {
      return Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Total(${state.casinums.length})",
              style: TextStyle(fontSize: 18),
            ),
          )),
          IconButton(
              onPressed: () => onRestore(context), 
              icon: Icon(Icons.undo)),
          IconButton(
              onPressed: () => onDeletePopup(context),
              icon: Icon(Icons.delete_outline))
        ],
      );
    });
  }

  Future onRestore(BuildContext context) async {
    context.read<DeletedCasinumBloc>().add(DeletedCasinumRestore());
  }

  Future onDeletePopup(BuildContext context) async {
    final res = await showDialog<bool>(
        context: context, builder: (context) => RemoveCasinumDialog());
    if (res != null && res) {
      context.read<DeletedCasinumBloc>().add(DeletedCasinumRemove());
    }
  }
}
