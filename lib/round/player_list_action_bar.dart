import 'package:flutter/material.dart';

class PlayerListActionBar extends StatelessWidget {
  const PlayerListActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Total(${10})",
              style: TextStyle(fontSize: 18),
            ),
          )
        ),
        if (true)
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        else
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline))
      ],
    );
  }
}
