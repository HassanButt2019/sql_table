import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/config/values.dart';
import 'package:flutter_sqllite_table_view/providers/sqlite_database_provider.dart';
import 'package:provider/provider.dart';

class GroupByPage extends StatefulWidget {
  const GroupByPage({Key? key}) : super(key: key);

  @override
  _GroupByPageState createState() => _GroupByPageState();
}

class _GroupByPageState extends State<GroupByPage> {

  @override
  Widget build(BuildContext context) {
    List<Map> tableDetail=List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableDetailList.length, (index) {
      Map map=Provider.of<DatabaseProvider>(context,listen: false).tableDetailList[index];
      return map;
    }
    );
    ScreenConfig().init(context);
    final columnName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Group By"),
      ),
      body: SizedBox(
        width: ScreenConfig.screenWidth,
        height: ScreenConfig.screenHeight,
        child: ListView.builder(
          itemCount: Provider.of<DatabaseProvider>(context,listen: false).groupSetList.length,
          itemBuilder: (context,index){
            return DataTable(columns: List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableColumnName.length, (iCol) {
              return DataColumn(
                  label: InkWell(
                    child: Text(Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![iCol].toString()),
                  ));
            }), rows:
                getGroupedRows(columnName,index,context)
            // List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableDetailList!.length, (iRow) {
            //   var tableDetailRow=tableDetail[iRow];
            //   if(tableDetailRow[columnName].toString()==Provider.of<DatabaseProvider>(context,listen: false).groupSetList[index].toString()){
            //     return DataRow(
            //         selected: true,
            //         cells: List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableColumnName!.length, (index) {
            //           return DataCell(Text(tableDetailRow[Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![index]].toString()??"0"));
            //         })
            //
            //     );
            //   }else{
            //     return  DataRow(
            //         selected: true,
            //         cells: List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableColumnName!.length, (index) {
            //           return DataCell(Container());
            //         })
            //     );
            //   }
            //
            // }
            // )

            );
          },
        ),
      ),
    );
  }
  getGroupedRows(String columnName,int index,BuildContext context){
    List<Map> tableDetail=List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableDetailList.length, (index) {
      Map map=Provider.of<DatabaseProvider>(context,listen: false).tableDetailList![index];
      return map;
    }
    );
    List<DataRow> dataRowList=[];
    for(int iRow=0;iRow<Provider.of<DatabaseProvider>(context,listen:false).tableDetailList!.length;iRow++){
      var tableDetailRow=tableDetail[iRow];
      if(tableDetailRow[columnName].toString()==Provider.of<DatabaseProvider>(context,listen: false).groupSetList[index].toString()){
        dataRowList.add(DataRow(
            selected: true,
            cells: List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableColumnName!.length, (index) {
              return DataCell(Text(tableDetailRow[Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![index]].toString()));
            })

        ));
      }
    }
    return dataRowList;
  }
}
