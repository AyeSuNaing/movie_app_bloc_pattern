import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/blocs/movie_detail_bloc.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/widgets/actor_and_creators_section_views.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/rating_view.dart';
import 'package:movie_app/widgets/title_text.dart';

import '../data/models/movie_model.dart';
import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  MovieDetailsPage(this.movieId);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late MovieDetailsBloc _bloc;
  @override
  void initState() {
    _bloc = MovieDetailsBloc(widget.movieId);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.disposeStreams();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _bloc.movieStreamController.stream.asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<MovieVO> movieSnapshop) {
          return Container(
            color: HOME_SCREEN_BACKGROUND_COLOR,
            child: (movieSnapshop.data != null)
                ? CustomScrollView(
                    slivers: [
                      MovieDetailsSliverAppBarView(
                          () => Navigator.pop(context), movieSnapshop.data!),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: MARGIN_MEDIUM_2),
                            child: TrailerSection(movieSnapshop.data!),
                          ),
                          SizedBox(
                            height: MARGIN_LARGE,
                          ),
                          StreamBuilder(
                            stream: _bloc.actorsStreamController.stream
                                .asBroadcastStream(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<CreditVO>> snapshot) {
                              if (snapshot.hasData &&
                                  (snapshot.data?.isNotEmpty ?? false)) {
                                return ActorAndCreatorSectionView(
                                  ACTOR_TITLE,
                                  "",
                                  seeMoreButtonVisibility: false,
                                  mActorList: snapshot.data ?? [],
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          SizedBox(
                            height: MARGIN_LARGE,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: MARGIN_MEDIUM_2),
                            child: AboutFilmSectionView(movieSnapshop.data!),
                          ),
                          SizedBox(
                            height: MARGIN_LARGE,
                          ),
                          StreamBuilder(
                            stream: _bloc.creatorsStreamController.stream
                                .asBroadcastStream(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<CreditVO>> snapshot) {
                              if (snapshot.hasData &&
                                  (snapshot.data?.isNotEmpty ?? false)) {
                                return ActorAndCreatorSectionView(
                                    CREATOR_TITLE, MORE_CREATORS_TITLE,
                                    mActorList: snapshot.data ?? []);
                              } else {
                                return Container();
                              }
                            },
                          )
                        ]),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}

class AboutFilmSectionView extends StatelessWidget {
  final MovieVO movieVO;

  const AboutFilmSectionView(this.movieVO);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("ABOUT FILM"),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
          "Original Title",
          movieVO.originalTitle ?? movieVO.title ?? "",
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
          "Type",
          movieVO.genres?.map((genre) => genre.name).join(",") ?? "",
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
            "Production",
            movieVO.prodcutionCountries
                    ?.map((country) => country.name)
                    .join(",") ??
                ""),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
          "Premier",
          movieVO.releaseDate ?? "",
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
          "Description",
          movieVO.overview ?? "",
        ),
      ],
    );
  }
}

class AboutFilmInfoView extends StatelessWidget {
  final String label;
  final String description;

  const AboutFilmInfoView(this.label, this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            label,
            style: TextStyle(
              color: MOVIE_DETAIL_INFO_TEXT_COLOR,
              fontSize: MARGIN_MEDIUM_2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_CARD_MEDIUM_2,
        ),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: MARGIN_MEDIUM_2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class TrailerSection extends StatelessWidget {
  final MovieVO mMovie;

  TrailerSection(this.mMovie);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreView(
            mMovie.genres?.map((genre) => genre.name).toList() ?? []),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        StorylineView(mMovie.overview ?? ""),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Row(
          children: [
            MovieDetailsScreenButtonView(
                "PLAY TRAILER",
                PLAY_BUTTON_COLOR,
                Icon(
                  Icons.play_circle_fill,
                  color: Colors.black54,
                )),
            SizedBox(
              width: MARGIN_CARD_MEDIUM_2,
            ),
            MovieDetailsScreenButtonView(
              "RATE MOVIE",
              HOME_SCREEN_BACKGROUND_COLOR,
              Icon(
                Icons.star,
                color: PLAY_BUTTON_COLOR,
              ),
              isGhostButton: true,
            ),
          ],
        ),
      ],
    );
  }
}

class MovieDetailsScreenButtonView extends StatelessWidget {
  final String title;
  final Color backgroudColor;
  final Icon buttonIcon;
  final bool isGhostButton;

