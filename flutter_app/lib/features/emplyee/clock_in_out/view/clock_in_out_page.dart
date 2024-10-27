import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/my_time_counter.dart';
import 'package:flutter_app/features/emplyee/clock_in_out/controller/clock_in_out_provider.dart';
import 'package:provider/provider.dart';

class ClockInOutPage extends StatelessWidget {
  const ClockInOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ClockInOutProvider>(builder:
    (context, clockInOutProvider, child) {
      return Column(
        children: [
          MyTimeCounter(startTime: DateTime.now(),),
          ElevatedButton(
            onPressed: () {
              // Clock in/out logic
            },
            child: Text('Clock in/out'),
          ),
        ],  
      );
    });
  }
}