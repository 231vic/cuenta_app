import 'package:cuenta_app/bloc/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _CrearFondo(size: size),
          _loginForm(context, size),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context, Size size) {
    final bloc = LoginProvider.of(context);
    final labelStyle = TextStyle(fontSize: 12.0);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 170.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            margin: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Text('Ingreso', style: TextStyle(fontSize: 15.0)),
                SizedBox(height: 10.0),
                _crearEmail(bloc, labelStyle),
                SizedBox(height: 5.0),
                _crearPassword(bloc, labelStyle),
                SizedBox(height: 5.0),
                _crearSubmit(bloc, context),
                SizedBox(height: 5.0),
                _crearButtons(),
                TextButton(
                  child: Text('Crear nueva cuenta'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearSubmit(LoginBloc bloc, BuildContext context) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ElevatedButton(
            onPressed: snapshot.hasData ? () => _login(context) : null,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Iniciar sesión'),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              primary: Color.fromRGBO(7, 17, 154, 1.0),
              elevation: 0.0,
              textStyle: TextStyle(color: Colors.white),
            ),
          );
        });
  }

  Widget _crearButtons() {
    return Container(
      child: Column(
        children: [
          SignInButton(
            Buttons.Google,
            onPressed: () {},
          ),
          SignInButton(
            Buttons.FacebookNew,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _login(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _crearEmail(LoginBloc bloc, TextStyle labelStyle) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email_outlined,
                  color: Colors.blueAccent),
              hintText: 'ejemplo@correo.com',
              labelText: 'Escriba su correo electrónico',
              labelStyle: labelStyle,
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc, TextStyle labelStyle) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.blueAccent),
                labelText: 'Escriba su contraseña',
                labelStyle: labelStyle,
                counterText: snapshot.data,
                errorStyle: TextStyle(fontSize: 10.0),
                errorText: snapshot.error,
              ),
              onChanged: bloc.changePassword,
            ),
          );
        });
  }
}

class _CrearFondo extends StatelessWidget {
  final Size size;
  const _CrearFondo({
    Key key,
    @required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fondo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(1, 18, 253, 1.0),
            Colors.blue[900],
            Color.fromRGBO(7, 17, 154, 1.0),
          ],
        ),
      ),
    );
    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(7, 17, 154, 0.35),
      ),
    );
    return Stack(
      children: <Widget>[
        fondo,
        Positioned(child: circle, top: 90.0, left: 30.0),
        Positioned(child: circle, top: -40.0, right: -30.0),
        Positioned(child: circle, bottom: 120.0, right: -10.0),
        Positioned(child: circle, bottom: -50.0, left: -20.0),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Icon(
                Icons.person_pin_circle_outlined,
                color: Colors.white,
                size: 80.0,
              ),
              SizedBox(
                height: 5.0,
                width: double.infinity,
              ),
              Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
