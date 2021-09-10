import 'package:flutter/material.dart';
import 'package:flutter_latihan/screen/secondscreen.dart';


class FirstScreen extends StatefulWidget {

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool ishiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
            child: ListView(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0D47A1), Color(0xFFE1F5FE)],
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32, right: 32),
                child: Text(
                  'SELAMAT DATANG.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: null,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextField(
              obscureText: ishiddenPassword,
                controller: null,
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        Icons.visibility,
                        ),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Belum punya Akun ? ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            Container(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Login ', style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      )
    ])));
  }

  void _togglePasswordView() {
    //if (ishiddenPassword == true){
    //  ishiddenPassword = false;
    //} else {
    //  ishiddenPassword = true;
    //}
    setState(() {
      ishiddenPassword = !ishiddenPassword;
    });
  }
}