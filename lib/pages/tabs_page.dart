import 'package:cuenta_app/pages/estado_page.dart';
import 'package:cuenta_app/pages/tarjeta_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(), //Bloquea deslizamiento
      children: <Widget>[
        EstadoPage(),
        TarjetaPage(),
      ],
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt), label: 'Estados de cuenta'),
        BottomNavigationBarItem(
            icon: Icon(Icons.credit_card), label: 'Tarjeta habiente'),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 350), curve: Curves.easeIn);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
