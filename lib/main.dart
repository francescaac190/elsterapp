import 'dart:convert';

import 'package:elsterapp/helpers/widgets.dart';
import 'package:elsterapp/index.dart';
import 'package:elsterapp/model/eventos.dart';
import 'package:elsterapp/screens/categorias.dart';
import 'package:elsterapp/screens/evento_detalle.dart';
import 'package:elsterapp/screens/lista.dart';
import 'package:elsterapp/screens/range.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1.0),
          ),
        );
      },
      title: 'Elster',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/eventodetalle': (BuildContext context) => const EventoDetalle(),
        '/range': (BuildContext context) => const RangePage(),
        '/categorias': (BuildContext context) => const Categoriaspage(),
        '/lista': (BuildContext context) => const ListEventos(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dato> _eventos = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    try {
      final String jsonString =
          await rootBundle.loadString('lib/database/events.json');

      final jsonData = json.decode(jsonString);
      final eventos = GetEvento.fromJson(jsonData);

      setState(() {
        _eventos = eventos.datos ?? [];
      });
    } catch (e) {
      print('Error al cargar eventos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            addVerticalSpace(8),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/range');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: amarillo,
                  minimumSize: Size(double.infinity, 50)),
              child: Text(
                'BUSCAR',
                style: medium(negro, 22),
              ),
            ),
            addVerticalSpace(8),
            Text(
              'Categorias',
              style: semibold(negro, 25),
            ),
            addVerticalSpace(8),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                _categoriawidget('assets/restaurant.png', 'Restaurantes'),
                _categoriawidget('assets/disco club.png', 'Club/Bar'),
                _categoriawidget('assets/arcade.png', 'Arcade'),
                _categoriawidget('assets/cine.png', 'Cinema'),
                _categoriawidget('assets/themepark.png', 'Theme Park'),
                _categoriawidget('assets/mall.png', 'Mall'),
              ],
            ),
            addVerticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tambien para ti...',
                  style: semibold(negro, 20),
                ),
                Text(
                  'Ver más',
                  style: regular(grisOscuro, 18),
                ),
              ],
            ),
            addVerticalSpace(8),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final evento = _eventos[index];

                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/eventodetalle',
                          arguments: evento);
                    },
                    contentPadding: EdgeInsets.all(4),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        evento.imagenUrl!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      evento.nombre!,
                      style: medium(negro, 18),
                    ),
                    subtitle: Text(
                      evento.nombreCategoria!,
                      style: regular(negro, 18),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: grisOscuro,
                      size: 20,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Column _categoriawidget(String imagen, String nombre) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagen,
            height: 100,
            width: 100,
          ),
        ),
        Text(
          nombre,
          style: regular(negro, 16),
        )
      ],
    );
  }
}
