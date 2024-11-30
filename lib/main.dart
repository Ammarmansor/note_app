import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp2/Cubit/NotesCubit/notes_cubit_cubit.dart';
import 'package:noteapp2/Screens/EditNote.dart';
import 'package:noteapp2/Screens/HomeScreen.dart';
import 'package:noteapp2/constants.dart';
import 'package:noteapp2/model/NotesModel.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          EditNote.id: (context) => const EditNote(),
        },
        initialRoute: HomeScreen.id,
        home: const HomeScreen(),
      ),
    );
  }
}
