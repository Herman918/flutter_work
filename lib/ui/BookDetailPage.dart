import 'package:flutter/material.dart';
import 'package:flutter_work/models/document.dart';

class BookDetailPage extends StatelessWidget {
  final Document document;

  const BookDetailPage({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Book Title: ${document.title ?? "Unknown"}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Author: ${document.authorName?.first ?? "Unknown"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'First Publish Year: ${document.firstPublishYear ?? "Unknown"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Publisher: ${document.publisher?.first ?? "Unknown"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Language: ${document.language?.first ?? "Unknown"}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
