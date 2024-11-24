import 'package:convert_zone/models/order.dart';
import 'package:convert_zone/models/properties_list.dart';
import 'package:convert_zone/models/settings.dart';
import 'package:convert_zone/pages/conversion_page.dart';
import 'package:convert_zone/pages/error_page.dart';
import 'package:convert_zone/pages/nav_bar.dart';
import 'package:convert_zone/pages/reorder_properties_page.dart';
import 'package:convert_zone/pages/reorder_units_page.dart';
import 'package:convert_zone/pages/settings_page.dart';
import 'package:convert_zone/pages/splash_screen.dart';
import 'package:convert_zone/pages/app_scaffold.dart';
import 'package:convert_zone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vector_graphics/vector_graphics.dart';

final isEverythingLoadedProvider = Provider<bool>((ref) =>
    ref.watch(SignificantFigures.provider).hasValue &&
    ref.watch(RemoveTrailingZeros.provider).hasValue &&
    ref.watch(IsDarkAmoled.provider).hasValue &&
    ref.watch(ThemeColorNotifier.provider).hasValue &&
    ref.watch(RevokeInternetNotifier.provider).hasValue &&
    ref.watch(CurrentThemeMode.provider).hasValue &&
    ref.watch(CurrentLocale.provider).hasValue &&
    ref.watch(PropertiesOrderNotifier.provider).hasValue &&
    ref.watch(UnitsOrderNotifier.provider).hasValue &&
    ref.watch(propertiesListProvider).hasValue);

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, _) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          // return AppScaffold(
          //   child: child,
          // );
          return NavBar();
        },
        routes: [
          GoRoute(
            path: '/conversions/:property',
            pageBuilder: (context, state) {
              final String property = state.pathParameters['property']!;
              final int? pageNumber = pageNumberMap[property];
              if (pageNumber == null) {
                throw Exception('property not found: $property');
              } else {
                return NoTransitionPage(child: ConversionPage(pageNumber, Color(0xFFD1E3FF)));
              }
            },
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SettingsPage()),
            routes: [
              GoRoute(
                path: 'reorder-properties',
                name: 'reorder-properties',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ReorderPropertiesPage()),
              ),
              GoRoute(
                path: 'reorder-units',
                name: 'reorder-units',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ChoosePropertyPage()),
                routes: [
                  GoRoute(
                    path: ':property',
                    pageBuilder: (context, state) {
                      final String property = state.pathParameters['property']!;
                      final int? pageNumber = pageNumberMap[property];
                      if (pageNumber == null) {
                        throw Exception('property not found: $property');
                      } else {
                        return NoTransitionPage(
                          child: ChoosePropertyPage(
                            selectedProperty: pageNumber,
                            isPropertySelected: true,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'about',
                name: 'about',
                builder: (context, state) => LicensePage(
                  applicationName: 'ConvertZone',
                  applicationIcon: const SvgPicture(
                    AssetBytesLoader('assets/app_icons/logo.svg.vec'),
                    width: 50,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      // Bypass splashscreen if variables are already loaded
      if (state.uri.toString() == '/') {
        if (ref.read(isEverythingLoadedProvider)) {
          final List<int> conversionsOrderDrawer =
              ref.read(PropertiesOrderNotifier.provider).value!;
          return '/conversions/${reversePageNumberListMap[conversionsOrderDrawer.indexWhere((val) => val == 0)]}';
        }
      }
      return null;
    },
    errorBuilder: (context, state) => const ErrorPage(),
  ),
);
