import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/base_actor_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';

import '../data/vos/actor_vo.dart';

class ActorView extends StatelessWidget {

  final BaseActorVO actorVO;

  ActorView(this.actorVO);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Stack(
        children: [
          Positioned.fill(
            child: ActorImageView(actorVO?.profilePath ?? ""),
          ),
          Padding(
            padding: EdgeInsets.all(MARGIN_MEDIUM),
            child: Align(
              alignment: Alignment.topRight,
              child: FavoriteButtonView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ActorNameAndLike(actorVO?.name ?? ""),
          ),
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {

  final String imgUrl;

  ActorImageView(this.imgUrl);


  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL${imgUrl}",
      fit: BoxFit.cover,
    );
  }
}

class FavoriteButtonView extends StatelessWidget {
  const FavoriteButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_border,
      color: Colors.white,
    );
  }
}

class ActorNameAndLike extends StatelessWidget {

  final String name;

  ActorNameAndLike(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_2,
          vertical: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM,),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.amber,
                size: MARGIN_CARD_MEDIUM_2,
              ),
              SizedBox(width: MARGIN_MEDIUM,),
              Text(
                "You like 13 movies",
                style: TextStyle(
                  color: HOME_SCREEN_LIST_TITLE_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
