import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/resources/dimens.dart';

class RatingView extends StatelessWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemBuilder: (BuildContext context, int index) =>  Icon(
        Icons.star,
        color: Colors.amber,
      ),
      initialRating: 3.0,
      itemSize: MARGIN_MEDIUM_2,
      onRatingUpdate: (rating){
        print(rating);
      },
    );
  }
}
