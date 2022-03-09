import 'package:flutter/material.dart';

/// tipo de animaciones
enum AnimationType {
  normal,
  fadeIn
}

/// Main class [context] es el BuildContext en ese momento de
/// [child] es el widget a navegar, [animation] es el tipo de animacion
class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  RouteTransitions({
    required this.context, 
    required this.child, 
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
    this.replacement = false
    }) {
      switch (this.animation) {
        case AnimationType.normal:
          this._normalTransition();
          break;
        case AnimationType.fadeIn:
        this._fadeInTransition();
          break;
        default:
      }
    }

  /// push normal
  void _pushPage(Route route) => Navigator.push(context, route);

  /// push replacement
  void _pushReplacementPage(Route route) => Navigator.pushReplacement(context, route);

  /// animacion normal
  void _normalTransition() {
    final route = MaterialPageRoute(builder: (BuildContext context) => this.child);
    (this.replacement) 
    ? this._pushReplacementPage(route)
    : this._pushPage(route);
  } 

  /// controlador de la transicion con fadein
  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            child: child,
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut)
            ),
          );
        }
      );
      
      (this.replacement) 
      ? this._pushReplacementPage(route)
      : this._pushPage(route);
  }
}

