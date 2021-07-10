import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/providers/database_provider.dart';
import 'package:provider/provider.dart';
class TableDetailPage extends StatelessWidget {
  const TableDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      appBar:AppBar(
        title: Text("Table Details"),
      ),
          body:Column(
            children: [
              SizedBox(
                  height: ScreenConfig.blockHeight*10,
                  width: ScreenConfig.screenWidth,
                  child: Table(
                    children: [
                      TableRow(
                          children: [
                            SizedBox(
                              height: ScreenConfig.blockHeight*10,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Provider.of<DatabaseProvider>(context,listen:false).tableColumnName!.length,
                                  itemBuilder: (context,index){
                                    return Text((Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![index].toString()));
                                  }),
                            )
                          ]
                      ),
                    ],
                  )
              ),
              SizedBox(
                width:ScreenConfig.screenWidth,
                height: ScreenConfig.blockHeight*50,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: Provider.of<DatabaseProvider>(context,listen:false).tableDetailList!.length,
                    itemBuilder: (context,index){
                      Map map=Provider.of<DatabaseProvider>(context,listen:false).tableDetailList![index];
                      print(map);
                      return SizedBox(
                        height: ScreenConfig.blockHeight*5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Provider.of<DatabaseProvider>(context,listen:false).tableColumnName!.length,
                          itemBuilder: (context,i){
                            return Padding(
                                padding: EdgeInsets.only(right: 8.0)
                                ,child: Text(map[Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![i]].toString()));
                          }),);
                      // return ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     shrinkWrap: true,
                      //     itemCount: Provider.of<DatabaseProvider>(context,listen:false).tableColumnName!.length,
                      //     itemBuilder: (context,index){
                      //       print(map[Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![index]]);
                      //       return Container();
                      //         //Text(map[Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![index]]);
                      //
                      //
                      //     });
                    }),
              )
            ],
          )
    );
  }
}