  const MovieDetailsScreenButtonView(
      this.title, this.backgroudColor, this.buttonIcon,
      {this.isGhostButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_CARD_MEDIUM_2),
      height: MARGIN_XXLLARGE,
      decoration: BoxDecoration(
        color: backgroudColor,
        borderRadius: BorderRadius.circular(MARGIN_LARGE),
        border: (isGhostButton)
            ? Border.all(
                color: Colors.white,
                width: 2,
              )
            : null,
      ),
      child: Center(
        child: Row(
          children: [
            buttonIcon,
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StorylineView extends StatelessWidget {
  final String overview;

  StorylineView(this.overview);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(MOVIE_DETAILS_STORYLINE_TITLE),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          overview,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
      ],
    );
  }
}

class MovieTimeAndGenreView extends StatelessWidget {
  final List<String?> genreList;

  MovieTimeAndGenreView(this.genreList);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.horizontal,
      children: _createMovieTimeAndGenreWidget(),
    );
  }

  List<Widget> _createMovieTimeAndGenreWidget() {
    List<Widget> widgets = [
      Icon(
        Icons.access_time,
        color: PLAY_BUTTON_COLOR,
      ),
      SizedBox(
        width: MARGIN_SMALL,
      ),
      Text(
        "2hr 30mins",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: MARGIN_MEDIUM,
      ),
    ];

    // Wrap(
    //   direction: Axis.horizontal,
    //   spacing: MARGIN_SMALL,
    //   alignment: WrapAlignment.start,
    //   children: (genreList != null ) ?
    //   genreList.map((genre) => GenreChipView(genre ?? "")).toList() : [Container()],
    // );

    widgets.addAll(
      genreList.map((genre) => GenreChipView(genre ?? "")).toList(),
    );

    widgets.add(
      Icon(
        Icons.favorite_border,
        color: Colors.white,
      ),
    );

    return widgets;
  }
}

/*
Row(
      children: [
        Icon(
          Icons.access_time,
          color: PLAY_BUTTON_COLOR,
        ),
        SizedBox(width: MARGIN_SMALL,),
        Text(
          "2hr 30mins",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(width: MARGIN_MEDIUM,),
        Row(
          children: genreList
          .map((genre) => GenreChipView(genre))
          .toList(),
        ),
        Icon(
          Icons.favorite_border,
          color: Colors.white,
        ),
      ],
    );
 */
class GenreChipView extends StatelessWidget {
  final String genreText;

  const GenreChipView(this.genreText);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          backgroundColor: MOVIE_DETAILS_SCREEN_CHIP_BG_COLOR,
          label: Text(
            genreText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_SMALL,
        ),
      ],
    );
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {
  final Function onTapBack;
  final MovieVO mMovie;

  const MovieDetailsSliverAppBarView(this.onTapBack(), this.mMovie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAILS_SCREEN_SLIVER_APP_BAR_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: MovieDetailsAppBarImageView(mMovie.posterPath ?? ""),
            ),
            Positioned.fill(
              child: GradientView(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MARGIN_XXLLARGE,
                  left: MARGIN_MEDIUM_2,
                ),
                child: BackButtonView(() {
                  this.onTapBack();
                }),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MARGIN_XXLLARGE + MARGIN_MEDIUM,
                  right: MARGIN_MEDIUM_2,
                ),
                child: SearchButtonView(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                  bottom: MARGIN_LARGE,
                ),
                child: MoiveDetailsAppBarInfoView(mMovie),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoiveDetailsAppBarInfoView extends StatelessWidget {
  final MovieVO movieVO;

  const MoiveDetailsAppBarInfoView(this.movieVO);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MovieDetailsYearView(movieVO.releaseDate?.substring(0, 4) ?? ""),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingView(),
                    SizedBox(
                      height: MARGIN_SMALL,
                    ),
                    TitleText("${movieVO.voteCount} VOTES"),
                    SizedBox(
                      height: MARGIN_CARD_MEDIUM_2,
                    )
                  ],
                ),
                SizedBox(
                  width: MARGIN_MEDIUM,
                ),
                Text(
                  "${movieVO.voteAverage}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MOVIE_DETAILS_RATING_TEXT_SIZE,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Text(
          movieVO.title ?? movieVO.originalTitle ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_HEADING_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class MovieDetailsYearView extends StatelessWidget {
  final String year;

  const MovieDetailsYearView(this.year);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      height: MARGIN_XXLLARGE,
      decoration: BoxDecoration(
        color: PLAY_BUTTON_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_LARGE),
      ),
      child: Center(
        child: Text(
          year,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SearchButtonView extends StatelessWidget {
  const SearchButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      color: Colors.white,
      size: MARGIN_XLLARGE,
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function onTapBack;

  const BackButtonView(this.onTapBack());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapBack();
      },
      child: Container(
        width: MARGIN_XXLLARGE,
        height: MARGIN_XXLLARGE,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: MARGIN_XLLARGE,
        ),
      ),
    );
  }
}

class MovieDetailsAppBarImageView extends StatelessWidget {
  final String imgUrl;

  const MovieDetailsAppBarImageView(this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL${imgUrl}",
      fit: BoxFit.cover,
    );
  }
}
