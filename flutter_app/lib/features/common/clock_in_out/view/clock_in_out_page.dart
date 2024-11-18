import 'package:flutter/material.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/core/utils/constants/access_identifiers.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/my_text_icon_state_button.dart';
import 'package:flutter_app/core/widgets/my_time_picker.dart';
import 'package:flutter_app/core/widgets/my_work_cycles_tile.dart';
import 'package:flutter_app/features/common/clock_in_out/controller/my_time_counter_provider.dart';
import 'package:flutter_app/features/common/clock_in_out/view/my_time_counter.dart';
import 'package:flutter_app/features/common/clock_in_out/controller/clock_in_out_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';

class ClockInOutPage extends StatelessWidget {
  const ClockInOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MyTimeCounterProvider()),
          ChangeNotifierProvider(create: (context) => ClockInOutProvider()),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(Dimentions.sizeXXL),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimentions.sizeXXL * 2.2),
                child: MyBeveledContainer(
                  isBackGPrimary: true,
                  child: Padding(
                    padding: const EdgeInsets.all(Dimentions.sizeXXL * 1.3),
                    child: Image.asset('assets/images/qr-code-for-tile.png'),
                  ),
                ),
              ),
              Gap(Dimentions.sizeXXL * 1.5),
              Text('Twój czas pracy:',
                  style: Theme.of(context).textTheme.titleLarge),
              Gap(Dimentions.sizeL),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimentions.sizeXXL * 1.5),
                child: MyTimeCounter(),
              ),
              Gap(Dimentions.sizeL),
              Builder(
                builder: (context) {
                  return MyTextIconStateButton(
                    initialText: 'Start',
                    otherText: 'Stop',
                    initialIcon: Icons.play_circle_outline,
                    otherIcon: Icons.stop_circle_outlined,
                    onPressed:
                        Provider.of<MyTimeCounterProvider>(context).switchTimer,
                  );
                },
              ),
              Gap(Dimentions.sizeXXL * 3.0),
              MyDivider(),
              Gap(Dimentions.sizeL),
              MyBeveledContainer(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyDynamicList()
              )),
            ],
          ),
        ));
  }
}

class MyDynamicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClockInOutProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.workCycles.length,
          itemBuilder: (context, index) {
            final item = provider.workCycles[index];
            return Column(
              children: [
                Gap(Dimentions.sizeM),
                MyWorkCyclesTile(
                  workCycle: item,
                  isEditable: AccessIdentifiers.hasIntersection(
                      [AccessIdentifiers.admin, AccessIdentifiers.manager],
                      Provider.of<AppInitUserDataProvider>(context, listen: false)
                          .appInitUserData!
                          .accessIdentifiers!),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
