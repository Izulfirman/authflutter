import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'register.dart';
class LoginPage extends StatefulWidget {
@override
_LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
bool _isObscure3 = true;
bool visible = false;
final _formkey = GlobalKey<FormState>();
final TextEditingController emailController = new TextEditingController();
final TextEditingController passwordController = new
TextEditingController();
final _auth = FirebaseAuth.instance;
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color.fromARGB(255, 68, 202, 41),
body: SingleChildScrollView(
child: Column(
children: <Widget>[
Container(
child: Center(
child: Container(
margin: EdgeInsets.symmetric(horizontal: 100, vertical: 
100),
child: Form(
key: _formkey,
child: Column(
children: [
SizedBox(
height: 30,
),
Text(
"Login",
style: TextStyle(
fontWeight: FontWeight.bold,
color: Colors.white,
fontSize: 40,
),
),
SizedBox(
height: 20,
),
TextFormField(
controller: emailController,
decoration: InputDecoration(
filled: true,
fillColor: Colors.white,
hintText: 'Email',
hintStyle: TextStyle(color: Colors.red),
enabled: true,
contentPadding: const EdgeInsets.only(
left: 14.0, bottom: 8.0, top: 8.0),
focusedBorder: OutlineInputBorder(
borderSide: new BorderSide(color: Colors.white),
borderRadius: new BorderRadius.circular(10),
),
enabledBorder: UnderlineInputBorder(
borderSide: new BorderSide(color: Colors.white),
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
onSaved: (value) {
emailController.text = value!;
},
keyboardType: TextInputType.emailAddress,
),
SizedBox(
height: 20,
),
TextFormField(
controller: passwordController,
obscureText: _isObscure3,
decoration: InputDecoration(
suffixIcon: IconButton(
icon: Icon(
_isObscure3
? Icons.visibility
: Icons.visibility_off,
color: Colors.red,
),
onPressed: () {
setState(() {
_isObscure3 = !_isObscure3;
});
}),
filled: true,
fillColor: Colors.white,
hintText: 'Password',
hintStyle: TextStyle(color: Colors.red),
enabled: true,
contentPadding: const EdgeInsets.only(
left: 14.0, bottom: 8.0, top: 15.0),
focusedBorder: OutlineInputBorder(
borderSide: new BorderSide(color: Colors.white),
borderRadius: new BorderRadius.circular(10),
),
enabledBorder: UnderlineInputBorder(
borderSide: new BorderSide(color: Colors.white),
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
onSaved: (value) {
passwordController.text = value!;
},
keyboardType: TextInputType.emailAddress,
),
SizedBox(
height: 20,
),
MaterialButton(
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.all(Radius.circular(20.0))),
elevation: 5.0,
height: 40,
onPressed: () {
setState(() {
visible = true;
});
signIn(
emailController.text, 
passwordController.text);
},
child: Text(
"Login",
style: TextStyle(
color: Colors.red,
fontSize: 20,
),
),
color: Colors.white,
),
Visibility(
maintainSize: true,
maintainAnimation: true,
maintainState: true,
visible: visible,
child: Container(
child: CircularProgressIndicator(
color: Colors.white,
))),
TextButton(
onPressed: () {
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (context) => Register(),
),
);
},
child: Text(
"Tidak punya akun? SignUp",
style: TextStyle(
color: Colors.white,
fontSize: 15,
),
),
),
],
)
),
),
),
),
],
),
),
);
}
void signIn(String email, String password) async {
if (_formkey.currentState!.validate()) {
try {
UserCredential userCredential =
await FirebaseAuth.instance.signInWithEmailAndPassword(
email: email,
password: password,
);
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (context) => Lokasi(),
),
);
} on FirebaseAuthException catch (e) {
if (e.code == 'user-not-found') {
print('No user found for that email.');
} else if (e.code == 'wrong-password') {
print('Wrong password provided for that user.');
}
}
}
}
}
