import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginWidget extends StatefulWidget {
final VoidCallback onClickedSignUp;
const LoginWidget({Key? key, required this.onClickedSignUp})
: super(key: key);
@override
State<LoginWidget> createState() => _LoginWidgetState();
}
class _LoginWidgetState extends State<LoginWidget> {
final emailController = TextEditingController();
final passwordController = TextEditingController();
@override
void dispose() {
emailController.dispose();
passwordController.dispose();
super.dispose();
}
@override
Widget build(BuildContext context) {
return SingleChildScrollView(
padding: EdgeInsets.all(16),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
SizedBox(
height: 150,
),
Text(
'Login',
style: TextStyle(fontSize: 35),
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
OutlineInputBorder(borderRadius: 
BorderRadius.circular(10)),
suffixIcon: Icon(Icons.password)),
),
SizedBox(height: 30),
ElevatedButton.icon(
style: ElevatedButton.styleFrom(
maximumSize: Size.fromHeight(50),
),
icon: Icon(Icons.lock_open, size: 20),
label: Text(
'Sign In',
style: TextStyle(fontSize: 18),
),
onPressed: signIn,
),
SizedBox(height: 15),
RichText(
text: TextSpan(
style: TextStyle(color: Colors.black, fontSize: 14),
text: "Doesn't have an account?",
children: [
TextSpan(
recognizer: TapGestureRecognizer()
..onTap = widget.onClickedSignUp,
text: 'Sign Up',
style: TextStyle(
decoration: TextDecoration.underline,
color: Theme.of(context).colorScheme.secondary))
]),
)
],
),
);
}
Future signIn() async {
await FirebaseAuth.instance.signInWithEmailAndPassword(
email: emailController.text.trim(),
password: passwordController.text.trim());}}
