import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_appbar.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_bloc.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_list.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class DeletedCasinumScreen extends StatelessWidget {
  const DeletedCasinumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DeletedCasinumBloc()),
      ],
      child: Scaffold(
        appBar: AppBar(
            title: Text("Deleted casinums", style: TextStyle(fontWeight: FontWeight.w600),), 
            scrolledUnderElevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1), 
              child: Container(
                color: ColorSchema.borderColor,
                height: 1,
              )
            )
        ),
        body: Column(
          children: [
            DeletedCasinumAppbar(),
            DeletedCasinumList(),
          ],
        ),
      ),
    );
  }
}