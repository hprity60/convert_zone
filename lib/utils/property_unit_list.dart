import 'package:flutter/cupertino.dart';
import 'package:units_converter/units_converter.dart';
import 'package:convert_zone/utils/utils.dart';
import 'utils_widgets.dart';

/// This will return the list of [PropertyUi], an objext that contains all the data regarding the displaying of the
/// property all over the app. From this List depends also other functions.
List<PropertyUi> getPropertyUiList(BuildContext context) {
  const String basePath = 'assets/property_icons';
 // var l10n = AppLocalizations.of(context)!;
  //The order is important!
  return [
    PropertyUi(PROPERTYX.length, "Length", '$basePath/length.svg', 18),
    PropertyUi(PROPERTYX.area, 'Area', '$basePath/area.svg', 12),
    PropertyUi(PROPERTYX.volume, 'Volume', '$basePath/volume.svg', 18),
    PropertyUi(
        PROPERTYX.currencies, 'Currencies', '$basePath/currencies.svg', 31),
    PropertyUi(PROPERTYX.time, 'Time', '$basePath/time.svg', 15),
    PropertyUi(PROPERTYX.temperature, 'Temperature',
        '$basePath/temperature.svg', 7),
    PropertyUi(PROPERTYX.speed, 'Speed', '$basePath/speed.svg', 6),
    PropertyUi(PROPERTYX.mass, 'Mass', '$basePath/mass.svg', 14),
    PropertyUi(PROPERTYX.force, 'Force', '$basePath/force.svg', 5),
    PropertyUi(PROPERTYX.fuelConsumption, 'Fuel Consumption',
        '$basePath/fuel.svg', 4),
    PropertyUi(PROPERTYX.numeralSystems, 'Numeral System',
        '$basePath/numeral_systems.svg', 4),
    PropertyUi(PROPERTYX.pressure, 'Pressure', '$basePath/pressure.svg', 8),
    PropertyUi(PROPERTYX.energy, 'Energy', '$basePath/energy.svg', 6),
    PropertyUi(PROPERTYX.power, 'Power', '$basePath/power.svg', 7),
    PropertyUi(PROPERTYX.angle, 'Angle', '$basePath/angle.svg', 4),
    PropertyUi(
        PROPERTYX.shoeSize, 'Shoe Size', '$basePath/shoe_size.svg', 10),
    PropertyUi(
        PROPERTYX.digitalData, 'Digital Data', '$basePath/data.svg', 27),
    PropertyUi(
        PROPERTYX.siPrefixes,'SI Prefix', '$basePath/si_prefixes.svg', 21),
    PropertyUi(PROPERTYX.torque, 'Torque', '$basePath/torque.svg', 5)
  ];
}

/// This method will return a map of Property name translated:
/// {PROPERTYX.LENGTH: 'Length', ...}
Map<PROPERTYX, String> getPropertyTranslationMap(BuildContext context) {
  List<PropertyUi> propertyUiList = getPropertyUiList(context);
  Map<PROPERTYX, String> propertyTranslationMap = {};

  for (PropertyUi propertyUi in propertyUiList) {
    propertyTranslationMap.putIfAbsent(
      propertyUi.property,
      () => propertyUi.name,
    );
  }

  return propertyTranslationMap;
}

/// This method will return the list of Property name translated: ['Length',
/// 'Area', 'Volume', ...]
List<String> getPropertyNameList(BuildContext context) {
  return getPropertyTranslationMap(context).values.toList();
}

