import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/data/models/surah_bookmark.dart';
import 'package:mobile_alquran_app/features/alquran/bookmark/bloc/bookmark_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/bookmark/widgets/bookmark_item.dart';
import 'package:mobile_alquran_app/features/alquran/bookmark/widgets/build_text.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  void initState() {
    super.initState();

    context.read<BookmarkBloc>().add(FetchBookmark());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkBloc, BookmarkState>(
      builder: (context, state) {
        debugPrint("state: $state");
        if (state is BookmarkLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BookmarkError) {
          return const Center(
            child: BuildText(
              text: 'Sorry, something went wrong!',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          );
        } else if (state is BookmarkLoaded) {
          final List<SurahBookmark> surah = state.bookmarks;
          if (surah.isEmpty) {
            return Center(
              child: BuildText(
                text: "No Data Found",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => BookmarkItem(
                    context: context,
                    surah: surah.elementAt(index),
                  ),
              separatorBuilder: (context, index) =>
                  Divider(color: const Color(0xFF7B80AD).withOpacity(.35)),
              itemCount: surah.length);
        } else {
          return const Center(
            child: BuildText(
              text: 'Sorry, something went wrong!',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),);
        }
      },
    );
  }
}
