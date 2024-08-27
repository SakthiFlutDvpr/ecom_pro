abstract class SubCategoryEvent {}

class SubCategoryFetchEvent extends SubCategoryEvent {}

class ProductFetchEvent extends SubCategoryEvent {}

class ValueChangingEvent extends SubCategoryEvent {
  final int value;

  ValueChangingEvent(this.value);
}
