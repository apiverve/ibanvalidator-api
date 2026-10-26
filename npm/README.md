# IBAN Validator API

IBAN Validator checks an IBAN's mod-97 checksum, its length and format for the country, and national check digits where the country defines them. It returns whether the IBAN is valid, the country and the reasons it fails. Paid plans add the bank code, branch code and account number, the correct check digits and the SEPA flag.

[![npm version](https://img.shields.io/npm/v/@apiverve/ibanvalidator.svg)](https://www.npmjs.com/package/@apiverve/ibanvalidator)

This is a JavaScript wrapper for the [IBAN Validator API](https://apiverve.com/marketplace/ibanvalidator?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/ibanvalidator
```

Using yarn:
```shell
yarn add @apiverve/ibanvalidator
```

---

## Configuration

Before using the IBAN Validator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The IBAN Validator API documentation is found here: [https://docs.apiverve.com/ref/ibanvalidator](https://docs.apiverve.com/ref/ibanvalidator?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const ibanvalidatorAPI = require('@apiverve/ibanvalidator');
const api = new ibanvalidatorAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  iban: "GB29NWBK60161331926819"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  iban: "GB29NWBK60161331926819"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  iban: "GB29NWBK60161331926819"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
