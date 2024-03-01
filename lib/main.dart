import 'package:flutter/material.dart';
import 'package:flutter_with_bloc_z_to_h/topics/flutter_bloc_concepts/my_bloc_provider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      routes: {
        '/': (context) => const MyApp(),
        '/cubit': (context) => const MyBlocProviderParent(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: [
              Colors.purple.shade300,
              Colors.white
            ],
          ),
        ),
        height: size.height,
        width: size.height ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 55,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 16, backgroundColor: Colors.white12),
                onPressed: () => Navigator.pushNamed(context, '/cubit'),
                child:  Text('Go To Cubit', style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 55,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 16, backgroundColor: Colors.white10),
                onPressed: () => Navigator.pushNamed(context, '/cubit'),
                child: Text('Go To Cubit' , style: Theme.of(context).textTheme.titleLarge,),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
