
import 'package:flutter/material.dart';
import 'package:flutter_application_prje/constants/app_constants.dart';
import 'package:flutter_application_prje/helper/data_helper.dart';

/* HarfDropdownWidget adında bir StatefulWidget sınıfı tanımlanıyor.
Bu widget, harf notlarının seçilebildiği bir açılır menü oluşturmak
için kullanılacak. onHarfSecildi adında bir fonksiyon parametresi alıyor
ve bu fonksiyon, harf seçildiğinde çağrılacak. */
class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({required this.onHarfSecildi, Key? key}) : super(key: key);


/* Widget'ın durumunu yöneten sınıfın oluşturulmasını sağlayan bir metoddur. */
  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

/* _HarfDropdownWidgetState adında bir sınıf tanımlanıyor.
Bu sınıf, widget'ın durumunu tutacak ve güncelleyecek.
secilenHarfDegeri adında bir değişken tanımlanıyor ve başlangıçta
100 değeri atanıyor. */
class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;


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

// DropdownButton widget'ı, harf notlarını seçmek için kullanılır.
      child: DropdownButton<double>(

// value, başlangıçta seçili harf notunun değeri.
        value: secilenHarfDegeri,

// elevation, açılır menünün gölge efekti.
        elevation: 16,

// iconEnabledColor, açılır menüdeki simgenin rengi.
        iconEnabledColor: const Color.fromARGB(255, 1, 2, 10),

// onChanged, harf notu seçildiğinde çalışacak fonksiyon.
        onChanged: (deger){
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onHarfSecildi(secilenHarfDegeri);
          }
        );
      },

// underline, açılır menüde alt çizginin görünmemesi için kullanılır.
      underline: Container(),

// items, açılır menüde görüntülenecek harf notları listesi.
      items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}

