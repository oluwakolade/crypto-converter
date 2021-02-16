import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> cryptoList = ['BTC', 'ETH', 'LTC','XRP'];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'ADE0E228-0B70-48D2-95CC-D1A0ABC1C99C';


class CoinData {
  Future getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {

      String requestURL =
          '$coinAPIURL/$crypto/NGN?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}