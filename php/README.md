# IBAN Validator API - PHP Package

IBAN Validator checks an IBAN's mod-97 checksum, its length and format for the country, and national check digits where the country defines them. It returns whether the IBAN is valid, the country and the reasons it fails. Paid plans add the bank code, branch code and account number, the correct check digits and the SEPA flag.

## Installation

Install via Composer:

```bash
composer require apiverve/ibanvalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Ibanvalidator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['iban' => 'GB29NWBK60161331926819']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Ibanvalidator\Client;
use APIVerve\Ibanvalidator\Exceptions\APIException;
use APIVerve\Ibanvalidator\Exceptions\ValidationException;

try {
    $response = $client->execute(['iban' => 'GB29NWBK60161331926819']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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
    "isQRIBAN": false
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/ibanvalidator?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/ibanvalidator?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/ibanvalidator?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
