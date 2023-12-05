import 'pages.dart';
class Query {
  Query({
    required this.pages,
  });

  List<Pages>? pages;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    pages:
    // json["pages"] == null
    //     ? List<Page>.empty()
    //     :
    List<Pages>.from(json["pages"].map((x) => Pages.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    // "pages": pages == null
    //     ? null
    "pages": List<dynamic>.from(pages!.map((x) => x.toJson())),
  };
}