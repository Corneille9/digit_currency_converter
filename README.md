# Digit Currency Converter

The `digit_currency_converter` package is a powerful tool for handling currency conversions, retrieving real-time exchange rates, and obtaining device-specific locale information in Flutter applications. This package offers robust API integration and is designed to be flexible, catering to both direct API usage and managed state via provider pattern within the Flutter framework.

## Features

- **Direct Currency Conversion**: Convert amounts directly from one currency to another using up-to-date exchange rates.
- **Device Locale Information**: Automatically fetch the currency and country based on the device's IP address.
- **Exchange Rate Retrieval**: Get the latest exchange rates between two specified currencies.
- **Provider State Management**: Utilize a provider to manage and reactively update UI components based on currency-related data changes.

## Installation

Add the `digit_currency_converter` to your project's `pubspec.yaml` file:

```yaml
dependencies:
  digit_currency_converter:
    git: 
      url: https://github.com/Corneille9/digit_currency_converter
      ref: main
```

## Usage

### Setup

First, set up the `DigitCurrencyConverter` with your API credentials:

```dart
import 'package:digit_currency_converter/digit_currency_converter.dart';

const credentials = Credentials(username: "YOUR_USERNAME", password: "YOUR_PASSWORD");
final converter = DigitCurrencyConverter(credentials: credentials);
```

### Performing Currency Conversions

Convert an amount from one currency to another:

```dart
final result = await converter.convert(from: Currency.xof, to: Currency.eur, amount: 50000);
```

### Retrieving Device Currency and Country

Get the device's current currency and country based on IP:

```dart
final deviceCurrency = await DigitCurrencyConverter.deviceCurrency();
final deviceCountry = await DigitCurrencyConverter.deviceCountry();
```

### Fetching Exchange Rates

Retrieve the current exchange rate between two currencies:

```dart
final rate = await converter.rate(from: Currency.xof, to: Currency.eur);
```

### Converting with Specific or Device Country/Currency

Convert amounts using a specific country's currency or directly using the device's detected values:

```dart
final resultWithCountry = await converter.convertWithCountry(countryCode: "BJ", from: Currency.usd, amount: 100);
final resultWithDeviceCountry = await converter.convertWithDeviceCountry(from: Currency.usd, amount: 100);
final resultWithDeviceCurrency = await converter.convertWithDeviceCurrency(from: Currency.usd, amount: 100);
```

### Using DigitCurrencyProvider

For applications needing reactive state management:

```dart
ChangeNotifierProvider(
  create: (_) => DigitCurrencyProvider(
    credentials: credentials,
    from: Currency.xof,
    to: Currency.eur, // Optional
    useDeviceCurrency: false, // Set to true to use the device's currency
  ),
  child: Consumer<DigitCurrencyProvider>(
    builder: (context, provider, child) {
      if (provider.hasError) {
        return Text('Failed to load data');
      }
      if (!provider.initialized) {
        return CircularProgressIndicator();
      }
      return Text('Rate: ${provider.rate}');
    },
  ),
);
```

## Contributing

We welcome contributions to enhance the `digit_currency_converter` package. Please read the contributing guidelines for more information on how to submit pull requests, report issues, or make feature requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.