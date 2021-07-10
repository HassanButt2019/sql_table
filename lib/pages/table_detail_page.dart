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
          body:SingleChildScrollView(
        child: SizedBox(
        height: ScreenConfig.screenHeight,
        width: ScreenConfig.screenWidth,
          child: ListView.builder(
              itemCount: Provider.of<DatabaseProvider>(context,listen:false).tableColumnName!.length,
              itemBuilder: (context,index){
            return Wrap(
              children: [
                Text((Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![index])),
              ],
            );
          }),
    ),
    )
    );
  }
}
