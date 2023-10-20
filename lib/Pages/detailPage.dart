import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  
  DetailPage(@required this.image, @required this.name,@required this.price);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          
          children: <Widget>[
            Container(
              
              // height: 500,
              width: double.infinity,
              child: Image(
                  image: NetworkImage(image),
                  
              
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 237, 234, 234),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 95, 113, 187),
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontFamily: "Pacifico",
                            ),
                          ),
                          Text(
                            "$price BDT",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: "Pacifico",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Pepperoni pizza is a classic pizza option and is one of the most well-loved pizzas for a reason something about the combination of pepperoni, tomato sauce, and cheese creates a flavor sensation unlike anything else. At 11 Inch Pizza, we pride ourselves on making the best pepperoni pizza in Melbourne by combining traditional Italian flavors and techniques with innovative ingredients.",
                        style: TextStyle(
                          color: Color.fromARGB(255, 40, 40, 40),
                        ),
                      ),
                      Container(
                        height: 255,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 200, 15, 104),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 200, 15, 104),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.shopping_cart),
                                SizedBox(
                                  width: 70,
                                ),
                                Text('Add to cart'),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 200, 15, 104),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
