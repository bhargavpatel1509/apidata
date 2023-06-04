import 'dart:convert';
import 'package:apidata/ApiData_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final url_api = 'https://randomuser.me/api/';
  String NAME = '';
  String firtsname = '';
  String Gender = '';
  String Mobile = '';
  String Email = '';
  String profile = '';
  Api_data z = Api_data();
  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Random Data'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 90, bottom: 10),
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(profile),
                          maxRadius: 90),
                    ),
                    Row(children: [
                      boxs('Name'),
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Row(children: [
                              Text(
                                NAME,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    firtsname,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.025),
                                  )),
                            ]),
                          )),
                    ]),
                    Row(children: [
                      boxs('Gender'),
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              Gender,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                          )),
                    ]),
                    Row(children: [
                      boxs('Mobile'),
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              Mobile,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                          )),
                    ]),
                    Row(children: [
                      boxs('Email'),
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              Email,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                          )),
                    ]),
                    InkWell(
                      onTap: fetchData,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.only(left: 10, top: 88),
                        alignment: Alignment.centerLeft,
                        child: Center(
                          child: Text(
                            'reset',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 3,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025),
                          ),
                        ),
                      ),
                    )
                  ]))
        ])));
  }

  Future<Api_data> fetchData() async {
    final response = await http.get(Uri.parse(url_api));
    final Map<String, dynamic> Data = jsonDecode(response.body);
    Api_data z = Api_data.fromjson(Data);
    setState(() {
      NAME = '${Data['results'][0]['name']['title']}';
      firtsname = '${Data['results'][0]['name']['first']}';
      Gender = '${Data['results'][0]['gender']}';
      Mobile = '${Data['results'][0]['phone']}';
      Email = '${Data['results'][0]['email']}';
      profile = '${Data['results'][0]['picture']['large']}';
    });
    return z;
  }

  Widget boxs(String dataname) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.025,
        width: MediaQuery.of(context).size.width * 0.18,
        child: Text(
          dataname,
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
        ));
  }
}
