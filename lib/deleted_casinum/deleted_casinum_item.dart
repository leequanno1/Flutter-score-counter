import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/comon/string_helper.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_bloc.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_event.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_state.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class DeletedCasinumItem extends StatelessWidget {
  final int casinumIndex;

  const DeletedCasinumItem({super.key, required this.casinumIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeletedCasinumBloc, DeletedCasinumState>(builder: (context, state) {
      return GestureDetector(
        onTap: () async {
          context.read<DeletedCasinumBloc>().add(DeletedCasinumSelect(casinumIndex));
        },
        child: AbsorbPointer(
          absorbing: true,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: 50,
            decoration: BoxDecoration(
                color: ColorSchema.acceptColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [
                  Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.transparent,
                      side: BorderSide(
                        color: Colors.white,
                        width: 1.5
                      ),
                      value: state.isSelecteds[casinumIndex],
                      onChanged: (value) {}),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      state.casinums[casinumIndex].name,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    dateTimeConvert(state.casinums[casinumIndex].initDate),
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
