import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpWidget extends StatefulWidget {
final Function() onClickedSignIn;
const SignUpWidget({Key? key, required this.onClickedSignIn})
: super(key: key);
@override
State<SignUpWidget> createState() => _SignUpWidgetState();
}
class _SignUpWidgetState extends State<SignUpWidget> {
final emailController = TextEditingController();
final passwordController = TextEditingController();
@override
void dispose() {
emailController.dispose();
passwordController.dispose();
super.dispose();
}
Widget build(BuildContext context) {
return SingleChildScrollView(
padding: EdgeInsets.all(16),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
SizedBox(height: 150),
Text(
'Register',
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 35,
),
),
SizedBox(height: 40),
TextFormField(
controller: emailController,
decoration: InputDecoration(
labelText: "Email",
border:
OutlineInputBorder(borderRadius: 
BorderRadius.circular(10)),
suffixIcon: Icon(Icons.email)),
),
SizedBox(height: 8),
TextFormField(
controller: passwordController,
obscureText: true,
decoration: InputDecoration(
labelText: "Password",
border:
OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
suffixIcon: Icon(Icons.password),
),
),
SizedBox(height: 30),
ElevatedButton.icon(
style: ElevatedButton.styleFrom(
maximumSize: Size.fromHeight(50),
),
icon: Icon(Icons.arrow_forward, size: 20),
label: Text(
'Sign Up',
style: TextStyle(fontSize: 18),
),
onPressed: signUp,
),
SizedBox(height: 15),
RichText(
text: TextSpan(
style: TextStyle(
color: Colors.black,
),
text: 'Already have an account?',
children: [
TextSpan(
recognizer: TapGestureRecognizer()
..onTap = widget.onClickedSignIn,
text: 'Login',
style: TextStyle(
decoration: TextDecoration.underline,
color: Theme.of(context).colorScheme.secondary),
),
],
),
),
],
),
);
}
Future signUp() async {
await FirebaseAuth.instance.createUserWithEmailAndPassword(
email: emailController.text.trim(),
password: passwordController.text.trim());
}
}
