import 'package:flutter/material.dart';

import '../../constans/myColors.dart';
import '../../data/model/caracters.dart';

class CaractersDetailsScreen extends StatelessWidget {
  final Character character;

  const CaractersDetailsScreen({
    this.character,
  });
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickName,
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
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
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('Job : ', character.jobs.join(' / ')),
                  buildDivider(315),
                  characterInfo(
                      'Appeared in : ', character.categoryForTwoSeries),
                  buildDivider(250),
                  characterInfo(
                      'Seasons : ', character.appearanceOfSeasons.join(' / ')),
                  buildDivider(280),
                  characterInfo('Status : ', character.statusIfDeadOrAlive),
                  buildDivider(300),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : characterInfo('Better Call Saul Seasons : ',
                          character.betterCallSaulAppearance.join(" / ")),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : buildDivider(150),
                  characterInfo('Actor/Actress : ', character.acotrName),
                  buildDivider(235),
                  SizedBox(
                    height: 20,
                  ),
                  // BlocBuilder<CharactersCubit, CharactersState>(
                  //   builder: (context, state) {
                  //     return checkIfQuotesAreLoaded(state);
                  //   },
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
            )
          ]))
        ],
      ),
    );
  }
}
