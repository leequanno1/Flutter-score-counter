import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning_bloc/casinums/casinum_screen.widget.dart';
import 'package:learning_bloc/models/casinum.dart';
import 'package:learning_bloc/models/db_name.dart';
import 'package:learning_bloc/models/log_item.dart';
import 'package:learning_bloc/models/player.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CasinumAdapter());
  Hive.registerAdapter(PlayerAdapter());
  Hive.registerAdapter(LogItemAdapter());
  await Hive.openBox<Casinum>(DbName.getCasinumBaseName());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _closeAllBoxes();
    }
  }

  Future<void> _closeAllBoxes() async {
    await Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CasinumScreen(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CasinumScreen(),
//     );
//   }
// }
