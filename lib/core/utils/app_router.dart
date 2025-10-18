import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kHomePage = 'HomePage';
  static String kSplashView = 'SplashView';
  static String kDetailsPage = 'DetailsPage';
  static String kSearchView = 'SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/Home',
        name: kHomePage,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: '/Search',
        name: kSearchView,
        builder: (context, state) {
          return SearchView();
        },
      ),
      GoRoute(
        path: '/',
        name: kSplashView,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: '/Details',
        name: kDetailsPage,
        builder: (context, state) {
          final book = state.extra as BookModel;
          return DetailsView(book: book);
        },
      ),
    ],
  );
}
