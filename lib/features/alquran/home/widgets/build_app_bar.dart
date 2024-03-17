import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/search/search_screen.dart';

import 'build_text.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(children: [
        IconButton(
            onPressed: (() => {
                  Scaffold.of(context).openDrawer(),
            }),
            icon: SvgPicture.asset('assets/images/menu-icon.svg')),
        const SizedBox(
          width: 24,
        ),
        const BuildText(
            text: 'AlQuran App',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        const Spacer(),
        IconButton(
            onPressed: (() => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchScreen()))
                }),
            icon: SvgPicture.asset('assets/images/search-icon.svg')),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
