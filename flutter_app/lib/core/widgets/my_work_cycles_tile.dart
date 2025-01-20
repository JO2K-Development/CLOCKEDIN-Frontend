import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/app_colors.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_time_picker.dart';
import 'package:flutter_app/domain/model_classes/work_cycle.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyWorkCyclesTile<T> extends StatefulWidget {
  final WorkCycleModel workCycle;
  final bool isEditable;
  const MyWorkCyclesTile(
      {super.key, required this.workCycle, this.isEditable = false, required this.viewModel});

  final T viewModel;

  @override
  State<MyWorkCyclesTile> createState() => _MyCyclesTileState();
}

class _MyCyclesTileState extends State<MyWorkCyclesTile> {
  @override
  void initState() {
    super.initState();
  }

  bool isInEdit = false;


  @override
  Widget build(BuildContext context) {
    Widget beveledContainerContent = DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColors.white,
          // fontWeight: FontWeight.bold,
          // fontSize: Dimentions.sizeM
          ),
      child: Padding(
        padding: const EdgeInsets.all(Dimentions.sizeM),
        child: Builder(
          builder: (context) {
            return  isInEdit ? _inEdit() : _notInEdit(widget.isEditable);
          }
        ),
      ),
    );
    return 
       MyBeveledContainer(
          radius: Dimentions.sizeM,
          isBackGPrimary: true,
          child: beveledContainerContent
    );
  }

  Widget _notInEdit(bool isEditable) {
    return Column(
      children: [
        Row(
          children: [
            Text(DateFormat('HH:mm').format(widget.workCycle.startTime)),
            Text(" - "),
            Text(DateFormat('HH:mm').format(widget.workCycle.endTime)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: widget.workCycle.type.icon,
            ),
            Spacer(),            
            if (isEditable) ...[
              GestureDetector(
                child: Icon(Icons.edit_outlined, color: AppColors.white, 
                // size: Dimentions.sizeXL
                ),
                onTap: () {
                  setState(() {
                    isInEdit = !isInEdit;
                  });
                },
              ),
            ],
            
          ],
        ),
        Gap(Dimentions.sizeM),
        Row(
          children: [
            Spacer(),
            // Text(AppLocalizations.of(context).clocked_in_out_cycle_type_office_checked, style: Theme.of(context).textTheme.bodySmall!.copyWith(
            //   color: AppColors.customMaterialColor.shade900
            // ),),
          ],
        ),
      ],
    );
  }
  
  Widget _inEdit() {
    return Column(
                    children: [
                      Gap(Dimentions.sizeM),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeM),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Icon(Icons.cancel_outlined, color: AppColors.white, size: Dimentions.sizeXL,),
                              onTap: () {
                                setState(() {
                                  isInEdit = !isInEdit;
                                });
                              },
                            ),
                            Spacer(),
                            GestureDetector(
                              child: Icon(Icons.delete_outline, color: AppColors.white, size: Dimentions.sizeXL),
                              onTap: () {
                                widget.viewModel.deleteWorkCycle(widget.workCycle.id);
                              },
                            ),
                          ],
                        ),
                      ),
                      Text(AppLocalizations.of(context).clocked_in_out_edit_start_time),
                      MyTimePicker(
                        initialTime: widget.workCycle.startTime,
                        onTimeChanged: (DateTime date) => widget.viewModel.setStartTime(widget.workCycle.id, date),
                      ),
                      Gap(Dimentions.sizeS),
                      Text(AppLocalizations.of(context).clocked_in_out_edit_end_time),
                      MyTimePicker(
                        initialTime: widget.workCycle.endTime,
                        onTimeChanged: (DateTime date) => widget.viewModel.setEndTime(widget.workCycle.id, date),
                      ),
                      //TODO: customise the send widget
                      /*TODO: take care of the bounds of the selectable time: 
                      shouldnt be able to select a time that is before the
                      endTime of previous cycle or after the startTime of 
                      the next cycle or the current cycle if it exists*/
            
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            widget.viewModel.patchWorkCycle();
                            setState(() {
                              isInEdit = !isInEdit;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(Dimentions.sizeM),
                            child: Icon(Icons.check, color: AppColors.white, size: Dimentions.sizeXL),
                          ),
                        ),
                      ),
                    ],
                  );
  }
}

