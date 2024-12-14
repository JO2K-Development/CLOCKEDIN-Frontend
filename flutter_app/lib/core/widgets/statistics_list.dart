import 'package:flutter/material.dart';
import 'package:flutter_app/core/models/StatisticsDict';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsList extends StatelessWidget {
  final List<Widget> _tiles = [];
  StatisticsList(StatisticsDict statisticsDict, {super.key}) {
    statisticsDict.data.forEach((key, value) {
      if (value is Map) {
        _tiles.add(_PlotTile(key, value));
      } else {
        _tiles.add(_SimpleTile(key, value.toString()));
      }
      _tiles.add(Gap(Dimentions.sizeL),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _tiles,
    );
  }
}

class _SimpleTile extends StatelessWidget {
  final String title;
  final String value;
  const _SimpleTile(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: Theme.of(context).textTheme.displayLarge),
          
          Text(title, style: Theme.of(context).textTheme.labelLarge),
          Gap(Dimentions.sizeS),
          MyDivider(indentPercent: 0,),
        ],
      ),
    );
  }
}

class _PlotTile extends StatelessWidget {
  final String title;
  late String label_x;
  late String label_y;
  final List<ChartData> chartData = [];
  _PlotTile(this.title, data, {super.key}) {
    label_x = data["label_x"];
    label_y = data["label_y"];
    data["data"].forEach((key, value) {
      chartData.add(ChartData(key, value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimentions.sizeL),
      child: SfCartesianChart(
        title: ChartTitle(text: title, textStyle: Theme.of(context).textTheme.labelMedium),
        primaryXAxis: CategoryAxis(),
        series: <CartesianSeries<ChartData, String>>[
          LineSeries<ChartData, String>(
            color: Theme.of(context).colorScheme.secondary,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
          )
        ],
      ),
    );
    ;
  }
}

class ChartData {
  ChartData(this.category, value) {
    this.value = value.toDouble();
  }
  final String category;
  late double value;
}
