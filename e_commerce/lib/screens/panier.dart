import 'package:flutter/material.dart';





import 'package:e_commerce/screens/home.dart';
import 'package:flutter/rendering.dart';
import 'package:e_commerce/screens/connexion.dart';
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
        title: Text('Panier'),
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
      body: Container(child: BasketScreen()),
    );
  }
}

class Panier extends StatefulWidget {
  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier>
    with TickerProviderStateMixin<Panier> {
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







class BasketScreen extends StatefulWidget {
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  int quantity = 1;
  int prix = 10;
  int totalPrice = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SizedBox.expand(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Container(
              width: 350,
              height: 100,
              margin: const EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    "https://ae01.alicdn.com/kf/Hbfe55f23fcdc4ff5843cb54fa28c7a13c.jpg_200x200Q90.jpg_.webp",
                  ),
                ),
                Flexible(
                    child: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            "Voici de bien belle chaussures\n qui sont exeptionnelement \n parfaite pour la course à pieds",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ]),
                        Row(children: [
                          Container(
                            width: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRect(
                                  child: InkWell(
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                        ),
                                      ),
                                      child: Image.network(
                                          "https://www.pngarts.com/files/3/Plus-Symbol-Transparent-Images.png"),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        quantity += 1;
                                        totalPrice += prix;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "$quantity",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                ClipRect(
                                  child: InkWell(
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                        ),
                                      ),
                                      child: Image.network(
                                          "https://www.icone-png.com/png/16/16358.png"),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        quantity == 1 ? null : totalPrice -= prix;
                                        quantity == 1 ? null : quantity -= 1 ;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Text(
                            "$totalPrice",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            textAlign: TextAlign.right,
                          ),
                        ])
                      ]),
                ))
              ])),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200,
                padding: EdgeInsets.only(top: 30.00, right: 50.00, left: 50.00),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(70.0),
                    topRight: Radius.circular(70.0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL :",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          "$totalPrice",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 60,
                            child: TextButton(
                                child: Text("BUY NOW"),
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}