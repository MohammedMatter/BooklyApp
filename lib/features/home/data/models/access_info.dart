import 'package:bookly_app/features/home/data/models/equp.dart';
import 'package:bookly_app/features/home/data/models/pdf.dart';

class AccessInfo {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final Pdf? pdf;
  final Epub? epub;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    this.pdf,
    this.epub,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json['country'] ?? '',
        viewability: json['viewability'] ?? '',
        embeddable: json['embeddable'] ?? false,
        publicDomain: json['publicDomain'] ?? false,
        textToSpeechPermission: json['textToSpeechPermission'] ?? '',
        pdf: json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null,
        epub: json['epub'] != null ? Epub.fromJson(json['epub']) : null,
        webReaderLink: json['webReaderLink'],
        accessViewStatus: json['accessViewStatus'],
        quoteSharingAllowed: json['quoteSharingAllowed'],
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'viewability': viewability,
        'embeddable': embeddable,
        'publicDomain': publicDomain,
        'textToSpeechPermission': textToSpeechPermission,
        'pdf': pdf?.toJson(),
        'epub': epub?.toJson(),
        'webReaderLink': webReaderLink,
        'accessViewStatus': accessViewStatus,
        'quoteSharingAllowed': quoteSharingAllowed,
      };
}