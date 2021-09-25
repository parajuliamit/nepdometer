import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nepdometer/classes/data_response.dart';

class NetworkCall {
  static Future<DataResponse?> getData() async {
    var url = Uri.parse(
        'https://corona.lmao.ninja/v2/countries/nepal?yesterday=true');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);

        return DataResponse(
          activeCases: decodedData['active'],
          recentCases: decodedData['todayCases'],
          recentDeath: decodedData['todayDeaths'],
          recentRecovered: decodedData['todayRecovered'],
          totalCases: decodedData['cases'],
          totalDeath: decodedData['deaths'],
          totalRecovered: decodedData['recovered'],
          totalTest: decodedData['tests'],
          updateTime: decodedData['updated'],
        );
      } else {
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
