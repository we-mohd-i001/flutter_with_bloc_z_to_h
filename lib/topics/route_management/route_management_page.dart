import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_bloc_z_to_h/topics/route_management/cubit/internet_cubit.dart';
import 'package:flutter_with_bloc_z_to_h/topics/route_management/routes/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'cubit/counter_cubit.dart';


class RouteManagementPage extends StatelessWidget {

  final AppRouter appRouter;
  final Connectivity connectivity;
  const RouteManagementPage({super.key, required this.appRouter, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetCubit(connectivity)),
        BlocProvider(create: (context) => CounterCubitNew()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true ,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
