
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


/* Bu bölüm, Sabitler adlı bir sınıfı tanımlar.
Bu sınıf, belirli stil ve değerleri depolamak için kullanılır.
Örneğin, anaRenk adlı bir sabit, genel renk temasını
belirlemek için kullanır. baslikText sabiti,
uygulama başlığı için metni depolar. */
class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const baslikText = ('Ortalama Hesapla');


/* baslikStyle adlı bir TextStyle tanımı, uygulama başlığı
için kullanılan metin stilini belirler.
GoogleFonts.quicksand ile belirli bir yazı tipi kullanılır.
Bu stilde, metin boyutu (fontSize), yazı kalınlığı (fontWeight)
ve renk (color) belirtilir. */
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );


/* BorderRadius nesnesi, genel olarak uygulamada
kullanılacak kenar yuvarlama değerini depolar.
Bu durumda, köşeleri yuvarlatmak için 24 birimlik bir
yarıçap kullanılıyor. */
  static BorderRadius borderRadius = BorderRadius.circular(24);


/* ortalamaGosterBodyStyle adlı bir diğer TextStyle tanımı,
ortalama gösterimi için kullanılan metin stilini belirler.
Boyut, kalınlık ve renk gibi özellikler belirtilir. */
  static final TextStyle ortalamaGosterBodyStyle = GoogleFonts.quicksand(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: anaRenk,
  );
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: anaRenk,
  );


/* dropDownPadding adlı bir EdgeInsets nesnesi, açılır menü
elemanları etrafındaki boşlukları belirler.
Yatayda 16 birim, dikeyde 8 birim boşluk kullanılır. */
  static final EdgeInsets dropDownPadding = 
    EdgeInsets.symmetric(horizontal: 16, vertical: 8,
  );


/* yatayPadding8, yatayda 8 birim boşluk eklemek için kullanılır. */
  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}


/* 'color' adlı bir mixin tanımlanır. Ancak, bu mixin içinde
herhangi bir kod yoktur. Mixinler, başka sınıfların
özelliklerini genişletmek veya ortak özellikleri paylaşmak
için kullanılır. Bu koddaki mixin boş olduğu için bir
işlevselliği yoktur. */
mixin color {  }

