import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const AuthScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  String _email = '';
  bool _isSecret = true;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Me\n'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                    children: [
                      TextSpan(
                        text: 'Connecter'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          //fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 44.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _email = value),
                        validator: (value) =>
                            value.isEmpty || !emailRegex.hasMatch(value)
                                ? 'Entrez une adresse valide svp !'
                                : null,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.blueGrey),
                            )),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _password = value),
                        validator: (value) => value.length < 6
                            ? 'Entrez un Mot de Passe (6 caractères minimum)'
                            : null,
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () =>
                                  setState(() => _isSecret = !_isSecret),
                              child: Icon(
                                !_isSecret
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            hintText: 'Mot de passe',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.purple),
                            )),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        color: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        onPressed:
                            !emailRegex.hasMatch(_email) || _password.length < 6
                                ? null
                                : () {
                                    if (_formKey.currentState.validate()) {
                                      print(_email);
                                      print(_password);

                                      widget.onChangedStep(1);
                                    }
                                  },
                        child: Text(
                          'Me Connecter'.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '\n'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          children: [
                            TextSpan(
                              text: 'Pas de compte ?\n'.toUpperCase(),
                            ),
                            TextSpan(
                              text: '\nJ’ai oublié mon mot de passe'
                                  .toUpperCase(),
                              style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                //fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
