import 'dart:ui';

import 'models/product_model.dart';

class HomeMocks {
  //----

  static List<ProductModel> products = [
    ProductModel(
      id: '1',
      img: 'sneaker_01.png',
      brand: 'Nike',
      name: 'Zoom 1',
      price: '150',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      sizes: [10, 11, 12, 13, 14],
      color: const Color(0xff6390DD),
    ),
    ProductModel(
      id: '2',
      img: 'sneaker_02.png',
      brand: 'Nike',
      name: 'Zoom 2',
      price: '200',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      sizes: [10, 11, 12, 13, 14],
      color: const Color(0xff7D749D),
    ),
    ProductModel(
      id: '3',
      img: 'sneaker_03.png',
      brand: 'Nike',
      name: 'Zoom 1',
      price: '99',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      sizes: [10, 11, 12, 13, 14],
      color: const Color(0xff253F4F),
    ),
    ProductModel(
      id: '4',
      img: 'sneaker_04.png',
      brand: 'Nike',
      name: 'Dynamic 1',
      price: '199',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      sizes: [10, 11, 12, 13, 14],
      color: const Color(0xff273C86),
    )
  ];

  static const Map<String, String> brands = {
    '1': "Nike",
    '2': "Addidas",
    '3': "Jordan",
    '4': "Puma",
    '5': "Reebok",
  };

  static const Map<String, String> productType = {
    'upcoming': "Upcoming",
    'featured': "Featured",
    'new': "New",
  };
}
