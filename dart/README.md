# IBAN Validator API - Dart/Flutter Client

IBAN Validator checks an IBAN's mod-97 checksum, its length and format for the country, and national check digits where the country defines them. It returns whether the IBAN is valid, the country and the reasons it fails. Paid plans add the bank code, branch code and account number, the correct check digits and the SEPA flag.

[![pub package](https://img.shields.io/pub/v/apiverve_ibanvalidator.svg)](https://pub.dev/packages/apiverve_ibanvalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [IBAN Validator API](https://apiverve.com/marketplace/ibanvalidator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_ibanvalidator: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_ibanvalidator/apiverve_ibanvalidator.dart';

void main() async {
  final client = IbanvalidatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'iban': 'GB29NWBK60161331926819'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "iban": "GB29NWBK60161331926819",
    "isValid": true,
    "formatted": "GB29 NWBK 6016 1331 9268 19",
    "countryCode": "GB",
    "countryName": "United Kingdom",
    "checkDigits": "29",
    "expectedLength": 22,
    "length": 22,
    "errors": [],
    "bban": "NWBK60161331926819",
    "bankCode": "NWBK",
    "branchCode": "601613",
    "accountNumber": "31926819",
    "nationalCheckDigits": null,
    "expectedCheckDigits": "29",
    "isSEPA": true,
    "isQRIBAN": false,
    "checks": {
      "country": true,
      "length": true,
      "format": true,
      "checksum": true,
      "nationalCheckDigits": null
    }
  }
}
```

## API Reference

- **API Home:** [IBAN Validator API](https://apiverve.com/marketplace/ibanvalidator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/ibanvalidator](https://docs.apiverve.com/ref/ibanvalidator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
