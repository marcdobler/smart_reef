import 'package:flutter/material.dart';
import 'package:smart_reef/services/auth.dart';
import 'package:smart_reef/shared/constants.dart';
import 'package:smart_reef/shared/loading.dart';
import 'package:smart_reef/widget/wave.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

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
                color: Colors.blue,
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
                        'Create an account!',
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
                              color: Colors.blue,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.blue),
                          ),
                          style: TextStyle(color: Colors.blue),
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
                              color: Colors.blue,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.visibility_off,
                                color: Colors.blue,
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                        SizedBox(height: 56.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 16),
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            child: Text('Register'),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);

                                dynamic result = await _auth
                                    .registerUserWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'please supply a valid email';
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
                              side: BorderSide(color: Colors.blue, width: 2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 16),
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            child: Text('Sign In'),
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
                      ]),
                ),
              ),
            ]),
          );
  }
}
