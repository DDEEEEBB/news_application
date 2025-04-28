import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news/core/constant/App_assets.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/core/themes/app_colors.dart';
import 'package:provider/provider.dart';

import '../../core/manager/app_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: provider.themeMode==ThemeMode.light?AppColors.white:AppColors.black,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ZoomIn(
                duration: const Duration(seconds: 2),
                child:provider.themeMode==ThemeMode.light?Image.asset(AppAssets.news_logo_l_bg):Image.asset(AppAssets.news_logo_d_bg)
                    ),
            const Spacer(),
            FadeInUp(
                delay: const Duration(seconds: 3),
                onFinish: (direction) {
                  Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
                },
                child:provider.themeMode==ThemeMode.light?Image.asset(AppAssets.route_logo_l_bg,height: 85,width: 214,) :Image.asset(
                        AppAssets.route_logo_d_bg,
                        height: 85,
                        width: 214,
                      ),
                      )
          ],
        ),
      ),
    );
  }
}
