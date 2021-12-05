class Ders {
  final String ad;
  final int krediDegeri;
  final double harfDegeri;

  Ders({required this.ad, required this.krediDegeri, required this.harfDegeri});
  @override
  String toString() {
    return "ad:$ad,kredi degeri:$krediDegeri,harf degeri:$harfDegeri";
  }
}
