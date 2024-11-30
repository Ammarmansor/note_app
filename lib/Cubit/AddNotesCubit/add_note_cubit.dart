import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:noteapp2/constants.dart';
import 'package:noteapp2/model/NotesModel.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NotesModel note) async {
    emit(AddNoteLoading());
    try {
            var noteBox = Hive.box<NotesModel>(kNotesBox);
      await noteBox.add(note);
      print(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(message: e.toString()));
    }
  }
}
