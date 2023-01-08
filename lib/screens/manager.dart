import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waffle/providers/member_data.dart';
import 'package:waffle/screens/login.dart';
import 'package:waffle/utilities/services.dart';
import 'package:waffle/widgets/waffle_appbar.dart';
import 'package:waffle/styles/palette.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  //MARK: TO BE CHANGED
  final secureStorage = FlutterSecureStorage();
  //Future<MemberData>? memberData;
  //memberData = snapshot.data;
  var amount = 0;
  var roles = "관리자";
  var username = "김하은";

  @override
  void initState() {
    super.initState();
    //memberData;
    HttpServices httpServices = HttpServices();
    httpServices.getService;
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final secureStorage = FlutterSecureStorage();
    return Scaffold(
      backgroundColor: Palette.lightGrey,
      appBar: WaffleAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, top: 25.0),
                                  child: Text("$roles",
                                      style: TextStyle(
                                          color: Palette.tickGrey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, top: 5.0),
                                  child: Text("$username",
                                      style: TextStyle(
                                          color: Palette.tickGrey,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w100)),
                                )
                              ]),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 25.0, top: 25.0),
                                child: TextButton(
                                    onPressed: () async {
                                      secureStorage.delete(key: "loginKey");
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  LoginScreen())));
                                    },
                                    child: Text("로그아웃",
                                        style: TextStyle(
                                            color: Palette.tickGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w100))),
                              ),
                            ],
                          )
                        ]),
                    Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Container(
                            height: _height * 0.2,
                            width: _width * 0.9,
                            decoration: BoxDecoration(
                                color: Palette.darkGrey,
                                border: Border.all(color: Palette.darkGrey),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Palette.tickGrey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 15,
                                      offset: Offset.zero)
                                ]))),
                    SizedBox(height: 35.0),
                    Center(
                        child: Text("최근 기록",
                            style: TextStyle(
                                color: Palette.tickGrey, fontSize: 25))),
                    const Divider(
                      color: Palette.tickGrey,
                      indent: 25.0,
                      endIndent: 25.0,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
