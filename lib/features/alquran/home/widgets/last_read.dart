import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';

class LastRead extends StatelessWidget {
  const LastRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 131,
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
            child: SvgPicture.asset('assets/images/quran.svg')),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/book.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  const BuildText(
                    text: 'Last Read',
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const BuildText(
                text: 'Al-Fatihah',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 4,
              ),
              const BuildText(
                text: 'Ayat No: 1',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        )
      ],
    );
  }
}
