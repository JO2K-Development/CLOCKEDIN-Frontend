import 'package:flutter/material.dart';

class MyTimePicker extends StatefulWidget {
  final DateTime initialTime;
  final Function(DateTime) onTimeChanged;

  MyTimePicker(
      {required this.initialTime,
      required this.onTimeChanged});

  @override
  _MyTimePickerState createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  late TextEditingController _hourController;
  late TextEditingController _minuteController;
  late TextEditingController _secondController;

  @override
  void initState() {
    super.initState();
    _hourController = TextEditingController(
        text: widget.initialTime.hour.toString().padLeft(2, '0'));
    _minuteController = TextEditingController(
        text: widget.initialTime.minute.toString().padLeft(2, '0'));
    _secondController = TextEditingController(
        text: widget.initialTime.second.toString().padLeft(2, '0'));
  }

  void _updateTime() {
    final hours = int.parse(_hourController.text);
    final minutes = int.parse(_minuteController.text);
    final seconds = int.parse(_secondController.text);
    widget.onTimeChanged(
        DateTime(widget.initialTime.year, widget.initialTime.month,
            widget.initialTime.day, hours, minutes, seconds));
  }

  Widget _buildTimeField(TextEditingController controller, int max) {
    return SizedBox(
      width: 60,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 2,
        decoration: InputDecoration(
          counterText: '',
        ),
        onChanged: (value) {
          if (int.tryParse(value) != null && int.parse(value) > max) {
            controller.text = max.toString().padLeft(2, '0');
          }
          _updateTime();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimeField(_hourController, 23),
        const Text(':'),
        _buildTimeField(_minuteController, 59),
        const Text(':'),
        _buildTimeField(_secondController, 59),
      ],
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _secondController.dispose();
    super.dispose();
  }
}
