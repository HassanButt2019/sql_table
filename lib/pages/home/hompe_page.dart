import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';
class DashboardHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<DashboardProvider>(context,listen: false).getProjectTable(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }else{
            return Container(
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  itemCount: Provider.of<DashboardProvider>(context,listen: false).projectTableDetailList.length,
                  gridDelegate:
                  SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2.5,
                      crossAxisSpacing: 35,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    Map map=Provider.of<DashboardProvider>(context,listen: false).projectTableDetailList![index];
                    List list=map.values.toList();
                    List columnList=map.keys.toList();
                    Color randamColor =
                    Color(Random().nextInt(0xffffffff))
                        .withAlpha(0xff);
                    return InkWell(
                      child: Card(
                          borderOnForeground: true,
                          child:SizedBox(
                            width: ScreenConfig.screenWidth,
                            height: ScreenConfig.blockHeight*30,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap : true,
                                itemCount:list.length,
                                itemBuilder: (context,index){
                                  return Text(columnList[index].toString() +" : "+list[index].toString());

                                }),
                          )
                      ),
                      onTap: (){

                        Provider.of<DashboardProvider>(context,listen: false).getProjectMenuById(map["ProjectID"]).then((value) {
                          Navigator.pushNamed(context, '/project_menu_dashboard_page');
                        });
                      },
                    );
                    //   GridTile(
                    //   child: InkWell(
                    //     child: Container(
                    //         height: 400,
                    //         width: 100,
                    //         child: Card(
                    //           elevation: 15,
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(15),
                    //               side: BorderSide(color: randamColor, width: 0.5)
                    //           ),
                    //           child: Column(
                    //             children: [
                    //               ClipRRect(
                    //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                    //                 child: Image(image: AssetImage("assets/images/food.jpeg"),),
                    //               ),
                    //               SizedBox(height: 10),
                    //               Row(
                    //                 children: [
                    //                   Text("Jacksonville",
                    //                     style: TextStyle(
                    //                         fontSize: 13,
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.green),
                    //                   ),
                    //                   Text("Scholl",
                    //                     style: TextStyle(
                    //                         fontSize: 13,
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.black),
                    //                   ),
                    //                 ],
                    //               ),
                    //               SizedBox(height: 20),
                    //               Text("Title:",
                    //                 style: TextStyle(
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.green),
                    //               ),
                    //               Text(
                    //                 "text",
                    //                 style: TextStyle(
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.black),
                    //               ),
                    //               SizedBox(height: 5),
                    //             ],
                    //           ),
                    //         )),
                    //     onTap: () {
                    //     },
                    //   ),
                    // );
                  },
            ));
          }
        },),
    );
  }
}
