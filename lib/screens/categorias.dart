import 'package:elsterapp/helpers/widgets.dart';
import 'package:elsterapp/index.dart';
import 'package:elsterapp/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Categoriaspage extends StatefulWidget {
  const Categoriaspage({super.key});

  @override
  State<Categoriaspage> createState() => _CategoriaspageState();
}

class _CategoriaspageState extends State<Categoriaspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr1(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: gris,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: negro,
                  ),
                  Text(
                    'SANTA CRUZ, BOLIVIA',
                    style: medium(negro, 20),
                  ),
                ],
              ),
            ),
            addVerticalSpace(16),
            categoriaswidget(
              'assets/restaurant.png',
              'Restaurantes',
              '100 cerca de ti',
            ),
            Divider(
              height: 24,
            ),
            categoriaswidget(
              'assets/disco club.png',
              'Club',
              '20 cerca de ti',
            ),
            Divider(
              height: 24,
            ),
            categoriaswidget(
              'assets/arcade.png',
              'Arcade',
              '3 cerca de ti',
            ),
            Divider(
              height: 24,
            ),
            categoriaswidget(
              'assets/cine.png',
              'Cinema',
              '2 cerca de ti',
            ),
            Divider(
              height: 24,
            ),
            categoriaswidget(
              'assets/themepark.png',
              'Parque',
              '10 cerca de ti',
            ),
            Divider(
              height: 24,
            ),
            categoriaswidget(
              'assets/mall.png',
              'Mall',
              '20 cerca de ti',
            ),
          ],
        ),
      ),
    );
  }

  Widget categoriaswidget(String imagen, String nombre, String subtitulo) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/lista', arguments: nombre);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              imagen,
              height: 80,
              width: 80,
            ),
          ),
          addHorizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: medium(negro, 20),
              ),
              addVerticalSpace(4),
              Text(
                subtitulo,
                style: regular(grisOscuro, 18),
              ),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.arrow_forward_ios,
              color: grisOscuro,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
