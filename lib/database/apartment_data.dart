import 'package:flutter/material.dart';

class ApartmentData {
  final List<String> imageUrl;
  final String title;
  final String description;
  final String comment;
  final String city;
  final String address;
  final double rating;
  final int price;
  bool isNetwork;
  bool isFavorite;

  ApartmentData( 
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.comment,
      required this.city,
      required this.address,
      required this.rating,
      required this.price,
      this.isFavorite = false,
      this.isNetwork = true,
    });
}

ValueNotifier<List<ApartmentData>> apartments = ValueNotifier<List<ApartmentData>>([
  ApartmentData(
    imageUrl: [
      'https://alaps-photos-kr.kcdn.kz/webp/e2/e298a283-aa01-4e16-ad98-9dfcd07319b3/4-full.webp',
      'https://alaps-photos-kr.kcdn.kz/webp/e2/e298a283-aa01-4e16-ad98-9dfcd07319b3/6-750x470.webp',
      'https://alaps-photos-kr.kcdn.kz/webp/e2/e298a283-aa01-4e16-ad98-9dfcd07319b3/2-750x470.webp',
      'https://alaps-photos-kr.kcdn.kz/webp/e2/e298a283-aa01-4e16-ad98-9dfcd07319b3/21-750x470.webp'
    ],
    description: '''
🌟Сдаётся новая квартира в ЖК Элит Класа 

🛋️Диван раскладывается 
🏔️Чистый горный воздух 
🪵На полу качественный паркет 
🌳Большая терраса на первом этаже 
🚰Фильтр для воды 
🪜Высокие потолки 
🅿️Имеется подземный паркинг 
Вся необходимая бытовая техника''',
    comment: 'Comment',
    title: 'Luxury Park',
    city: 'Алматы',
    address: 'Тайманова 224Б',
    rating: 4.8,
    price: 20000,
  ),
  ApartmentData(
      imageUrl: [
        'https://alaps-photos-kr.kcdn.kz/webp/be/be7f9771-ac10-47ec-89a4-a4d01f586f39/44-750x470.webp',
        'https://alaps-photos-kr.kcdn.kz/webp/be/be7f9771-ac10-47ec-89a4-a4d01f586f39/41-750x470.webp',
        'https://alaps-photos-kr.kcdn.kz/webp/be/be7f9771-ac10-47ec-89a4-a4d01f586f39/12-750x470.webp',

      ],
      title: 'Koktobe city',
      description: '''
ЖК КОКТОБЕ- СИТИ. Дом бизнес Класса. Высота потолков 3 метра. 
* Надежный сейсмостойкий дом 9 БАЛЛОВ. 
* В квартира выполнен дизайнерский ремонт который был выполнен ДЛЯ СОБСТВЕННОГО ПРОЖИВАНИЯ, НЕ ПОД СДАЧУ В АРЕНДУ, каждый квадратный метр продуман до мелочей. Использовали исключительно дорогие и качественные материалы. 
* Два санузла, один гостевой, второй в мастер спальне с ванной. 
* Имеется открытый балкон с прекрасным видом и также имеется собственная терраса на крыше. 
* В квартире есть гардеробная комната с зеРКалом во весь рост, а также много шкафов для хранения веще''',
      comment: 'Comment',
      city: 'Астана',
      address: 'Сагадат Нурмагамбетова 142/6 ',
      rating: 4.9,
      price: 30000,
      
    )
]);
