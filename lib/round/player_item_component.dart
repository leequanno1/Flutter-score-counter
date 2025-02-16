import 'package:flutter/material.dart';
import 'package:learning_bloc/comon/round_text_field.dart';
import 'package:learning_bloc/comon/score_box_component.dart';
import 'package:learning_bloc/comon/toast_message.dart';
import 'package:learning_bloc/styles/button.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class PlayerItemComponent extends StatefulWidget {
  
  final int defaultBetScore;
  
  const PlayerItemComponent({
    super.key, required this.defaultBetScore
  });

  @override
  State<PlayerItemComponent> createState() => _PlayerItemComponentState();
}

class _PlayerItemComponentState extends State<PlayerItemComponent> {
  late final TextEditingController _controller ;
  late bool _isAddConfirmed = false, _isSubtractConfirm = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "${widget.defaultBetScore}");
  }

  @override
  void dispose() {
    _controller.dispose(); // Giải phóng bộ nhớ khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(12, 0, 12, 5),
      decoration: BoxDecoration(
        color: ColorSchema.playerColor,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            SizedBox(
              width: 105,
              child: Text(
                "Player name", 
                style: TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Center(
                child: ScoreBoxComponent(score: 10, margin: EdgeInsets.only(left: 5)),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(_isSubtractConfirm) {
                        resetButton();
                        showToastMessage(context, "Subtract ok! (${_controller.text})");
                      }else{
                        _isSubtractConfirm = true;
                        _isAddConfirmed = false;
                      }
                    });
                  },
                  style: (_isAddConfirmed)? scoreButtonSecondary : scoreButton, 
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ), // Sử dụng controller
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(_isAddConfirmed) {
                        resetButton();
                        showToastMessage(context, "Plus ok! (${_controller.text})");
                      }else{
                        _isSubtractConfirm = false;
                        _isAddConfirmed = true;
                      }
                    });
                  }, 
                  style: (_isSubtractConfirm)? scoreButtonSecondary : scoreButton,
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  
  void resetButton() {
    _isAddConfirmed = false;
    _isSubtractConfirm = false;
    FocusScope.of(context).unfocus();
  }
}
