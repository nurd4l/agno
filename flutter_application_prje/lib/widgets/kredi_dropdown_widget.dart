
import 'package:flutter/material.dart';
import 'package:flutter_application_prje/constants/app_constants.dart';
import 'package:flutter_application_prje/helper/data_helper.dart';

/* KrediDropdownWidget adında bir StatefulWidget sınıfı tanımlanıyor.
Bu widget, kredi değerlerinin seçilebildiği bir açılır menü oluşturmak
için kullanılacak. onKrediSecildi adında bir fonksiyon parametresi alıyor
ve bu fonksiyon, kredi seçildiğinde çağrılacak. */
class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdownWidget({required this.onKrediSecildi, Key? key}) : super(key: key);


// Widget'ın durumunu yöneten sınıfın oluşturulmasını sağlayan metod.
  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

/* _KrediDropdownWidgetState adında bir sınıf tanımlanıyor.
Sınıf, widget'ın durumunu tutacak ve güncelleyecek.
secilenKrediDegeri adında bir değişken tanımlanıyor ve başlangıçta
1 değeri atanıyor. */
class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDegeri = 1;


/* build metodu, widget'ın arayüzünü oluşturuyor.
Bir Container içinde bulunan öğelerle widget'ı şekillendiriyor. */
  @override
  Widget build(BuildContext context) {
    return Container(

// alignment, içerikleri ortalamak için kullanılır.
      alignment: Alignment.center,

// padding, widget'ın içeriğinin etrafında boşluk bırakır.
      padding: Sabitler.dropDownPadding,

/* decoration: Container'ın görünümünü şekillendirmek için kullanılır.
Arkaplan rengi ve kenar yuvarlatmasını belirliyor. */
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),

// DropdownButton widget'ı, kredi değerlerini seçmek için kullanılır.
    child: DropdownButton<double>(

// value, başlangıçta seçili kredi değerinin değeri.
      value: secilenKrediDegeri,

// elevation, açılır menünün gölge efekti.
      elevation: 16,

// iconEnabledColor, açılır menüdeki simgenin rengi.
      iconEnabledColor: const Color.fromARGB(255, 1, 2, 10),

// onChanged, kredi değeri seçildiğinde çalışacak fonksiyon.
      onChanged: (deger){
        setState(() {
          secilenKrediDegeri = deger!;
          widget.onKrediSecildi(secilenKrediDegeri);
        });
      },

// underline, açılır menüde alt çizginin görünmemesi için kullanılır.
      underline: Container(),

// items, açılır menüde görüntülenecek kredi değerleri listesi.
      items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}

