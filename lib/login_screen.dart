import 'package:flutter/material.dart';
import 'package:retail/landingpage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   void handleLogin(BuildContext context) {
//     // You can add your authentication logic here to validate the credentials.
//     // For this example, let's assume successful login and navigate to the next screen.
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => RetailApp()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 300,
//               margin: EdgeInsets.all(10),
//               child: TextField(
//                 controller: mobileController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(labelText: 'Mobile Number'),
//               ),
//             ),
//             Container(
//               width: 300,
//               margin: EdgeInsets.all(10),
//               child: TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () => handleLogin(context),
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  late String mobileNumber;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change the background color
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/retaillogo.png',
                  height: 300.0), // Change the logo size
              SizedBox(height: 20.0),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  mobileNumber = value;
                },
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  fillColor: Color(
                      0xff46BDFA), // Change the input field background color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none, // Remove the border
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  fillColor: Color(
                      0xff46BDFA), // Change the input field background color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none, // Remove the border
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RetailApp()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
