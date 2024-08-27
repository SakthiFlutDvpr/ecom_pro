// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/environments/api_environments.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/dashboard/product_search/search_entity/search_model.dart';
import 'package:sel_org/ui_1/dashboard/product_search/search_event.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';

class SearchBloc extends Bloc<SearchEvent, BaseState> {
  static const String orgid = 'M07';

  SearchBloc() : super(InitialState()) {
    on<SearchQueryEvent>(_searchQuery);
  }

  Future<void> _searchQuery(
      SearchQueryEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    try {
      final response = await fetchSearchData(event.query, orgid);

      emit(SuccessState(successResponse: response));
    } catch (e) {
      emit(ErrorState(errorMessage: 'Failed to load search data: $e'));
    }
  }

  String buildUrl(String query, String orgid) {
    final encodedQuery = Uri.encodeComponent(query);
    final encodedUdf1 = Uri.encodeComponent(orgid);

    return 'https://devapi.selorg.com/v1/home/search?q=$encodedQuery&udf1=$encodedUdf1';
  }

  Future fetchSearchData(String query, String orgid) async {
    try {
      final url = buildUrl(query, orgid);
      debugPrint('Fetching data from URL: $url');
      debugPrint("what's happening");
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        debugPrint('Response data: ${response.data}');
        return response.data;
      } else {
        throw Exception(
            'Failed to load data, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
