import 'package:flutter/cupertino.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/news/pages/news_screen.dart';
import '../../modules/splash/splash_screen.dart';
import 'app_routes.dart';

class ROUTES{
  ROUTES._();

  static Map<String, Widget Function(BuildContext)> routes ={

    AppRoutes.splash:(_)=> SplashScreen(),
    AppRoutes.homeScreen:(_)=> HomeScreen(),
    AppRoutes.NewsScreen:(_)=> NewsScreen(),

  };
}