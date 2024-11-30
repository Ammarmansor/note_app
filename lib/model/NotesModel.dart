import 'package:hive/hive.dart';

part 'NotesModel.g.dart';
@HiveType(typeId:0 )
class NotesModel extends HiveObject{
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String subtitle;
  
  NotesModel( { required this.date, required this.title, required this.subtitle});
}
