import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/colors.dart';

class CustomProfileFeatures extends StatelessWidget {
  final Widget firstIcon;
  final Text text;
  final Widget? lastIcon;
  final VoidCallback? onPressed;
  final bool? isSwitched;
  final Function(bool)? onToggle;

  const CustomProfileFeatures({
    required this.firstIcon,
    required this.text,
    this.lastIcon,
    this.onPressed,
    this.isSwitched,
    this.onToggle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: firstIcon,
      title: text,
      trailing: isSwitched != null && onToggle != null
          ? Switch(
        value: isSwitched!,
        onChanged: onToggle!,
      )
          : lastIcon,
    );
  }
}

