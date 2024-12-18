import 'package:convert_zone/helpers/responsive_helper.dart';
import 'package:convert_zone/models/conversions.dart';
import 'package:convert_zone/models/currencies.dart';
import 'package:convert_zone/models/properties_list.dart';
import 'package:convert_zone/utils/utils_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:convert_zone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:convert_zone/utils/property_unit_list.dart';
import 'package:intl/intl.dart';

class ConversionPage extends ConsumerWidget {
  final Color color;
  final int page;

  const ConversionPage(this.page, this.color, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<dynamic, String> unitTranslationMap = getUnitTranslationMap(context);
    Map<PROPERTYX, String> propertyTranslationMap =
        getPropertyTranslationMap(context);

    List<List<UnitData>>? unitsList =
        ref.watch(ConversionsNotifier.provider).valueOrNull;
    // if we remove the following check, if you enter the site directly to
    // '/conversions/:property' an error will occur
    if (unitsList == null) {
      return const SplashScreenWidget();
    }

    List<UnitData> unitDataList = unitsList[page];

    PROPERTYX currentProperty =
        ref.read(propertiesListProvider).valueOrNull?[page].name;

    Widget? subtitleWidget;
    if (currentProperty == PROPERTYX.currencies) {
      Currencies? currencies =
          ref.watch(CurrenciesNotifier.provider).valueOrNull;
      if (currencies == null) {
        subtitleWidget = const SizedBox(
          height: 30,
          child: Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else {
        subtitleWidget = Text(
          _getLastUpdateString(context, currencies.lastUpdate),
          style: Theme.of(context).textTheme.titleSmall,
        );
      }
    }

    List<Widget> gridTiles = [];

    for (UnitData unitData in unitDataList) {
      gridTiles.add(UnitWidget(
        fillColor: color,
        tffKey: unitData.unit.name.toString(),
        unitName: unitTranslationMap[unitData.unit.name]!,
        unitSymbol: unitData.unit.symbol,
        keyboardType: unitData.textInputType,
        controller: unitData.tec,
        validator: (String? input) {
          if (input != null) {
            if (input != '' && !unitData.getValidator().hasMatch(input)) {
              return 'Invalid Characters';
            }
          }
          return null;
        },
        onChanged: (String txt) {
          if (txt.contains(',')) {
            txt = txt.replaceAll(',', '.');
            unitData.tec.text = txt;
          }
          if (txt.startsWith('.')) {
            txt = '0$txt';
            unitData.tec.text = txt;
          }
          if (txt == '' || unitData.getValidator().hasMatch(txt)) {
            var conversions = ref.read(ConversionsNotifier.provider.notifier);
            //just numeral system uses a string for conversion
            if (unitData.property == PROPERTYX.numeralSystems) {
              conversions.convert(unitData, txt == "" ? null : txt, page);
            } else {
              conversions.convert(
                unitData,
                txt == "" ? null : double.parse(txt),
                page,
              );
            }
          }
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(propertyTranslationMap[currentProperty]!),
        backgroundColor: color.withOpacity(.5),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
        final int numCols = responsiveNumCols(constraint.maxWidth);
        return CustomScrollView(slivers: <Widget>[
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverGrid.count(
            crossAxisCount: numCols,
            childAspectRatio: responsiveChildAspectRatio(
              constraint.maxWidth,
              numCols,
            ),
            children: gridTiles,
          ),
          // SliverAppBar.large(
          //   title: Text(propertyTranslationMap[currentProperty]!),
          // ),
          // if (subtitleWidget != null)
          //   SliverToBoxAdapter(
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 15),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [subtitleWidget],
          //       ),
          //     ),
          //   ),
          // SliverPadding(
          //   padding: EdgeInsets.only(
          //     top: 10,
          //     bottom: isDrawerFixed(MediaQuery.sizeOf(context).width)
          //         ? 55 // So FAB doesn't overlap the card
          //         : 0,
          //   ),
          //   sliver: SliverGrid.count(
          //     crossAxisCount: numCols,
          //     childAspectRatio: responsiveChildAspectRatio(
          //       constraint.maxWidth,
          //       numCols,
          //     ),
          //     children: gridTiles,
          //   ),
          // ),
        ]);
      }),
    );
  }
}

String _getLastUpdateString(BuildContext context, String lastUpdate) {
  DateTime lastUpdateCurrencies = DateTime.parse(lastUpdate);
  DateTime dateNow = DateTime.now();
  if (lastUpdateCurrencies.day == dateNow.day &&
      lastUpdateCurrencies.month == dateNow.month &&
      lastUpdateCurrencies.year == dateNow.year) {
    return 'Last Currencies Update Today';
  }
  return 'Last Currencies Update' +
      DateFormat.yMd(Localizations.localeOf(context).languageCode)
          .format(lastUpdateCurrencies);
}
