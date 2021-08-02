import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/app.dart';
import 'package:flutter_sqllite_table_view/providers/dashboard_provider.dart';
import 'package:flutter_sqllite_table_view/providers/splash_data_provider.dart';
import 'package:flutter_sqllite_table_view/providers/sqlite_database_provider.dart';
import 'package:flutter_sqllite_table_view/providers/pdf_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>DatabaseProvider()),
        ChangeNotifierProvider(create: (context)=>PdfProvider()),
        ChangeNotifierProvider(create: (context)=>SplashDataProvider()),
        ChangeNotifierProvider(create: (context)=>DashboardProvider()),
      ],
      child: MyApp(),));
}

