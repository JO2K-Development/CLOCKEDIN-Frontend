import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/domain/model_classes/k_v_statistic_model/k_v_statistic_model.dart';
import 'package:flutter_app/domain/model_classes/plot_statistic_model/plot_statistic_model.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsList extends StatelessWidget {
  final List<Widget> _tiles = [];
  StatisticsList(StatisticsModel statisticsModel, {super.key}) {
    statisticsModel.statistics.forEach((element) {
      switch (element){
        case KVStatisticModel():
          _tiles.add(_SimpleTile(element.name, element.value.toString()));
        case PlotStatisticModel():
          _tiles.add(_PlotTile(title: element.title, x_label: element.x_axis, y_label: element.y_axis, data: element.data));

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
          
          Text(title, style: Theme.of(context).textTheme.labelMedium),
          Gap(Dimentions.sizeS),
          MyDivider(indentPercent: 0,),
        ],
      ),
    );
  }
}

class _PlotTile extends StatelessWidget {
  final String title;
  final String x_label;
  final String y_label;
  late List<ChartData> chartData = [];

  _PlotTile({super.key, required this.title,required this.x_label,required this.y_label,required Map<String, double> data}){
    data.forEach((k, v) {
      chartData.add(ChartData(k, v));
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
            color: Theme.of(context).colorScheme.primary,
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
