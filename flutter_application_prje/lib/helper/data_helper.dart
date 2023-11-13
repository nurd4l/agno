
import 'package:flutter/material.dart';
import 'package:flutter_application_prje/model/ders.dart';
class DataHelper {

/* Bu satır, eklenen dersleri tutmak için bir liste oluşturuyor.
Ders sınıfının nesneleri bu listede saklanacak. */
  static List<Ders> tumEklenenDersler = [];


/* dersEkle adında bir fonksiyon tanımlanıyor. Bu fonksiyon,
parametre olarak aldığı bir Ders nesnesini tumEklenenDersler
listesine ekliyor. */
  static dersEkle (Ders ders) {
    tumEklenenDersler.add(ders);
  }

/* ortalamaHesapla adındaki fonksiyon, eklenen derslerin not
ortalamasını hesaplıyor. Dersler üzerinde dönerek her bir
dersin kredi değeri ile harf değerini çarpıp toplam notu
hesaplıyor ve toplam kredi değerini topluyor. Son olarak,
toplam notu toplam krediye bölererek not ortalamasını döndürüyor. */
  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    tumEklenenDersler.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    });
    return toplamNot / toplamKredi;
  }

  /* _tumDerslerinHarfleri adında bir private fonksiyon tanımlanıyor.
  Fonksiyon, geçerli harf notlarını içeren bir liste döndürüyor. */
  static List<String> _tumDerslerinHarfleri(){
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

/* _harfiNotaCevir adındaki fonksiyon, harf notlarını karşılık
gelen not puanlarına çeviriyor. Bir switch ifadesi kullanarak
her harf notu için uygun puanı döndürüyor. */
  static double _harfiNotaCevir(String harf) {
    switch(harf) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.50;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.50;
      case 'CC':
        return 2.00;
      case 'DC':
        return 1.50;
      case 'DD':
        return 1.00;
      case 'FD':
        return 0.50;
      case 'FF':
        return 0;
      default:
      return 4;
    }
  }

  /* tumDerslerinHarfleri adındaki fonksiyon, harf notlarını
  ve bu harf notlarının karşılık geldiği not puanlarını içeren
  bir liste döndürüyor. map fonksiyonuyla her harf notunu alarak,
  DropdownMenuItem widget'ını oluşturuyor ve değer olarak
  _harfiNotaCevir fonksiyonundan dönen puanı atıyor. */
  static List<DropdownMenuItem<double>> tumDerslerinHarfleri(){
    return _tumDerslerinHarfleri()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _harfiNotaCevir(e),
          ),
        )
        .toList();
  }

  /* _tumKrediler adındaki fonksiyon, farklı kredi değerlerini
  içeren bir liste döndürüyor. Burada List.generate fonksiyonu
  kullanılarak 0.5'ten başlayarak 0.5'er artan bir liste
  oluşturuluyor. */
  static List<double> _tumKrediler() {
    return List.generate(20, (index) => (index * 0.5) + 0.5).toList();
  }

  /* tumDerslerinKredileri adındaki fonksiyon, farklı kredi
  değerlerini içeren bir liste döndürüyor. Her bir kredi değeri
  için bir DropdownMenuItem widget'ı oluşturuluyor ve kredi
  değeri double cinsinden atanıyor. */
  static List<DropdownMenuItem<double>> tumDerslerinKredileri(){
    return _tumKrediler()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()
          ),
          value: e.toDouble(),
        ),
      ).toList();
  }

  static double agnoHesapla(double gecmisKrediTop, double gecmisAgno, double donemKrediTop, double ortalama, double agnoSonuc) {
    double agno = (gecmisAgno * gecmisKrediTop + ortalama * donemKrediTop) / (gecmisKrediTop + donemKrediTop);
    return agno;
  }
}

