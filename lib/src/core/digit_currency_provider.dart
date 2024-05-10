// ----------------------------------------------------------------------------------
// Author : Corneille Bankole
// GitHub : https://github.com/Corneille9
// ----------------------------------------------------------------------------------

import 'package:digit_currency_converter/src/common/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:digit_currency_converter/digit_currency_converter.dart';

/// Provides centralized access to currency conversion and device-specific information.
///
/// This class utilizes the `DigitCurrencyConverter` for currency-related operations
/// and adheres to the provider pattern to manage and distribute application state
/// related to currency and locale.
class DigitCurrencyProvider with ChangeNotifier {
  /// Credentials required for the currency converter API.
  final Credentials credentials;

  /// The base currency from which conversions are calculated.
  Currency from;

  /// The target currency to convert to. Must be non-null if `useDeviceCurrency` is false.
  Currency? to;

  /// Optional country code to override automatic country detection based on IP.
  String? countryCode;

  /// Flag to determine whether to use the device's locale or manual settings for currency.
  bool useDeviceCurrency;

  late DigitCurrencyConverter _converter;
  IpInfo? _ipInfo;
  String? _deviceCurrency;
  String? _deviceCountry;
  num? _rate;
  bool _disposed = false;
  bool isLoading = false;

  /// Constructs a [DigitCurrencyProvider] with necessary initializations.
  ///
  /// Throws an [AssertionError] if `to` is null while `useDeviceCurrency` is false.
  DigitCurrencyProvider({
    required this.credentials,
    required this.from,
    this.to,
    this.countryCode,
    this.useDeviceCurrency = false,
  }) {
    assert(useDeviceCurrency || to != null, "to currency must not be null when useDeviceCurrency is false");
    _converter = DigitCurrencyConverter(credentials: credentials);
    _initialize();
  }

  /// Indicates whether all required information has been successfully loaded.
  bool get initialized => _ipInfo != null && _deviceCountry != null && _deviceCurrency != null && _rate != null;

  /// Indicates whether there has been an error during loading of information.
  bool get hasError => !initialized || isLoading;

  /// Returns the IP information of the device.
  IpInfo get ipInfo => _ipInfo!;

  /// Returns the current currency of the device.
  String get deviceCurrency => _deviceCurrency!;

  /// Returns the current country of the device.
  String get deviceCountry => _deviceCountry!;

  /// Returns the current conversion rate from [from] to [deviceCurrency].
  num get rate => _rate!;

  /// Returns the IP address from the device's IP information.
  String get deviceIp => _ipInfo!.query;

  /// Initializes provider data asynchronously and notifies listeners on update.
  Future<void> _initialize() async {
    if (isLoading) return;
    isLoading = true;

    try {
      if (useDeviceCurrency) {
        _deviceCurrency = await DigitCurrencyConverter.deviceCurrency();
        _deviceCountry = await DigitCurrencyConverter.deviceCountry();
      } else {
        if (countryCode != null) {
          _deviceCountry = countryCode;
        }
        if (to != null) {
          _deviceCurrency = to!.name;
        }
      }

      _ipInfo = await getInfo();
      _rate = await _converter.rate(from: from, to: deviceCurrency.asCurrency);
      isLoading = false;
    } catch (e, s) {
      isLoading = false;
      logger(error: e, stackTrace: s);
    }

    notifyListeners();
  }

  /// Public method to refresh the provider data.
  Future<void> refresh({Currency? to, Currency? from, bool? useDeviceCurrency}) async {
    if(to != null) this.to = to;
    if(from != null) this.from = from;
    if(useDeviceCurrency != null) this.useDeviceCurrency = useDeviceCurrency;
    await _initialize();
  }

  /// Overrides to prevent notifying listeners if the provider is disposed.
  @override
  void notifyListeners() {
    if (_disposed) return;
    super.notifyListeners();
  }

  /// Cleans up resources and marks the provider as disposed.
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
