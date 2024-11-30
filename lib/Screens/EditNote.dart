import 'package:flutter/material.dart';
import 'package:noteapp2/model/NotesModel.dart';
import 'package:noteapp2/widgets/CustomButton.dart';
import 'package:noteapp2/widgets/Customtextfield.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key});
  static String id = 'EditNote';


  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text('Edit Note'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
                onPressed: () {

                },
                icon: const Icon(
                  Icons.done,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
                onSaved: (p0) {
                  title = p0;
                },
                label: 'title',
                hintText: 'title'),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              onSaved: (p0) {
                subtitle = p0;
              },
              label: 'subtitle',
              hintText: 'subtitle',
              maxLines: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(text: 'Done !', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
