import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/search/bloc/search_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/search/widgets/search_item.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({super.key});

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Search Surah',
                    labelStyle: const TextStyle(color: AppColors.text),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          context
                              .read<SearchBloc>()
                              .add(FetchSearch(_controller.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Center(
                                  child: Text('Please input the surah name')),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      context.read<SearchBloc>().add(FetchSearch(value));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                              child: Text('Please input the surah name')),
                        ),
                      );
                    }
                  },
                ),
              ),
              if (state is SearchLoading)
                const Expanded(
                  flex: 9,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (state is SearchLoaded)
                Expanded(
                  flex: 9,
                  child: ListView.separated(
                      itemBuilder: (context, index) => SearchItem(
                            context: context,
                            surah: state.listSearch.elementAt(index),
                          ),
                      separatorBuilder: (context, index) => Divider(
                          color: const Color(0xFF7B80AD).withOpacity(.35)),
                      itemCount: state.listSearch.length),
                )
              else if (state is SearchError)
                Expanded(
                  flex: 9,
                  child: Center(
                    child: Text(state.message),
                  ),
                )
              else
                const Expanded(
                  flex: 9,
                  child: Center(
                    child: Text('Unknown state'),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
