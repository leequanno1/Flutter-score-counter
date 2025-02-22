import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/casinums/casinum_bloc.dart';
import 'package:learning_bloc/casinums/casinum_event.dart';
import 'package:learning_bloc/casinums/casinum_state.dart';
import 'package:learning_bloc/comon/string_helper.dart';
import 'package:learning_bloc/models/casinum.dart';
import 'package:learning_bloc/round/round_screen.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class CasinumItem extends StatelessWidget {
  final int casinumIndex;

  const CasinumItem({super.key, required this.casinumIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CasinumBloc, CasinumsState>(builder: (context, state) {
      return GestureDetector(
        onLongPress: () {
          if (state.selectedNumber == 0) {
            context.read<CasinumBloc>().add(CasinumsSelected(casinumIndex));
          }
        },
        onTap: () {
          if (state.selectedNumber == 0) {
            Navigator.push<Casinum>(
              context,
              MaterialPageRoute(builder: (context) => RoundScreen(casinum: state.casinums[casinumIndex]))
            );
          } else {
            // un check
            context.read<CasinumBloc>().add(CasinumsSelected(casinumIndex));
          }
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
                if (state.selectedNumber > 0)
                  Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.transparent,
                      side: BorderSide(
                        color: Colors.white,
                        width: 1.5
                      ),
                      value: state.itemSelecteds[casinumIndex],
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
