enum AppTabEnum { home, music, video, profile }

enum Demo {
  home(1),
  music(2),
  video(3),
  profile(4);

  const Demo(this.value);

  final int value;
}
