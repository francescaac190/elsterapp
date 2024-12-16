import 'package:elsterapp/index.dart';
import 'package:flutter/material.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  const AppBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: azul,
      title: Text(
        'ELSTER',
        style: bold(blanco, 25),
      ),
    );
  }

  // Define el tamaño preferido del AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarr1 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarr1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: blanco),
      backgroundColor: azul,
      title: Text(
        'ELSTER',
        style: bold(blanco, 25),
      ),
    );
  }

  // Define el tamaño preferido del AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
