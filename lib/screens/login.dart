import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';
import 'package:waffle/widgets/waffle_bottom_navigator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                    child: Icon(Icons.lock_outline_rounded,
                        size: 85.0, color: Palette.darkGrey)),
                const Divider(
                  color: Palette.tickGrey,
                  height: 15.0,
                  thickness: 1.0,
                  indent: 25.0,
                  endIndent: 25.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "로그인",
                      style: TextStyle(
                          color: Palette.darkGrey,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    )),
                SizedBox(
                  height: _height * 0.08,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                              height: _height * 0.07,
                              width: _width * 0.6,
                              margin: const EdgeInsets.only(top: 15.0),
                              decoration: BoxDecoration(
                                  color: Palette.lightGrey,
                                  border: Border.all(color: Palette.darkGrey),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Palette.tickGrey.withOpacity(0.3),
                                        spreadRadius: 3,
                                        blurRadius: 15,
                                        offset: Offset.zero)
                                  ]),
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 3.0, left: 10.0),
                                child: TextFormField(
                                  controller: _idController,
                                  cursorColor: Palette.tickGrey,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "아이디",
                                    focusColor: Palette.darkGrey,
                                    border: InputBorder.none,
                                  ),
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
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Palette.tickGrey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 15,
                                    offset: Offset.zero)
                              ]),
                          child: Container(
                              margin:
                                  const EdgeInsets.only(top: 3.0, left: 10.0),
                              child: TextFormField(
                                controller: _passwordController,
                                cursorColor: Palette.tickGrey,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "비밀번호",
                                    suffixIcon: IconButton(
                                      color: Palette.tickGrey,
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    )),
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        height: _height * 0.16,
                        width: _width * 0.23,
                        decoration: BoxDecoration(
                            color: Palette.darkGrey,
                            borderRadius: BorderRadius.circular(10),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavigationScreen()));
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
                  height: _height * 0.15,
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0),
                        child: Text(
                          "Powered by",
                          style: TextStyle(
                              color: Palette.tickGrey,
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
