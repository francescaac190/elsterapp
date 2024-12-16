import 'package:elsterapp/helpers/widgets.dart';
import 'package:elsterapp/index.dart';
import 'package:elsterapp/widgets/appbar.dart';
import 'package:flutter/material.dart';

class RangePage extends StatefulWidget {
  const RangePage({super.key});

  @override
  State<RangePage> createState() => _RangePageState();
}

class _RangePageState extends State<RangePage> {
  double _priceValue = 2; // Valores: 1 = $, 2 = $$, 3 = $$$
  double _ageValue = 21; // Valores: 15, 21, 30+
  double _distanceValue = 5; // Valores en kilómetros
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
            Text(
              'Rango de precio',
              style: medium(negro, 20),
            ),
            Slider(
              value: _priceValue,
              min: 1,
              max: 3,
              divisions: 2,
              label: _getPriceLabel(_priceValue),
              activeColor: amarillo,
              onChanged: (value) {
                setState(() {
                  _priceValue = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("\$", style: TextStyle(fontSize: 14)),
                Text("\$\$", style: TextStyle(fontSize: 14)),
                Text("\$\$\$", style: TextStyle(fontSize: 14)),
              ],
            ),
            addVerticalSpace(24),
            Text(
              'Rango de edad',
              style: medium(negro, 20),
            ),
            Slider(
              value: _ageValue,
              min: 15,
              max: 30,
              divisions: 2,
              activeColor: amarillo,
              label: _getAgeLabel(_ageValue),
              onChanged: (value) {
                setState(() {
                  _ageValue = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("-15", style: TextStyle(fontSize: 14)),
                Text("18+", style: TextStyle(fontSize: 14)),
                Text("30+", style: TextStyle(fontSize: 14)),
              ],
            ),
            addVerticalSpace(24),
            Text(
              'Rango de distancia',
              style: medium(negro, 20),
            ),
            Slider(
              value: _distanceValue,
              min: 1,
              max: 10,
              divisions: 2,
              activeColor: amarillo,
              label: _getDistanceLabel(_distanceValue),
              onChanged: (value) {
                setState(() {
                  _distanceValue = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("1 km", style: TextStyle(fontSize: 14)),
                Text("5 km", style: TextStyle(fontSize: 14)),
                Text("10 km", style: TextStyle(fontSize: 14)),
              ],
            ),
            addVerticalSpace(24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/categorias');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: amarillo,
                  minimumSize: Size(double.infinity, 50)),
              child: Text(
                'BUSCAR',
                style: medium(negro, 22),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getPriceLabel(double value) {
    if (value == 1) return "\$";
    if (value == 2) return "\$\$";
    return "\$\$\$";
  }

  String _getAgeLabel(double value) {
    if (value == 15) return "-15";
    if (value == 21) return "18+";
    return "30+";
  }

  String _getDistanceLabel(double value) {
    if (value == 1) return "1 km";
    if (value == 5) return "5 km";
    return "10 km";
  }
}
