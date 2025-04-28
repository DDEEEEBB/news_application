import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;


  void changeTheme(ThemeMode? value){
    if(value!= null){
      themeMode=value;
    }else{
      if(themeMode==ThemeMode.light){
        themeMode =ThemeMode.dark;
      }else{
        themeMode =ThemeMode.light;
      }
    }
    saveTheme();
    notifyListeners();
  }
  Future<void> saveTheme() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", themeMode.name);
  }

  Future<void> getTheme() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme =  prefs.getString("theme")??"light";
    if(theme =="light"){
      themeMode = ThemeMode.light;
    }else{
      themeMode = ThemeMode.dark;
    }
  }



  }