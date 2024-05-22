// ----------------------------------------------------------------------------------
// Author : Corneille Bankole
// GitHub : https://github.com/Corneille9
// ----------------------------------------------------------------------------------

import 'package:flutter_test/flutter_test.dart';

import 'package:digit_currency_converter/digit_currency_converter.dart';

void main() {
  group('DigitCurrencyConverter Tests', () {
    const Credentials credentials = Credentials(username: "test", password: "test");
    late DigitCurrencyConverter converter;

    setUp(() {
      converter = DigitCurrencyConverter(credentials: credentials);
    });

    test('DigitCurrencyConverter instance creation', () {
      expect(converter, isNotNull);
    });

    test('Convert 50,000 XOF to EUR', () async {
      final result = await converter.convert(from: Currency.xof, to: Currency.eur, amount: 50000);
      expect(result, 76.2);
    });

    test('Convert 100 USD with country code BJ', () async {
      final result = await converter.convertWithCountry(countryCode: "BJ", from: Currency.usd, amount: 100);
      expect(result, 60879.6706);
    });

    test('Get device currency', () async {
      expect(await DigitCurrencyConverter.deviceCurrency(), "XOF");
    });

    test('Get device country', () async {
      expect(await DigitCurrencyConverter.deviceCountry(), "BJ");
    });

    test('Get exchange rate from XOF to EUR', () async {
      expect(await converter.rate(from: Currency.xof, to: Currency.eur), 0.001524);
    });

    // test('Check supported currencies', () async {
    //   var base = Currency.xof;
    //   List<Currency> unsupported = [];
    //
    //   for(var currency in Currency.values) {
    //     var result = await converter.convert(from: base, to: currency, amount: 1);
    //     if (result == null) {
    //       unsupported.add(currency);
    //     }
    //   }
    //
    //   print("Unsupported currencies: $unsupported");
    //
    //   expect(unsupported.isEmpty, true);
    // });
  });

}
