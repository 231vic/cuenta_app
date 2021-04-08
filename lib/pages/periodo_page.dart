import 'package:flutter/material.dart';

import 'package:cuenta_app/provider/mes_provider.dart';
import 'package:provider/provider.dart';

class PeriodoEstado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final monthService = Provider.of<MesService>(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            Text(
              'Periodo',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                '${monthService.selectedMonth}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.blueAccent),
            Text(
              'Establecimiento',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                'Nombre del establecimiento',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.blueAccent),
            Text(
              'Importe de Cargo',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                '\$100.0',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.blueAccent),
            Text(
              'Importe de Abono',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                '\$100.0',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.blueAccent),
            Text(
              'Saldo Previo',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                '\$100.0',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.blueAccent),
            Text(
              'Saldo Actual',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                '\$100.0',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
