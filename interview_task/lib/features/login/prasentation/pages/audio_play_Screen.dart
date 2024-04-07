import 'package:flutter/material.dart';
import 'package:interview_task/core/utils/ui_data.dart';

class SongPlayScreen extends StatelessWidget {
  const SongPlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9, // Set aspect ratio as per your requirement
            child: Image.asset(
              UIData.musicpic,
              fit: BoxFit.cover, // Ensure the image covers the entire area
            ),
          ),
        ),
      ),
    );
  }
}
