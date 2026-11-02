/// Response models for the IBAN Validator API.

/// API Response wrapper.
class IbanvalidatorResponse {
  final String status;
  final dynamic error;
  final IbanvalidatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  IbanvalidatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory IbanvalidatorResponse.fromJson(Map<String, dynamic> json) => IbanvalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? IbanvalidatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the IBAN Validator API.

class IbanvalidatorData {
  String? iban;
  bool? isValid;
  String? formatted;
  String? countryCode;
  String? countryName;
  String? checkDigits;
  num? expectedLength;
  num? length;
  List<dynamic>? errors;
  String? bban;
  String? bankCode;
  String? branchCode;
  String? accountNumber;
  dynamic nationalCheckDigits;
  String? expectedCheckDigits;
  bool? isSEPA;
  bool? isQRIBAN;
  IbanvalidatorDataChecks? checks;

  IbanvalidatorData({
    this.iban,
    this.isValid,
    this.formatted,
    this.countryCode,
    this.countryName,
    this.checkDigits,
    this.expectedLength,
    this.length,
    this.errors,
    this.bban,
    this.bankCode,
    this.branchCode,
    this.accountNumber,
    this.nationalCheckDigits,
    this.expectedCheckDigits,
    this.isSEPA,
    this.isQRIBAN,
    this.checks,
  });

  factory IbanvalidatorData.fromJson(Map<String, dynamic> json) => IbanvalidatorData(
      iban: json['iban'],
      isValid: json['isValid'],
      formatted: json['formatted'],
      countryCode: json['countryCode'],
      countryName: json['countryName'],
      checkDigits: json['checkDigits'],
      expectedLength: json['expectedLength'],
      length: json['length'],
      errors: (json['errors'] as List?)?.cast<dynamic>(),
      bban: json['bban'],
      bankCode: json['bankCode'],
      branchCode: json['branchCode'],
      accountNumber: json['accountNumber'],
      nationalCheckDigits: json['nationalCheckDigits'],
      expectedCheckDigits: json['expectedCheckDigits'],
      isSEPA: json['isSEPA'],
      isQRIBAN: json['isQRIBAN'],
      checks: json['checks'] != null ? IbanvalidatorDataChecks.fromJson(json['checks']) : null,
    );
}

class IbanvalidatorDataChecks {
  bool? country;
  bool? length;
  bool? format;
  bool? checksum;
  dynamic nationalCheckDigits;

  IbanvalidatorDataChecks({
    this.country,
    this.length,
    this.format,
    this.checksum,
    this.nationalCheckDigits,
  });

  factory IbanvalidatorDataChecks.fromJson(Map<String, dynamic> json) => IbanvalidatorDataChecks(
      country: json['country'],
      length: json['length'],
      format: json['format'],
      checksum: json['checksum'],
      nationalCheckDigits: json['nationalCheckDigits'],
    );
}

class IbanvalidatorRequest {
  String iban;

  IbanvalidatorRequest({
    required this.iban,
  });

  Map<String, dynamic> toJson() => {
      'iban': iban,
    };
}
