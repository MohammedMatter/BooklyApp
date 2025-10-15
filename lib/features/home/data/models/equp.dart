class Epub {
  final bool isAvailable;
  final String? acsTokenLink;

  Epub({required this.isAvailable, this.acsTokenLink});

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json['isAvailable'] ?? false,
        acsTokenLink: json['acsTokenLink'],
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
        'acsTokenLink': acsTokenLink,
      };
}