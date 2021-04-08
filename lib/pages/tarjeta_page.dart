import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:credit_card_slider/card_background.dart';
import 'package:credit_card_slider/card_network_type.dart';
import 'package:credit_card_slider/validity.dart';

class TarjetaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjeta habiente'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(7, 17, 154, 1.0),
        backwardsCompatibility: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CreditCard(
                cardNumber: '1111 1111 1111 1111',
                roundedCornerRadius: 10,
                cardBackground: SolidColorCardBackground(Colors.black),
                cardNetworkType: CardNetworkType.visaBasic,
                cardHolderName: 'Nombre del usuario',
                validity: Validity(validThruMonth: 12, validThruYear: 24),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'Nombre del cliente',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dirección',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '525 55 555 55',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
