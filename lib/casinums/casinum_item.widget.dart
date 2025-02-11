import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/casinums/casinum_bloc.dart';
import 'package:learning_bloc/casinums/casinum_event.dart';
import 'package:learning_bloc/casinums/casinum_state.dart';

class CasinumItem extends StatelessWidget {
  final int casinumIndex;

  const CasinumItem({super.key, required this.casinumIndex});

  String dateTimeConvert(DateTime dateTime) {
    String dataString = dateTime.toIso8601String();
    List<String> data = dataString.split("T");
    String dateString = data[0];
    String timeString = data[1];
    List<String> date = dateString.split("-");
    List<String> time = timeString.split(":");
    return "${date[1]}/${date[2]}/${date[0].substring(2)}   ${time[0]}:${time[1]}";
  }

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
            // TODO: redirect to view.
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
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [
                if (state.selectedNumber > 0)
                  Checkbox(
                      value: state.itemSelecteds[casinumIndex],
                      onChanged: (value) {}),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      state.casinums[casinumIndex].name,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    dateTimeConvert(state.casinums[casinumIndex].initDate),
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
