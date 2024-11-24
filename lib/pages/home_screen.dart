import 'package:convert_zone/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/property_unit_list.dart';
import '../utils/utils.dart';
import 'conversion_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> colors = [
    {"color": "0xFFD1E3FF"},
    {"color": "0xFFFFF0D1"},
    {"color": "0xFFFFD1D1"},
    {"color": "0xFFD1FFF0"},
    {"color": "0xFFD1E3FF"},
    {"color": "0xFFFFF0D1"},
    {"color": "0xFFFFD1D1"},
    {"color": "0xFFD1FFF0"},
    {"color": "0xFFD1E3FF"},
    {"color": "0xFFFFF0D1"},
    {"color": "0xFFFFD1D1"},
    {"color": "0xFFD1FFF0"},
    {"color": "0xFFD1E3FF"},
    {"color": "0xFFFFF0D1"},
    {"color": "0xFFFFD1D1"},
    {"color": "0xFFD1FFF0"},
    {"color": "0xFFD1E3FF"},
    {"color": "0xFFFFF0D1"},
    {"color": "0xFFFFD1D1"},
  ];

  final TextEditingController _searchController = TextEditingController();

  List<PropertyUi> properties = [];
  List<PropertyUi> filteredProperties = [];

  @override
  void initState() {
    super.initState();
    properties = getPropertyUiList(context);
    filteredProperties = List.from(properties);
    _searchController.addListener(_filterProperties);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterProperties);
    _searchController.dispose();
    super.dispose();
  }

  void _filterProperties() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredProperties = List.from(properties);
      } else {
        filteredProperties = properties.where((property) {
          return property.name.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Convert Zone', style: font20BTextStyle),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search here",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columns
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.7, // Adjust height if needed
                ),
                itemCount: filteredProperties.length,
                itemBuilder: (context, index) {
                  final property = filteredProperties[index];
                  final color = Color(int.parse(colors[index]['color']!));
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ConversionPage(index, color);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: color.withOpacity(.4),
                        border: Border.all(color: color, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.5),
                              border: Border.all(color: color, width: 2),
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: SvgPicture.asset(
                              property.imagePath,
                              width: 30,
                              height: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(property.name, style: font16BTextStyle),
                              const SizedBox(height: 4),
                              Text(
                                '${property.unitCount} Units',
                                style: font12TextStyle.copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
