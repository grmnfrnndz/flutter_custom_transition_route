import 'package:flutter/material.dart';
import 'package:custom_route_transition_gdevops/custom_route_transition_gdevops.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (BuildContext context) => PaginaUnoPage(),
        'pagina2': (BuildContext context) => PaginaDosPage(),
      },

    );
  }
}


class PaginaUnoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('pagina 1')),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          child: Text('Go to page 2'),
          color: Colors.white,
          onPressed: () {
            RouteTransitions(
              context: context, 
              child: PaginaDosPage(),
              animation: AnimationType.fadeIn,
              duration: Duration(seconds: 2),
              replacement: true
              );
          },
        )
     ),
   );
  }
}


class PaginaDosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('pagina 2')),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.cyanAccent,
      body: Center(
        child: Text('Hola Mundo'),
     ),
   );
  }
}