/// This will return the list of [UnitUi], an objext that contains all the data
/// regarding the displaying of the units all over the app. From this List
/// depends also other functions.
List<UnitUi> getUnitUiList(BuildContext context) {
  const String basePath = 'assets/property_icons';
  // var l10n = AppLocalizations.of(context)!;
  return [
    UnitUi(LENGTH.meters, "Meters", '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.centimeters, 'Centimeters', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.inches, 'Inches', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(
        LENGTH.mils, 'Mils', '$basePath/length.svg', PROPERTYX.length),
    UnitUi(
        LENGTH.feet, 'Feet', '$basePath/length.svg', PROPERTYX.length),
    UnitUi(LENGTH.nauticalMiles, 'NauticalMiles', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(
        LENGTH.yards, 'Yards', '$basePath/length.svg', PROPERTYX.length),
    UnitUi(
        LENGTH.miles, 'Miles', '$basePath/length.svg', PROPERTYX.length),
    UnitUi(LENGTH.millimeters, 'Millimeters', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.micrometers, 'Micrometers', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.nanometers, 'Nanometers', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.angstroms, 'Angstroms', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.picometers, 'Pico Meters', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.kilometers, 'Kilometers', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.astronomicalUnits, 'Astronomical Units',
        '$basePath/length.svg', PROPERTYX.length),
    UnitUi(LENGTH.lightYears, 'Light Years', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.parsec, 'Parsec', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(LENGTH.feetUs, 'Feet (US survey)', '$basePath/length.svg',
        PROPERTYX.length),
    UnitUi(AREA.squareMeters, 'Square Meters', '$basePath/area.svg',
        PROPERTYX.area),
    UnitUi(AREA.squareCentimeters, 'Square Centimeters',
        '$basePath/area.svg', PROPERTYX.area),
    UnitUi(AREA.squareInches, 'Square Inches', '$basePath/area.svg',
        PROPERTYX.area),
    UnitUi(AREA.squareFeet, 'Square Feet', '$basePath/area.svg',
        PROPERTYX.area),
    UnitUi(AREA.squareMiles, 'Square Miles', '$basePath/area.svg',
        PROPERTYX.area),
    UnitUi(AREA.squareYard, 'Square Yard', '$basePath/area.svg',
        PROPERTYX.area),
    UnitUi(AREA.squareMillimeters, 'Square Millimeters',
        '$basePath/area.svg', PROPERTYX.area),
    UnitUi(AREA.squareKilometers, 'Square Kilometers',
        '$basePath/area.svg', PROPERTYX.area),
    UnitUi(
        AREA.hectares, 'Hectares', '$basePath/area.svg', PROPERTYX.area),
    UnitUi(AREA.acres, 'Acres', '$basePath/area.svg', PROPERTYX.area),
    UnitUi(AREA.are, 'Are', '$basePath/area.svg', PROPERTYX.area),
    UnitUi(AREA.squareFeetUs, 'Square Feet (US survey)', '$basePath/area.svg',
        PROPERTYX.area),
    UnitUi(VOLUME.cubicMeters, 'Cubic Meters', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.liters, 'Liters', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.imperialGallons, 'Imperial gallons',
        '$basePath/volume.svg', PROPERTYX.volume),
    UnitUi(VOLUME.usGallons, 'US Gallons', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.imperialPints, 'Imperial Pints', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.usPints, 'Us Pints', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.milliliters, 'Milliliters', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.tablespoonsUs, 'Tablespoon Us', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.australianTablespoons, 'Tablespoon Australian',
        '$basePath/volume.svg', PROPERTYX.volume),
    UnitUi(
        VOLUME.cups, 'Cups', '$basePath/volume.svg', PROPERTYX.volume),
    UnitUi(VOLUME.cubicCentimeters, 'Cubic Centimeters',
        '$basePath/volume.svg', PROPERTYX.volume),
    UnitUi(VOLUME.cubicFeet, 'Cubic Feet', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.cubicInches, 'Cubic Inches', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.cubicMillimeters, 'Cubic Millimeters',
        '$basePath/volume.svg', PROPERTYX.volume),
    UnitUi(VOLUME.usFluidOunces, 'US Fluid Ounces', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.imperialFluidOunces, 'Imperial Fluid Ounces',
        '$basePath/volume.svg', PROPERTYX.volume),
    UnitUi(VOLUME.usGill, 'US Gill', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(VOLUME.imperialGill, 'Imperial Gill', '$basePath/volume.svg',
        PROPERTYX.volume),
    UnitUi(
        'EUR', 'Euro', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'CAD',' l10n.cad', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'HKD', 'l10n.hkd', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'PHP', 'l10n.php', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'DKK', 'l10n.dkk', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'NZD', 'l10n.nzd', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'CNY', 'l10n.cny', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'AUD', 'l10n.aud', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'RON', 'l10n.ron', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'SEK', 'l10n.sek', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'IDR', 'l10n.idr', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'INR', 'l10n.inr', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'BRL', 'l10n.brl', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'USD', 'l10n.usd', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'ILS', 'l10n.ils', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'JPY', 'l10n.jpy', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'THB', 'l10n.thb', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'CHF', 'l10n.chf', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'CZK', 'l10n.czk', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'MYR', 'l10n.myr', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'TRY', 'l10n.trY', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'MXN', 'l10n.mxn', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'NOK', 'l10n.nok', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'HUF', 'l10n.huf', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'ZAR', 'l10n.zar', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'SGD', 'l10n.sgd', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'GBP', 'l10n.gbp', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'KRW', 'l10n.krw', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'PLN', 'l10n.pln', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'BGN', 'l10n.bgn', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        'ISK', 'l10n.isk', '$basePath/currencies.svg', PROPERTYX.currencies),
    UnitUi(
        TIME.seconds, 'Seconds', '$basePath/time.svg', PROPERTYX.time),
    UnitUi(TIME.deciseconds, 'Deciseconds', '$basePath/time.svg',
        PROPERTYX.time),
    UnitUi(TIME.centiseconds, 'Centiseconds', '$basePath/time.svg',
        PROPERTYX.time),
    UnitUi(TIME.milliseconds, 'Milliseconds', '$basePath/time.svg',
        PROPERTYX.time),
    UnitUi(TIME.microseconds, 'Microseconds', '$basePath/time.svg',
        PROPERTYX.time),
    UnitUi(TIME.nanoseconds, 'Nanoseconds', '$basePath/time.svg',
        PROPERTYX.time),
    UnitUi(
        TIME.minutes, 'Minutes', '$basePath/time.svg', PROPERTYX.time),
    UnitUi(TIME.hours, 'Hours', '$basePath/time.svg', PROPERTYX.time),
    UnitUi(TIME.days, 'Days', '$basePath/time.svg', PROPERTYX.time),
    UnitUi(TIME.weeks, 'Weeks', '$basePath/time.svg', PROPERTYX.time),
    UnitUi(TIME.years365, 'Years', '$basePath/time.svg', PROPERTYX.time),
    UnitUi(
        TIME.lustrum, 'Lustrum', '$basePath/time.svg', PROPERTYX.time),
    UnitUi(
        TIME.decades, 'Decades', '$basePath/time.svg', PROPERTYX.time),
    UnitUi(TIME.centuries, 'Centuries', '$basePath/time.svg',
        PROPERTYX.time),
    UnitUi(TIME.millennium, 'Millennium', '$basePath/time.svg',
        PROPERTYX.time),
    UnitUi(TEMPERATURE.fahrenheit, 'Fahrenheit',
        '$basePath/temperature.svg', PROPERTYX.temperature),
    UnitUi(TEMPERATURE.celsius, 'Celsius', '$basePath/temperature.svg',
        PROPERTYX.temperature),
    UnitUi(TEMPERATURE.kelvin, 'Kelvin', '$basePath/temperature.svg',
        PROPERTYX.temperature),
    UnitUi(TEMPERATURE.reamur, 'Reamur', '$basePath/temperature.svg',
        PROPERTYX.temperature),
    UnitUi(TEMPERATURE.romer, 'Romer', '$basePath/temperature.svg',
        PROPERTYX.temperature),
    UnitUi(TEMPERATURE.delisle, 'Delisle', '$basePath/temperature.svg',
        PROPERTYX.temperature),
    UnitUi(TEMPERATURE.rankine, 'Rankine', '$basePath/temperature.svg',
        PROPERTYX.temperature),
    UnitUi(SPEED.metersPerSecond, 'Meters Second', '$basePath/speed.svg',
        PROPERTYX.speed),
    UnitUi(SPEED.kilometersPerHour, 'Kilometers Per Hour',
        '$basePath/speed.svg', PROPERTYX.speed),
    UnitUi(SPEED.milesPerHour, 'Miles Hour', '$basePath/speed.svg',
        PROPERTYX.speed),
    UnitUi(SPEED.knots, 'Knots', '$basePath/speed.svg', PROPERTYX.speed),
    UnitUi(SPEED.feetsPerSecond, 'Feet Second', '$basePath/speed.svg',
        PROPERTYX.speed),
    UnitUi(SPEED.minutesPerKilometer, 'Minutes Per Kilometer',
        '$basePath/speed.svg', PROPERTYX.speed),
    UnitUi(MASS.grams, 'Grams', '$basePath/mass.svg', PROPERTYX.mass),
    UnitUi(MASS.ettograms, 'Ettograms', '$basePath/mass.svg',
        PROPERTYX.mass),
    UnitUi(MASS.kilograms, 'Kilograms', '$basePath/mass.svg',
        PROPERTYX.mass),
    UnitUi(MASS.pounds, 'Pounds', '$basePath/mass.svg', PROPERTYX.mass),
    UnitUi(MASS.ounces, 'Ounces', '$basePath/mass.svg', PROPERTYX.mass),
    UnitUi(
        MASS.quintals, 'Quintals', '$basePath/mass.svg', PROPERTYX.mass),
    UnitUi(MASS.tons, 'Tons', '$basePath/mass.svg', PROPERTYX.mass),
    UnitUi(MASS.milligrams, 'Milligrams', '$basePath/mass.svg',
        PROPERTYX.mass),
    UnitUi(MASS.uma, 'Uma', '$basePath/mass.svg', PROPERTYX.mass),
    UnitUi(MASS.carats, 'Carats', '$basePath/mass.svg', PROPERTYX.mass),
    UnitUi(MASS.centigrams, 'Centigrams', '$basePath/mass.svg',
        PROPERTYX.mass),
    UnitUi(MASS.pennyweights, 'Pennyweights', '$basePath/mass.svg',
        PROPERTYX.mass),
    UnitUi(MASS.troyOunces, 'Troy Ounces', '$basePath/mass.svg',
        PROPERTYX.mass),
    UnitUi(MASS.stones, 'Stones', '$basePath/mass.svg', PROPERTYX.mass),
    UnitUi(
        FORCE.newton, 'Newton', '$basePath/force.svg', PROPERTYX.force),
    UnitUi(FORCE.dyne, 'Dyne', '$basePath/force.svg', PROPERTYX.force),
    UnitUi(FORCE.poundForce, 'Pound Force', '$basePath/force.svg',
        PROPERTYX.force),
    UnitUi(FORCE.kilogramForce, 'Kilogram Force', '$basePath/force.svg',
        PROPERTYX.force),
    UnitUi(FORCE.poundal, 'Poundal', '$basePath/force.svg',
        PROPERTYX.force),
    UnitUi(FUEL_CONSUMPTION.kilometersPerLiter, 'Kilometers Liter',
        '$basePath/fuel.svg', PROPERTYX.fuelConsumption),
    UnitUi(FUEL_CONSUMPTION.litersPer100km, 'Liters Per 100km',
        '$basePath/fuel.svg', PROPERTYX.fuelConsumption),
    UnitUi(FUEL_CONSUMPTION.milesPerUsGallon, 'Miles Us Gallon',
        '$basePath/fuel.svg', PROPERTYX.fuelConsumption),
    UnitUi(FUEL_CONSUMPTION.milesPerImperialGallon, "Miles Imperial Gallon",
        '$basePath/fuel.svg', PROPERTYX.fuelConsumption),
    UnitUi(NUMERAL_SYSTEMS.decimal, 'Decimal',
        '$basePath/numeral_systems.svg', PROPERTYX.numeralSystems),
    UnitUi(NUMERAL_SYSTEMS.hexadecimal, 'Hexadecimal',
        '$basePath/numeral_systems.svg', PROPERTYX.numeralSystems),
    UnitUi(NUMERAL_SYSTEMS.octal, 'Octal',
        '$basePath/numeral_systems.svg', PROPERTYX.numeralSystems),
    UnitUi(NUMERAL_SYSTEMS.binary, 'Binary',
        '$basePath/numeral_systems.svg', PROPERTYX.numeralSystems),
    UnitUi(PRESSURE.pascal, 'Pascal', '$basePath/pressure.svg',
        PROPERTYX.pressure),
    UnitUi(PRESSURE.atmosphere, 'Atmosphere', '$basePath/pressure.svg',
        PROPERTYX.pressure),
    UnitUi(PRESSURE.bar, 'Bar', '$basePath/pressure.svg',
        PROPERTYX.pressure),
    UnitUi(PRESSURE.millibar, 'Millibar', '$basePath/pressure.svg',
        PROPERTYX.pressure),
    UnitUi(PRESSURE.psi, "PSI", '$basePath/pressure.svg',
        PROPERTYX.pressure),
    UnitUi(PRESSURE.torr, 'Torr', '$basePath/pressure.svg',
        PROPERTYX.pressure),
    UnitUi(PRESSURE.inchOfMercury, 'Inches Of Mercury',
        '$basePath/pressure.svg', PROPERTYX.pressure),
    UnitUi(PRESSURE.hectoPascal, 'Hecto Pascal', '$basePath/pressure.svg',
        PROPERTYX.pressure),
    UnitUi(ENERGY.joules, 'Joule', '$basePath/energy.svg',
        PROPERTYX.energy),
    UnitUi(ENERGY.calories, 'Calories', '$basePath/energy.svg',
        PROPERTYX.energy),
    UnitUi(ENERGY.kilowattHours, 'Kilowatt Hour', '$basePath/energy.svg',
        PROPERTYX.energy),
    UnitUi(ENERGY.electronvolts, 'Electronvolt', '$basePath/energy.svg',
        PROPERTYX.energy),
    UnitUi(ENERGY.energyFootPound, 'Foot Pound', '$basePath/energy.svg',
        PROPERTYX.energy),
    UnitUi(ENERGY.kilocalories, 'Kilocalories', '$basePath/energy.svg',
        PROPERTYX.energy),
    UnitUi(POWER.watt, 'Watt', '$basePath/power.svg', PROPERTYX.power),
    UnitUi(POWER.milliwatt, 'Milliwatt', '$basePath/power.svg',
        PROPERTYX.power),
    UnitUi(POWER.kilowatt, 'Kilowatt', '$basePath/power.svg',
        PROPERTYX.power),
    UnitUi(POWER.megawatt, 'Megawatt', '$basePath/power.svg',
        PROPERTYX.power),
    UnitUi(POWER.gigawatt, 'Gigawatt', '$basePath/power.svg',
        PROPERTYX.power),
    UnitUi(POWER.europeanHorsePower, 'European Horse Power',
        '$basePath/power.svg', PROPERTYX.power),
    UnitUi(POWER.imperialHorsePower, 'Imperial Horse Power',
        '$basePath/power.svg', PROPERTYX.power),
    UnitUi(
        ANGLE.degree, 'Degree', '$basePath/angle.svg', PROPERTYX.angle),
    UnitUi(ANGLE.minutes, 'Minutes Degree', '$basePath/angle.svg',
        PROPERTYX.angle),
    UnitUi(ANGLE.seconds, 'Seconds Degree', '$basePath/angle.svg',
        PROPERTYX.angle),
    UnitUi(ANGLE.radians, 'Radians Degree', '$basePath/angle.svg',
        PROPERTYX.angle),
    UnitUi(SHOE_SIZE.centimeters, 'Centimeters',
        '$basePath/shoe_size.svg', PROPERTYX.shoeSize),
    UnitUi(SHOE_SIZE.inches, 'Inches', '$basePath/shoe_size.svg',
        PROPERTYX.shoeSize),
    UnitUi(SHOE_SIZE.euChina, 'EuChina', '$basePath/shoe_size.svg',
        PROPERTYX.shoeSize),
    UnitUi(SHOE_SIZE.ukIndiaChild, 'UK India Child',
        '$basePath/shoe_size.svg', PROPERTYX.shoeSize),
    UnitUi(SHOE_SIZE.ukIndiaMan, 'l10n.ukIndiaMan', '$basePath/shoe_size.svg',
        PROPERTYX.shoeSize),
    UnitUi(SHOE_SIZE.ukIndiaWoman, 'l10n.ukIndiaWoman',
        '$basePath/shoe_size.svg', PROPERTYX.shoeSize),
    UnitUi(SHOE_SIZE.usaCanadaChild, 'l10n.usaCanadaChild',
        '$basePath/shoe_size.svg', PROPERTYX.shoeSize),
    UnitUi(SHOE_SIZE.usaCanadaMan, 'l10n.usaCanadaMan',
        '$basePath/shoe_size.svg', PROPERTYX.shoeSize),
    UnitUi(SHOE_SIZE.usaCanadaWoman, 'l10n.usaCanadaWoman',
        '$basePath/shoe_size.svg', PROPERTYX.shoeSize),
    UnitUi(SHOE_SIZE.japan, 'l10n.japan', '$basePath/shoe_size.svg',
        PROPERTYX.shoeSize),
    UnitUi(DIGITAL_DATA.bit, 'Bit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.nibble, 'Nibble', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.kilobit, 'Kilobit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.megabit, 'Megabit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.gigabit, 'Gigabit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.terabit, 'Terabit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.petabit, 'Petabit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.exabit, 'Exabit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.kibibit, 'Kibibit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.mebibit, 'Mebibit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.gibibit, 'Gibibit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.tebibit, 'Tebibit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.pebibit, 'Pebibit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.exbibit, 'Exbibit', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.byte, 'Byte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.kilobyte, 'Kilobyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.megabyte, 'Megabyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.gigabyte, 'Gigabyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.terabyte, 'Terabyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.petabyte, 'Petabyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.exabyte, 'Exabyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.kibibyte, 'Kibibyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.mebibyte, 'Mebibyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.gibibyte, 'Gibibyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.tebibyte, 'Tebibyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.pebibyte, 'Pebibyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(DIGITAL_DATA.exbibyte, 'Exbibyte', '$basePath/data.svg',
        PROPERTYX.digitalData),
    UnitUi(SI_PREFIXES.base, 'Base', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.deca, 'Deca', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.hecto, 'Hecto', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.kilo, 'Kilo', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.mega, 'Mega', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.giga, 'Giga', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.tera, 'Tera', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.peta, 'Peta', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.exa, 'Exa', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.zetta, 'Zetta', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.yotta, 'Yotta', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.deci, 'Deci', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.centi, 'Centi', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.milli, 'Milli', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.micro, 'Micro', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.nano, 'Nano', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.pico, 'Pico', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.femto, 'Femto', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.atto, 'Atto', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.zepto, 'Zepto', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(SI_PREFIXES.yocto, 'Yocto', '$basePath/si_prefixes.svg',
        PROPERTYX.siPrefixes),
    UnitUi(TORQUE.newtonMeter, 'Newton Meter', '$basePath/torque.svg',
        PROPERTYX.torque),
    UnitUi(TORQUE.dyneMeter, 'Dyne Meter', '$basePath/torque.svg',
        PROPERTYX.torque),
    UnitUi(TORQUE.poundForceFeet, 'Pound Force Feet',
        '$basePath/torque.svg', PROPERTYX.torque),
    UnitUi(TORQUE.kilogramForceMeter, 'Kilogram Force Meter',
        '$basePath/torque.svg', PROPERTYX.torque),
    UnitUi(TORQUE.poundalMeter, 'Poundal Meter', '$basePath/torque.svg',
        PROPERTYX.torque)
  ];
}

/// This method will return a map of Unit name translated: {LENGTH.meters: 'Meters', ...}
Map<dynamic, String> getUnitTranslationMap(BuildContext context) {
  List<UnitUi> unitUiList = getUnitUiList(context);

  Map<dynamic, String> unitTranslationMap = {};

  for (UnitUi unitUi in unitUiList) {
    unitTranslationMap.putIfAbsent(unitUi.unit, () => unitUi.name);
  }

  return unitTranslationMap;
}

/// This method will return a List of [SearchUnit], needed in order to display the tiles in the search
List<SearchUnit> getSearchUnitsList(Function onTap, BuildContext context) {
  List<SearchUnit> searchUnitsList = [];
  List<UnitUi> unitUiList = getUnitUiList(context);
  List<PropertyUi> propertyUiList = getPropertyUiList(context);

  int propertyNumber = 0;
  PROPERTYX previousProperty = PROPERTYX.length;

  // Add units in searhc
  for (UnitUi unitUi in unitUiList) {
    if (previousProperty != unitUi.property) {
      propertyNumber++;
      previousProperty = unitUi.property;
    }
    int currentNumber = propertyNumber;
    searchUnitsList.add(SearchUnit(
      iconAsset: unitUi.imagePath,
      unitName: unitUi.name,
      onTap: () {
        onTap(currentNumber);
      },
    ));
  }

  // Add properties in search
  propertyNumber = 0;
  for (PropertyUi properrtyUi in propertyUiList) {
    int currentNumber = propertyNumber;
    searchUnitsList.add(SearchUnit(
      iconAsset: properrtyUi.imagePath,
      unitName: properrtyUi.name,
      onTap: () {
        onTap(currentNumber);
      },
    ));
    propertyNumber++;
  }

  return searchUnitsList;
}

/// This method will return a List of [SearchGridTile], needed in order to display the gridtiles in the search
List<SearchGridTile> initializeGridSearch(
    Function onTap, BuildContext context, bool darkMode, List<int> orderList) {
  List<PropertyUi> propertyUiList = getPropertyUiList(context);
  final int propertyCount = propertyUiList.length;
  List<SearchGridTile> searchGridTileList = List.filled(
    propertyCount,
    SearchGridTile(
      iconAsset: 'assets/app_icons/logo.svg',
      darkMode: darkMode,
      footer: 'None',
      onTap: () {},
    ),
  );

  for (int i = 0; i < propertyCount; i++) {
    PropertyUi propertyUi = propertyUiList[i];
    searchGridTileList[orderList[i]] = SearchGridTile(
      iconAsset: propertyUi.imagePath,
      footer: propertyUi.name,
      onTap: () {
        onTap(i);
      },
      darkMode: darkMode,
    );
  }

  return searchGridTileList;
}
