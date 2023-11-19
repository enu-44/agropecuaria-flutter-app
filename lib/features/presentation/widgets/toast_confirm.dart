import 'package:agropecuariosapp/consts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastConfirm {
  static showToastConfirm(FToast toast, {required void Function() onConfirm}) {
    Widget toastWithButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Palette.backgroundColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            child: Text(
              "Esta seguro que desea borrar el registro ?",
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
            ),
            color: Colors.white,
            onPressed: () {
              toast.removeCustomToast();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.check,
            ),
            color: Colors.white,
            onPressed: () {
              toast.removeCustomToast();
              onConfirm();
            },
          )
        ],
      ),
    );
    toast.showToast(
      child: toastWithButton,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 50),
    );
  }
}
