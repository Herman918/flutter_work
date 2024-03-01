// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      titleSuggest: json['title_suggest'] as String? ?? '',
      editionKey: (json['edition_key'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      coverId: json['cover_i'] as int? ?? 0,
      isbn:
          (json['isbn'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      hasFulltext: json['has_fulltext'] as bool? ?? false,
      authorName: (json['author_name'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      contributor: (json['contributor'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      authorKey: (json['author_key'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      firstPublishYear: json['first_publish_year'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      publisher: (json['publisher'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      language: (json['language'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'title_suggest': instance.titleSuggest,
      'edition_key': instance.editionKey,
      'cover_i': instance.coverId,
      'isbn': instance.isbn,
      'has_fulltext': instance.hasFulltext,
      'author_name': instance.authorName,
      'contributor': instance.contributor,
      'author_key': instance.authorKey,
      'first_publish_year': instance.firstPublishYear,
      'title': instance.title,
      'publisher': instance.publisher,
      'language': instance.language,
    };
