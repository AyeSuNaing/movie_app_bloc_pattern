import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/rating_view.dart';

import '../data/vos/movie_vo.dart';

class MovieView extends StatelessWidget {

  final Function(int) onTapMovie;
  final MovieVO mMovie;

  MovieView(this.onTapMovie, this.mMovie);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              onTapMovie(mMovie.id ?? 0);
            },
            child: Image.network(
              "$IMAGE_BASE_URL${mMovie?.posterPath ?? ""}",
              height: BANNER_SECTION_HEIGHT,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('😢');
              },
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Expanded(
            child: Text(
              mMovie?.title ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Row(
            children: [
              Text(
                "8.9",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MARGIN_SMALL,
              ),
              RatingView(),
            ],
          ),
        ],
      ),
    );
  }
}
