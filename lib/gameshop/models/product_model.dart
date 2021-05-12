class Product {
  final int id, score;
  final String name, image;
  final double price;

  Product(this.id, this.score, this.name, this.image, this.price);

  Product.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.price = json['price'],
        this.score = json['score'],
        this.image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'score': score,
        'image': image,
      };
}
