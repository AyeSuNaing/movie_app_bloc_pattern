import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/play_button_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {

  final MovieVO mMovieVO;
  final Function(int) onTapMovie;
  ShowCaseView(this.mMovieVO, this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: 300,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: (){
                onTapMovie(mMovieVO.id ?? 0);
              },
              child: Image.network(
                "$IMAGE_BASE_URL${mMovieVO.backDropPath}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(MARGIN_MEDIUM_2) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mMovieVO?.title ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_3X,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: MARGIN_MEDIUM,),
                  TitleText(mMovieVO?.originalTitle ?? ""),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
