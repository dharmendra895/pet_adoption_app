import 'package:flutter/material.dart';
import 'package:pet_adoption/configuration.dart';
import 'package:pet_adoption/screenTwo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)..rotateY(isDrawerOpen?-0.5:0),
      duration: Duration(milliseconds: 250),

      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0) ,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 40,
                          ),
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                  Column(
                    children: [
                      Text('Location',style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: darkBlue,
                          ),
                          Text('Sikkim',style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: darkBlue,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text('Search pet to adapt',style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.settings)
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Color(0xffD3DFE4),
                            boxShadow: shadowList,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            categories[index]['iconPath'],
                            height: 50,
                            width: 50,
                            color: Colors.grey[900],
                          ),
                        ),
                        Text(categories[index]['name'],style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Screen2()));
              },
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xffCCD5D8),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList),
                          margin: EdgeInsets.only(top: 40),
                        ),
                        Align(
                          child: Image.asset(
                            'images/pet-cat2.png',
                          ),
                        )
                      ],
                    )),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(top: 60, bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: shadowList,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                    ))
                  ],
                ),
              ),
            ),
            Container(
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffECD3AE),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: shadowList),
                            margin: EdgeInsets.only(top: 40),
                          ),
                          Align(
                            child: Image.asset(
                              'images/pet-cat1.png',
                            ),
                          )
                        ],
                      )),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 60, bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
