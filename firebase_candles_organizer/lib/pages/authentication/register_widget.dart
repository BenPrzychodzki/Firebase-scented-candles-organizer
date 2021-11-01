import 'package:firebase_candles_organizer/services/auth_service.dart';
import 'package:firebase_candles_organizer/styles/loading_styles.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;

  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return isLoading ? const BuildLoadingScreen() : Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }


  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              widget.toggleView();
            },
            child: const Text("Sign In")),
      ],
    );
  }

  Container _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              validator: (val) => val!.isEmpty ? 'Enter an email' : null, // TODO: better validation func
              onChanged: (val) {
                setState(() => email = val);
              },),
            const SizedBox(height: 20),
            TextFormField(
              validator: (val) => val!.length < 6 ? 'Password must be at least six chars long' : null, // TODO: better validation func
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  // if all TextFormField validators will return null, it means that everything is valid
                  if(_formKey.currentState!.validate()) {
                    setState(() => isLoading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        isLoading = false;
                        error = 'please supply a valid email'; // TODO: More detailed error messages
                      });
                    }
                  }
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                )),
            Text(error),
          ],
        ),
      ),
    );
  }
}

/*
For anyone who wants to display detailed information about the error : in the auth methods when you catch the errors, you can do a

switch (e.code) {
 case '(here goes the errorcode)' : return '(your message)'
 }

 you can look up the errorcodes by hovering over the firebase function and holding ctrl + q.  Make sure these codes are typed correctly since you are comparing strings.

Then inside the  onpressed you can see
if (result is String) {
setState(){
error = result
)};


which is only true when we don't get back a User.
 */