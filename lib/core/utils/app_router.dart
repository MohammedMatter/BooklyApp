import 'package:bookly_app/features/home/presentation/views/details_page.dart';
import 'package:bookly_app/features/home/presentation/views/home_page_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/HomePage',
        name: 'HomePage',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(path: '/', 
      name: 'SplashView',
      builder: (context, state) => SplashView()),
      GoRoute(
        path: '/DetailsPage',
        name: 'DetailsPage',

        builder: (context, state) => DetailsPage(),
      ),
    ],
  );
}
