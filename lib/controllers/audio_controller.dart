import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();

  RxBool isPlaying = false.obs;
  RxBool isRepeating = false.obs;
  RxBool isShuffling = false.obs;
  RxDouble rating = 4.5.obs; // Add rating here
  Rx<Duration> duration = Duration.zero.obs; // Add duration here

  @override
  void onInit() {
    super.onInit();
    audioPlayer.setUrl('assets/Audio/Nishikilie.mp3').then((_) {
      duration.value = audioPlayer.duration ?? Duration.zero; // Set the duration
    });
  }

  void play() {
    audioPlayer.play();
    isPlaying.value = true;
  }

  void pause() {
    audioPlayer.pause();
    isPlaying.value = false;
  }

  void stop() {
    audioPlayer.stop();
    isPlaying.value = false;
  }

  void seek(Duration position) {
    audioPlayer.seek(position);
  }

  void toggleRepeat() {
    if (isRepeating.value) {
      audioPlayer.setLoopMode(LoopMode.off);
    } else {
      audioPlayer.setLoopMode(LoopMode.all);
    }
    isRepeating.value = !isRepeating.value;
  }

  void toggleShuffle() {
    if (isShuffling.value) {
      audioPlayer.setShuffleModeEnabled(false);
    } else {
      audioPlayer.setShuffleModeEnabled(true);
    }
    isShuffling.value = !isShuffling.value;
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
