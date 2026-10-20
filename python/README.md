IBAN Validator API
============

IBAN Validator checks an IBAN's mod-97 checksum, its length and format for the country, and national check digits where the country defines them. It returns whether the IBAN is valid, the country and the reasons it fails. Paid plans add the bank code, branch code and account number, the correct check digits and the SEPA flag.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-ibanvalidator.svg)](https://pypi.org/project/apiverve-ibanvalidator/)

This is a Python wrapper for the [IBAN Validator API](https://apiverve.com/marketplace/ibanvalidator?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-ibanvalidator
```

Using `pip3`:

```bash
pip3 install apiverve-ibanvalidator
```

---

## Configuration

Before using the IBAN Validator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_ibanvalidator.apiClient import IbanvalidatorAPIClient

# Initialize the client with your APIVerve API key
api = IbanvalidatorAPIClient("[YOUR_API_KEY]")

query = { "iban": "GB29NWBK60161331926819" }

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The IBAN Validator API documentation is found here: [https://docs.apiverve.com/ref/ibanvalidator](https://docs.apiverve.com/ref/ibanvalidator?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_ibanvalidator.apiClient import IbanvalidatorAPIClient

# Initialize the client with your APIVerve API key
api = IbanvalidatorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = { "iban": "GB29NWBK60161331926819" }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `IbanvalidatorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_ibanvalidator.apiClient import IbanvalidatorAPIClient, IbanvalidatorAPIClientError

api = IbanvalidatorAPIClient("[YOUR_API_KEY]")

query = { "iban": "GB29NWBK60161331926819" }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except IbanvalidatorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_ibanvalidator.apiClient import IbanvalidatorAPIClient, IbanvalidatorAPIClientError

api = IbanvalidatorAPIClient("[YOUR_API_KEY]")

query = { "iban": "GB29NWBK60161331926819" }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except IbanvalidatorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_ibanvalidator.apiClient import IbanvalidatorAPIClient, IbanvalidatorAPIClientError

query = { "iban": "GB29NWBK60161331926819" }

# Using context manager ensures proper cleanup
with IbanvalidatorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except IbanvalidatorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_ibanvalidator.apiClient import IbanvalidatorAPIClient

# Enable debug mode
api = IbanvalidatorAPIClient("[YOUR_API_KEY]", debug=True)

query = { "iban": "GB29NWBK60161331926819" }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_ibanvalidator.apiClient import IbanvalidatorAPIClient

api = IbanvalidatorAPIClient("[YOUR_API_KEY]")

query = { "iban": "GB29NWBK60161331926819" }

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
