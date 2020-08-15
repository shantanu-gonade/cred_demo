import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import './home_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _phoneController = TextEditingController();

  final _codeController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        AuthResult result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicColors.decorationDarkColor(
        Colors.green[50],
        intensity: 0.10,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 3,
                    left: 24,
                    right: 24,
                    top: 24,
                  ),
                  child: NeumorphicText(
                    "give us your",
                    textStyle: NeumorphicTextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Product Sans',
                      fontStyle: FontStyle.normal,
                    ),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                      depth: 8,
                      lightSource: LightSource.topLeft,
                      color: Colors.green[300],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 2,
                    left: 24,
                    right: 24,
                    top: 3,
                  ),
                  child: NeumorphicText(
                    "mobile number",
                    textStyle: NeumorphicTextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Product Sans',
                      fontStyle: FontStyle.normal,
                    ),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                      depth: 8,
                      lightSource: LightSource.topLeft,
                      color: Colors.green[300],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 1,
                    left: 24,
                    right: 24,
                    top: 2,
                  ),
                  child: NeumorphicText(
                    "to apply, we need your mobile",
                    textStyle: NeumorphicTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Product Sans',
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left,
                    curve: Curves.easeInToLinear,
                    duration: Duration(
                      seconds: 2,
                    ),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                      depth: 8,
                      lightSource: LightSource.topLeft,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                    left: 24,
                    right: 24,
                    top: 1,
                  ),
                  child: NeumorphicText(
                    "number linked to your device",
                    textStyle: NeumorphicTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Product Sans',
                      fontStyle: FontStyle.normal,
                    ),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                      depth: 8,
                      lightSource: LightSource.topLeft,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                    left: 24,
                    right: 24,
                    top: 24,
                  ),
                  child: Neumorphic(
                    drawSurfaceAboveChild: true,
                    textStyle: TextStyle(
                      backgroundColor: NeumorphicColors.decorationWhiteColor(
                        Colors.green[50],
                        intensity: 0.95,
                      ),
                      color: NeumorphicColors.decorationWhiteColor(
                        Colors.green[50],
                        intensity: 0.95,
                      ),
                    ),
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 8,
                        lightSource: LightSource.top,
                        color: Colors.grey),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: NeumorphicColors.decorationWhiteColor(
                                Colors.green[50],
                                intensity: 0.95,
                              ),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: NeumorphicColors.decorationWhiteColor(
                                Colors.green[50],
                                intensity: 0.95,
                              ),
                            )),
                        filled: true,
                        fillColor: NeumorphicColors.decorationWhiteColor(
                          Colors.green[50],
                          intensity: 0.95,
                        ),
                        counterStyle: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 21,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        errorStyle: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 21,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        helperStyle: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 21,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        labelStyle: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 21,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        suffixStyle: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 21,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        hintText: "9999999999",
                        hintStyle: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 21,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      controller: _phoneController,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: NeumorphicCheckbox(
                    style: NeumorphicCheckboxStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(16)),
                      disableDepth: true,
                      selectedIntensity: 0.8,
                      selectedColor: Colors.green[200],
                    ),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 3,
                    left: 24,
                    right: 24,
                    top: 2,
                  ),
                  child: NeumorphicText(
                    "I agree to allow ELIXY to access the \ninformation for the services.",
                    textAlign: TextAlign.left,
                    textStyle: NeumorphicTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Product Sans',
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1.0,
                    ),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                      depth: 8,
                      lightSource: LightSource.topLeft,
                      color: Colors.green[300],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 8,
                        lightSource: LightSource.topLeft,
                        color: Colors.grey),
                    child: NeumorphicButton(
                      child: Text(
                        "Accept and Continue",
                        style: TextStyle(
                          color: Colors.amber[350],
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Product Sans',
                          decorationColor: Colors.greenAccent[400],
                          decorationStyle: TextDecorationStyle.wavy,
                        ),
                        textWidthBasis: TextWidthBasis.parent,
                      ),
                      padding: EdgeInsets.all(16),
                      onPressed: () {
                        final phone = "+91" + _phoneController.text.trim();

                        loginUser(phone, context);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
