class Terms {
  Terms({
    this.description,
  });

  List<String>? description;

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
        description: json["description"] == null
            ? null
            : List<String>.from(json["description"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description == null
            ? null
            : List<dynamic>.from(description!.map((x) => x)),
      };
}
