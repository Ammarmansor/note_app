import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/Cubit/AddNotesCubit/add_note_cubit.dart';
import 'package:noteapp2/helper/FormBottomSheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => AddNoteCubit(),
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context)
                        .viewInsets
                        .bottom, // this is how u make the item  go above the keyboard whenever u open it....
                  ),
                  child: Formbottomsheet()),
            );
          },
        );
      },
      backgroundColor: Colors.white,
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white),
      ),
      child: const Icon(size: 32, color: Colors.black, Icons.add),
    );
  }
}
