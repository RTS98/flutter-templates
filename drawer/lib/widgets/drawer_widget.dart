import 'package:drawer/widgets/name_widget.dart';
import 'package:drawer/progress_avatar_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  final VoidCallback closeDrawer;
  const DrawerWidget({required this.closeDrawer, Key? key }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> 
  with SingleTickerProviderStateMixin {

  var drawerItemName = <String>["Templates", "Categorise", "Analytics", "Settings"];
  var drawerItemIcon = <IconData>[
    Icons.assignment_outlined,
    Icons.grid_view_outlined,
    Icons.analytics_outlined,
    Icons.settings
  ];
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 120.0),
                const ProgressAvatarWidget(),
                const SizedBox(height: 30.0),
                const NameWidget(name: "Joy"),
                const SizedBox(height: 5.0),
                const NameWidget(name: "Mithcell"),
                const SizedBox(height: 20.0),
                ...List.generate(
                  drawerItemName.length,
                  (index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 1.0,
                    iconColor: Colors.white.withOpacity(0.2),
                    leading: Icon(drawerItemIcon[index]),
                    title: Text(
                      drawerItemName[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(show: false),
                      lineBarsData: <LineChartBarData>[
                        LineChartBarData(
                          color: Colors.blue,
                          isCurved: true,
                          barWidth: 2,
                          spots: const <FlSpot>[
                            FlSpot(0, 1),
                            FlSpot(1, 3),
                            FlSpot(2, 1),
                            FlSpot(3, 2),
                            FlSpot(4, 1),
                            FlSpot(5, 4),
                            FlSpot(6, 2),
                            FlSpot(7, 1),
                            FlSpot(8, 2),
                            FlSpot(9, 4),
                            FlSpot(10, 5),
                            FlSpot(11, 3.5),
                          ],
                          dotData: FlDotData(show: false)
                        ),
                      ],
                      minX: 0,
                      maxX: 11,
                      maxY: 6,
                      minY: 0,
                      gridData:
                        FlGridData(drawHorizontalLine: false, show: false),
                      titlesData: FlTitlesData(show: false),
                    ),
                    swapAnimationDuration: const Duration(milliseconds: 1000),
                    swapAnimationCurve: Curves.bounceInOut
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Good",
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: 10.0
                  ),
                ),
                const Text(
                  "Consistency",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 40.0,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 100.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
              color: Colors.transparent,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                size: 20.0,
              ),
              onPressed: widget.closeDrawer,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 200.0)
        ],
      ),
    );
  }
}