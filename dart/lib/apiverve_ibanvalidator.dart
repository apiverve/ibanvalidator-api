/// IBAN Validator API client for Dart/Flutter
///
/// IBAN Validator checks an IBAN's mod-97 checksum, its length and format for the country, and national check digits where the country defines them. It returns whether the IBAN is valid, the country and the reasons it fails. Paid plans add the bank code, branch code and account number, the correct check digits and the SEPA flag.
///
/// For more information, visit: https://apiverve.com/marketplace/ibanvalidator?utm_source=dart&utm_medium=referral&utm_content=readme
library apiverve_ibanvalidator;

export 'src/client.dart';
export 'src/models.dart';
