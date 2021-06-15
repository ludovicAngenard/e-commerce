import 'package:flutter/material.dart';

import 'login_screen.dart';

class DeliveryScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const DeliveryScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<DeliveryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  String _numero = '';
  String _adresse = '';
  String _complementAdresse = '';
  String _codePostal = '';
  String _ville = '';
  bool _isSecret = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Adresse\n'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                    children: [
                      TextSpan(
                        text: 'de Livraison'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RichText(
                  text: TextSpan(
                    text: 'A QUELLE ADRESSE DEVONS-NOUS VOUS LIVRER ?\n'
                        .toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
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
                        onChanged: (value) => setState(() => _numero = value),
                        decoration: InputDecoration(
                            hintText: 'N°, Etage, Lieu dit...',
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
                        height: 8.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _adresse = value),
                        decoration: InputDecoration(
                            hintText: 'Adresse',
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
                        height: 8.0,
                      ),
                      TextFormField(
                        onChanged: (value) =>
                            setState(() => _complementAdresse = value),
                        decoration: InputDecoration(
                            hintText: 'Complément d\'adresse',
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
                        height: 8.0,
                      ),
                      TextFormField(
                        onChanged: (value) =>
                            setState(() => _codePostal = value),
                        decoration: InputDecoration(
                            hintText: 'Code Postal',
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
                        height: 8.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _ville = value),
                        decoration: InputDecoration(
                            hintText: 'Ville',
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
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        color: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        onPressed: !emailRegex.hasMatch(_ville)
                            ? null
                            : () {
                                if (_formKey.currentState.validate()) {
                                  print(_numero);
                                  print(_adresse);
                                  print(_complementAdresse);
                                  print(_codePostal);
                                  print(_ville);
                                  widget.onChangedStep(1);
                                }
                              },
                        child: Text(
                          'Utiliser cette Adresse'.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.purple),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthScreen()),
                          );
                        },
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
