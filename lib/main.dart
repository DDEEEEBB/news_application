import 'package:flutter/material.dart';
import 'package:news/core/manager/app_provider.dart';
import 'package:news/core/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_route_name.dart';


void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider()..getTheme(),
      builder:(context, child) {
        var provider =Provider.of<AppProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: ROUTES.routes,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:provider.themeMode,

        );
      },
    );
  }
}
