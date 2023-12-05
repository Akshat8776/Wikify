import 'query.dart';

class SearchResult {
  SearchResult({
    required this.query,
  });

  Query? query;
  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
      );

  Map<String, dynamic> toJson() => {
        "query": query == null ? null : query!.toJson(),
      };
}
