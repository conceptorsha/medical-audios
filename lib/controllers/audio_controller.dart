import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxBool isRepeating = false.obs;
  RxBool isShuffling = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load your audio file or stream
    audioPlayer.setUrl('assets/Audio/Nishikilie.mp3'); // Replace with your audio source
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
