import 'thumbnail.dart';
import 'description.dart';
class Pages {
  Pages({
    required this.title,
    required this.pageid,
    required this.ns,
    required this.index,
    required this.url,
    required this.extract,
    required this.thumbnail,
    required this.terms,
  });
  String? extract;
  int pageid;
  String? title;
  int? index;
  Thumbnail? thumbnail;
  int ns;
  String url;
  Terms? terms;

  factory Pages.fromJson(Map<String, dynamic> json) => Pages(
    pageid: json["pageid"],
    ns: json["ns"],
    thumbnail: json["thumbnail"] == null
        ? null
        : Thumbnail.fromJson(json["thumbnail"]),
    extract: json["extract"],
    url: json["fullurl"],
    title: json["title"],
    index: json["index"],
    terms: json["terms"] == null ? null : Terms.fromJson(json["terms"]),
  );

  Map<String, dynamic> toJson() => {
    "pageid": pageid,
    "ns": ns,
    "url": url,
    "extract": extract,
    "thumbnail": thumbnail == null ? null : thumbnail!.toJson(),
    "title": title,
    "index": index,
    "terms": terms == null ? null : terms!.toJson(),
  };
}