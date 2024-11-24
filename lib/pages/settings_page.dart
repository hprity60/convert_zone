import 'dart:io';
import 'package:convert_zone/models/currencies.dart';
import 'package:convert_zone/models/settings.dart';
import 'package:convert_zone/pages/home_screen.dart';
import 'package:convert_zone/styles/consts.dart';
import 'package:convert_zone/utils/palette.dart';
import 'package:convert_zone/utils/utils_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:convert_zone/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../styles/text_styles.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static const List<int> significantFiguresList = [6, 8, 10, 12, 14];
  static const TextStyle textStyle = TextStyle(fontSize: singlePageTextSize);
  static const BorderRadiusGeometry borderRadius =
      BorderRadius.all(Radius.circular(30));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapTheme = {
      ThemeMode.system: (
        title: 'System',
        icon: Icons.brightness_auto_outlined
      ),
      ThemeMode.dark: (
        title: 'Dark',
        icon: Icons.dark_mode_outlined
      ),
      ThemeMode.light: (
        title: 'Light',
        icon: Icons.light_mode_outlined
      ),
    };

    updateNavBarColor(Theme.of(context).colorScheme);

    final themeColor = ref.watch(ThemeColorNotifier.provider).valueOrNull!;
    final iconColor = getIconColor(Theme.of(context));
    final titlesStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
            color: switch (Theme.of(context).brightness) {
          Brightness.light => Theme.of(context).primaryColor,
          Brightness.dark => HSLColor.fromColor(Theme.of(context).primaryColor)
              .withLightness(0.7)
              .toColor()
        });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                          'assets/app_icons/logo.svg',
                              height: 30, width: 50,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Convert Zone', style: font16BTextStyle),
                          Text('All Your Measurement Needs in One Place!', style: font12BTextStyle.copyWith(color: Colors.black54),),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            // SegmentedButtonListTile(
            //   leading: Container(
            //       padding: EdgeInsets.all(8),
            //       decoration: BoxDecoration(
            //         color: Color(0xFF8C5E02).withOpacity(.2), borderRadius: BorderRadius.circular(55),
            //       ),
            //       child: Icon(Icons.contrast, color: Color(0xFF8C5E02))),
            //   title: 'Theme',
            //   items: mapTheme.values.toList(),
            //   value:
            //   mapTheme[ref.watch(CurrentThemeMode.provider).valueOrNull ?? 0]!
            //       .title,
            //   onChanged: (String? string) => ref
            //       .read(CurrentThemeMode.provider.notifier)
            //       .set(mapTheme.keys
            //       .where((key) => mapTheme[key]?.title == string)
            //       .single),
            //   textStyle: textStyle,
            // ),
            // ListTile(
            //   title: Text('Theme Color'),
            //   leading: Container(
            //       padding: EdgeInsets.all(8),
            //       decoration: BoxDecoration(
            //         color: Color(0xFF5702A6).withOpacity(.2), borderRadius: BorderRadius.circular(55),
            //       ),
            //       child: Icon(Icons.palette_outlined, color: Color(0xFF5702A6))),
            //   shape: const RoundedRectangleBorder(borderRadius: borderRadius),
            //   trailing: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 18),
            //     child: Container(
            //       width: 24,
            //       height: 24,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(24 / 2),
            //         color: themeColor.useDeviceColor
            //             ? ref.watch(deviceAccentColorProvider)!
            //             : themeColor.colorTheme,
            //       ),
            //     ),
            //   ),
            //   onTap: () => showDialog(
            //     context: context,
            //     builder: (context) => const ColorPickerDialog(),
            //   ),
            // ),
            ListTile(
              trailing: IconButton(onPressed: () { }, icon: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20)),
              leading: Container(
                padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0xFFD238FD).withOpacity(.2), borderRadius: BorderRadius.circular(55),
                  ),
                  child: Icon(Icons.build, color: Color(0xFFD238FD),)),
              title: Text('Tools'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return HomeScreen();
                }));
                print('Tools tapped');
              },
            ),
            ListTile(
              trailing: IconButton(onPressed: () { }, icon: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20)),
              leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F403).withOpacity(.2), borderRadius: BorderRadius.circular(55),
                  ),
                  child: Icon(Icons.star, color: Color(0xFFD0CC03),)),
              title: Text('Rate Us'),
              onTap: () {
                // Handle Rate Us action
                print('Rate Us tapped');
              },
            ),
            ListTile(
              trailing: IconButton(onPressed: () { }, icon: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20)),
              leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF4E3DFF).withOpacity(.2), borderRadius: BorderRadius.circular(55),
                  ),
                  child: Icon(Icons.share, color: Color(0xFFFF4E3DFF),)),
              title: Text('Share'),
              onTap: () {
                // Handle Share action
                print('Share tapped');
              },
            ),
            ListTile(
              trailing: IconButton(onPressed: () { }, icon: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20)),
              leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF4E3D).withOpacity(.2), borderRadius: BorderRadius.circular(55),
                  ),
                  child: Icon(Icons.privacy_tip, color: Color(0xFFFF4E3D))),
              title: Text('Privacy Policy'),
              onTap: () {
                // Handle Privacy Policy action
                print('Privacy Policy tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPickerDialog extends ConsumerWidget {
  const ColorPickerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColor = ref.watch(ThemeColorNotifier.provider).valueOrNull!;
    final deviceAccentColor = ref.watch(deviceAccentColorProvider);

    return AlertDialog(
      title: Text('Theme Color'),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (deviceAccentColor != null) ...[
              SwitchListTile(
                value: themeColor.useDeviceColor,
                onChanged: (val) {
                  ref
                      .read(ThemeColorNotifier.provider.notifier)
                      .setDefaultTheme(val);
                },
                title: Text('Use Device Color'),
              ),
              const SizedBox(height: 8),
            ],
            Text(
              !themeColor.useDeviceColor
                  ? 'Pick Color'
                  : '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Center(
              child: Palette(
                initial: themeColor.colorTheme,
                enabled: !themeColor.useDeviceColor,
                onSelected: (color) => ref
                    .read(ThemeColorNotifier.provider.notifier)
                    .setColorTheme(color),
              ),
            )
          ],
        ),
      ),
    );
  }
}
