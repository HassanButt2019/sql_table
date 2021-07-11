import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/config/values.dart';
import 'package:flutter_sqllite_table_view/providers/database_provider.dart';
import 'package:provider/provider.dart';
class TableDetailPage extends StatelessWidget {
  List<DataColumn> list=List.generate(Provider.of<DatabaseProvider>(Values.navigatorKey!.currentContext as BuildContext,listen:false).tableColumnName!.length, (index) {
    return DataColumn(
        onSort: (columnIndex,sortAscending){
          print(Provider.of<DatabaseProvider>(Values.navigatorKey!.currentContext as BuildContext,listen:false).tableColumnName![columnIndex]);
          print(sortAscending);

        },
        label: Text(Provider.of<DatabaseProvider>(Values.navigatorKey!.currentContext as BuildContext,listen:false).tableColumnName![index].toString()));
  });
  List<DataRow> TableDetaillist=List.generate(Provider.of<DatabaseProvider>(Values.navigatorKey!.currentContext as BuildContext,listen:false).tableDetailList!.length, (index) {
    Map map=Provider.of<DatabaseProvider>(Values.navigatorKey!.currentContext as BuildContext,listen: false).tableDetailList![index];
    return DataRow(
      selected: true,
      cells: List.generate(Provider.of<DatabaseProvider>(Values.navigatorKey!.currentContext as BuildContext,listen:false).tableColumnName!.length, (index) {
        return DataCell(Text(map[Provider.of<DatabaseProvider>(Values.navigatorKey!.currentContext as BuildContext,listen:false).tableColumnName![index]].toString()));

      })

    );


  }
  );
  TableDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      appBar:AppBar(
        title: Text("Table Details"),
      ),
          body:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  //sortColumnIndex: 1,
                  //sortAscending: false,
                columns: list, rows: TableDetaillist)),
          ),
    );

  }
}
