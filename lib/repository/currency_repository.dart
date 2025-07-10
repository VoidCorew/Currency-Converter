import 'package:currency_converter/models/currency_data.dart';
import 'package:dio/dio.dart';

abstract class CurrencyRepository {
  Future<CurrencyData> fetchRates();
}

class CurrencyRepositoryImpl implements CurrencyRepository {
  final String baseUrl = "http://api.exchangeratesapi.io/v1/latest?access_key=";
  final String apiKey = "cc8d56df29267289f23442bce66a8cc5";
  late final String url = "$baseUrl$apiKey";

  final Dio dio = Dio();

  @override
  Future<CurrencyData> fetchRates() async {
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = response.data;

      if (data['success'] == true) {
        final Map<String, dynamic> ratesDynamic = data['rates'];
        final Map<String, double> rates = ratesDynamic.map(
          (key, value) => MapEntry(key, (value as num).toDouble()),
        );

        final String date = data['date'];

        return CurrencyData(date: date, rates: rates);
      } else {
        throw Exception('API returned success: false');
      }
    } else {
      throw Exception('Failed to load rates, status: ${response.statusCode}');
    }
  }
}
