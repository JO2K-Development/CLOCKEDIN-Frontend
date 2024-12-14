import 'package:flutter/material.dart';
import 'package:flutter_app/core/models/work_cycle.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_work_cycles_tile.dart';
import 'package:provider/provider.dart';

class WorkCyclesScrollableList<T> extends StatelessWidget {
  final List<WorkCycle>? workCyclesOverwrite;
  final bool scrollable;
  final bool isTopGap;
  const WorkCyclesScrollableList({this.workCyclesOverwrite, super.key, this.scrollable=true, this.isTopGap=true});
  // duck typing used for provider generics
  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (context, provider, child) {
      List<WorkCycle> workCycles = workCyclesOverwrite ?? (provider as dynamic).workCycles;
      return scrollable ? SizedBox(
        height: 400,
        child: ListView.builder(
          itemCount: workCycles.length,
          itemBuilder: (context, index) => _itemBuildersMethod(context, index, workCycles)
      ))
      : Column(
        children: List.generate(
          workCycles.length,
          (index) => _itemBuildersMethod(context, index, workCycles),
        ),
      );
    });
  }
  
  _itemBuildersMethod(context, index, workCycles) {
            final item = workCycles[index];
            return Padding(
              padding: EdgeInsets.only(top: index == 0 && isTopGap ? Dimentions.sizeL : 0, left: Dimentions.sizeS, right: Dimentions.sizeS),
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
          }
        
  
}
