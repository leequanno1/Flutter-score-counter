import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/casinums/casinum_action_bar.dart';
import 'package:learning_bloc/casinums/casinum_bloc.dart';
import 'package:learning_bloc/casinums/casinum_list.widget.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class CasinumScreen extends StatelessWidget {
  const CasinumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CasinumBloc()),
      ], 
      child: Scaffold(
        appBar: AppBar(
          title: Text("Casinums", style: TextStyle(fontWeight: FontWeight.w600),), 
          scrolledUnderElevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), 
            child: Container(
              color: ColorSchema.borderColor,
              height: 1,
            )
          ),
          actions: [
            PopupMenuButton<int>(
              icon: Icon(Icons.more_horiz_rounded),
              itemBuilder: (contex) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text("Deleted casinums")
                        )
                      ],
                    )
                  ),
                ];
              }
            )
          ],
        ),
        body: Column(
          children: [
            CasinumActionBar(),
            CasinumList()
          ],
        )
      )
    );
  }
}
