import 'dart:convert';
import 'package:http/http.dart' as http;

const googleKey = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';

class LocationHelper {
  static Future<dynamic> getCurrentAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleKey';
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['results'][0]['formatted_address'];
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Fail to Access');
    }
  }
}
