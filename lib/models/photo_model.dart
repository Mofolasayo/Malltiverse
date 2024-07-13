class Photo {
  Photo({
    required this.modelName,
    required this.modelId,
    required this.url,
    required this.position,
  });

  final String? modelName;
  final String? modelId;
  final String? url;
  final int? position;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      modelName: json["model_name"],
      modelId: json["model_id"],
      url: json["url"],
      position: json["position"],
    );
  }

  Map<String, dynamic> toJson() => {
        "model_name": modelName,
        "model_id": modelId,
        "url": url,
        "position": position,
      };
}
