import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/base_actor_vo.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/viewitems/actor_view.dart';
import 'package:movie_app/widgets/title_text_with_see_more_view.dart';

class ActorAndCreatorSectionView extends StatelessWidget {
  final String titleText;
  final String seeMoreText;
  final bool seeMoreButtonVisibility;
  final List<BaseActorVO> mActorList;

  ActorAndCreatorSectionView(this.titleText, this.seeMoreText, {this.seeMoreButtonVisibility = true, required this.mActorList} );


  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.only(
        top: MARGIN_MEDIUM_2,
        bottom: MARGIN_XXLLARGE,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithSeeMoreView(
              titleText,
              seeMoreText,
              seeMoreButtonVisibility: seeMoreButtonVisibility,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),
          Container(
            height: BEST_ACTORS_HEIGHT,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              children: mActorList
                  .map((actor) => ActorView(actor))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

