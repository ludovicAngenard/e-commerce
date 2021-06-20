import 'package:e_commerce/screens/article.dart';
import 'package:e_commerce/screens/connexion.dart';
import 'package:e_commerce/screens/favoris.dart';
import 'package:flutter/material.dart';
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
        title: Text('${widget.destination.title}'),
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
      body: Column(
        children: [
          Container()
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
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
          MaterialPageRoute(builder: (context) => Connexion()),
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

class CategoryList extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Container(
          width: 100,
          child: Center(
            child: Text(
              'Categorie 1',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 100,
          child: Center(
            child: Text(
              'Categorie 2',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 100,
          child: Center(
            child: Text(
              'Categorie 3',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 100,
          child: Center(
            child: Text(
              'Categorie 4',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 100,
          child: Center(
            child: Text(
              'Categorie 5',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 100,
          child: Center(
            child: Text(
              'Categorie 6',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 100,
          child: Center(
            child: Text(
              'Categorie 7',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 100,
          child: Center(
            child: Text(
              'Categorie 8',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(home: Article(), debugShowCheckedModeBanner: false));
}
