import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_calling/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_api_calling/home/services/boredService.dart';

import 'services/connectivityService.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<BoredServices>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Activities for bored people'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.activityName),
                    Text(state.activityType),
                    Text(state.participants.toString()),
                    ElevatedButton(
                        onPressed: () => BlocProvider.of<HomeBloc>(context)
                            .add(LoadApiEvent()),
                        child: Text('LOAD NEXT'))
                  ],
                ),
              );
            }
            if (state is HomeNoInternetState) {
              return const Center(child: Text('No Internet :('));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
