import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../detail/detail_screen.dart';

class LastRead extends StatefulWidget {
  const LastRead({super.key});

  @override
  State<LastRead> createState() => _LastReadState();
}

class _LastReadState extends State<LastRead> {
  Stream<Map<String, dynamic>> _getLastRead() async* {
    final prefs = await SharedPreferences.getInstance();
    while (true) {
      final lastReadSurah = prefs.getInt('lastReadSurah') ?? 1;
      final lastReadAyat = prefs.getInt('lastReadAyat') ?? 1;
      final lastReadSurahLatin = prefs.getString('lastReadSurahLatin') ?? 'Al-Fatihah';
      yield {'surah': lastReadSurah, 'ayat': lastReadAyat, 'surahLatin': lastReadSurahLatin};
      await Future.delayed(Duration(seconds: 1));
    }
  }

  void _goToDetail(BuildContext context, int surahNumber) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(noSurat: surahNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _getLastRead().first.then((lastRead) {
          _goToDetail(context, lastRead['surah']!);
        });
      },
      child: StreamBuilder<Map<String, dynamic>>(
        stream: _getLastRead(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            final lastRead = snapshot.data!;
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
                BuildText(
                  text: 'Surah ${lastRead['surahLatin']}',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 4,
                ),
                BuildText(
                  text: 'Ayat ${lastRead['ayat']}',
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
      },
      ),
    );
  }
}
