import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reck_morty/constants/my_colors.dart';
import 'package:reck_morty/data/models/character.dart';
import 'package:reck_morty/logic/cubit/characters_cubit.dart';
import 'package:reck_morty/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<dynamic> allCharacters;
  List<dynamic> filteredCharacters = [];
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters(); // Triggers fetch
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: stopSearch),
    );
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    _searchController.clear();
    filteredCharacters.clear();
  }

  void filterCharacters(String searchText) {
    filteredCharacters = allCharacters.where((character) {
      return character.name.toLowerCase().contains(searchText.toLowerCase());
    }).toList();
    setState(() {});
  }

  Widget buildSearchField() {
    return TextField(
      controller: _searchController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        hintText: "Search characters...",
        hintStyle: TextStyle(color: MyColors.myGrey),
        border: InputBorder.none,
      ),
      style: const TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: filterCharacters,
    );
  }

  List<Widget> buildAppBarActions() {
    return [
      IconButton(
        icon: Icon(isSearching ? Icons.clear : Icons.search, color: MyColors.myGrey),
        onPressed: () {
          if (isSearching) {
            stopSearch();
            Navigator.pop(context); // Close local history entry
          } else {
            startSearch();
          }
        },
      ),
    ];
  }

  Widget buildAppBarTitle() {
    return const Text(
      "Characters",
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.myYellow),
    );
  }

  Widget buildCharacterList(List<dynamic> characters) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      padding: EdgeInsets.zero,
      itemCount: characters.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (ctx, index) {
        return CharacterItem(character: characters[index]);
      },
    );
  }

  Widget buildLoadedListWidgets() {
    final charactersToShow =
        _searchController.text.isEmpty ? allCharacters : filteredCharacters;

    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharacterList(charactersToShow),
          ],
        ),
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: isSearching ? buildSearchField() : buildAppBarTitle(),
        actions: buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
