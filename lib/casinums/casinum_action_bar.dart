import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/casinums/casinum_bloc.dart';
import 'package:learning_bloc/casinums/casinum_event.dart';
import 'package:learning_bloc/casinums/casinum_state.dart';
import 'package:learning_bloc/dialog/create_casinum_dialog.dart';
import 'package:learning_bloc/models/casinum.dart';

class CasinumActionBar extends StatelessWidget {
  const CasinumActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CasinumBloc, CasinumsState>(builder: (context, state) {
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
          if (state.selectedNumber == 0)
            IconButton(
                onPressed: () => openCreatePopup(context),
                icon: Icon(Icons.add))
          else
            IconButton(
              onPressed: () {
                context.read<CasinumBloc>().add(CasinumDelete());
              }, 
              icon: Icon(Icons.delete_outline)
            )
        ],
      );
    });
  }

  Future openCreatePopup(BuildContext context) async {
    final result = await showDialog<Casinum>(context: context, builder: (context) => CreateCasinumDialog());
    if(result != null) {
      context.read<CasinumBloc>().add(CasinumsAdd(result));
    }
  }
}
