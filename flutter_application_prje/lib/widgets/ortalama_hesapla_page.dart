
/* Burada kullanılan çeşitli Flutter paketleri, özel widget'lar ve
diğer bağımlılıkları içe aktarıyoruz. */
import 'package:flutter/material.dart';
import 'package:flutter_application_prje/constants/app_constants.dart';
import 'package:flutter_application_prje/helper/data_helper.dart';
import 'package:flutter_application_prje/model/ders.dart';
import 'package:flutter_application_prje/widgets/agno_page.dart';
import 'package:flutter_application_prje/widgets/ders_listesi.dart';
import 'package:flutter_application_prje/widgets/harf_dropdown_widget.dart';
import 'package:flutter_application_prje/widgets/kredi_dropdown_widget.dart';
import 'package:flutter_application_prje/widgets/ortalama_goster.dart';


/* Bu class uygulamanın ana sayfasını tanımlar. */
class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}


/* Burada, _OrtalamaHesaplaPageState sınıfı başlatılıyor.
Durum değişkenleri ve kullanıcının etkileşimine yanıt olarak
değişebilen widget ağacını oluşturan build metodunu içerir.
Ayrıca, seçilen not değeri, seçilen kredi değeri ve girilen
ders adı için durum değişkenleri içerir. */
class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {

// formKey, form nesnesinin durumunu izlemek için bir anahtar.
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

// secilenHarfDegeri, başlangıçta seçili harf değeri.
  double secilenHarfDegeri = 4;

// secilenKrediDegeri, başlangıçta seçili kredi değeri.
  double secilenKrediDegeri = 1;

// girilenDersAdi, kullanıcının girdiği ders adını tutan bir string.
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {


  /* Scaffold widget'i, temel materyal tasarım yapısını oluşturur.
  appBar kısmı, sayfanın üstünde bir uygulama çubuğu
  (app bar) oluşturur. */
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(197, 241, 225, 245),
        elevation: 0,
        title: Center(
          child: Text(Sabitler.baslikText,
          style: Sabitler.baslikStyle),
        ),
      ),


/* Bu bölüm, sayfanın ana gövdesini oluşturur.
Column widget'i, dikey yönde sıralanan öğeleri gruplar. */
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
// Row, ders ekleme formunu ve ortalama gösterme bölümünü yatay olarak böler.
          Row(
            children: [
              Expanded(
                flex: 2,


/* _buildForm(), özel bir fonksiyon çağrısıyla
ders ekleme formunu oluşturan widget'i döndürür. */
                child: _buildForm(),
          ),
          Expanded(
            flex: 1,


/* ortalamaGoster(), özel bir widget olan ortalamaGoster'ı
çağırarak ortalama gösterme bölümünü oluşturur.
Bu bölüm, ders sayısını ve hesaplanan ortalama notu gösterir. */
            child: ortalamaGoster(
              dersSayisi: DataHelper.tumEklenenDersler.length,
              ortalama: DataHelper.ortalamaHesapla()),
            ),
            //AgnoPage(),
        ],
      ),


/* Expanded, dersleri listeleyen DersListesi widget'ını içerir.
Kullanıcı dersi çıkardığında onElemanCikarildi fonksiyonu çalışır. */
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {
                  
                });
              },
            ),
          ),


/* Bu widget, yükseltilmiş bir düğmeyi temsil eder.
Kullanıcı bu düğmeye tıkladığında belirli bir işlem gerçekleşir.
Aşağıda, düğmeye tıklanmasıyla bir sonraki sayfaya geçiş işlemi gerçekleştirilir. */      
            ElevatedButton(


/* Bu özellik, düğmeye tıklandığında çalışacak işlevi belirtir.
Burada, Navigator.push yöntemi kullanılarak bir sayfa geçişi gerçekleştirilir.
Bu yöntem, geçiş yapılacak sayfanın rotası belirtilerek kullanılır. */
              onPressed: () {
                Navigator.push(
                  context,


/* Bu, sayfa geçiş animasyonları gibi yönlendirme işlemlerini kolaylaştıran bir sınıftır.
builder işlevi, yeni sayfanın nasıl oluşturulacağını belirtir.
Burada AgnoPage() widget'i kullanılarak yeni bir AgnoPage sayfası oluşturulur. */
                  MaterialPageRoute(builder: (context) => AgnoPage()
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(197, 241, 225, 245),
              ),


/* Bu özellik, düğme içinde görüntülenecek widget'ı belirtir.
Burada bir Text widget'ı kullanılarak düğme üzerine metin eklenir.
Metin rengi, ağırlığı gibi stil özellikleri de belirlenir. */
              child: const Text('AGNO hesaplamak için tıklayınız',
              style: TextStyle(
                color: Sabitler.anaRenk,
                fontWeight: FontWeight.w900,
              ),),
            ),
        ],
      ),
    );
  }
  

