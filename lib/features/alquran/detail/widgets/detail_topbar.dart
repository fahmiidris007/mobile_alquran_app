import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_alquran_app/data/models/surah_bookmark.dart';
import 'package:mobile_alquran_app/data/models/surah_detail.dart';
import 'package:mobile_alquran_app/features/alquran/bookmark/bloc/bookmark_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';

class DetailSurah extends StatefulWidget {
  const DetailSurah({super.key, required this.surah});

  final SurahDetail surah;

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    final blocBookmark = context.read<BookmarkBloc>().state;
    if (blocBookmark is BookmarkLoaded) {
      final List<SurahBookmark> bookmarks = blocBookmark.bookmarks;
      final isBookmarked = bookmarks.any((element) => element.nomor == widget.surah.nomor);
      setState(() {
        this.isBookmarked = isBookmarked;
      });
    }
  }

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
        Positioned(
          top: 20,
          right: 20,
          child: GestureDetector(
            onTap: () async {
              SurahBookmark bookmark = SurahBookmark(
                nomor: widget.surah.nomor,
                nama: widget.surah.nama,
                namaLatin: widget.surah.namaLatin,
                jumlahAyat: widget.surah.jumlahAyat,
                tempatTurun: tempatTurunValues.map[widget.surah.tempatTurun],
                arti: widget.surah.arti,
                deskripsi: widget.surah.deskripsi,
                audio: widget.surah.audio,
              );

              if (isBookmarked) {
                context.read<BookmarkBloc>().add(RemoveBookmark(widget.surah.nomor!));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Center(child: Text('Surah removed from bookmark')),
                  ),
                );
              } else {
                context.read<BookmarkBloc>().add(AddBookmark(bookmark));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Center(child: Text('Surah added to bookmark')),
                  ),
                );
              }

              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              color: Colors.white,
            ),
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
                text: widget.surah.nama!,
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 4,
              ),
              BuildText(
                text: widget.surah.arti!,
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
                    text: widget.surah.tempatTurun!,
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
                    text: widget.surah.jumlahAyat.toString(),
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
