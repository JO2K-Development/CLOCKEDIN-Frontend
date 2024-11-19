import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/my_text_icon_state_button.dart';
import 'package:flutter_app/core/widgets/my_work_cycles_tile.dart';
import 'package:flutter_app/features/common/clock_in_out/controller/my_time_counter_provider.dart';
import 'package:flutter_app/features/common/clock_in_out/view/my_time_counter.dart';
import 'package:flutter_app/features/common/clock_in_out/controller/clock_in_out_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClockInOutPage extends StatelessWidget {
  const ClockInOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyTimeCounterProvider()),
        ChangeNotifierProvider(create: (context) => ClockInOutProvider()),
      ],
      child: Consumer<ClockInOutProvider>(builder: (context, provider, child) {
        // Directly use the `isLoading` flag from the provider to show loading state
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        // Once loading is done, show the actual content
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL * 1.5),
                child: MyTimeCounter(),
              ),
              Gap(Dimentions.sizeL),
              Builder(
                builder: (context) {
                  return MyTextIconStateButton(
                    initialText: AppLocalizations.of(context).clocked_in_out_button_off,
                    otherText: AppLocalizations.of(context).clocked_in_out_button_on,
                    initialIcon: Icons.play_circle_outline,
                    otherIcon: Icons.stop_circle_outlined,
                    onPressed: Provider.of<MyTimeCounterProvider>(context).switchTimer,
                  );
                },
              ),
              Gap(Dimentions.sizeXXL * 3.0),
              MyDivider(),
              Gap(Dimentions.sizeS),
              Padding(
                padding: const EdgeInsets.all(Dimentions.sizeM),
                child: MyBeveledContainer(child: MyDynamicList()),
              ),
            ],
          ),
        );
      }),
    );
  }
}


class MyDynamicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClockInOutProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(Dimentions.sizeS),
        child: SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: provider.workCycles.length,
            itemBuilder: (context, index) {
              final item = provider.workCycles[index];
              return Column(
                children: [
                  // Gap(Dimentions.sizeXS),
                  Padding(
                    padding: const EdgeInsets.all(Dimentions.sizeXS),
                    child: MyWorkCyclesTile(workCycle: item, isEditable: true),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}
