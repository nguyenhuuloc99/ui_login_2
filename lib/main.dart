import 'package:flutter/material.dart';
import 'package:ui_login_2/ui/tab_layout.dart';

import 'clone_shopee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DemoTablayout(),
    );
  }
}

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin:
                    const EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          //dich chuyen bong theo x,y
                          offset: Offset(0, 10),
                          //ban kich mo
                          blurRadius: 20)
                    ]),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) => validate(value!),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Email/Mobile",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) => validePassword(value!),
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: _passwordVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print(">>> validate du lieu thanh cong");
                              } else {
                                print(">>> incorrect");
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  String? validate(String email) {
    if (email.isEmpty || email == null) {
      return 'Please enter some text';
    } else {
      return null;
    }
  }

  String? validePassword(String password) {
    if (password.isEmpty || password == null) {
      return 'Please enter some text';
    } else {
      return null;
    }
  }

/*
  To validate the form, use the _formKey created in step 1. You can use the _formKey.currentState() method to access the FormState,
  which is automatically created by Flutter when building a Form.
  The FormState class contains the validate() method. When the validate() method is called, it runs the validator()
  function for each text field in the form. If everything looks good, the validate() method returns true. If any text field contains errors,
  the validate() method rebuilds the form to display any error messages and returns false.
  Sử dụng _formKey.currentState() để truy cập vào formState, được tạo tự động khi flutter tạo Form
  FormState chứa validate() khi validate() được  gọi nó chạy function validator trả về true, nếu false thì rebuild lại
 */
}
