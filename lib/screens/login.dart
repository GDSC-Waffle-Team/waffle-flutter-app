import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waffle/styles/palette.dart';
import 'package:waffle/utilities/authentication.dart';
import 'package:waffle/widgets/waffle_character.dart';
import 'package:waffle/widgets/waffle_login_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  dynamic userInfo = "";
  bool _isObscure = true;
  Authenticator authenticator = Authenticator();
  var memberIdController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final secureStorage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    //MARK: LOAD TO FLUTTER SECURE STORAGE INFORMATION
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoLogin();
    });
    authenticator;
  }

  //**MARK: AUTO LOGIN (VERY IMFORTANT)*/
  _autoLogin() async {
    userInfo = await secureStorage.read(key: "loginKey");
    if (userInfo != null &&
        (await authenticator.classifier(userInfo) == true)) {
      print("$userInfo");
      print("autoLogin: 관리자 스크린으로 이동했어요.");
      Navigator.pushNamed(context, "/navigator");
    } else if (userInfo != null &&
        (await authenticator.classifier(userInfo) == false)) {
      print("autoLogin: 멤버 스크린으로 이동했어요.");
      Navigator.pushNamed(context, "/member");
    } else {
      print("autoLogin Error: userInfo가 존재하지 않아요. 로그인이 필요해요.");
    }
  }

  @override
  void dispose() {
    memberIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                    padding: const EdgeInsets.only(top: 75.0),
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
                    child: const Text(
                      "로그인",
                      style: TextStyle(
                          color: Palette.darkGrey,
                          fontSize: 30,
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
                              child: Form(
                                key: _formKey,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 3.0, left: 10.0),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: memberIdController,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "아이디를 입력해야해요.";
                                      }
                                      return null;
                                    },
                                    cursorColor: Palette.tickGrey,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      hintText: "아이디",
                                      focusColor: Palette.darkGrey,
                                      border: InputBorder.none,
                                    ),
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
                                controller: passwordController,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "비밀번호를 입력해야해요.";
                                  }
                                  return null;
                                },
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
                    WaffleLoginButton(
                      height: _height * 0.16,
                      width: _width * 0.23,
                      child: IconButton(
                        onPressed: () async {
                          //MARK: LOGIN FAILED MESSENGER
                          final failedMessenger = SnackBar(
                              backgroundColor: Palette.lightMagenta,
                              content: const Text("로그인 중 오류가 발생했어요."));
                          //MARK: LOGIN SUCCESS MESSENGER
                          final successMessenger = SnackBar(
                              backgroundColor: Palette.darkGrey,
                              content: const Text("로그인 했어요!"));
                          if (await authenticator.authentication(
                                  memberIdController.text,
                                  passwordController.text) ==
                              true) {
                            String? token =
                                await secureStorage.read(key: "loginKey");
                            if (await authenticator.classifier(token) == true) {
                              print("관리자 로그인 성공");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(successMessenger);
                              Navigator.pushNamed(context, "/navigator");
                            } else if (await authenticator.classifier(token) ==
                                false) {
                              print("멤버 로그인 성공");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(successMessenger);
                              Navigator.pushNamed(context, "/member");
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(failedMessenger);
                            print("로그인 실패");
                          }
                          // CircularProgressIndicator();
                        },
                        icon: Icon(Icons.login_outlined, color: Palette.mimosa),
                        iconSize: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * 0.15,
                ),
                Container(child: WaffleCharacter(width: _width * 0.2)),
              ],
            ),
          ),
        ));
  }
}
