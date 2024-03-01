import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_bloc_z_to_h/topics/flutter_bloc_concepts/cubit/counter_cubit.dart';

class MyBlocProviderParent extends StatelessWidget {
  const MyBlocProviderParent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const MyBlocProvider(),
    );
  }
}

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    double elevation = 10;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Counter Cubit')),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.greenAccent, Colors.white],
          ),
        ),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterInitial>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (state.counterValue < 0)
                      Text(
                        'This number is Negative',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    else
                      Text(
                        'This number is Not Negative',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    Material(
                      elevation: elevation,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomCenter,
                            colors: [Colors.greenAccent, Colors.white],
                          ),
                        ),
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Text(
                            '${state.counterValue}',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  tooltip: 'Increment',
                  elevation: elevation,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 28,
                ),
                FloatingActionButton(
                  tooltip: 'Decrement',
                  elevation: elevation,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: elevation, backgroundColor: Colors.greenAccent),
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).increaseTen();
              },
              icon: Icon(
                Icons.add_circle,
                color: Colors.green.shade900,
              ),
              label: Text(
                'Increase  by 10',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: elevation, backgroundColor: Colors.white70),
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decreaseTen();
              },
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red.shade800,
              ),
              label: Text(
                'Decrease by 10',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
