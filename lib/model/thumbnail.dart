class Thumbnail {
  Thumbnail({
    this.source,
    this.width,
    this.height,
  });

  String? source;
  int? width;
  int? height;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    source: json["source"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "width": width,
    "height": height,
  };
}