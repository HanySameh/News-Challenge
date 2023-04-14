import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/data/repos/home_repo_impl.dart';
import '../../../features/home/presentation/manager/search_cubit/search_cubit_cubit.dart';
import '../../../features/home/presentation/view/widgets/home_widgets.dart';
import '../../widgets/error_widget.dart';
import '../service_locator.dart';

Future<void> showSearchBar(BuildContext context) async {
  await showSearch(
    context: context,
    delegate: CustomSearchDelegate(),
  );
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(getIt.get<HomeRepoImpl>())..search(query),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccessState) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return RecNewsItem(
                  newsModel: state.news[index],
                );
              },
            );
          } else if (state is SearchFailureState) {
            return ErrorItem(
              message: state.errMessage,
            );
          } else {
            return const LinearProgressIndicator();
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
