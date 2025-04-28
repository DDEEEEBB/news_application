import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/constant/app_category.dart';
import 'package:news/core/themes/app_colors.dart';
import 'package:news/modules/news/view_model/news_view_model.dart';
import 'package:news/modules/news/widgets/news_card.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/manager/app_provider.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    AppCategory category =
        ModalRoute.of(context)?.settings.arguments as AppCategory;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            category.name,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.inter().fontFamily),
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => NewsProvider()..getSources(category.id),
          child: Consumer<NewsProvider>(
            builder: (context, vm, _) {
              return Column(
                children: [
                  DefaultTabController(
                    length: vm.sources.length,
                    child: Column(
                      children: [
                        TabBar(
                          onTap: (value) {
                            vm.getNews(vm.sources[value].id ?? "");
                          },
                          overlayColor: WidgetStatePropertyAll(
                              provider.themeMode == ThemeMode.light
                                  ? AppColors.white
                                  : AppColors.black),
                          labelPadding: const EdgeInsets.all(12),
                          tabAlignment: TabAlignment.start,
                          dividerColor: Colors.transparent,
                          labelColor: provider.themeMode == ThemeMode.light
                              ? AppColors.black
                              : AppColors.white,
                          indicatorColor: provider.themeMode == ThemeMode.light
                              ? AppColors.black
                              : AppColors.white,
                          isScrollable: true,
                          tabs: vm.sources.map(
                            (e) {
                              return Tab(
                                child: Text(
                                  e.name ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: vm.articles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isDismissible: false,
                                elevation: 0,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return DraggableScrollableSheet(
                                    expand: false,
                                    initialChildSize: 0.5,
                                    minChildSize: 0.3,
                                    maxChildSize: 0.6,
                                    builder: (context, scrollController) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14, horizontal: 14),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: provider.themeMode ==
                                                      ThemeMode.light
                                                  ? AppColors.black
                                                  : AppColors.white),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: provider.themeMode ==
                                                        ThemeMode.light
                                                    ? AppColors.black
                                                    : AppColors.white),
                                            child: SingleChildScrollView(
                                              controller: scrollController,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      child: CachedNetworkImage(
                                                        height: 220,
                                                        fit: BoxFit.cover,
                                                        imageUrl: vm
                                                                .articles[index]
                                                                .urlToImage ??
                                                            "",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                          color: provider
                                                                      .themeMode ==
                                                                  ThemeMode
                                                                      .light
                                                              ? AppColors.black
                                                              : AppColors.white,
                                                        )),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Center(
                                                                child: Icon(
                                                          Icons.error,
                                                          color: provider
                                                                      .themeMode ==
                                                                  ThemeMode
                                                                      .light
                                                              ? AppColors.black
                                                              : AppColors.white,
                                                        )),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      vm.articles[index]
                                                              .title ??
                                                          "",
                                                      style: TextStyle(
                                                          color: provider
                                                                      .themeMode ==
                                                                  ThemeMode
                                                                      .light
                                                              ? AppColors.white
                                                              : AppColors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(height: 2,),
                                                    Text(
                                                      vm.articles[index]
                                                              .description ??
                                                          "",
                                                      style: TextStyle(
                                                          color: provider
                                                                      .themeMode ==
                                                                  ThemeMode
                                                                      .light
                                                              ? AppColors.white
                                                              : AppColors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor: provider
                                                                            .themeMode ==
                                                                        ThemeMode
                                                                            .light
                                                                    ? AppColors
                                                                        .white
                                                                    : AppColors
                                                                        .black,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        18),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16)),),
                                                            onPressed: () {
                                                              launchUrl(
                                                                  mode: LaunchMode.inAppWebView
                                                                  ,Uri.parse(vm.articles[index].url??""));
                                                            },
                                                            child: Text(
                                                              "View Full Article",
                                                              style: TextStyle(
                                                                  color: provider
                                                                              .themeMode ==
                                                                          ThemeMode
                                                                              .light
                                                                      ? AppColors
                                                                          .black
                                                                      : AppColors
                                                                          .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontFamily: GoogleFonts
                                                                          .inter()
                                                                      .fontFamily),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: news_card(articles: vm.articles[index]));
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }
}
