import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.lightGrey,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 85.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Palette.darkGrey,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  color: Palette.tickGrey,
                  thickness: 2.0,
                  indent: 25.0,
                  endIndent: 25.0,
                ),
                SizedBox(
                  height: _height * 0.1,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                              height: _height * 0.07,
                              width: _width * 0.6,
                              margin: const EdgeInsets.only(top: 15.0),
                              decoration: BoxDecoration(
                                  color: Palette.lightGrey,
                                  border: Border.all(color: Palette.darkGrey),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Palette.tickGrey.withOpacity(0.3),
                                        spreadRadius: 3,
                                        blurRadius: 15,
                                        offset: Offset.zero)
                                  ]),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                      focusColor: Palette.darkGrey,
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.person,
                                        color: Palette.tickGrey,
                                      )),
                                ),
                              )),
                        ),
                        Container(
                            height: _height * 0.07,
                            width: _width * 0.6,
                            margin: const EdgeInsets.only(top: 15.0),
                            decoration: BoxDecoration(
                                color: Palette.lightGrey,
                                border: Border.all(color: Palette.darkGrey),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Palette.tickGrey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 15,
                                      offset: Offset.zero)
                                ]),
                            child: Center(
                              child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.lock_outlined,
                                        color: Palette.tickGrey,
                                      ))),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        height: _height * 0.16,
                        width: _width * 0.23,
                        decoration: BoxDecoration(
                            color: Palette.darkGrey,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Palette.tickGrey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 15,
                                  offset: Offset.zero)
                            ]),
                        child: IconButton(
                          onPressed: () {
                            // isResponse status == 200 ? Route Page : null
                          },
                          icon:
                              Icon(Icons.login_outlined, color: Palette.mimosa),
                          iconSize: 25,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: _height * 0.2,
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0),
                        child: Text(
                          "Powered by",
                          style: TextStyle(
                              color: Palette.darkGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      Image(
                          image: AssetImage("assets/images/waffle.png"),
                          width: _width * 0.2)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
