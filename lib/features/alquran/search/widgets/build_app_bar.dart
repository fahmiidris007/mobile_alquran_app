import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/search/widgets/build_text.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(children: [
        IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: SvgPicture.asset('assets/images/back-icon.svg')),
        const SizedBox(
          width: 24,
        ),
        const BuildText(
            text: 'Search Surah',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ]),
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
