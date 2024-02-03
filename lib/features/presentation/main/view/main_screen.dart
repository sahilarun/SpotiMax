import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotimax/core/app/colors/colors.dart';
import 'package:spotimax/core/app/router/router.dart';
import 'package:spotimax/core/app/themes/theme_consts.dart';
import 'package:spotimax/core/di/injector.dart';
import 'package:spotimax/core/permissions/permissions_manager.dart';
import 'package:spotimax/core/permissions/requiring_permission_services_initializer.dart';
import 'package:spotimax/features/presentation/permissions_dialog/view/permissions_dialog.dart';
import 'package:spotimax/generated/l10n.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with AutoRouteAwareStateMixin {
  final PermissionsManager _permissionsManager = injector.get<PermissionsManager>();
  final RequiringPermissionServicesInitializer _requiringPermissionServicesInitializer =
      injector.get<RequiringPermissionServicesInitializer>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future(() async {
        if (!(await _permissionsManager.isPermissionsGranted()) && context.mounted) {
          showPermissonsDialog(context, () async {
            final isPermissionsGranted = await _permissionsManager.requestPermissions();
            await _requiringPermissionServicesInitializer.initialize();
            return isPermissionsGranted;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: const [HomeRoute(), SearchRoute(), HistoryRoute()],
        navigatorObservers: () => [AutoRouteObserver()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                child,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color.fromARGB(0, 0, 0, 0), Color.fromARGB(150, 0, 0, 0)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Theme(
                      data: ThemeData(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: const Color.fromARGB(0, 0, 0, 0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: bottomNavigationBarHeight,
                          child: BottomNavigationBar(
                              enableFeedback: false,
                              selectedFontSize: 10,
                              unselectedFontSize: 10,
                              selectedItemColor: onBackgroundPrimaryColor,
                              unselectedItemColor: onBackgroundSecondaryColor,
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              currentIndex: tabsRouter.activeIndex,
                              onTap: (index) => tabsRouter.setActiveIndex(index),
                              items: [
                                BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                      'resources/images/svg/bottom_bar/home_icon.svg',
                                      height: 25,
                                      width: 25,
                                      colorFilter: const ColorFilter.mode(onBackgroundSecondaryColor, BlendMode.srcIn),
                                    ),
                                    activeIcon: SvgPicture.asset(
                                      'resources/images/svg/bottom_bar/home_icon_active.svg',
                                      height: 25,
                                      width: 25,
                                      colorFilter: const ColorFilter.mode(onBackgroundPrimaryColor, BlendMode.srcIn),
                                    ),
                                    label: S.of(context).main),
                                BottomNavigationBarItem(
                                  icon: SvgPicture.asset(
                                    'resources/images/svg/search_icon.svg',
                                    height: 25,
                                    width: 25,
                                    colorFilter: const ColorFilter.mode(onBackgroundSecondaryColor, BlendMode.srcIn),
                                  ),
                                  activeIcon: SvgPicture.asset(
                                    'resources/images/svg/search_icon.svg',
                                    height: 25,
                                    width: 25,
                                    colorFilter: const ColorFilter.mode(onBackgroundPrimaryColor, BlendMode.srcIn),
                                  ),
                                  label: S.of(context).search,
                                ),
                                BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                      'resources/images/svg/bottom_bar/history_icon.svg',
                                      height: 25,
                                      width: 25,
                                      colorFilter: const ColorFilter.mode(onBackgroundSecondaryColor, BlendMode.srcIn),
                                    ),
                                    activeIcon: SvgPicture.asset(
                                      'resources/images/svg/bottom_bar/history_icon_active.svg',
                                      height: 25,
                                      width: 25,
                                      colorFilter: const ColorFilter.mode(onBackgroundPrimaryColor, BlendMode.srcIn),
                                    ),
                                    label: S.of(context).history),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
