String resizeApiImage({
  required String imageUrl,
  required num width,
  required num height,
}) {
  // IMPROVES THE IMAGE RESOLUTION TO BETTER VISIBILITY
  final formattedWidth = (width * 2).toInt();
  final formattedHeight = (height * 2).toInt();

  return '$imageUrl?mode=scale&h=$formattedHeight&w=$formattedWidth';
}
