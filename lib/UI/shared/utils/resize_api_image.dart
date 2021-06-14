String resizeApiImage({
  required String imageUrl,
  required width,
  required height,
}) {
  // IMPROVES THE IMAGE RESOLUTION TO BETTER VISIBILITY
  final formattedWidth = (width * 1.8).toInt();
  final formattedHeight = (height * 1.8).toInt();

  return '$imageUrl?mode=scale&h=$formattedWidth&w=$formattedHeight';
}
