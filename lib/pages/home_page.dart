import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/providers/database_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<DatabaseProvider>(context,listen:false).readTableName();
    ScreenConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: FutureBuilder(
        future: Provider.of<DatabaseProvider>(context,listen: false).readTableName(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return SizedBox(
              height: ScreenConfig.screenHeight,
              width: ScreenConfig.screenWidth,
              child: ListView.builder(
                  itemCount: (snapshot.data! as List).length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text((snapshot.data! as List)[index]['name']),
                      onTap: (){
                        Provider.of<DatabaseProvider>(context,listen: false).getTable((snapshot.data! as List)[index]['name']);


                      },
                    );

                  }),
            );
          }

          return CircularProgressIndicator();
        },
      )
    );
  }
}
