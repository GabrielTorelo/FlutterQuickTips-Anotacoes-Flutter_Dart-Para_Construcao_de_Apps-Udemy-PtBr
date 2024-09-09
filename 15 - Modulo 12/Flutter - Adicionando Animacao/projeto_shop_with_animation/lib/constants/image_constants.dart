enum ImageConstants {
  placeholder('assets/images/skeleton.webp');

  final String value;
  const ImageConstants(this.value);

  String call() => value.toString();
}
