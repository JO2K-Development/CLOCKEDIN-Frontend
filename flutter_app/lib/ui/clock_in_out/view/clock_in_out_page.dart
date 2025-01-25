import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/my_error.dart';
import 'package:flutter_app/core/widgets/my_text_icon_state_button.dart';
import 'package:flutter_app/core/widgets/work_cycles_scrollable_list.dart';
import 'package:flutter_app/ui/clock_in_out/view/my_time_counter.dart';
import 'package:flutter_app/ui/clock_in_out/view_model/clock_in_out_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClockInOutPage extends StatelessWidget {
  const ClockInOutPage({super.key, required this.viewModel});
  
  final ClockInOutProvider viewModel;
  
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel.load,
      builder: (context, child) {
      if (viewModel.load.running) {
        return Center(child: CircularProgressIndicator());
      }

      if (viewModel.load.error) {
        return ErrorMessage(title: AppLocalizations.of(context).calendar_errorTitle);
      }
    
      return SingleChildScrollView(
        child: Column(
          children: [
            Gap(Dimentions.sizeXXL),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL * 2.2),
              child: MyBeveledContainer(
                isBackGPrimary: true,
                child: Padding(
                  padding: const EdgeInsets.all(Dimentions.sizeXXL * 1.3),
                  child: Image.asset('assets/images/qr-code-for-tile.png'),
                ),
              ),
            ),
            Gap(Dimentions.sizeXXL * 1.5),
            Text(AppLocalizations.of(context).clocked_in_out_time_label, style: Theme.of(context).textTheme.titleLarge),
            Gap(Dimentions.sizeL),
            ListenableBuilder(
              listenable: viewModel.elapsedSeconds,
              builder: (context, child) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL * 1.5),
                      child: MyTimeCounter(viewModel.elapsedSeconds.value),
                    ),
                  ],
                );
              },
            ),
            Gap(Dimentions.sizeL),
            MyTextIconStateButton(
              initialText: AppLocalizations.of(context).clocked_in_out_button_off,
              otherText: AppLocalizations.of(context).clocked_in_out_button_on,
              initialIcon: Icons.play_circle_outline,
              otherIcon: Icons.stop_circle_outlined,
              onPressed: viewModel.switchTimer,
            ),
              
          
            Gap(Dimentions.sizeXXL * 3.0),
            MyDivider(),
            Gap(Dimentions.sizeS),
            Padding(
              padding: const EdgeInsets.all(Dimentions.sizeM),
              child: MyBeveledContainer(child: WorkCyclesScrollableList<ClockInOutProvider>(workCycles: viewModel.workCycles!, viewModel: viewModel,)),
            ),
          ],
        ),
      );
    });
  }
}


