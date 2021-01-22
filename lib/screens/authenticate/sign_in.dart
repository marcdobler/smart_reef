import 'package:flutter/material.dart';
import 'package:smart_reef/services/auth.dart';
import 'package:smart_reef/shared/constants.dart';
import 'package:smart_reef/shared/loading.dart';
import 'package:smart_reef/widget/wave.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool showPassword = false;
  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: <Widget>[
              Container(
                height: size.height - 180,
                color: Theme.of(context).accentColor,
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
                top: keyboardOpen ? -size.height / 3.7 : 0.0,
                child: WaveWidget(
                  size: size,
                  yOffset: size.height / 2.2,
                  color: Colors.white,
                  speed: 5000,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
                top: keyboardOpen ? -size.height / 3.7 : 0.0,
                child: WaveWidget(
                  size: size,
                  yOffset: size.height / 2.3,
                  color: Colors.white30,
                  speed: 6000,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 190.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text(
                        'SMART REEF',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Theme.of(context).accentColor,
                          ),
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        style: TextStyle(color: Theme.of(context).accentColor),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Theme.of(context).accentColor,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.visibility_off,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).accentColor),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 16,
                            ),
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            primary: Theme.of(context).accentColor,
                          ),
                          child: Text('Login'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not sign in with those credentials';
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                            side: BorderSide(
                                color: Theme.of(context).accentColor, width: 2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 16),
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text('Sign Up'),
                          onPressed: () {
                            widget.toggleView();
                          },
                        ),
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),
                      ),

                      // ElevatedButton(
                      //   child: Text('Sign in with Google'),
                      //   onPressed: () async {
                      //     setState(() => loading = false);
                      //     dynamic result = await _auth.signInWithGoogle();
                      //     if (result == null) {
                      //       setState(() {
                      //         error = 'Could not sign in with those credentials';
                      //         loading = false;
                      //       });
                      //     }
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ]),
          );
  }
}
