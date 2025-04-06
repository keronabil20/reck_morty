// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:reck_morty/constants/my_colors.dart';

import 'package:reck_morty/data/models/character.dart';

class DetailedCharacters extends StatelessWidget {
  final Character character;
  const DetailedCharacters({
    super.key,
    required this.character,
  });

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Hero(
          tag: character.id,
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: "assets/images/gif.gif",
            image: character.image,
          ),
        ),
        title: Text(
          character.name,
          style: const TextStyle(
            color: MyColors.myWhite,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: MyColors.myGrey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("Name : ", character.name),
                      buildDivider(400),
                      characterInfo(
                          "Location : ",
                          character.location
                              .map((key, value) {
                                return MapEntry(key, value);
                              })
                              .values
                              .first),
                      buildDivider(450),
                      characterInfo("Status : ", character.status),
                      buildDivider(500),
                      characterInfo("Species : ", character.species),
                      buildDivider(550),
                      const SizedBox(
                        height: 1000,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget characterInfo(String title, String value) {
  return RichText(
    text: TextSpan(
      text: title,
      style: const TextStyle(
        color: MyColors.myWhite,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      children: [
        TextSpan(
          text: value,
          style: const TextStyle(
            color: MyColors.myWhite,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget buildDivider(double endIndent) {
  return Divider(
    color: MyColors.myYellow,
    thickness: 3,
    endIndent: endIndent,
    height: 20,
  );
}
