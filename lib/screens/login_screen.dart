import 'package:flutter/material.dart';
import 'package:flutter_gallery/screens/gallery_screen.dart';
import 'package:flutter_gallery/services/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userName = TextEditingController();
  var password = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  LoginApi loginAut = LoginApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                    return null;
                  },
                  controller: userName,
                  decoration: InputDecoration(hintText: 'userName'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                    return null;
                  },
                  controller: password,
                  decoration: InputDecoration(hintText: 'password'),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    await loginAut.userLogin(userName.text, password.text);
                    print(
                        '${loginAut.userLogin(userName.text, password.text)}');
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const GalleryScreen(),
                      ),
                    );
                    //${userName.text}${password.text}
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    width: double.infinity,
                    child: Center(child: Text('submit')),
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
