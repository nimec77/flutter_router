import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_router/app/router/router_cubit.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'First Page',
              style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w900),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<RouterCubit>().secondPage();
              },
              child: const Text('Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
