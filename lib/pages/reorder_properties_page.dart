import 'package:convert_zone/models/order.dart';
import 'package:convert_zone/utils/reorder_page.dart';
import 'package:convert_zone/pages/splash_screen.dart';
import 'package:convert_zone/utils/property_unit_list.dart';
import 'package:convert_zone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReorderPropertiesPage extends ConsumerWidget {
  const ReorderPropertiesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read the order of the properties in the drawer
    List<int>? conversionsOrderDrawer =
        ref.watch(PropertiesOrderNotifier.provider).valueOrNull;

    if (conversionsOrderDrawer == null) {
      return const SplashScreen();
    }
    List<String> propertyNameList = getPropertyNameList(context);
    List<String> orderedDrawerList =
        List.filled(conversionsOrderDrawer.length, '');
    for (int i = 0; i < conversionsOrderDrawer.length; i++) {
      orderedDrawerList[conversionsOrderDrawer[i]] = propertyNameList[i];
    }

    return ReorderPage(
      title: 'Reorder properties',
      itemsList: orderedDrawerList,
      onSave: (List<int>? orderList) {
        if (orderList != null) {
          // Save the order
          ref.read(PropertiesOrderNotifier.provider.notifier).set(orderList);
          // Update the quick actions
          List<PropertyUi> propertyUiList = getPropertyUiList(context);
          initializeQuickAction(
            conversionsOrderDrawer: orderList,
            propertyUiList: propertyUiList,
            onActionSelection: (String shortcutType) {
              final int index = int.parse(shortcutType);
              context.go('/conversions/${reversePageNumberListMap[index]}');
            },
          );
        }
        context.pop();
      },
    );
  }
}
