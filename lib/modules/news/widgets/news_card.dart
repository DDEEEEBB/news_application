import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/manager/app_provider.dart';
import '../../../core/themes/app_colors.dart';
import '../../../models/news_model.dart';

class news_card extends StatelessWidget {
  const news_card({
    super.key,
    required this.articles,
  });

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
              color: provider.themeMode == ThemeMode.light
                  ? AppColors.black
                  : AppColors.white,
              width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 220,
                fit: BoxFit.cover,
                imageUrl: articles.urlToImage??"",
                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: provider.themeMode==ThemeMode.light?AppColors.black:AppColors.white,)),
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error,color: provider.themeMode==ThemeMode.light?AppColors.black:AppColors.white ,)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              articles.title ?? "",
              style: TextStyle(
                  fontSize: 16,
                  color: provider.themeMode == ThemeMode.light
                      ? AppColors.black
                      : AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.inter().fontFamily),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Author: ${articles.author}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        color: provider.themeMode == ThemeMode.light
                            ? AppColors.black
                            : AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.inter().fontFamily),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  articles.publishedAt?.substring(0, 10) ?? "",
                  style: TextStyle(
                      fontSize: 16,
                      color: provider.themeMode == ThemeMode.light
                          ? AppColors.black
                          : AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.inter().fontFamily),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
