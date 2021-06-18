import 'package:flutter/material.dart';
import 'dart:math' as math;

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Colors.teal),
  Destination('Favoris', Icons.favorite, Colors.orange),
  Destination('Panier', Icons.shopping_cart, Colors.cyan),
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
              Icons.shopping_cart,
              semanticLabel: 'panier',
            ),
            onPressed: () {
              print('Panier button');
            },
          ),
        ],
      ),
      backgroundColor: widget.destination.color[0],
      body: Column(children: [
        Expanded(child: CategoryList()),
        Expanded(child: CollapsingList())
      ]),
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
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              backgroundColor: destination.color,
              label: (destination.title));
        }).toList(),
      ),
    );
  }
}



class CategoryList extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      
      children: <Widget>[
        Container(
          width: 100,
          color: Colors.amber[600],
          child: const Center(child: Text('Catégorie 1')),
        ),
        Container(
          width: 100,
          color: Colors.amber[600],
          child: const Center(child: Text('Catégorie 2')),
        ),
        Container(
          width: 100,
          color: Colors.amber[600],
          child: const Center(child: Text('Catégorie 3')),
        ),
        Container(
          width: 100,
          color: Colors.amber[600],
          child: const Center(child: Text('Catégorie 4')),
        ),
        Container(
          width: 100,
          color: Colors.amber[600],
          child: const Center(child: Text('Catégorie 5')),
        ),
        Container(
          width: 100,
          color: Colors.amber[600],
          child: const Center(child: Text('Catégorie 6')),
        ),
      ],
    );
  }
}

class CollapsingList extends StatelessWidget {
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 50,
          crossAxisSpacing: 15,
          childAspectRatio: (itemWidth / itemHeight),
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/1.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ], //here
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ], //here
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)), //here
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)), //here
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)), //here
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)), //here
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)), //here
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)), //here
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)), //here
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}
