import 'package:convert_zone/helpers/responsive_helper.dart';
import 'package:convert_zone/models/conversions.dart';
import 'package:convert_zone/models/order.dart';
import 'package:convert_zone/pages/custom_drawer.dart';
import 'package:convert_zone/pages/search_page.dart';
import 'package:convert_zone/utils/navigator_utils.dart';
import 'package:convert_zone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends ConsumerWidget {
  const AppScaffold({ super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // void openCalculator() {
    //   showModalBottomSheet<void>(
    //     context: context,
    //     isScrollControlled: true,
    //     builder: (BuildContext context) {
    //       return const CalculatorWidget();
    //     },
    //   );
    // }

    void clearAll(bool isDrawerFixed) {
      final int page = pageNumberMap[GoRouterState.of(context)
          .uri
          .toString()
          .substring('/conversions/'.length)]!;
      if (ref
          .read(ConversionsNotifier.provider.notifier)
          .shouldShowSnackbar(page)) {
        ref.read(ConversionsNotifier.provider.notifier).clearAllValues(page);
        //Snackbar undo request
        final SnackBar snackBar = SnackBar(
          content: Text("Undo Clear All Massages"),
          behavior: SnackBarBehavior.floating,
          width: isDrawerFixed ? 400 : null,
          action: SnackBarAction(
            key: const ValueKey('undoClearAll'),
            label: 'Undo',
            onPressed: () {
              ref
                  .read(ConversionsNotifier.provider.notifier)
                  .undoClearOperation();
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    void openSearch() {
      ref.read(PropertiesOrderNotifier.provider).whenData((orderList) async {
        final int? newPage = await showSearch(
          context: context,
          delegate: CustomSearchDelegate(orderList),
        );
        if (newPage != null) {
          final String targetPath =
              '/conversions/${reversePageNumberListMap[newPage]}';
          // ignore: use_build_context_synchronously
          if (GoRouterState.of(context).uri.toString() != targetPath) {
            // ignore: use_build_context_synchronously
            context.go(targetPath);
          }
        }
      });
    }

    return LayoutBuilder(builder: (context, constraints) {
      // ignore: no_leading_underscores_for_local_identifiers
      final bool _isDrawerFixed = isDrawerFixed(constraints.maxWidth);

      AppPage selectedSection = computeSelectedSection(context);

      Widget drawer = CustomDrawer(
        isDrawerFixed: _isDrawerFixed,
        openCalculator: () {},
       // openCalculator: openCalculator,
        openSearch: openSearch,
      );

      final ret = _isDrawerFixed
          ? Scaffold(
              body: SafeArea(
                child: Row(
                  children: <Widget>[
                    drawer,
                    // Expanded(child: child),
                  ],
                ),
              ),
              floatingActionButton: (selectedSection == AppPage.conversions &&
                      MediaQuery.viewInsetsOf(context).bottom == 0)
                  ? FloatingActionButton(
                      key: const ValueKey('clearAll'),
                      onPressed: () => clearAll(_isDrawerFixed),
                      tooltip: 'Clear All',
                      child: const Icon(Icons.clear_outlined),
                    )
                  : null,
            )
          : PopScope(
              canPop: selectedSection == AppPage.conversions,
        onPopInvoked: (didPop) {
          if (selectedSection == AppPage.settings) {
            context.go('/');
          } else if (selectedSection == AppPage.reorder) {
            context.goNamed('settings');
          } else if (selectedSection == AppPage.reorderDetails) {
            // 2 sided page
            if (_isDrawerFixed) {
              context.goNamed('settings');
            } else {
              context.goNamed('reorder-units');
            }
          }
        },
              child: Scaffold(
                drawer: drawer,
               // body: SafeArea(child: child),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endContained,
                bottomNavigationBar: selectedSection == AppPage.conversions
                    ? BottomAppBar(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              tooltip: 'Search',
                              icon: const Icon(Icons.search),
                              onPressed: openSearch,
                            ),
                            IconButton(
                              tooltip: 'Calculator',
                              icon: const Icon(Icons.calculate_outlined),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    : null,
                floatingActionButton: (selectedSection == AppPage.conversions &&
                        MediaQuery.viewInsetsOf(context).bottom == 0)
                    ? FloatingActionButton(
                        key: const ValueKey('clearAll'),
                        onPressed: () => clearAll(_isDrawerFixed),
                        tooltip: 'Clear All',
                        child: const Icon(Icons.clear_outlined),
                      )
                    : null,
              ),
            );

      return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyK):
              const ActivateIntent(),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            ActivateIntent: CallbackAction<ActivateIntent>(
              onInvoke: (ActivateIntent intent) {
                openSearch();
                return null;
              },
            ),
          },
          child: ret,
        ),
      );
    });
  }
}
