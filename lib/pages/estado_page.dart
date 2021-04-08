import 'package:cuenta_app/pages/periodo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:cuenta_app/provider/mes_provider.dart';

class EstadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final monthService = Provider.of<MesService>(context);
    final meses = [
      'Periodo Actual',
      'Periodo 1',
      'Periodo 2',
      'Periodo 3',
      'Periodo 4',
      'Periodo 5',
      'Periodo 6'
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Estado de cuenta'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(7, 17, 154, 1.0),
          backwardsCompatibility: false,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: Column(
          children: [
            _ListarMeses(meses: meses),
            if (!monthService.isLoading) Expanded(child: PeriodoEstado()),
            if (monthService.isLoading)
              Expanded(
                  child: Center(
                child: Text(
                  'Escoja un periodo',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
                ),
              ))
          ],
        ));
  }
}

class _ListarMeses extends StatelessWidget {
  final List<String> meses;
  const _ListarMeses({
    Key key,
    @required this.meses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: meses.length,
        itemBuilder: (BuildContext context, int index) {
          final monthService = Provider.of<MesService>(context);
          final cMes = meses[index];
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                _MesButton(mes: meses[index]),
                SizedBox(height: 5.0),
                Text(
                  '${cMes[0].toUpperCase()}${cMes.substring(1)}',
                  style: TextStyle(
                    color: (meses[index] == monthService.selectedMonth)
                        ? Color.fromRGBO(7, 17, 154, 1.0)
                        : Colors.blueGrey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MesButton extends StatelessWidget {
  final String mes;
  const _MesButton({
    Key key,
    this.mes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final monthService = Provider.of<MesService>(context);
    return InkWell(
      onTap: () {
        final monthService = Provider.of<MesService>(context, listen: false);
        monthService.selectedMonth = mes;
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (monthService.selectedMonth == mes)
              ? Color.fromRGBO(7, 17, 154, 1.0)
              : Colors.white,
        ),
        child: Icon(Icons.calendar_today,
            color: (monthService.selectedMonth == mes)
                ? Colors.white
                : Colors.blueGrey),
      ),
    );
  }
}
