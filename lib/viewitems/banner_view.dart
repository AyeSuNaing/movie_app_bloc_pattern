import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/play_button_view.dart';

import '../data/vos/movie_vo.dart';
import '../network/api_constants.dart';

class BannerView extends StatelessWidget {
  final Function(int) onTapMovie;
  final MovieVO mMovie;

  BannerView(this.onTapMovie, this.mMovie);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(mImageUrl: mMovie?.backDropPath ?? "",),
        ),
        Positioned.fill(
          child: GestureDetector(
            onTap:() {
              this.onTapMovie(mMovie.id ?? 0);
            },
            child: GradientView(),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleView(title: mMovie?.title ?? "",),
        ),
        Align(
          alignment: Alignment.center,
          child: PlayButtonView(),
        ),
        
      ],
    );
  }
}




class BannerTitleView extends StatelessWidget {

  final String title;

  BannerTitleView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w500,
            ),
          ),

         /* Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w500,
            ),
          ),*/
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  final String mImageUrl;

  BannerImageView({required this.mImageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL${mImageUrl}",
      fit: BoxFit.cover,
    );
  }
}
