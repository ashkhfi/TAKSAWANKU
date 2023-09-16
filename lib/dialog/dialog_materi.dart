import 'package:flutter/material.dart';

class Dialog_materi extends StatefulWidget {
  const Dialog_materi({Key? key}) : super(key: key);

  @override
  State<Dialog_materi> createState() => _Dialog_materiState();
}

class _Dialog_materiState extends State<Dialog_materi> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          "Materi 1"
        ),
      ),
    );
  }
}
