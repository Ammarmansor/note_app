import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp2/Cubit/AddNotesCubit/add_note_cubit.dart';
import 'package:noteapp2/Cubit/NotesCubit/notes_cubit_cubit.dart';
import 'package:noteapp2/model/NotesModel.dart';
import 'package:noteapp2/widgets/CustomButton.dart';
import 'package:noteapp2/widgets/Customtextfield.dart';

class Formbottomsheet extends StatefulWidget {
  const Formbottomsheet({
    super.key,
  });

  @override
  State<Formbottomsheet> createState() => _FormbottomsheetState();
}

class _FormbottomsheetState extends State<Formbottomsheet> {
  String? title, subtitle;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteLoading) {
          print('loading ');
        }
      },
      builder: (context, state) {
        if (state is AddNoteLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Form(
          autovalidateMode: autovalidateMode,
          key: formkey,
          child: Column(
            children: [
              CustomTextField(
                onSaved: (p0) {
                  title = p0;
                },
                label: 'title',
                hintText: 'title',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                onSaved: (p0) {
                  subtitle = p0;
                },
                label: 'subtitle',
                hintText: 'subtitle',
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Add Note',
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    NotesModel note = NotesModel(
                      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      title: title!,
                      subtitle: subtitle!,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    
                    
                    Navigator.of(context).pop();
                    BlocProvider.of<NotesCubit>(context).fetchNotes();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}
