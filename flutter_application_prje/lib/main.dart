
import 'package:flutter/material.dart';
import 'package:flutter_application_prje/constants/app_constants.dart';
import 'package:flutter_application_prje/widgets/ortalama_hesapla_page.dart';
void main () {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

// Uygulamamın adı
      title: 'Not Otalama Hesaplama',

// theme, Uygulama teması için ayarları içerir.
      theme: ThemeData(

// PrimarySwatch, uygulamanın ana rengini belirtir.
        primarySwatch:Sabitler.anaRenk,

// VisualDensity, adaptif platform yoğunluğunu belirler.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

/* home parametresi, uygulama açıldığında görünen ilk
sayfanın hangi widget olduğunu belirtir. */
      home: OrtalamaHesaplaPage(),
    );
  }
}


