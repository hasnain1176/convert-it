
import 'package:currency_convertor_app/Model/allcurrencies.dart';
import 'package:currency_convertor_app/Model/ratemodel.dart';
import 'package:currency_convertor_app/Utils/key.dart';

import 'package:http/http.dart' as http;

Future<RatesModel> fetchrates() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/latest.json?app_id=87008fdae03148a68d4b867e56f40a04'));
      print(response.statusCode);
  final result = ratesModelFromJson(response.body);
  return result;
}

Future<Map> fetchcurrencies() async {
  var response = await http.get(Uri.parse(
       'https://openexchangerates.org/api/currencies.json?app_id=' + key));
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

String convertany(Map exchangeRates, String amount, String currencybase,
    String currencyfinal) {
  String output = (double.parse(amount) /
          exchangeRates[currencybase] *
          exchangeRates[currencyfinal])
      .toStringAsFixed(2)
      .toString();

  return output;
}
