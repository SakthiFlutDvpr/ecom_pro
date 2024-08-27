import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitialEvent extends SearchEvent {
  final BuildContext context;

  const SearchInitialEvent(this.context);

  @override
  List<Object> get props => [context];
}

class SearchQueryEvent extends SearchEvent {
  final String query;

  const SearchQueryEvent(this.query);

  @override
  List<Object> get props => [query];
}
