import 'dart:math'; // For random number generation
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:medical_audios/controllers/topic_controller.dart';

class AudioController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxBool isRepeating = false.obs;
  RxBool isShuffling = false.obs;
  RxDouble rating = 4.5.obs;
  Rx<Duration> duration = Duration.zero.obs;

  RxInt currentIndex = 0.obs;
  late List<CardiologyContentItem> audioTracks;
  String? currentAudioPath; // To track the current audio path
  final Random _random = Random(); // Random number generator for shuffling

  @override
  void onInit() {
    super.onInit();
    final contentController = Get.put(CardiologyContentController());
    audioTracks = contentController.items;

    // Set the initial audio track if there are tracks available
    if (audioTracks.isNotEmpty) {
      currentAudioPath = audioTracks[currentIndex.value].audioPath;
      setAudio(currentAudioPath!);
    }

    // Listen to audio player state and duration
    audioPlayer.playerStateStream.listen((playerState) {
      isPlaying.value = playerState.playing;
    });
    audioPlayer.durationStream.listen((duration) {
      this.duration.value = duration ?? Duration.zero;
    });
  }

  void setAudio(String path) async {
    if (path != currentAudioPath) {
      print('Setting audio to path: $path');
      try {
        await audioPlayer.setUrl(path);
        duration.value = audioPlayer.duration ?? Duration.zero;
        currentAudioPath = path; // Update the current path
      } catch (e) {
        print('Error setting audio: $e');
      }
    }
  }

  void playPrevious() {
    if (audioTracks.isEmpty) return;

    if (isShuffling.value) {
      // Pick a random track if shuffling
      currentIndex.value = _random.nextInt(audioTracks.length);
    } else {
      // Sequential previous track logic
      if (currentIndex.value > 0) {
        currentIndex.value--;
      } else {
        currentIndex.value = audioTracks.length - 1; // Loop to the last track
      }
    }

    setAudio(audioTracks[currentIndex.value].audioPath);
    play();
  }

  void playNext() {
    if (audioTracks.isEmpty) return;

    if (isShuffling.value) {
      // Pick a random track if shuffling
      currentIndex.value = _random.nextInt(audioTracks.length);
    } else {
      // Sequential next track logic
      if (currentIndex.value < audioTracks.length - 1) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0; // Loop to the first track
      }
    }

    setAudio(audioTracks[currentIndex.value].audioPath);
    play();
  }

  void play() {
    try {
      audioPlayer.play();
      isPlaying.value = true;
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  void pause() {
    try {
      audioPlayer.pause();
      isPlaying.value = false;
    } catch (e) {
      print('Error pausing audio: $e');
    }
  }

  void stop() {
    try {
      audioPlayer.stop();
      isPlaying.value = false;
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  void seek(Duration position) {
    audioPlayer.seek(position);
  }

  void toggleRepeat() {
    isRepeating.value = !isRepeating.value;
    audioPlayer.setLoopMode(
      isRepeating.value ? LoopMode.all : LoopMode.off,
    );
  }

  void toggleShuffle() {
    isShuffling.value = !isShuffling.value;
    if (isShuffling.value) {
      // If shuffle is enabled, pick a random track immediately
      playNext();
    }
  }

  // Get the current track item
  CardiologyContentItem getCurrentTrack() {
    return audioTracks[currentIndex.value];
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
