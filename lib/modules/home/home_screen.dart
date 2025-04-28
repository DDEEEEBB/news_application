import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/constant/App_assets.dart';
import 'package:news/core/constant/app_category.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/modules/home/widgets/category_card.dart';
import 'package:provider/provider.dart';
import '../../core/manager/app_provider.dart';
import '../../core/themes/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: provider.themeMode == ThemeMode.light
            ? AppColors.white
            : AppColors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: provider.themeMode == ThemeMode.light
                ? Brightness.dark
                : Brightness.light),
        title: Text(
          "Home",
          style: TextStyle(
              fontSize: 20,
              color: provider.themeMode == ThemeMode.light
                  ? AppColors.black
                  : AppColors.white,
              fontWeight: FontWeight.w700,
              fontFamily: GoogleFonts.inter().fontFamily),
        ),
        actions: [
          Icon(
            Icons.search,
            color: provider.themeMode == ThemeMode.light
                ? AppColors.black
                : AppColors.white,
            size: 28,
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: AppColors.black,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          child: Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: AppColors.white),
                child: Center(
                  child: Text(
                    "News",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      overlayColor:
                          const WidgetStatePropertyAll(AppColors.black),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.homeScreen);
                      },
                      child: Row(
                        children: [
                          const ImageIcon(
                            AssetImage(AppAssets.home_icon),
                            color: AppColors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Go To Home",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: GoogleFonts.inter().fontFamily,
                                color: AppColors.white),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.white,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.format_paint,
                          color: AppColors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Them",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.inter().fontFamily,
                              color: AppColors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: 280,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: provider.themeMode,
                        icon: const Icon(
                          Icons.arrow_drop_down_rounded,
                          color: AppColors.white,
                        ),
                        iconSize: 40,
                        dropdownColor: AppColors.black,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.inter().fontFamily),
                        items: const [
                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text(
                              "Light",
                            ),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text("Dark"),
                          ),
                        ],
                        onChanged: (value) {
                          provider.changeTheme(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.white,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning\nHere is Some News For You",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: provider.themeMode == ThemeMode.light
                      ? AppColors.black
                      : AppColors.white),
            ),
            const SizedBox(height: 16,),
            Expanded(
              child: ListView.builder(
                itemCount: AppCategory.categories.length,
                itemBuilder: (context, index) {
                return Column(
                  textDirection: TextDirection.ltr,
                  children: [
                    CategoryCard(category: AppCategory.categories[index],
                    isLeft: index % 2==0,)
                  ],
                );
              },),
            ),
          ],
        ),
      )
    );
  }
}
