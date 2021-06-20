import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool _view = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/luffy.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: GestureDetector(
                onVerticalDragEnd: (dragDetails) {
                  if (dragDetails.velocity.pixelsPerSecond.direction != 0) {
                    setState(
                      () {
                        if (_view) {
                          _view = false;
                        } else {
                          _view = true;
                        }
                      },
                    );
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height:
                      _view ? MediaQuery.of(context).size.height / 2 : 600.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        width: 200.0,
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      Text(
                        "Nom du produit a rallonge pour voir sur plusieurs lignes",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 30.0),
                              child: Text("12.00 €"),
                            ),
                            Spacer(),
                            Container(
                              width: 100.0,
                              child:
                                  Text("Mise en favoris par 1,2K de visiteurs"),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 50.0,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Visibility(
                              visible: (!_view),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      "Description",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 20.0),
                                      child: Text(
                                        "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, bottom: 10.0),
                                    child: Text(
                                      "Color",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 10.0),
                                    child: Text(
                                      "Size",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20.0, top: 10.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2.0),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.0, vertical: 15.0),
                                          child: GestureDetector(
                                            child: Text("M"),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 2.0),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 15.0),
                                            child: GestureDetector(
                                              child: Text("L"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2.0),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 15.0),
                                          child: GestureDetector(
                                            child: Text("S"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 150.0),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.black),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  child: Container(
                                    child: Text(
                                      "BUY NOW",
                                      style: TextStyle(
                                          fontSize: 30.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}