import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

//state
abstract class ThemeState extends Equatable {
  @override
  List<Object> get props => [];
}

class LightThemeState extends ThemeState {}

class DarkThemeState extends ThemeState {}

//Event
abstract class ThemeEvent {}

class DarkThemeEvent extends ThemeEvent {}

class LightThemeEvent extends ThemeEvent {}

//ThemeBloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(DarkThemeState()) {
    on<DarkThemeEvent>((event, emit) async {
      emit(DarkThemeState());
    });
    on<LightThemeEvent>((event, emit) async {
      emit(LightThemeState());
    });
  }
}
