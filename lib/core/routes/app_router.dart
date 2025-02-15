import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: '/',
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page:RegistrationRoute.page,
      path: '/registration',
    ),
    AutoRoute(
      page:ProfileRoute.page,
      path: '/profile',
    ),
    AutoRoute(
      page:EditProfileRoute.page,
      path: '/editProfile',
    ),
    AutoRoute(
      page:JobDescriptionRoute.page,
      path: '/jobDescription',
    ),
    AutoRoute(
      page:AppliedJobsRoute.page,
      path: '/appliedJobList',
    ),
    AutoRoute(
      page:AppNotificationRoute.page,
      path: '/appNotification',
    ),
    AutoRoute(
      page: HomeTabRoute.page,
      path: '/',
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: 'home-screen',
          initial: true,
        ),
        AutoRoute(
          page: MenuRoute.page,
          path: 'menu-screen',
        ),
      ],
    ),
  ];
}

