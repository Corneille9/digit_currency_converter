// ----------------------------------------------------------------------------------
// Author : Corneille Bankole
// GitHub : https://github.com/Corneille9
// ----------------------------------------------------------------------------------

library digit_currency_converter;

import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:digit_currency_converter/src/common/credentials.dart';
import 'package:digit_currency_converter/src/common/ip_info.dart';
import 'package:digit_currency_converter/src/common/utils.dart';
import 'package:digit_currency_converter/src/core/base_converter.dart';
import 'package:digit_currency_converter/src/common/currency.dart';
import 'package:digit_currency_converter/src/core/http_client.dart';

export 'package:digit_currency_converter/src/common/credentials.dart';
export 'package:digit_currency_converter/src/common/currency.dart';
export 'package:digit_currency_converter/src/common/ip_info.dart';
export 'package:digit_currency_converter/src/core/digit_currency_provider.dart';

/// A class that provides currency conversion functionalities.
///
/// This class implements the [BaseConverter] interface and provides methods
/// to convert currencies, get the currency and country of the device, and
/// fetch exchange rates using an API. It requires [Credentials] for API authentication.
class DigitCurrencyConverter implements BaseConverter {
  /// Authentication credentials for the API.
  final Credentials credentials;

  /// Base URL for the currency exchange API.
  String get _baseUrl => "api.exchangeratesapi.org";

  /// Creates an instance of [DigitCurrencyConverter] with the given [credentials].
  DigitCurrencyConverter({required this.credentials});

  /// Headers for HTTP requests, including authorization and content type.
  Map<String, String> get _headers => {
    "Authorization": "Basic ${base64.encode(utf8.encode("${credentials.username}:${credentials.password}"))}",
    "Content-Type": "application/json",
  };

  /// Converts an amount from one currency to another.
  /// 
  /// This method posts a request to the API to convert [amount] from currency [from]
  /// to currency [to]. The result can be rounded if [withoutRounding] is set to false.
  @override
  Future<num?> convert({
    required Currency from,
    required Currency to,
    required double amount,
    bool withoutRounding = true
  }) async {
    try {
      var client = HttpClient(_baseUrl);
      var response = await client.post(
          "/exchange-rate-app/api/convert/by-currency-exchanges",
          {"from": from.name.toUpperCase(), "to": to.name.toUpperCase(), "amount": amount},
          headers: _headers
      );

      if(response.isFailed) return null;

      var value = response.data["data"]["amountConverted"];
      return value == null ? null : withoutRounding ? num.parse(value.toString()) : num.parse(value.toStringAsFixed(2));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      logger(message: "Error while converting currency", error: e, stackTrace: s);
      return null;
    }
  }

  /// Converts an amount from a specific country's currency.
  /// 
  /// Similar to [convert], but uses a country code [countryCode] to specify the country
  /// for which the currency conversion is relevant.
  @override
  Future<num?> convertWithCountry({
    required String countryCode,
    required Currency from,
    required double amount,
    bool withoutRounding = true
  }) async {
    try {
      var client = HttpClient(_baseUrl);
      var response = await client.post(
          "/exchange-rate-app/api/convert/by-country-exchanges",
          {"from": from.name.toUpperCase(), "countryCode": countryCode.toUpperCase(), "amount": amount},
          headers: _headers
      );

      if(response.isFailed) return null;

      var value = response.data["data"]["amountConverted"];
      return value == null ? null : withoutRounding ? num.parse(value.toString()) : num.parse(value.toStringAsFixed(2));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      logger(message: "Error while converting currency", error: e, stackTrace: s);
      return null;
    }
  }

  /// Gets the exchange rate between two currencies.
  /// 
  /// This method simply calls [convert] with an amount of 1 to get the rate from currency [from] to [to].
  @override
  Future<num?> rate({required Currency from, required Currency to}) async {
    return await convert(from: from, to: to, amount: 1, withoutRounding: true);
  }

  /// Retrieves the country of the device based on IP information.
  static Future<String?> deviceCountry() async {
    try {
      IpInfo? ipInfo = await getInfo();
      if (ipInfo == null || ipInfo.countryCode.isEmpty) return null;
      return ipInfo.countryCode;
    } catch (e, s) {
      logger(message: "Error while getting device country", error: e, stackTrace: s);
      return null;
    }
  }

  /// Retrieves the currency of the device based on IP information.
  static Future<String?> deviceCurrency() async {
    try {
      IpInfo? ipInfo = await getInfo();
      if (ipInfo == null || ipInfo.currency.isEmpty) return null;
      return ipInfo.currency.toUpperCase();
    } catch (e, s) {
      logger(message: "Error while getting device currency", error: e, stackTrace: s);
      return null;
    }
  }

  /// Converts a specified amount from a given currency to the currency associated with the device's country.
  ///
  /// This method retrieves the country code from the device's location (as determined by IP)
  /// and uses it to perform a currency conversion from the specified `from` currency to the corresponding
  /// country's currency.
  ///
  /// Parameters:
  ///   - `from`: The currency from which to convert. This is the base currency for the conversion.
  ///   - `amount`: The amount of the `from` currency to convert.
  ///   - `withoutRounding`: A boolean value that determines whether the converted result should be
  ///     rounded. If set to `true`, the result is not rounded. Defaults to `true`.
  ///
  /// Returns:
  ///   - A [Future] that completes with the converted amount as a [num], or `null` if the conversion
  ///     could not be performed (e.g., if the country code could not be determined).
  ///
  /// Example:
  ///   - To convert 100 USD to the currency of the device's country:
  ///     ```
  ///     var convertedAmount = await converter.convertWithDeviceCountry(from: Currency.usd, amount: 100);
  ///     ```
  @override
  Future<num?> convertWithDeviceCountry({required Currency from, required double amount, bool withoutRounding = true}) async {
    String? countryCode = await DigitCurrencyConverter.deviceCountry();

    if (countryCode == null) return null;

    return await convertWithCountry(countryCode: countryCode, from: from, amount: amount, withoutRounding: withoutRounding);
  }

  /// Converts a specified amount from a given currency to the device's currency.
  ///
  /// This method fetches the currency associated with the device's current location (as determined
  /// by IP) and converts a specified amount from the `from` currency to this device currency.
  ///
  /// Parameters:
  ///   - `from`: The base currency from which to convert.
  ///   - `amount`: The amount in the `from` currency to be converted.
  ///   - `withoutRounding`: Determines whether the resulting amount should be rounded or not.
  ///     If set to `true`, the result will not be rounded. Defaults to `true`.
  ///
  /// Returns:
  ///   - A [Future] that completes with the converted amount as a [num], or `null` if the conversion
  ///     cannot be completed (e.g., if the device's currency could not be retrieved).
  ///
  /// Example:
  ///   - To convert 50 EUR to the device's currency:
  ///     ```
  ///     var convertedAmount = await converter.convertWithDeviceCurrency(from: Currency.eur, amount: 50);
  ///     ```
  @override
  Future<num?> convertWithDeviceCurrency({required Currency from, required double amount, bool withoutRounding = true}) async {
    String? currency = await DigitCurrencyConverter.deviceCurrency();

    if (currency == null) return null;

    return await convert(from: from, to: currency.asCurrency, amount: amount, withoutRounding: withoutRounding);
  }

}
