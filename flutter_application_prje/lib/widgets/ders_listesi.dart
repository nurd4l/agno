
import 'package:flutter/material.dart';
import 'package:flutter_application_prje/constants/app_constants.dart';
import 'package:flutter_application_prje/helper/data_helper.dart';
import 'package:flutter_application_prje/model/ders.dart';

/* DersListesi widget'ı, derslerin listelendiği bir bileşen oluşturmak için
kullanılacak. onElemanCikarildi adında bir fonksiyon parametresi alıyor ve
bu fonksiyon, bir öğe listeden çıkarıldığında çağrılacak. */
class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi, Key? key}) : super(key: key);


/* build metodunda, widget'ın görüntüsünü oluşturuyoruz. DataHelper.tumEklenenDersler
listesini tumDersler adında bir değişkende saklıyoruz. */
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;


/* Burada, bir koşul kullanılarak, eğer tumDersler listesinde eleman varsa bir
ListView.builder döndürülüyor. Bu builder, listedeki her bir ders öğesi için
bir öğe oluşturur. Her öğe, Dismissible widget'ı ile saran bir Card içinde yer
alır. */
      return tumDersler.length > 0 ? ListView.builder(
        itemCount: tumDersler.length,
        itemBuilder: (context, index){

/* Dismissible widget'ı, öğelerin kaydırılarak silinebilmesini sağlar.
key parametresi, widget'ın benzersiz bir anahtara sahip olmasını sağlar.
onDismissed parametresi, öğe silindiğinde çağrılacak fonksiyonu belirtir.
direction parametresiyle silme işleminin yönü belirlenir. */
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (a) {
              onElemanCikarildi(index);
            },

// Padding, öğenin içeriğini etrafında boşluk bırakarak saran bir widget'dır.
            child: Padding(
              padding: const EdgeInsets.all(2.0),

/* Card, materyal tasarım diline uygun bir kart öğesi oluşturur.
İçerisinde ListTile bulunur. 
ListTile: Listelenen öğenin içeriğini temsil eder.
Başlık, alt başlık ve önde bir simge veya öğe oluşturabilir. */
              child: Card(
                child: ListTile(
                title: Text(tumDersler[index].ad),
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 232, 204, 245),
                  child: Text(
                      (tumDersler[index].harfDegeri *
                      tumDersler[index].krediDegeri)
                    .toStringAsFixed(0)
                ),
              ),
                subtitle: Text(
                  '${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}'),
              ),
            ),
          ),
        );
      }
    ):

/* Bu bölüm, eğer tumDersler listesi boşsa, kullanıcıya "Lütfen ders ekleyin" mesajını
içeren bir Container widget'ı döndürür. Center widget'ı içinde bulunan Text, mesajı
ve stilini belirtir. */
      Container(
        child: Center(
          child: Text
          ('Lütfen ders Ekleyin', style: Sabitler.baslikStyle,
          ),
      ),
    );
  }
}


