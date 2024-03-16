import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/data/models/surah_bookmark.dart';
import 'package:mobile_alquran_app/features/alquran/bookmark/bloc/bookmark_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/bookmark/widgets/bookmark_item.dart';

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
        if (state is BookmarkLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BookmarkError) {
          return Center(
            child: Text(
              "No Data", style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (state is BookmarkLoaded) {
          final List<SurahBookmark> surah = state.bookmarks;
          return ListView.separated(
              itemBuilder: (context, index) => BookmarkItem(
                    context: context,
                    surah: surah.elementAt(index),
                  ),
              separatorBuilder: (context, index) =>
                  Divider(color: const Color(0xFF7B80AD).withOpacity(.35)),
              itemCount: surah.length);
        } else {
          return Center(
            child: Text(
              "No Data", style: const TextStyle(color: Colors.white),
            ),);
        }
      },
    );
  }
}
