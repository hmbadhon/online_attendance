import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_attendance/Services/location.dart';
import 'package:online_attendance/Widgets/input_form_widget.dart';
import 'package:online_attendance/Widgets/rounded_btn.dart';
import 'package:location/location.dart';
import 'package:online_attendance/Services/network.dart';

class AttendancePage extends StatefulWidget {
  final String storeID;

  AttendancePage({this.storeID});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  var nameController = TextEditingController();
  var uidController = TextEditingController();
  String uid;
  String name;
  double lat;
  double long;
  String address;
  String requestID;

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();
    setState(() {
      lat = locationData.latitude;
      long = locationData.longitude;
    });
  }

  String _randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });

    return new String.fromCharCodes(codeUnits);
  }

  void _getAddress() async {
    address =
        await LocationHelper.getCurrentAddress(this.lat, this.long) as String;
  }

  Future<void> _sendDetails() async {
    sendData(
        uid: uid,
        name: name,
        lat: lat,
        long: long,
        address: address,
        requestID: requestID);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentUserLocation();
    _getAddress();
    setState(() {
      requestID = _randomString(10);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    uidController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        title: Text('Store ${widget.storeID}'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            InputFormWidget(
              fieldController: nameController,
              labelText: 'Name',
              hintText: 'Enter your name',
              keyType: TextInputType.text,
              onSaved: (value) {
                if (value != null) {
                  setState(() {
                    name = value;
                  });
                }
              },
            ),
            InputFormWidget(
              fieldController: uidController,
              labelText: 'User Id',
              hintText: 'Enter User Id',
              keyType: TextInputType.number,
              onSaved: (value) {
                if (value != null) {
                  setState(() {
                    uid = value;
                  });
                }
              },
            ),
            RoundedButton(
              btnText: 'Submit',
              onPress: () {
                nameController.clear();
                uidController.clear();
                _sendDetails();
                print('$name $uid');
                print('$lat $long');
                print(address);
                print(requestID);
                WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }
}
