import 'package:agropecuariosapp/consts.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
    required this.state
  }) : super(key: key);
  final String? text;
  final Function? press;
  final bool state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: state ? Colors.white : Colors.black,
          backgroundColor: state ? Palette.backgroundColor : Palette.kSecondaryColor,
        ),
        onPressed: state ? press as void Function()? : null,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}