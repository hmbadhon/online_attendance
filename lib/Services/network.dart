import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseAPI = 'http://128.199.215.102:4040';
const String storeURL = '/api/stores';
const String attendanceURL = '/api/attendance'; //APi Not Valid

Future<dynamic> getData() async {
  try {
    http.Response response = await http.get('$baseAPI$storeURL');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List decode = data['data'];
      return decode;
    } else {
      print(response.statusCode);
    }
  } catch (e) {
    print('Fail to Load');
  }
}

Future<dynamic> sendData({
  String uid,
  String name,
  double lat,
  double long,
  String address,
  String requestID,
}) async {
  try {
    http.Response response = await http.post(
      '$baseAPI$attendanceURL',
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'uid': uid,
          'name': name,
          'lat': lat.toString(),
          'long': long.toString(),
          'address': address,
          'requestedID': requestID,
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
    } else {
      throw Exception('Failed to Send!');
    }
  } catch (e) {
    print('Fail to Send');
  }
}
