// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:move/constant/strings.dart';
import 'package:move/data/models/Characters.dart';
import 'package:move/constant/my_Colors.dart';

class BuildCharacters extends StatelessWidget {
  final Characters1 character;

  const BuildCharacters({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: MyColors.syrite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: (){
          //!Repository ثم يذهب لل Cubit يستعدي الميثود من 
          Navigator.pushNamed(context, charactersDetailsScreen , arguments: character) ;
        } ,
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.syrite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          //! Widget Animation in flutter 
          child: Hero(
            tag: character.id,
            child: Container(
              color: MyColors.Grey,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loded.gif',
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/notFound.jpg') ,
            ),
          ),
        ),
      ),
    );
  }
}