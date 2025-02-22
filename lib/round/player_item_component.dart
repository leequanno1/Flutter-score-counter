import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/comon/round_text_field.dart';
import 'package:learning_bloc/comon/score_box_component.dart';
import 'package:learning_bloc/comon/string_helper.dart';
import 'package:learning_bloc/comon/toast_message.dart';
import 'package:learning_bloc/models/player.dart';
import 'package:learning_bloc/round/player_event.dart';
import 'package:learning_bloc/round/players_bloc.dart';
import 'package:learning_bloc/round/players_state.dart';
import 'package:learning_bloc/styles/button.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class PlayerItemComponent extends StatefulWidget {
  // final int defaultBetScore;
  final Player player;
  final int index;

  const PlayerItemComponent(
      {super.key, required this.player, required this.index});

  @override
  State<PlayerItemComponent> createState() => _PlayerItemComponentState();
}

class _PlayerItemComponentState extends State<PlayerItemComponent> {
  late final TextEditingController _controller;
  late Player _player;
  late int _index;
  late bool _isAddConfirmed = false, _isSubtractConfirm = false;

  @override
  void initState() {
    super.initState();
    _player = widget.player;
    _controller = TextEditingController(text: "${widget.player.deafaultBet}");
    _index = widget.index;
  }

  @override
  void dispose() {
    _controller.dispose(); // Giải phóng bộ nhớ khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(builder: (context, state) {
      return GestureDetector(
        onLongPress: () {
          if (state.itemSelecteds == 0) {
            context.read<PlayersBloc>().add(PlayerSelected(_index));
          }
        },
        onTap: () {
          if (state.itemSelecteds > 0) {
            context.read<PlayersBloc>().add(PlayerSelected(_index));
          }
        },
        child: Container(
          height: 50,
          margin: EdgeInsets.fromLTRB(12, 0, 12, 5),
          decoration: BoxDecoration(
              color: ColorSchema.playerColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                if (state.itemSelecteds > 0)
                  AbsorbPointer(
                      child: Container(
                    height: 24,
                    width: 24,
                    margin: EdgeInsets.only(right: 10),
                    child: Checkbox(
                        checkColor: Colors.black,
                        activeColor: Colors.transparent,
                        side: BorderSide(color: Colors.black, width: 1.5),
                        value: state.isSelected[_index],
                        onChanged: (value) {}),
                  )),
                SizedBox(
                  width: 105,
                  child: Text(
                    _player.name,
                    style: TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (state.itemSelecteds == 0)
                  Expanded(
                    child: Center(
                      child: ScoreBoxComponent(
                          score: _player.score,
                          margin: EdgeInsets.only(left: 5)),
                    ),
                  ),
                if (state.itemSelecteds == 0)
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_isSubtractConfirm) {
                              try {
                                _player.deafaultBet =
                                    int.parse(_controller.text);
                                _player.score -= _player.deafaultBet;
                                context
                                    .read<PlayersBloc>()
                                    .add(PlayerUpdate(_player, _index));
                                showToastMessage(context,
                                    "Subtract ok! (${_controller.text})");
                              } catch (e) {
                                showToastMessage(
                                    context, "Default bet can't be blank!");
                              }
                              resetButton();
                            } else {
                              _isSubtractConfirm = true;
                              _isAddConfirmed = false;
                            }
                          });
                        },
                        style: (_isAddConfirmed)
                            ? scoreButtonSecondary
                            : scoreButton,
                        child: Icon(Icons.horizontal_rule),
                      ),
                      RoundTextField(
                        controller: _controller,
                        width: 43,
                        autoFocus: false,
                        textAlign: TextAlign.center,
                        contentPadding: EdgeInsets.zero,
                        borderColor: ColorSchema.blackColor,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ), // Sử dụng controller
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_isAddConfirmed) {
                              try {
                                _player.deafaultBet =
                                    int.parse(_controller.text);
                                _player.score += _player.deafaultBet;
                                context
                                    .read<PlayersBloc>()
                                    .add(PlayerUpdate(_player, _index));
                                showToastMessage(
                                    context, "Plus ok! (${_controller.text})");
                              } catch (e) {
                                _controller.text = "${_player.deafaultBet}";
                                showToastMessage(
                                    context, "Default bet can't be blank!");
                              }
                              resetButton();
                            } else {
                              _isSubtractConfirm = false;
                              _isAddConfirmed = true;
                            }
                          });
                        },
                        style: (_isSubtractConfirm)
                            ? scoreButtonSecondary
                            : scoreButton,
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                if (state.itemSelecteds > 0)
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          dateTimeConvert(_player.initDate),
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ))
              ],
            ),
          ),
        ),
      );
    });
  }

  void resetButton() {
    _isAddConfirmed = false;
    _isSubtractConfirm = false;
    FocusScope.of(context).unfocus();
  }
}
