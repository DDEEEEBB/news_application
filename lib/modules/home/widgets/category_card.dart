import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_category.dart';
import '../../../core/manager/app_provider.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/themes/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.isLeft
  });

  final AppCategory category;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      height: 245,
      margin: const EdgeInsets.only(top: 6,bottom: 6),
      width: double.infinity,
      decoration: BoxDecoration(
          color: provider.themeMode == ThemeMode.light
              ? AppColors.black
              : AppColors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          )),
      child: Row(
        textDirection: isLeft ?TextDirection.ltr:TextDirection.rtl,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: Image.asset(
              category.image,
              fit: BoxFit.cover,
              width: 200,
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category.name,
                style: TextStyle(
                    color: provider.themeMode == ThemeMode.light
                        ? AppColors.white
                        : AppColors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.inter().fontFamily),
              ),
              const SizedBox(
                height: 20,
              ),
              ActionSlider.standard(
                backgroundColor: provider.themeMode == ThemeMode.light
                    ? AppColors.white
                    : AppColors.black,
                toggleColor: AppColors.white,
                direction:isLeft? TextDirection.rtl:TextDirection.ltr,
                height: 50,
                width: 160,
                child: const Text("View All"),
                action: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(milliseconds: 1000));
                  controller.reset();
                  return Navigator.pushNamed(context, AppRoutes.NewsScreen,arguments: category);
                },
              )
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
