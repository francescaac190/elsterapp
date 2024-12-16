import 'package:elsterapp/helpers/widgets.dart';
import 'package:elsterapp/index.dart';
import 'package:elsterapp/model/eventos.dart';
import 'package:elsterapp/widgets/appbar.dart';
import 'package:flutter/material.dart';

class EventoDetalle extends StatefulWidget {
  const EventoDetalle({super.key});

  @override
  State<EventoDetalle> createState() => _EventoDetalleState();
}

class _EventoDetalleState extends State<EventoDetalle> {
  @override
  Widget build(BuildContext context) {
    final evento = ModalRoute.of(context)!.settings.arguments as Dato;

    return Scaffold(
      appBar: AppBarr1(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              evento.imagenUrl!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        evento.nombre!,
                        style: bold(negro, 25),
                      ),
                      Text(
                        '\$\$\$',
                        style: bold(negro, 25),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: gris,
                      ),
                    ],
                  ),
                  addVerticalSpace(24),
                  Text(
                    'Ubicación',
                    style: medium(negro, 20),
                  ),
                  Text(
                    evento.ubicacion!,
                    style: regular(negro, 18),
                  ),
                  addVerticalSpace(24),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: regular(negro, 18),
                  ),
                  addVerticalSpace(16),
                  ElevatedButton(
                    onPressed: () {
                      print('contactar');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: amarillo,
                        minimumSize: Size(double.infinity, 50)),
                    child: Text(
                      'CONTACTAR',
                      style: semibold(blanco, 22),
                    ),
                  ),
                  addVerticalSpace(24),
                  Text(
                    'Opiniones',
                    style: medium(negro, 20),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(4),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/Rectangle 35.png',
                            // height: 50,
                            // width: 50,
                          ),
                        ),
                        title: Text(
                          'Maria',
                          style: medium(negro, 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Espectacular!',
                              style: regular(negro, 18),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: gris,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      ListTile(
                        contentPadding: EdgeInsets.all(4),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/Rectangle 36.png',
                            // height: 50,
                            // width: 50,
                          ),
                        ),
                        title: Text(
                          'Sonia',
                          style: medium(negro, 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Me encanta!',
                              style: regular(negro, 18),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: gris,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
