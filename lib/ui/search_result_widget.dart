import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/models/document.dart';
import 'package:flutter_work/ui/BookDetailPage.dart';

import 'BookDetailPage.dart'; // Подключаем страницу с деталями книги

class SearchResultWidget extends StatelessWidget {
  final Document document;

  const SearchResultWidget({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToBookDetail(context, document);
      },
      child: Container(
        height: 150.0,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBookCover(),
            _buildBookDetails(context),
          ],
        ),
      ),
    );
  }

  void _navigateToBookDetail(BuildContext context, Document document) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(document: document),
      ),
    );
  }

  Widget _buildBookCover() {
    return document.getBookCover() != null
        ? Container(
      width: 128.0,
      height: 128.0,
      margin: const EdgeInsets.only(right: 16.0),
      child: CachedNetworkImage(
        imageUrl: document.getBookCover()!,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.black),
      ),
    )
        : Container(width: 128.0, height: 128.0); // Placeholder if no cover available
  }

  Widget _buildBookDetails(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildBookInfo('Book Title', document.title ?? '-'),
          _buildBookInfo('Book Author', document.authorName?.first ?? 'Unknown Author'),
          _buildBookInfo('First Publish Year', document.firstPublishYear.toString()),
        ],
      ),
    );
  }

  Widget _buildBookInfo(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              content,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
