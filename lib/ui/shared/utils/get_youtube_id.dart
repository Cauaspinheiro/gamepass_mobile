String getYoutubeId(String youtubeUrl) {
  if (youtubeUrl.contains('watch?v=')) return youtubeUrl.split('watch?v=').last;

  final a = youtubeUrl.split('/').last.trim();

  return a;
}
