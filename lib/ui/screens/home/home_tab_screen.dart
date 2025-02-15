import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/routes/app_router.gr.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_typography.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../widgets/buttons/ink_well_material.dart';

enum _BottomTabEnum {
  home(
      name: 'Home',
      icon: Icons.home,
      width: 28,
      height: 28,
      route: HomeRoute()),
  profile(
      name: 'Menu',
      icon: Icons.menu,
      width: 28,
      height: 28,
      route: MenuRoute());

  const _BottomTabEnum({
    required this.icon,
    required this.route,
    required this.name,
    this.width,
    this.height,
  });

  final IconData icon;
  final String name;
  final PageRouteInfo route;
  final double? width;
  final double? height;
}

@RoutePage()
class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) => AutoRouter(
        builder: (context, content) => Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: content,
              ),
              Positioned(
                bottom: context.safeBottomStrict + 20,
                left: 100,
                right: 100,
                child: const _GBottomNav(),
              ),
            ],
          ),
        ),
      );
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final activeRoute = AutoRouter.of(context, watch: true)
        .stack
        .reversed
        .firstOrNull
        ?.routeData
        .name;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.topRight,
          //   colors: [
          //     Colors.transparent,
          //     Color(0xFF414347),
          //   ],
          // ),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 70,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _BottomTabEnum.values.length,
                // ignore: proper_expanded_and_flexible
                (index) => Expanded(
                  child: _BottomTabButton(
                    bottomTabEnum: _BottomTabEnum.values[index],
                    activeRoute: activeRoute,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomTabButton extends StatelessWidget {
  const _BottomTabButton({
    required this.bottomTabEnum,
    required this.activeRoute,
  });

  final _BottomTabEnum bottomTabEnum;

  final String? activeRoute;

  @override
  Widget build(BuildContext context) => InkWellMaterial(
        borderRadius: 20,
        onTap: () => context.navigateTo(bottomTabEnum.route),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 14, bottom: 1,
            // top: activeRoute == bottomTabEnum.route.routeName ? 14 : 18,
            // bottom: activeRoute == bottomTabEnum.route.routeName ? 2 : 0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  bottomTabEnum.icon,
                  color: activeRoute == bottomTabEnum.route.routeName
                      ? AppColors.buttonColor
                      : AppColors.buttonColor.withOpacity(0.6),
                  size: 20,
                ),
                const Gap(2),
                Text(
                  bottomTabEnum.name,
                  style: TextStyle(
                    fontSize: AppTypography.sBodySmall,
                    color: activeRoute == bottomTabEnum.route.routeName
                        ? AppColors.buttonColor
                        : AppColors.buttonColor.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _GBottomNav extends StatelessWidget {
  const _GBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final activeRoute = AutoRouter.of(context, watch: true)
        .stack
        .reversed
        .firstOrNull
        ?.routeData
        .name;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: GNav(
          // key: Key(activeRoute.toString()),
          gap: 4,
          selectedIndex: _BottomTabEnum.values.indexWhere(
            (element) => element.route.routeName == activeRoute,
          ),
          backgroundColor: Colors.white,
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.lightBlueAccent.shade100,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          tabs: List.generate(
            _BottomTabEnum.values.length,
            (index) => GButton(
              // active: activeRoute ==
              //     _BottomTabEnum.values[index].route.routeName,
              icon: _BottomTabEnum.values[index].icon,
              text: _BottomTabEnum.values[index].name,
              onPressed: () => context.router.push(
                _BottomTabEnum.values[index].route,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
