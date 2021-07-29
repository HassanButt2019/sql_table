import 'dart:math';

import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          itemCount: 10,
          gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2.5,
              crossAxisSpacing: 35,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            Color randamColor =
            Color(Random().nextInt(0xffffffff))
                .withAlpha(0xff);
            return GridTile(
              child: InkWell(
                child: Container(
                    height: 400,
                    width: 100,
                    child: Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: randamColor, width: 0.5)
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                            child: Image(image: AssetImage("assets/images/food.jpeg"),),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Jacksonville",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Text("Scholl",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text("Title:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          Text(
                            "text",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    )),
                onTap: () {
                },
              ),
            );
          }),
    );
  }
}
