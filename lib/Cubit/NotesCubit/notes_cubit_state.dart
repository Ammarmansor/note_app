part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

final class NotesCubitLoading extends NotesCubitState {}

final class NotesCubitSuccess extends NotesCubitState {
}

final class NotesCubitFailure extends NotesCubitState {
  final String message;

  NotesCubitFailure({required this.message});
}
