import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:gamepass/ui/game/widgets/player_control_button.dart';
import 'package:gamepass/ui/shared/utils/get_youtube_id.dart';

class TrailerPlayerWidget extends StatefulWidget {
  final String trailer;

  TrailerPlayerWidget({
    Key? key,
    required this.trailer,
  }) : super(key: key);

  @override
  _TrailerPlayerWidgetState createState() => _TrailerPlayerWidgetState();
}

class _TrailerPlayerWidgetState extends State<TrailerPlayerWidget> {
  late YoutubePlayerController trailerController;
  bool isMuted = false, isPaused = false, isEnded = false, isStarted = false;

  @override
  void didChangeDependencies() {
    trailerController = YoutubePlayerController(
      initialVideoId: getYoutubeId(widget.trailer),
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
    return Container(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: YoutubePlayer(
              controller: trailerController,
              onEnded: (_) {
                setState(() {
                  isEnded = true;
                });
              },
              onReady: () {
                setState(() {
                  isStarted = true;
                });
              },
            ),
          ),
          _buildPlayerControls()
        ],
      ),
    );
  }

  Widget _buildPlayerControls() {
    if (isStarted) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PlayerControlButton.secondary(
              onTap: () {
                if (isMuted)
                  trailerController.unMute();
                else
                  trailerController.mute();

                setState(() {
                  isMuted = !isMuted;
                });
              },
              icon:
                  isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
            ),
            SizedBox(width: 8),
            _buildPrimaryControlButton()
          ],
        ),
      );
    }

    return Container();
  }

  Widget _buildPrimaryControlButton() {
    if (isEnded) {
      return PlayerControlButton.primary(
        onTap: () {
          trailerController.play();

          setState(() {
            isEnded = false;
          });
        },
        icon: Icons.replay,
      );
    }

    return PlayerControlButton.primary(
      onTap: () {
        if (!isPaused)
          trailerController.pause();
        else
          trailerController.play();

        setState(() {
          isPaused = !isPaused;
        });
      },
      icon: isPaused ? Icons.play_arrow : Icons.pause,
    );
  }
}
