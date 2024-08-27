import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/category_entity/category_models.dart';

import 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, BaseState> {
  CategoryBloc() : super(InitialState()) {
    on<CategoryPageContent>(loadInitialContent);
  }

  final List<Datum> dummyData = [
    Datum(
      categoryCode: 'V01',
      categoryDesc: 'Vegetables',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Vegetables.png',
      sort: 3,
    ),
    Datum(
      categoryCode: 'GR1',
      categoryDesc: 'GROCERIES',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/Groceries.png',
      sort: 2,
    ),
    Datum(
      categoryCode: 'FV1',
      categoryDesc: 'FRUITS & VEGETABLES',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/Fruits_Vegetables.png',
      sort: 1,
    ),
    Datum(
      categoryCode: 'OIL',
      categoryDesc: 'OIL',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Oil.png',
      sort: 9,
    ),
    Datum(
      categoryCode: 'BEV',
      categoryDesc: 'BEVERAGES',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Beverages.png',
      sort: 15,
    ),
    Datum(
      categoryCode: 'GP1',
      categoryDesc: 'GRAINS & PULSES',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Grains_Pulses.png',
      sort: 4,
    ),
    Datum(
      categoryCode: 'FF1',
      categoryDesc: 'FRESH FRUITS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Fruits.png',
      sort: 1,
    ),
    Datum(
      categoryCode: 'DFN1',
      categoryDesc: 'DRY FRUITS & NUTS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Dry_Fruits_Nuts.png',
      sort: 6,
    ),
    Datum(
      categoryCode: 'LHS',
      categoryDesc: 'LEAFY, HERBS & SEASONING',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Leafy_Herbs_Seasonings.png',
      sort: 17,
    ),
    Datum(
      categoryCode: 'MP1',
      categoryDesc: 'MASALAS & POWDERS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Masalas_Powders.png',
      sort: 12,
    ),
    Datum(
      categoryCode: 'DBS',
      categoryDesc: 'DAIRY, BREADS & SPREADS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Fruits.png',
      sort: 20,
    ),
    Datum(
      categoryCode: 'ATF1',
      categoryDesc: 'ATTAS & FLOURS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Attas_Flours.png',
      sort: 11,
    ),
    Datum(
      categoryCode: 'CES',
      categoryDesc: 'CLEANING ESSENTIALS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Fruits.png',
      sort: 21,
    ),
    Datum(
      categoryCode: 'GCO',
      categoryDesc: 'Grocery',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Fruits.png',
      sort: 22,
    ),
    Datum(
      categoryCode: 'DAL',
      categoryDesc: 'DAL',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Dal.png',
      sort: 5,
    ),
    Datum(
      categoryCode: 'SE1',
      categoryDesc: 'SEEDS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Seeds.png',
      sort: 7,
    ),
    Datum(
      categoryCode: 'VCO',
      categoryDesc: 'VEGETABLE COMBO',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Fruits.png',
      sort: 24,
    ),
    Datum(
      categoryCode: 'SAL',
      categoryDesc: 'SALT',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Salts.png',
      sort: 18,
    ),
    Datum(
      categoryCode: 'ML1',
      categoryDesc: 'MILLETS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Millets.png',
      sort: 3,
    ),
    Datum(
      categoryCode: 'WSS',
      categoryDesc: 'WHOLES, SPICES & SEASONING',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Whole_Spices_Seasoning.png',
      sort: 8,
    ),
    Datum(
      categoryCode: 'GHE',
      categoryDesc: 'GHEE',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Ghee.png',
      sort: 13,
    ),
    Datum(
      categoryCode: 'F01',
      categoryDesc: 'Fruits',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Fruits.png',
      sort: 19,
    ),
    Datum(
      categoryCode: 'HSP',
      categoryDesc: 'HONEY & SPREADS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Honey_Spreads.png',
      sort: 14,
    ),
    Datum(
      categoryCode: 'RC1',
      categoryDesc: 'RICE & CEREALS',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Rice_Cereals.png',
      sort: 2,
    ),
    Datum(
      categoryCode: 'SJ1',
      categoryDesc: 'SUGAR & JAGGERY',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Sugar_Jaggery.png',
      sort: 10,
    ),
    Datum(
      categoryCode: 'FVE',
      categoryDesc: 'FRESH VEGETABLES',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Vegetables.png',
      sort: 16,
    ),
    Datum(
      categoryCode: 'FCO',
      categoryDesc: 'Fruit Combo',
      image:
          'https://selorg-sku.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Fruits.png',
      sort: 23,
    ),
  ];

  FutureOr<void> loadInitialContent(
      CategoryPageContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1), () {
      emit(SuccessState(successResponse: dummyData));
    });
  }
}
