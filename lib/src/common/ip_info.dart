
class IpInfo{
  final String query;
  final String status;
  final String country;
  final String countryCode;
  final String currency;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final num lat;
  final num lon;
  final String timezone;

//<editor-fold desc="Data Methods">
  const IpInfo({
    required this.query,
    required this.status,
    required this.country,
    required this.countryCode,
    required this.currency,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IpInfo &&
          runtimeType == other.runtimeType &&
          query == other.query &&
          status == other.status &&
          country == other.country &&
          countryCode == other.countryCode &&
          currency == other.currency &&
          region == other.region &&
          regionName == other.regionName &&
          city == other.city &&
          zip == other.zip &&
          lat == other.lat &&
          lon == other.lon &&
          timezone == other.timezone);

  @override
  int get hashCode =>
      query.hashCode ^
      status.hashCode ^
      country.hashCode ^
      countryCode.hashCode ^
      currency.hashCode ^
      region.hashCode ^
      regionName.hashCode ^
      city.hashCode ^
      zip.hashCode ^
      lat.hashCode ^
      lon.hashCode ^
      timezone.hashCode;

  @override
  String toString() {
    return 'IpInfo{ query: $query, status: $status, country: $country, countryCode: $countryCode, currency: $currency, region: $region, regionName: $regionName, city: $city, zip: $zip, lat: $lat, lon: $lon, timezone: $timezone,}';
  }

  IpInfo copyWith({
    String? query,
    String? status,
    String? country,
    String? countryCode,
    String? currency,
    String? region,
    String? regionName,
    String? city,
    String? zip,
    num? lat,
    num? lon,
    String? timezone,
  }) {
    return IpInfo(
      query: query ?? this.query,
      status: status ?? this.status,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      currency: currency ?? this.currency,
      region: region ?? this.region,
      regionName: regionName ?? this.regionName,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'query': this.query,
      'status': this.status,
      'country': this.country,
      'countryCode': this.countryCode,
      'currency': this.currency,
      'region': this.region,
      'regionName': this.regionName,
      'city': this.city,
      'zip': this.zip,
      'lat': this.lat,
      'lon': this.lon,
      'timezone': this.timezone,
    };
  }

  factory IpInfo.fromMap(Map<String, dynamic> map) {
    return IpInfo(
      query: map['query'] ?? '',
      status: map['status'] ?? '',
      country: map['country'] ?? '',
      countryCode: map['countryCode'] ?? '',
      currency: map['currency'] ?? '',
      region: map['region'] ?? '',
      regionName: map['regionName'] ?? '',
      city: map['city'] ?? '',
      zip: map['zip'] ?? '',
      lat: map['lat'] ?? 0,
      lon: map['lon'] ?? 0,
      timezone: map['timezone'] ?? '',
    );
  }

//</editor-fold>
}