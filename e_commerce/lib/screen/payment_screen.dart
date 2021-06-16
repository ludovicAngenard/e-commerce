import 'package:flutter/material.dart';

import 'login_screen.dart';

class PaymentScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const PaymentScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  String _orderName = '';
  String _cardNumber = '';
  String _cardExpiryDate = '';
  String _cvcCode = '';

  bool _isSecret = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'INFORMATIONS DE PAIEMENT',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/nicoCard.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      //Image.asset('assets/images/nicoCard.png'),
                      SizedBox(
                        height: 44.0,
                      ),
                      TextFormField(
                        onChanged: (value) =>
                            setState(() => _orderName = value),
                        decoration: InputDecoration(
                            hintText: 'Carte order name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black),
                            )),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        onChanged: (value) =>
                            setState(() => _cardNumber = value),
                        validator: (value) => value.length == 16
                            ? 'Entrez un numéro de carte valide (16 chiffres)'
                            : null,
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                            hintText: 'Carte number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black),
                            )),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) =>
                                setState(() => _cardExpiryDate = value),
                            decoration: InputDecoration(
                                hintText: 'Expiry Date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) =>
                                setState(() => _cvcCode = value),
                            decoration: InputDecoration(
                                hintText: 'Code CVC',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black),
                                )),
                          ),
                        )
                      ]),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: _cardNumber.length == 16
                            ? null
                            : () {
                                if (_formKey.currentState.validate()) {
                                  print(_orderName);
                                  print(_cardNumber);
                                  print(_cardExpiryDate);
                                  print(_cvcCode);

                                  widget.onChangedStep(1);
                                }
                              },
                        child: Text(
                          'Utiliser cette carte'.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
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