/* Bu metot, çeşitli form alanlarını ve widget'ları içeren bir
Form widget'ını döndürür. Kullanıcılara ders adını girmeleri
için bir metin giriş alanı, not ve kredi seçimi için açılır
menüler ve ders eklemek ve GPA hesaplamak için bir
simge düğmesi içerir */
  Widget _buildForm() {


/* Form, form nesnesini temsil eder ve formKey anahtarını
kullanarak formun durumunu takip eder. */
    return Form(
      key: formKey,


/* Column, dikey olarak sıralanan widget'ları gruplar.
Bu sütun içindeki öğeler, ders ekleme formunun içeriğini oluşturur. */
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,


/* _buildTextFormField(): Özel bir fonksiyon çağrısıyla, ders adını
girilmesini sağlayan TextFormField widget'ını döndürür. */
            child: _buildTextFormField(),
          ),

// SizedBox boş bir alan ekler, formun elemanları arasında bir boşluk bırakır.
          SizedBox(
            height: 5,
          ),

/* Row, ders adı, harf notu ve kredi seçeneklerinin 
yatay olarak sıralandığı bir satır oluşturur. */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


/* Expanded, harf notu seçeneklerini içeren HarfDropdownWidget'ı
içerir. Kullanıcı harf notu seçtiğinde onHarfSecildi fonksiyonu
çalışır ve seçilen harf notu değeri güncellenir. */
              Expanded(
                child:Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDegeri = harf;
                    },
                  ),
                ),
              ),


/* Expanded, kredi seçeneklerini içeren KrediDropdownWidget'ı
içerir. Kullanıcı kredi seçtiğinde onKrediSecildi fonksiyonu çalışır
ve seçilen kredi değeri güncellenir. */
              Expanded(
                child:Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKrediDegeri = kredi;
                    }
                  ),
                ),
              ),


/* IconButton, ders eklemeyi ve ortalama hesaplamayı tetikleyen
bir ok işareti ikonu içeren düğmeyi temsil eder. onPressed
özelliğiyle tıklama işlemini yönlendirir. */
              IconButton(
                  onPressed: _dersEkleveOrtalamaHesapla, 
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color:  Color.fromARGB(255, 5, 128, 204),
                iconSize: 30,
              ),
            ],
          ),

// SizedBox, son olarak, formun altındaki bir boşluk ekler.
        SizedBox(height: 10),
        ],
      ),
    );
  }
  

/* Bu metot, kullanıcıların ders adını girebilmeleri
için bir TextFormField widget'ını döndürür. Ayrıca,
bir ders adı sağlandığından emin olmak için geçerlilik
mantığı içerir. */
  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if(s!.length <= 0) {
          return 'Ders adını giriniz';
        }
        else
        return null;
      },
    decoration: InputDecoration(
      hintText: 'Matematik',
      border: OutlineInputBorder(
        borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }


/* Bu metot, simge düğmesine basıldığında çağrılır.
Formu doğrular, girilen veriyi kaydeder,
bir Ders nesnesi oluşturur, bunu ders listesine ekler
ve ardından setState ile bir arayüz güncellemesini tetikler. */
  void _dersEkleveOrtalamaHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers = Ders(
        ad: girilenDersAdi,
        harfDegeri: secilenHarfDegeri,
        krediDegeri: secilenKrediDegeri
      );
      DataHelper.dersEkle(eklenecekDers);
      setState(() {
        
      });
    }
  }
}


