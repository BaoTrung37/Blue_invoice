import 'package:auto_route/auto_route.dart';

import '../presentation/presentation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: MainAppRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: InvoiceDetailRoute.page),
          ],
        ),
      ];
}
