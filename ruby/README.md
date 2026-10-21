# IBAN Validator API - Ruby Gem

IBAN Validator checks an IBAN's mod-97 checksum, its length and format for the country, and national check digits where the country defines them. It returns whether the IBAN is valid, the country and the reasons it fails. Paid plans add the bank code, branch code and account number, the correct check digits and the SEPA flag.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_ibanvalidator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_ibanvalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_ibanvalidator'

# Initialize the client
client = APIVerve::Ibanvalidator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ iban: "GB29NWBK60161331926819" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ iban: "GB29NWBK60161331926819" })
  puts response["data"]
rescue APIVerve::Ibanvalidator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Ibanvalidator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Ibanvalidator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/ibanvalidator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/ibanvalidator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/ibanvalidator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
