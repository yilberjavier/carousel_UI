import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<List<String>> products = [
    ['assets/images/reloj-1.jpg', 'Hugo Boss Pro', '100 \$'],
    ['assets/images/reloj-2.jpg', 'Rolex Air-King', '250 \$'],
    ['assets/images/reloj-3.jpg', 'Swarovski Octea Lux ', '140 \$'],
  ];

  int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.velocity.pixelsPerSecond.dx > 0) {
              _preve();
            } else if (details.velocity.pixelsPerSecond.dx < 0) {
              _next();
            }
          },
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 470,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(products[currentIndex][0]),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.grey.withOpacity(.9),
                        Colors.black.withOpacity(.0),
                      ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(bottom: 60),
                          child: Row(
                            children: _buildIndicator(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Transform.translate(
                    offset: Offset(0, -40),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[currentIndex][1],
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                products[currentIndex][2],
                                style: TextStyle(
                                  color: Colors.yellow[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 18, color: Colors.yellow[700]),
                                  Icon(Icons.star,
                                      size: 18, color: Colors.yellow[700]),
                                  Icon(Icons.star,
                                      size: 18, color: Colors.yellow[700]),
                                  Icon(Icons.star,
                                      size: 18, color: Colors.yellow[700]),
                                  Icon(Icons.star_half,
                                      size: 18, color: Colors.yellow[700]),
                                  SizedBox(width: 5),
                                  Text(
                                    '(4.2/70 reviews)',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[700],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'ADD TO CART',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isActive ? Colors.grey[800] : Colors.white),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
