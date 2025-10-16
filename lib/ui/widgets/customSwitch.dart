import 'package:flutter/material.dart';
import 'package:laza_shopping/utils/appColor.dart';

class CustomSwitch extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool isSwitch;

  @override
  void initState() {
    super.initState();
    isSwitch = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
        ),
        Transform.scale(
          scaleX: 1,
          scaleY: 0.9,
          child: Switch(

            activeThumbColor: Colors.white,
            activeTrackColor: AppColor.SwitchColor,
            // Replace with AppColor.SwitchColor if needed
            value: isSwitch,
            onChanged: (bool newValue) {
              setState(() {
                isSwitch = newValue;
              });
              widget.onChanged(newValue); // Call the callback
            },
          ),
        ),
      ],
    );
  }
}
