import 'package:flutter/material.dart';

import 'package:gamepass_clone/domain/game.dart';
import 'package:gamepass_clone/ui/shared/utils/get_youtube_id.dart';
import 'package:gamepass_clone/ui/theme/colors.dart';
import 'package:gamepass_clone/ui/theme/fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GamePage extends StatefulWidget {
  final Game game;

  const GamePage({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late YoutubePlayerController trailerController;
  bool isMuted = false, isPaused = false;

  @override
  void didChangeDependencies() {
    trailerController = YoutubePlayerController(
      initialVideoId: getYoutubeId(widget.game.trailer),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        hideControls: true,
        hideThumbnail: true,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    trailerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColors.background,
        child: ListView(
          padding: EdgeInsets.only(bottom: 16),
          children: [
            Container(
                height: (MediaQuery.of(context).size.height ~/ 1.8).toDouble(),
                width: double.maxFinite,
                child: Container(
                  height:
                      (MediaQuery.of(context).size.height ~/ 1.8).toDouble(),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(widget.game.logo),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, ThemeColors.background],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 28, horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            color: Colors.black26,
                          ),
                          child: BackButton(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 14, right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.game.title, style: ThemeFonts.gameTitle),
                  SizedBox(height: 4),
                  Text(widget.game.publisher, style: ThemeFonts.gamePublisher),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(widget.game.rating.logo,
                          width: 24, height: 24),
                      SizedBox(width: 6),
                      Text(
                        widget.game.ratingReasons.join(', '),
                        style: ThemeFonts.gameRatingReasons,
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildContent(
                    child: _buildYoutubePlayer(),
                    title: "Trailer",
                  ),
                  SizedBox(height: 16),
                  _buildContent(
                    child: Text(
                      widget.game.size,
                      style: ThemeFonts.primaryContent,
                    ),
                    title: "Tamanho",
                  ),
                  SizedBox(height: 16),
                  _buildContent(
                    child: Text(
                      widget.game.description,
                      style: ThemeFonts.primaryContent,
                    ),
                    title: 'Descrição',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildYoutubePlayer() {
    return Container(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          YoutubePlayer(
            controller: trailerController,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(44)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (isMuted)
                        trailerController.unMute();
                      else
                        trailerController.mute();

                      setState(() {
                        isMuted = !isMuted;
                      });
                    },
                    icon: Icon(
                      isMuted
                          ? Icons.volume_off_rounded
                          : Icons.volume_up_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(44)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (!isPaused)
                        trailerController.pause();
                      else
                        trailerController.play();

                      setState(() {
                        isPaused = !isPaused;
                      });
                    },
                    icon: Icon(
                      isPaused ? Icons.play_arrow : Icons.pause,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContent({required Widget child, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: ThemeFonts.primaryTitle),
        SizedBox(height: 4),
        child
      ],
    );
  }
}
