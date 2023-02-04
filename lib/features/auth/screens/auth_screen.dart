import 'package:amazon_clone/constants/variables.dart';
import 'package:amazon_clone/features/auth/widgets/custom_signupbutton.dart';
import 'package:amazon_clone/features/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routename = '/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signin = GlobalKey<FormState>();
  final _signup = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();

  Auth _auth = Auth.signup;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome',
            style: TextStyle(fontSize: 22),
          ),
          ListTile(
            tileColor: _auth == Auth.signup ? Colors.white : Colors.transparent,
            title: const Text('Create Account'),
            leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (val) {
                  setState(() {
                    _auth = val!;
                  });
                }),
          ),
          if (_auth == Auth.signup)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _signin,
                child: Column(
                  children: [
                    Customtextfiel(controller: _name, hinttext: 'Name'),
                    const SizedBox(height: 10),
                    Customtextfiel(
                      controller: _email,
                      hinttext: 'E-Mail',
                    ),
                    const SizedBox(height: 10),
                    Customtextfiel(controller: _password, hinttext: 'Password'),
                    const SizedBox(height: 10),
                    SignupButton(text: 'Sign Up', onTap: () {}),
                  ],
                ),
              ),
            ),
          ListTile(
            tileColor: _auth == Auth.signin ? Colors.white : Colors.transparent,
            title: const Text('Sign-In'),
            leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (val) {
                  setState(() {
                    _auth = val!;
                  });
                }),
          ),
          if (_auth == Auth.signin)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _signin,
                child: Column(
                  children: [
                    Customtextfiel(
                      controller: _email,
                      hinttext: 'E-Mail',
                    ),
                    const SizedBox(height: 10),
                    Customtextfiel(controller: _password, hinttext: 'Password'),
                    const SizedBox(height: 10),
                    SignupButton(text: 'Sign In', onTap: () {}),
                  ],
                ),
              ),
            )
        ],
      )),
    );
  }
}
