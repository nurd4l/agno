
/* Bu kısım uygulamanın giriş noktasını oluşturuyor.
flutter/material.dart ve iki ayrı dosya
(app_constants.dart ve data_helper.dart) içeri aktarılıyor.
main fonksiyonunda runApp fonksiyonu kullanılarak uygulama
başlatılıyor ve ana ekran AgnoPage sınıfı ile tanımlanıyor. */
import 'package:flutter/material.dart';
import 'package:flutter_application_prje/constants/app_constants.dart';
import 'package:flutter_application_prje/helper/data_helper.dart';

void main() {
  runApp(const MaterialApp(home: AgnoPage()));
}

/* Bu değişkenler, hesaplamalarda kullanılacak sayısal değerleri
saklamak için kullanılıyor. Başlangıçta hepsi sıfıra eşitleniyor. */
double gecmisKrediTop = 0.0;
double gecmisAgno = 0.0;
double donemKrediTop = 0.0;
double ortalama = 0.0;
double agno1=0.0;


/* Bu sınıf, AGNO hesaplaması ekranının ana yapısını temsil ediyor.
StatefulWidget sınıfını genişletiyor ve ayrıca içindeki durumu
tutacak alt sınıfını döndürüyor. */
class AgnoPage extends StatefulWidget {
  const AgnoPage({Key? key}) : super(key: key);

  @override
  State<AgnoPage> createState() => _AgnoPageState();
}

/* Bu _AgnoPageState sınıfı, AGNO hesaplama ekranının durumunu yönetiyor.
_formKey, formun durumunu takip etmek için kullanılan bir anahtar,
diğer değişkenler ise kullanıcının girdilerini tutmak için metin düzenleyici
denetimcilerini (TextEditingController) temsil ediyor. */
class _AgnoPageState extends State<AgnoPage> {
  final _formKey = GlobalKey<FormState>();
  double agnoSonuc = 0.0;
  String gecmisKrediController = "";
  TextEditingController gecmisAgnoController = TextEditingController();
  TextEditingController donemKrediController = TextEditingController();
  TextEditingController ortalamaController = TextEditingController();


/* Scaffold widget'ı, uygulamanın temel yapısını oluşturur.
Bu kısımda uygulama çubuğu (app bar) ayarlanıyor.
Başlık rengi ve arkaplan rengi değiştiriliyor. */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE8CCF5),
          title: const Text(
            'AGNO Hesaplama',
            style: TextStyle(
              color: Sabitler.anaRenk,
            ),
          ),
          centerTitle: true,
        ),

/* SingleChildScrollView, ekran küçük olduğunda içeriğin kaydırılmasını sağlar.
Padding içine alınan Form, form alanını oluşturur.
Column içinde sütun düzeninde widget'lar eklenir. */
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [


/* SizedBox, diğer widget'lar arasına boşluk ekler.
TextFormField kullanıcının geçmiş dönem kredi toplamını girmesini sağlar.
Klavye tipini sayısal olarak belirler.
onChanged, değer değiştiğinde bu fonksiyonu çalıştırır ve
gecmisKrediTop değişkenini günceller. */
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Geçmiş Dönemlerin Kredi Toplamı'),
                    onChanged: (value) {
                      gecmisKrediTop = double.tryParse(value) ?? 0;
                    },
                  ),

// Benzer şekilde, bu alan kullanıcının geçmiş dönem AGNO'sunu girmesini sağlar.
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'AGNO'),
                    onChanged: (value) {
                      gecmisAgno = double.tryParse(value) ?? 0;
                    },
                  ),

// Bu alan, kullanıcının mevcut dönem kredi toplamını girmesine izin verir.
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Dönem Krediler Toplamı'),
                    onChanged: (value) {
                      donemKrediTop = double.tryParse(value) ?? 0;
                    },
                  ),

/* Bu alandaki TextFormField, kullanıcının mevcut dönem ortalama notunu girmesini sağlar.
Bu alanda, DataHelper.ortalamaHesapla() fonksiyonu kullanılarak ortalamanın hesaplandığı
varsayılmaktadır. */ 
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText:
                            'Dönem Ortalaması ${DataHelper.ortalamaHesapla().toStringAsFixed(2)}'),
                    onChanged: (value) {
                      ortalama = double.tryParse(value) ?? 0;
                    },
                  ),

// Bu buton, hesaplama yapmak için kullanılır. onPressed olayı, butona tıklanıldığında çalışacak
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        
                      });
                      debugPrint(
                        "gecmisKrediTop: $gecmisKrediTop \n gecmisAgno:$gecmisAgno \n donemKrediTop: $donemKrediTop \n ortalama: $ortalama \n agnoSonuc: $agnoSonuc");
                      agno1 = DataHelper.agnoHesapla(gecmisKrediTop, gecmisAgno, donemKrediTop, ortalama, agnoSonuc);
                      debugPrint("agno1: $agno1");
                    },
                    child: const Text(
                      'Tamam',
                    ),
                  ),
                  SizedBox(height: 16),
                  (agno1!=0.0)?Text('AGNO = $agno1'):Text(''),
                ],
              )
            ),
          )
        )
      );
  }
}


