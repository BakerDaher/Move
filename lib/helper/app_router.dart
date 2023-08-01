import 'package:flutter/material.dart';
import 'package:move/business_logic/cubit/characters_cubit.dart';
import 'package:move/business_logic/cubit/quato_cubit.dart';
import 'package:move/data/models/Characters.dart';
import 'package:move/data/repository/Characters_repository.dart';
import 'package:move/data/repository/Quato_repo.dart';
import 'package:move/data/web_services/Quato_api.dart';
import 'package:move/data/web_services/characters_api.dart';
import '../constant/strings.dart';
import '../presentation/Screens/characters_Screen.dart';
import '../presentation/Screens/characters_Details_Screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//! Routes all Screen in Programe
class AppRouter {

  late CharactersRepos charactersRepos;
  late CharactersCubit charactersCubit;

  late QuatoRepos quatoRepos;
  late QuatoCubit quatoCubit;

  AppRouter() {
    //! Repo to Cubit
    quatoRepos = QuatoRepos(QuatoAPi());
    quatoCubit = QuatoCubit(quatoRepos);

    charactersRepos = CharactersRepos(CharactersApi());
    charactersCubit = CharactersCubit(charactersRepos);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: const CharactersScreen(),
                ));

      case charactersDetailsScreen:
        {
          final Characters1 character = settings.arguments as Characters1;
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (BuildContext context) => quatoCubit ,
                    child: CharactersDetailsScreen(character: character),
                  )
              );
        }
    }
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Text("no route defined"),
      ),
    );
  }
}
