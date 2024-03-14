import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_alquran_app/data/models/surah.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';

class DetailSurah extends StatelessWidget {
  const DetailSurah({super.key, required this.surah});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(children: [
        Container(
          height: 257,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    .6,
                    1
                  ],
                  colors: [
                    Color(0xFFDF98FA),
                    Color(0xFFB070FD),
                    Color(0xFF9055FF)
                  ])),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
                opacity: .2,
                child: SvgPicture.asset(
                  'assets/images/quran.svg',
                  width: 324 - 55,
                ))),
        const Positioned(
          top: 20,
          right: 20,
          child: Icon(
            Icons.bookmark_outline,
            color: Colors.white,
          ),
        ),
        const Positioned(
          top: 20,
          left: 20,
          child: Icon(
            Icons.share_outlined,
            color: Colors.white,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              BuildText(
                text: surah.nama,
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 4,
              ),
              BuildText(
                text: surah.arti,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              Divider(
                color: Colors.white.withOpacity(.35),
                thickness: 2,
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildText(
                    text: surah.tempatTurun.name,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  BuildText(
                    text: surah.jumlahAyat.toString(),
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SvgPicture.asset('assets/images/bismillah.svg')
            ],
          ),
        )
      ]),
    );
  }
}
