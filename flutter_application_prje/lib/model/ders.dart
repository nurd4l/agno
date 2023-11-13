
/* Bu satırlar, Ders adında bir sınıf tanımlıyor. Bu sınıf, bir dersin adını,
harf değerini ve kredi değerini içeren özelliklere sahiptir.
final anahtar kelimesiyle belirtilen özellikler, sınıf oluşturulduktan sonra
değiştirilemez (immutable) hale getirilmiştir. Sınıfın yapıcı metodu olan
constructor (Ders(...)) ile özellikler sınıfa atanır. */

class Ders{
  final String ad;  // Dersin adını belirten bi string

  final double harfDegeri;  // Dersin aldığı harf notunun karşılık geldiği 
                            // sayısal değer

  final double krediDegeri;// Dersin kredi değeri 

  Ders({required this.ad, required this.harfDegeri, required this.krediDegeri});


  /* Bu bölümde, toString() adında bir metodun üzerine yazılmış (@override)
  olduğunu görüyoruz. Bu metodun amacı, sınıfın özelliklerini okunabilir
  bir metin olarak temsil etmektir. Bu metodu özelleştirerek ders nesnesinin
  özelliklerini belirli bir formatla birleştirip döndürüyoruz. */

  @override
  String toString() {
    return '$ad $harfDegeri $krediDegeri';
  }
}

