import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/news_model.dart';
import '../../features/home/presentation/manager/bookmark_cubit/bookmark_cubit.dart';
import '../../features/home/presentation/view/nav_bar.dart';
import '../../features/home/presentation/view/news_details_screen.dart';

abstract class AppRouter {
  static const initialRoute = '/';
  static const newsDetailsScreenRoute = '/newsDetailsScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const NavBar(),
      ),
      GoRoute(
        path: newsDetailsScreenRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => BookmarkCubit(state.extra as NewsModel),
          child: NewsDetailsScreen(
            newsModel: state.extra as NewsModel,
          ),
        ),
      ),
    ],
  );
}
