
import 'package:flutter_work/utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable()
class Document {

  @JsonKey(name:'title_suggest')
  final String titleSuggest;
  @JsonKey(name:'edition_key')
  final List<String> editionKey;
  @JsonKey(name:'cover_i')
  final int? coverId;
  final List<String> isbn;
  @JsonKey(name:'has_fulltext')
  final bool hasFulltext;
  @JsonKey(name:'author_name')
  final List<String> authorName;
  final List<String> contributor;
  @JsonKey(name:'author_key')
  final List<String> authorKey;
  @JsonKey(name:'first_publish_year')
  final int firstPublishYear;
  final String title;
  final List<String> publisher;
  final List<String> language;

  Document({
    this.titleSuggest = '',
    this.editionKey = const [],
    this.coverId = 0,
    this.isbn = const [],
    this.hasFulltext = false,
    this.authorName = const [],
    this.contributor = const [],
    this.authorKey = const [],
    this.firstPublishYear = 0,
    this.title = '',
    this.publisher = const [],
    this.language = const [],
  });

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);

  String getBookCover() {
    if (coverId == null) {
      return ''; // или любое другое значение по умолчанию
    }
    return "${Constants.BASE_URL_COVER}b/id/$coverId.jpg";
  }

}