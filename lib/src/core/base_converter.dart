import '../common/currency.dart';

abstract class BaseConverter {
  Future<num?> rate({required Currency from, required Currency to});

  Future<num?> convert({required Currency from, required Currency to, required double amount, bool withoutRounding = true,});

  Future<num?> convertWithCountry({required String countryCode, required Currency from, required double amount, bool withoutRounding = true,});

  Future<num?> convertWithDeviceCountry({required Currency from, required double amount, bool withoutRounding = true,});

  Future<num?> convertWithDeviceCurrency({required Currency from, required double amount, bool withoutRounding = true,});
}