import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  QueryDocumentSnapshot doc;
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);

  @override
  createState() => _NoteReaderState();
}

class _NoteReaderState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];

    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.doc["creating_date"],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              widget.doc["note_content"],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
