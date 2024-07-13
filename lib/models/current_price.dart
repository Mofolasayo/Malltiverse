class CurrentPrice {
  CurrentPrice({
    required this.ngn,
  });

  final List<dynamic> ngn;

  factory CurrentPrice.fromJson(Map<String, dynamic> json) {
    return CurrentPrice(
      ngn: json["NGN"] == null
          ? []
          : List<dynamic>.from(json["NGN"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "NGN": ngn.map((x) => x).toList(),
      };
}
