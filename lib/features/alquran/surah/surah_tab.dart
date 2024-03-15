import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/data/models/surah_list.dart';
import 'package:mobile_alquran_app/features/alquran/surah/bloc/list_surah_bloc.dart';

import 'widgets/surah_item.dart';

class SurahTab extends StatefulWidget {
  const SurahTab({super.key});

  @override
  State<SurahTab> createState() => _SurahTabState();
}

class _SurahTabState extends State<SurahTab> {
  @override
  void initState() {
    super.initState();

    context.read<ListSurahBloc>().add(FetchListSurah());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListSurahBloc, ListSurahState>(
      builder: (context, state) {
        if (state is ListSurahLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ListSurahError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is ListSurahLoaded) {
          final List<SurahList> surah = state.listSurah;
          return ListView.separated(
              itemBuilder: (context, index) => SurahItem(
                    context: context,
                    surah: surah.elementAt(index),
                  ),
              separatorBuilder: (context, index) =>
                  Divider(color: const Color(0xFF7B80AD).withOpacity(.35)),
              itemCount: surah.length);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
