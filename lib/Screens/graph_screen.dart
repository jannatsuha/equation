import 'package:flutter/material.dart';
import 'package:sumaiya/utills/all_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _graphData {
  _graphData(this.x, this.y);

  final double x;
  final double y;
}
class GraphScreen extends StatefulWidget {
double m;
double c;
   GraphScreen({Key? key,
   required this.m,
   required this.c
   }) : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}
late double newM;
late double newC;
AllColor allColor=AllColor();
class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    List<_graphData> data = [
      _graphData(-3, calculateY(widget.m, widget.c,-3)),
      _graphData(-2, calculateY(widget.m, widget.c,-2)),
      _graphData(-1, calculateY(widget.m, widget.c,-1)),
      _graphData(0, calculateY(widget.m, widget.c,0)),
      _graphData(1, calculateY(widget.m, widget.c,1)),
      _graphData(2, calculateY(widget.m, widget.c,2)),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: allColor.appBarColor,
        title: Text("Graph View"),
      ),
      body:
      SfCartesianChart(

          primaryXAxis:NumericAxis(
            interval: 1,
            //desiredIntervals: 1,
            minorTicksPerInterval: 1,
              crossesAt: 0,
              maximum: 15
          ),
          primaryYAxis:NumericAxis(
            //desiredIntervals: 1,
            interval: 1,
            maximum: 15,
            minorTicksPerInterval: 1,
            crossesAt: 0,
          ),
         // legend: Legend(isVisible: true),
          //     // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_graphData, double>>[
            LineSeries<_graphData, double>(
                dataSource: data,
                xValueMapper: (_graphData dataVal, _) => dataVal.x,
                yValueMapper: (_graphData dataVal, _) => dataVal.y,
                // name: 'Sales',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]
      ),
    );
  }
}

calculateY(m,c,x){
  return m*x+c;
}