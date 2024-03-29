import 'package:flutter_work/models/document.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  final int start;
  final int numFound;

  @JsonKey(name: 'docs')
  final List<Document> docs;

  SearchResult({this.start = 0, this.numFound = 0, this.docs = const []});

  factory SearchResult.empty() => SearchResult(docs: []);

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
