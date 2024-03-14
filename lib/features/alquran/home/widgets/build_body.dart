import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/bookmark/bookmark_tab.dart';
import 'package:mobile_alquran_app/features/alquran/surah/surah_tab.dart';

import 'build_tab.dart';
import 'greet.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverToBoxAdapter(
                    child: Greet(),
                  ),
                  SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    backgroundColor: AppColors.background,
                    automaticallyImplyLeading: false,
                    shape: Border(
                        bottom: BorderSide(
                            width: 3,
                            color: const Color(0xFFAAAAAA).withOpacity(.1))),
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(0),
                      child: BuildTab(),
                    ),
                  )
                ],
            body: const TabBarView(children: [
              SurahTab(),
              Bookmark(),
            ])),
      ),
    );
  }
}
