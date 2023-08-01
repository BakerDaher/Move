// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:move/business_logic/cubit/characters_cubit.dart';
import 'package:move/constant/my_Colors.dart';
import 'package:move/data/models/Characters.dart';
import 'package:move/presentation/widgets/BuildCharacters.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Characters1>? allCharacters;
  late TextEditingController _searchTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchTextController = TextEditingController();

    //! Send Event to Block >> get all Characters
   // BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      backgroundColor: MyColors.Grey,
      appBar: AppBar(
        backgroundColor: MyColors.yellow,
        title: _buildSearchField(),
      ),
      body: OfflineBuilder(connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        // ignore: unused_local_variable
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          BlocProvider.of<CharactersCubit>(context).getAllCharacters();
          return buildBlocWidget();
        } else {
          return buildNoInternetWidget();
        }
      },
        child: shoLodingIndecator() ,
      ),
    );
  }

  // Widget buildBlocWidget() {
  //   return BlocBuilder<CharactersCubit, CharactersState>(
  //     builder: (context, state) {
  //       if (state is CharactersLoaded) {
  //         return Container();
  //       } else {
  //         return Container();
  //       }
  //     },
  //   );
  // }

  //! get in Block and Relode in UI
  Widget buildBlocWidget() {
    //* get State in Block
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.character;
          return buildLodedListWidget();
        } else if (state is CharactersSearch) {
          allCharacters = state.serchedForCharacters;
          return buildLodedListWidget();
        } else {
          return shoLodingIndecator();
        }
      },
    );
  }

  //! Build UI
  Widget buildLodedListWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 8, right: 8, top: 4),
      child: BuildCharactersList(),
    );
  }

  //! BuildCharactersList
  Widget BuildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacters!.length,
        itemBuilder: (context, index) {
          //? return Item
          return BuildCharacters(
            character: allCharacters![index],
          );
        });
  }

  //! Loded
  Widget shoLodingIndecator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.yellow,
      ),
    );
  }

  //! Widget in AppBar > Search
  Widget _buildSearchField() {
    return TextField(
      cursorColor: MyColors.Grey,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: MyColors.Grey,
        ),
        hintText: "Find a Character....",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColors.Grey,
          fontSize: 18,
        ),
      ),
      style: TextStyle(
        color: MyColors.Grey,
        fontSize: 18,
      ),
      onChanged: (searchCharacter) {
        BlocProvider.of<CharactersCubit>(context)
            .addSearchedOrItemSearchedList(searchCharacter);
      },
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Can\’t Connect .. Check Internet " ,
              style: TextStyle(
                fontSize: 22 ,
                color: MyColors.Grey ,
              ),
            ) ,
            Image.asset("assets/images/NotConnection.png")
          ],
        ),
      ),
    );
  }
}
