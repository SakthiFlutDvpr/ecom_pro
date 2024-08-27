class Font {
  static const Font poppinsLight = Font('Poppins-Light');
  static const Font poppinsMedium = Font('Poppins-Medium');
  static const Font poppinsRegular = Font('Poppins-Regular');
  static const Font poppinsSemiBold = Font('Poppins-SemiBold');
  static const Font poppinsMediumItalic = Font('Poppins-MediumItalic');
  static const Font poppinsBold = Font('Poppins-Bold');
//

  final String _fontName;

  String get value => _fontName;

  // ignore: sort_constructors_first
  const Font(this._fontName);
}
