import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/play_button_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {
  const ShowCaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
      child: Container(
        width: 300,
        // color: Colors.blue,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network("https://c4.wallpaperflare.com/wallpaper/652/295/578/titanic-in-3d-titanic-poster-wallpaper-preview.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: PlayButtonView(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Titanic",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MARGIN_MEDIUM,),
                    TitleText("19 DECEMBER 1997"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
