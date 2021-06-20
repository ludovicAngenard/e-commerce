import 'package:e_commerce/screens/connexion.dart';
import 'package:e_commerce/screens/panier.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/home.dart';
import 'package:flutter/rendering.dart';
import 'package:e_commerce/screens/favoris.dart';
import 'dart:math' as math;

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Colors.blue),
  Destination('Favoris', Icons.favorite, Colors.blue),
  Destination('Panier', Icons.shopping_cart, Colors.blue),
  Destination('Compte', Icons.account_circle_outlined, Colors.blue)
];

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Paiement'),
        backgroundColor: widget.destination.color,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              semanticLabel: 'compte',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Connexion()),
              );
            },
          ),
        ],
      ),
      backgroundColor: widget.destination.color[0],
      body: Container(child: PaymentScreen()),
    );
  }
}

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard>
    with TickerProviderStateMixin<CreditCard> {
  int _currentIndex = 0;
  final List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return DestinationView(destination: destination);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('Favoris'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), title: Text('Panier')),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle_outlined),
            title: new Text('Compte'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Favoris()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Panier()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Connexion()),
        );
        break;
    }
  }
}

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
                          'asset/images/nicoCard.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      
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