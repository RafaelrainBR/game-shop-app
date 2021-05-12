import 'package:flutter/material.dart';
import 'package:gameshop/app/modules/dashboard/basket/basket_store.dart';
import 'package:gameshop/shared/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget(
      {Key? key,
      required this.size,
      required this.product,
      required this.basketStore})
      : super(key: key);

  final BasketStore basketStore;
  final Product product;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: size.height * 0.3,
          width: size.width * 0.3,
          decoration: BoxDecoration(
            color: Colors.white54,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: Theme.of(context).primaryColor.withOpacity(0.23),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              /*Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),*/
              Expanded(
                child: Image.asset(
                  "assets/images/${product.image}",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      "${product.name}",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "R\$${product.price}",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              basketStore.addProduct(product);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    "Você adicionou o jogo ${product.name} ao seu carrinho."),
                              ));
                            },
                            child: Text("Comprar"),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
