import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/app.dart';
import 'package:flutter_sqllite_table_view/providers/database_provider.dart';
import 'package:flutter_sqllite_table_view/providers/pdf_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>DatabaseProvider()),
        ChangeNotifierProvider(create: (context)=>PdfProvider())],
      child: MyApp(),));
}

