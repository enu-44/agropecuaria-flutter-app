import 'package:agropecuariosapp/consts.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final TextStyle titleTextStyle;
  final VoidCallback? onLogoutPressed;
  final bool showBackButton;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.backgroundColor = Palette.backgroundColor,
      this.titleTextStyle =
          const TextStyle(fontSize: 20, color: Palette.kSecondaryColor),
      this.onLogoutPressed,
      this.showBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: titleTextStyle),
      centerTitle: true,
      backgroundColor: backgroundColor,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Palette.kSecondaryColor,
              onPressed: () {
                Navigator.of(context)
                    .pop();
              },
            )
          : null,
      actions: [
        if (onLogoutPressed != null)
          IconButton(
            color: Palette.kSecondaryColor,
            icon: const Icon(Icons.logout),
            onPressed: onLogoutPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
