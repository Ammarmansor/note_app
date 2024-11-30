import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/Cubit/NotesCubit/notes_cubit_cubit.dart';
import 'package:noteapp2/helper/CustomFloatingbutton.dart';
import 'package:noteapp2/model/NotesModel.dart';
import 'package:noteapp2/widgets/CardGenerator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const CustomFloatingActionButton(),
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Notes'),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.add),
            ),
          ],
        ),
        body: BlocBuilder<NotesCubit, NotesCubitState>(
          builder: (context, state) {
            if (state == NotesCubitLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<NotesModel> notes =
                  BlocProvider.of<NotesCubit>(context).allNotes ?? [];
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: notes.length,
                  itemBuilder: (context, index) => CardGenerator(
                        note: notes[index],
                      ));
            }
          },
        ));
  }
}
