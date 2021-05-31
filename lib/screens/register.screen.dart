import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _uname = "";
  String _pwd = "";
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  width: 380.0,
                  child: TextFormField(
                    validator: (String val) {
                      if (val.isNotEmpty) {
                        _uname = val;
                        return null;
                      } else {
                        return "please enter your username";
                      }
                    },
                    style: TextStyle(height: 1.0),
                    decoration: InputDecoration(
                      hintText: 'username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 380.0,
                  child: TextFormField(
                    validator: (String val) {
                      if (val.isNotEmpty) {
                        _pwd = val;
                        return null;
                      } else {
                        return "please enter your password";
                      }
                    },
                    style: TextStyle(height: 1.0),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 380.0,
                  child: TextFormField(
                    validator: (String val) {
                      if (val.isNotEmpty) {
                        if (_pwd == val) {
                          return null;
                        } else {
                          return "passwords do not match";
                        }
                      } else {
                        return "please confirm your password";
                      }
                    },
                    style: TextStyle(height: 1.0),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'confirm password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      print(_uname);
                      print(_pwd);
                      var client = http.Client();
                      try {
                        var url = Uri.parse('http://192.168.234.51:3000/users/register');
                        var response = await http.post(url, body: {'username': _uname, 'password': _pwd});
                        print('Response status: ${response.statusCode}');
                        print('Response body: ${response.body}');
                      } catch (e) {
                        debugPrint("something went wrong");
                        throw e.toString();
                      } finally {
                        client.close();
                      }
                      // var url = Uri.parse('http:192.168.234.51:3000/users/register');
                      // var response = await http.post(url, body: {'username':_uname, 'password':_pwd});
                      // print('Response status: ${response.statusCode}');
                      // print('Response body: ${response.body}');
                    }
                  },
                  child: Text(
                    'Register',
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
