import 'package:flutter/material.dart';
import 'package:reck_morty/constants/my_colors.dart';
import 'package:reck_morty/constants/strings.dart';
import 'package:reck_morty/data/models/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: ()=> {
          Navigator.pushNamed(context, detailedCharacters,
              arguments: character),
        },
        child: GridTile(
          footer: Hero(tag: character.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: MyColors.myYellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                character.name,
                style: const TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: "assets/images/gif.gif",
                    image: character.image)
                : Image.asset(
                    "assets/images/wait.gif",
                  ),
          ),
        ),
      ),
    );
  }
}
