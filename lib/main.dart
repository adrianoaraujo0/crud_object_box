// import 'package:crud_object_box/database/objectbox_database.dart';
import 'package:crud_object_box/database/objectbox_database.dart';
import 'package:crud_object_box/ui/lista_tarefas_page.dart';
import 'package:flutter/material.dart';

void main()async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBoxDatabase.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListaTarefasPage();
  }
}
