import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class Register extends StatefulWidget {
@override
_RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
_RegisterState();
bool showProgress = false;
bool visible = false;
final _formkey = GlobalKey<FormState>();
final _auth = FirebaseAuth.instance;
final TextEditingController passwordController = new
TextEditingController();
final TextEditingController confirmpassController =
new TextEditingController();
final TextEditingController name = new TextEditingController();
final TextEditingController emailController = new TextEditingController();
final TextEditingController mobile = new TextEditingController();
bool _isObscure = true;
bool _isObscure2 = true;
File? file;
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color.fromARGB(255, 68, 202, 41),
body: SingleChildScrollView(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Container(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
child: SingleChildScrollView(
child: Container(
margin: EdgeInsets.symmetric(horizontal: 100, vertical: 
100),
child: Form(
key: _formkey,
child: Column(
children: [
SizedBox(
height: 80,
),
Text(
"Register Now",
style: TextStyle(
fontWeight: FontWeight.bold,
color: Color.fromARGB(255, 255, 255, 255),
fontSize: 40,
),
),
SizedBox(
height: 50,
),
TextFormField(
controller: emailController,
decoration: InputDecoration(
filled: true,
fillColor: Color.fromARGB(255, 255, 255, 255),
hintText: 'Email',
hintStyle: TextStyle(color: Colors.red),
enabled: true,
contentPadding: const EdgeInsets.only(
left: 14.0, bottom: 8.0, top: 8.0),
focusedBorder: OutlineInputBorder(
borderSide: new BorderSide(color: Colors.red),
borderRadius: new BorderRadius.circular(10),
),
enabledBorder: UnderlineInputBorder(
borderSide: new BorderSide(color: Colors.red),
borderRadius: new BorderRadius.circular(10),
),
),
validator: (value) {
if (value!.length == 0) {
return "Email cannot be empty";
}
if (!RegExp(
"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
.hasMatch(value)) {
return ("Please enter a valid email");
} else {
return null;
}
},
onChanged: (value) {},
keyboardType: TextInputType.emailAddress,
),
SizedBox(
height: 20,
),
TextFormField(
obscureText: _isObscure,
controller: passwordController,
decoration: InputDecoration(
suffixIcon: IconButton(
icon: Icon(
_isObscure
? Icons.visibility_off
: Icons.visibility,
color: Color.fromARGB(255, 0, 0, 0)),
onPressed: () {
setState(() {
_isObscure = !_isObscure;
});
}),
filled: true,
fillColor: Color.fromARGB(255, 250, 250, 250),
hintText: 'Password',
hintStyle: TextStyle(color: Colors.red),
enabled: true,
contentPadding: const EdgeInsets.only(
left: 14.0, bottom: 8.0, top: 15.0),
focusedBorder: OutlineInputBorder(
borderSide: new BorderSide(color: Colors.red),
borderRadius: new BorderRadius.circular(10),
),
enabledBorder: UnderlineInputBorder(
borderSide: new BorderSide(color: Colors.red),
borderRadius: new BorderRadius.circular(10),
),
),
validator: (value) {
RegExp regex = new RegExp(r'^.{6,}$');
if (value!.isEmpty) {
return "Password cannot be empty";
}
if (!regex.hasMatch(value)) {
return ("please enter valid password min. 6 character");
} else {
return null;
}
},
onChanged: (value) {},
),
SizedBox(
height: 20,
),
TextFormField(
obscureText: _isObscure2,
controller: confirmpassController,
decoration: InputDecoration(
suffixIcon: IconButton(
icon: Icon(
_isObscure2
? Icons.visibility_off
: Icons.visibility,
color: Color.fromARGB(255, 0, 0, 0)),
onPressed: () {
setState(() {
_isObscure2 = !_isObscure2;
});
}),
filled: true,
fillColor: Color.fromARGB(255, 245, 245, 245),
hintText: 'Confirm Password',
hintStyle: TextStyle(color: Colors.red),
enabled: true,
contentPadding: const EdgeInsets.only(
left: 14.0, bottom: 8.0, top: 15.0),
focusedBorder: OutlineInputBorder(
borderSide: new BorderSide(color: Colors.red),
borderRadius: new BorderRadius.circular(10),
),
enabledBorder: UnderlineInputBorder(
borderSide: new BorderSide(color: Colors.red),
borderRadius: new BorderRadius.circular(10),
),
),
validator: (value) {
if (confirmpassController.text !=
passwordController.text) {
return "Password did not match";
} else {
return null;
}
},
onChanged: (value) {},
),
SizedBox(
height: 20,
),
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
crossAxisAlignment: CrossAxisAlignment.end,
children: [
MaterialButton(
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.all(Radius.circular(20.0)))
,
elevation: 5.0,
height: 40,
onPressed: () {
setState(() {
showProgress = true;
});
signUp(
emailController.text,
passwordController.text,
);
},
child: Text(
"Register",
style: TextStyle(
color: Colors.red,
fontSize: 20,
),
),
color: Colors.white,
),
],
),
SizedBox(
height: 20,
),
TextButton(
onPressed: () {
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (context) => LoginPage(),
),
);
},
child: Text(
"Sudah punya akun? SignIn",
style: TextStyle(
color: Color.fromARGB(255, 255, 255, 255),
fontSize: 15,
),
),
),
],
),
),
),
),
),
],
),
),
);
}
signUp(String email, String password) async {
if (_formkey.currentState!.validate()) {
try {
UserCredential userCredential = await FirebaseAuth.instance
.createUserWithEmailAndPassword(
email: email,
password: password,
)
.whenComplete(() => {
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (_) => LoginPage(),
),
)
});
} on FirebaseAuthException catch (e) {
if (e.code == 'weak-password') {
print('The password provided is too weak.');
} else if (e.code == 'email-already-in-use') {
print('The account already exists for that email.');
}
} catch (e) {
print(e);
}
}
CircularProgressIndicator();
}
}
