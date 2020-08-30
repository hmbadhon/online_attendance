import 'package:flutter/material.dart';
import 'package:online_attendance/Screens/attendance_page.dart';
import 'package:online_attendance/Services/network.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        title: Text('Online Attendance'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                return Card(
                  elevation: 8.0,
                  color: Color.fromRGBO(
                    58,
                    66,
                    86,
                    1.0,
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttendancePage(
                            storeID: snapshot.data[index]['id'].toString(),
                          ),
                        ),
                      );
                    },
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                        border: new Border(
                          right:
                              new BorderSide(width: 1.0, color: Colors.white24),
                        ),
                      ),
                      child: Text(
                        snapshot.data[index]['id'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    title: Text(
                      snapshot.data[index]['name'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.location_city, color: Colors.yellowAccent),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(snapshot.data[index]['address'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0))
                      ],
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Colors.white, size: 30.0),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
