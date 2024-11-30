import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp2/Cubit/NotesCubit/notes_cubit_cubit.dart';
import 'package:noteapp2/Screens/EditNote.dart';
import 'package:noteapp2/model/NotesModel.dart';

class CardGenerator extends StatelessWidget {
  const CardGenerator({
    super.key,
    this.onIconTap,
    required this.note,
  });

  final NotesModel note;
  final void Function()? onIconTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(EditNote.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 255, 228, 145),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ),
              subtitle: Text(
                note.subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                },
                icon: const Icon(Icons.delete),
                iconSize: 32,
                style: const ButtonStyle(
                  iconColor: WidgetStatePropertyAll(Colors.black),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
