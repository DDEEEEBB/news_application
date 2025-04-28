import 'package:news/core/constant/App_assets.dart';

class AppCategory {
  String id;
  String name;
  String image;

  AppCategory({
    required this.id,
    required this.name,
    required this.image
  });

  static List<AppCategory> categories=[
    AppCategory(id: "General", name: "General", image: AppAssets.genral_logo),
    AppCategory(id: "Business", name: "Business", image: AppAssets.business_logo),
    AppCategory(id: "Entertainment", name: "Entertainment", image: AppAssets.Entertainment_logo),
    AppCategory(id: "Technology", name: "Technology", image: AppAssets.technology_logo),
    AppCategory(id: "Science", name: "Science", image: AppAssets.Science_logo),
    AppCategory(id: "Health", name: "Health", image: AppAssets.health_logo),
    AppCategory(id: "Sport", name: "Sport", image: AppAssets.sport_logo),
  ];
}
