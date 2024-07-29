import 'package:shop/models/product.dart';
import 'package:uuid/uuid.dart';

List<Product> MOCK_PRODUCTS_DATA = [
  Product(
    id: const Uuid().v4(),
    title: 'Red Shirt',
    description: 'A red shirt - it is pretty red!',
    price: 29.99,
    imageUrl: ProductImage.redShirt(),
  ),
  Product(
    id: const Uuid().v4(),
    title: 'Trousers',
    description: 'A nice pair of trousers.',
    price: 59.99,
    imageUrl: ProductImage.trousers(),
  ),
  Product(
    id: const Uuid().v4(),
    title: 'Yellow Scarf',
    description: 'Warm and cozy - exactly what you need for the winter.',
    price: 19.99,
    imageUrl: ProductImage.yellowscarf(),
  ),
  Product(
    id: const Uuid().v4(),
    title: 'A Pan',
    description: 'Prepare any meal you want.',
    price: 49.99,
    imageUrl: ProductImage.pan(),
  ),
];

enum ProductImage {
  redShirt(
    "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
  ),
  trousers(
    "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg",
  ),
  yellowscarf(
    "https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg",
  ),
  pan(
    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg",
  );

  final String imageUrl;
  const ProductImage(this.imageUrl);

  String call() => imageUrl;
}
