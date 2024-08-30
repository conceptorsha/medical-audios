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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Now Playing'),
        ),
        body: Obx(() {
      final duration = audioController.duration.value;
      final position = audioController.audioPlayer.position;
      final isPlaying = audioController.isPlaying.value;
      final currentTrack = audioController.getCurrentTrack();

      return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        // Album Art
        Container(
        margin: EdgeInsets.all(20),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(currentTrack.imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    // Track Info
    Text(
    currentTrack.title,
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    Text(currentTrack.subTitle),
    SizedBox(height: 10),
    // Rating and Duration
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(Icons.star, color: Colors.orange, size: 24),
    SizedBox(width: 4),
    Text(
    '${currentTrack.rating}',
    style: TextStyle(fontSize: 18),
    ),
    SizedBox(width: 20),
    Text(
    'Duration: ${_formatDuration(duration)}',
    style: TextStyle(fontSize: 16),
    ),
    ],
    ),
    SizedBox(height: 20),
    // Audio Duration and Position
    Slider(
    value: position.inSeconds.toDouble(),
    min: 0.0,
    max: (duration.inSeconds > 0) ? duration.inSeconds.toDouble() : 0.0,
    onChanged: (value) {
    if (duration.inSeconds > 0) {
    audioController.seek(Duration(seconds: value.toInt()));
    }
    },
    ),
    Text(
    '${_formatDuration(position)} / ${_formatDuration(duration)}',
    style: TextStyle(fontSize: 16),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: ElevatedButton(
    onPressed: () {
    Get.toNamed('/transcript'); // Navigate to the transcript screen
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    minimumSize: Size(double.infinity, 50),
    ),
    child: Text('View Transcript'),
    ),
    ),
    SizedBox(height: 20),
    // Playback Controls
    Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.all(16),
    decoration: BoxDecoration(
    color: Colors.orange,
    borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    IconButton(
    icon: Icon(Icons.music_note, color: Colors.white),
    onPressed: () {
    Get.toNamed('/topics'); // Navigate to the topics screen
    },
    ),
    IconButton(
    icon: Icon(Icons.skip_previous, color: Colors.white),
    onPressed: () {
    audioController.playPrevious();
    },
    ),
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
    IconButton(
    icon: Icon(Icons.skip_next, color: Colors.white),
    onPressed: () {
    audioController.playNext();
    },
    ),
    IconButton(
         icon: Icon(audioController.isRepeating.value
          ? (audioController.isShuffling.value ? Icons.repeat : Icons.repeat_one)
              : Icons.shuffle, color: Colors.white),
          onPressed: () {
          if (audioController.isRepeating.value) {
          audioController.toggleRepeat(); // Toggle repeat mode
          } else {
          audioController.toggleShuffle(); // Toggle shuffle mode
          }
          },
          ),
          ],
          ),
          ),
          ],
          ),
          );
        }),
    );
  }

  String _formatDuration(Duration duration) {
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
