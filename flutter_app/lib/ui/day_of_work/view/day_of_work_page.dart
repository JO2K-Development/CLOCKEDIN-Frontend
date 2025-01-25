import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/my_error.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/section_title.dart';
import 'package:flutter_app/core/widgets/statistics_list.dart';
import 'package:flutter_app/core/widgets/work_cycles_scrollable_list.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';
import 'package:flutter_app/ui/calendar/view_model/calendar_provider.dart';
import 'package:flutter_app/ui/day_of_work/view_model/day_of_work_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class DayOfWorkPage extends StatelessWidget {

  const DayOfWorkPage({
    super.key, 
    required this.viewModel
  });

  final DayOfWorkProvider viewModel;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: MyAppBar(
            // title: DateFormat("EEE yyyy-MM-dd",Localizations.localeOf(context).toString()).format(DateTime.now()),
          ),
          body: 
          
           ListenableBuilder(
      listenable: viewModel.load,
      builder: (context, child) {
        if (viewModel.load.running) {
          return Center(child: CircularProgressIndicator());
        }
        if (viewModel.load.error) {
          return ErrorMessage(title: AppLocalizations.of(context).calendar_errorTitle);
        }
          
        return SingleChildScrollView(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  Gap(Dimentions.sizeM),
                  Text(DateFormat("EEE yyyy-MM-dd",Localizations.localeOf(context).toString()).format(DateTime.now()), style: Theme.of(context).textTheme.titleMedium,),
                  MyDivider(),
                  Padding(
                    padding: const EdgeInsets.all(Dimentions.sizeXS),
                    child: WorkCyclesScrollableList<DayOfWorkProvider>(workCycles: viewModel.workCycles!, scrollable: false, isTopGap: false, viewModel: viewModel),
                  ),
                  SectionTitle(AppLocalizations.of(context).calendar_statistics),
                  StatisticsList(viewModel.statisticsModel!),
                ],
              ),
            ),
          );
      })
        );
  }
}