import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:noteapp2/constants.dart';
import 'package:noteapp2/model/NotesModel.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial());
  List<NotesModel>? allNotes;
  fetchNotes() {
    emit(NotesCubitLoading());
    var notesBox = Hive.box<NotesModel>(kNotesBox);
    allNotes = notesBox.values.toList();
    emit(NotesCubitSuccess());
  }
}
