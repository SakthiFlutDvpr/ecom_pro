import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';

abstract class ProductEvent {}

class AddProductEvent extends ProductEvent {
  ProductModel? productModel;

  AddProductEvent(this.productModel);
}

class VarientChangeEvent extends ProductEvent {
  Varient? varient;

  VarientChangeEvent(this.varient);
}

class ProductClickedEvent extends ProductEvent {
  ProductClickedEvent();
}

class ProductIncreamentEvent extends ProductEvent {
  ProductIncreamentEvent();
}

class ProductDecreamentEvent extends ProductEvent {
  ProductDecreamentEvent();
}
