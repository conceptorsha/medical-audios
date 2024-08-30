import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/audio_controller.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioController audioController = Get.put(AudioController());
  late StreamSubscription<Duration> positionSubscription;

  @override
  void initState() {
    super.initState();
    positionSubscription = audioController.audioPlayer.positionStream.listen((position) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    positionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
      ),
      body: Obx(() {
        final duration = audioController.audioPlayer.duration ?? Duration.zero;
        final position = audioController.audioPlayer.position;
        final isPlaying = audioController.isPlaying.value;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Album Art
            Container(
              margin: const EdgeInsets.all(20),
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/heart.jpeg'), // replace with your asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Track Info
            const Text(
              'Cardiology',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Cardiology Basics'),
            const SizedBox(height: 20),
            // Audio Duration and Position
            Slider(
              value: position.inSeconds.toDouble(),
              min: 0.0,
              max: duration.inSeconds.toDouble(),
              onChanged: (value) {
                audioController.seek(Duration(seconds: value.toInt()));
              },
            ),
            Text(
              '${_formatDuration(position)} / ${_formatDuration(duration)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Playback Controls
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.music_note, color: Colors.white),
                    onPressed: () {
                      // Handle music icon tap if needed
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_previous, color: Colors.white),
                    onPressed: () {
                      // Handle skip previous
                    },
                  ),
                  const SizedBox(width: 8), // spacing between icons
                  IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white),
                    onPressed: () {
                      if (isPlaying) {
                        audioController.pause();
                      } else {
                        audioController.play();
                      }
                    },
                  ),
                  const SizedBox(width: 8), // spacing between icons
                  IconButton(
                    icon: const Icon(Icons.skip_next, color: Colors.white),
                    onPressed: () {
                      // Handle skip next
                    },
                  ),
                  const SizedBox(width: 8), // spacing between icons
                  IconButton(
                    icon: Icon(audioController.isRepeating.value ? Icons.repeat : Icons.repeat_one, color: Colors.white),
                    onPressed: () {
                      audioController.toggleRepeat();
                    },
                  ),
                  const SizedBox(width: 8), // spacing between icons
                  IconButton(
                    icon: Icon(audioController.isShuffling.value ? Icons.shuffle : Icons.shuffle, color: Colors.white),
                    onPressed: () {
                      audioController.toggleShuffle();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  String _formatDuration(Duration duration) {
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
