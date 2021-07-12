import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/config/values.dart';
import 'package:flutter_sqllite_table_view/providers/database_provider.dart';
import 'package:provider/provider.dart';
class TableDetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TableDetailPage();
  }
}
class _TableDetailPage extends State<TableDetailPage> {
   List<Map> tableDetail=List.generate(Provider.of<DatabaseProvider>(Values.navigatorKey!.currentContext as BuildContext,listen:false).tableDetailList!.length, (index) {
  Map map=Provider.of<DatabaseProvider>(Values.navigatorKey!.currentContext as BuildContext,listen: false).tableDetailList![index];
  return map;
  }
  );
  int _currentSortColumn = 0;
  bool _isAscending = true;
  _TableDetailPage({Key? key}) ;

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      appBar:AppBar(
        title: Text("Table Details"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
          body:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    sortColumnIndex: _currentSortColumn,
                    sortAscending: _isAscending,
                columns: List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableColumnName!.length, (index) {
                  return DataColumn(
                      onSort: (columnIndex,sortAscending){
                        print(sortAscending);
                        setState(() {
                          String cName=Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![columnIndex];
                          _currentSortColumn = columnIndex;
                          if (_isAscending == true) {
                            _isAscending = false;
                            // sort the product list in Ascending, order by Price
                            tableDetail.sort((productA, productB) =>
                                productB[cName].compareTo(productA[cName]));
                          } else {
                            _isAscending = true;
                            // sort the product list in Descending, order by Price
                            tableDetail.sort((productA, productB) =>
                                productA[cName].compareTo(productB[cName]));
                          }
                        });


                      },
                      label: Text(Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![index].toString()));
                }), rows: List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableDetailList!.length, (index) {
                  var tableDetailRow=tableDetail[index];
                  return DataRow(
                      selected: true,
                      cells: List.generate(Provider.of<DatabaseProvider>(context,listen:false).tableColumnName!.length, (index) {
                        return DataCell(Text(tableDetailRow[Provider.of<DatabaseProvider>(context,listen:false).tableColumnName![index]].toString()??"0"));
                      })

                  );


                }
                ))),
          ),
    );

  }
}
