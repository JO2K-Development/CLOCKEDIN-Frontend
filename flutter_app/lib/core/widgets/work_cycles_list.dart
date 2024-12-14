import 'package:flutter/material.dart';
import 'package:flutter_app/core/models/work_cycle.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_work_cycles_tile.dart';
import 'package:provider/provider.dart';

class WorkCyclesList<T> extends StatelessWidget {
  final List<WorkCycle>? workCyclesOver;
  const WorkCyclesList({this.workCyclesOver, super.key});
  // duck typing used for provider generics
  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (context, provider, child) {
      List<WorkCycle> workCycles = workCyclesOver ?? (provider as dynamic).workCycles;
      return SizedBox(
        height: 400,
        child: ListView.builder(
          itemCount: workCycles.length,
          itemBuilder: (context, index) {
            final item = workCycles[index];
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? Dimentions.sizeL : 0, left: Dimentions.sizeS, right: Dimentions.sizeS),
              child: Column(
                children: [
                  // Gap(Dimentions.sizeXS),
                  Padding(
                    padding: const EdgeInsets.all(Dimentions.sizeXS),
                    child: MyWorkCyclesTile(workCycle: item, isEditable: true),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
