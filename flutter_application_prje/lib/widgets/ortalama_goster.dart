
import 'package:flutter/material.dart';
import 'package:flutter_application_prje/constants/app_constants.dart';

/* ortalamaGoster adında bir StatelessWidget sınıfı tanımlanıyor.
Bu widget, ortalama notu ve girilen ders sayısını göstermek için
kullanılacak. dersSayisi ve ortalama adında iki özellik alıyor.
Key parametresi opsiyonel bir anahtar. */
class ortalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const ortalamaGoster({required this.dersSayisi, 
  required this.ortalama, Key? key}) : super(key: key);

/* build metodu, widget'ın arayüzünü oluşturuyor. 
Column widget'ı ile sütun düzeninde öğeleri alt alta ekliyor. */
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

/* Text: İlk öğe, girilen ders sayısını gösterir veya "Ders Seçiniz"
mesajını gösterir. Burada ternary (üçlü) operatörü kullanılarak bir koşula
göre mesaj belirlenir.  */
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Seçiniz',

// Sabitler.ortalamaGosterBodyStyle ile stil belirlenir.
          style: Sabitler.ortalamaGosterBodyStyle,
        ),

// Text, ortalama notu gösterir. Bu not 2 ondalık basamağa yuvarlanır.
        Text(
          ortalama >=0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',

// Sabitler.ortalamaStyle ile stil belirlenir.
          style: Sabitler.ortalamaStyle,
        ),

// Text, "Ortalama" kelimesini gösterir 
        Text(
          'Ortalama',

// Sabitler.ortalamaGosterBodyStyle ile stil belirlenir.
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
      ],
    );
  }
}

