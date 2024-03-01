import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_bloc_z_to_h/topics/route_management/constants/enums.dart';
import 'package:flutter_with_bloc_z_to_h/topics/route_management/cubit/counter_cubit.dart';
import 'package:flutter_with_bloc_z_to_h/topics/route_management/cubit/internet_cubit.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
  listener: (context, state) {
    if(state is InternetConnected && state.connectionType == ConnectionType.Wifi){
      context.read<CounterCubitNew>().increment();
    } else if(state is InternetConnected && state.connectionType == ConnectionType.Mobile){
      context.read<CounterCubitNew>().decrement();
    }
    // TODO: implement listener
  },
  child: Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(builder: (context, state){
              if(state is InternetConnected && state.connectionType == ConnectionType.Wifi){
                return const Text('WiFi',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.green));
              } else if(state is InternetConnected && state.connectionType == ConnectionType.Mobile){
                return const Text('Mobile',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.blue));
              } else if (state is InternetDisconnected){
                return const Text('Disconnected',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.grey));
              } else {
                return const CircularProgressIndicator();
              }


            }),
            BlocListener<CounterCubitNew, CounterState>(
              listener: (context, state) {
                if(state.wasIncremented){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const Text(
                    //   'When you Increase or Decrease the Number it Will be shown below.',
                    //   style: TextStyle(fontSize: 20),
                    // ),

                    BlocBuilder<CounterCubitNew, CounterState>(
                        builder: (context, count) {
                          if(count.counterValue < 0){
                            return  Text(
                              'This is Negative ${count.counterValue.toString()}', style: const TextStyle(fontSize: 28), );
                          } else if(count.counterValue % 2 == 0 && count.counterValue != 0){
                            return
                              Text(
                                'This is an even Number ${count.counterValue.toString()}', style: const TextStyle(fontSize:28), );
                          } else if(count.counterValue == 0){
                            return
                              Text(
                                'This is indeed zero ${count.counterValue.toString()}', style: const TextStyle(fontSize: 28), );
                          }
                          else{
                            return
                              Text(
                                count.counterValue.toString(), style: const TextStyle(fontSize: 40), );
                          }
                        }
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FloatingActionButton(
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                          onPressed: () => context.read<CounterCubitNew>().increment(),
                        ),
                        const SizedBox(height: 4),
                        FloatingActionButton(
                          tooltip: 'Decrement',
                          child: const Icon(Icons.remove),
                          onPressed: () => context.read<CounterCubitNew>().decrement(),
                        ),
                      ],
                    ),
                    MaterialButton(onPressed: (){
                      Navigator.of(context).pushNamed('/second');
                    },
                    color: Colors.redAccent,
                    child: const Text('Got to Second Screen', style: TextStyle(fontSize: 20),),),
                    MaterialButton(onPressed: (){

                      Navigator.of(context).pushNamed('/third');
                    },
                      color: Colors.greenAccent,
                      child: const Text('Go to Third Screen', style: TextStyle(fontSize: 20),),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    ),
);
  }
}