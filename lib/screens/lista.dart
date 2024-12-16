import 'dart:convert';

import 'package:elsterapp/helpers/widgets.dart';
import 'package:elsterapp/index.dart';
import 'package:elsterapp/model/eventos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListEventos extends StatefulWidget {
  const ListEventos({super.key});

  @override
  State<ListEventos> createState() => _ListEventosState();
}

class _ListEventosState extends State<ListEventos> {
  Future<List<Dato>> _loadEvents(BuildContext context) async {
    try {
      // Obtener la categoría desde el ModalRoute
      final String? categoria =
          ModalRoute.of(context)?.settings.arguments as String?;

      if (categoria == null) {
        print('La categoría no fue proporcionada.');
        return [];
      }

      final String jsonString =
          await rootBundle.loadString('lib/database/events.json');
      final jsonData = json.decode(jsonString);

      final eventos = GetEvento.fromJson(jsonData);

      return (eventos.datos ?? []).where((evento) {
        return evento.nombreCategoria?.toLowerCase() == categoria.toLowerCase();
      }).toList();
    } catch (e) {
      print('Error al cargar eventos: $e');
      return [];
    }
  }

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
            FutureBuilder<List<Dato>>(
              future: _loadEvents(
                  context), // Llama a la función para cargar los eventos
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Mostrar un indicador de carga
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Mostrar un mensaje de error
                  return const Center(
                      child: Text('Error al cargar los eventos'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  // Mostrar la lista de eventos si hay datos
                  final eventos = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: eventos.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          categoriaswidget(
                            eventos[index].imagenUrl ?? '',
                            eventos[index].nombre ?? 'Sin nombre',
                            '\$\$', // Precio de ejemplo, puedes cambiarlo
                          ),
                          Divider(
                            height: 24,
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Mostrar un mensaje si no hay eventos
                  return const Center(
                      child: Text('No se encontraron eventos.'));
                }
              },
            ),
            Divider(
              height: 24,
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
            child: Image.network(
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
              addVerticalSpace(4),
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
        ],
      ),
    );
  }
}
