import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_router/app/pages/first_page.dart';
import 'package:flutter_router/app/pages/second_page.dart';
import 'package:flutter_router/app/router/router_cubit.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RouterCubit, RouterState>(
      listener: (context, state) {
        state.maybeWhen(
          secondPage: () => _navigatorKey.currentState!.pushNamedAndRemoveUntil('/second', (route) => false),
          orElse: () => _navigatorKey.currentState!.pushNamedAndRemoveUntil('/', (route) => false),
        );
      },
      child: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (settings) {
          debugPrint(settings.toString());

          if (settings.name == '/second') {
            return PageRouteBuilder<void>(
                pageBuilder: (context, animation, secondaryAnimation) => const SecondPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1, 0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                });
          }

          return PageRouteBuilder<void>(
              pageBuilder: (context, animation, secondaryAnimation) => const FirstPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1, 0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
        },
      ),
    );
  }
}
