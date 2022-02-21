import 'package:bloc/bloc.dart';
import 'package:osp/di/db/database.dart';
import 'package:osp/di/db/models/building.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:osp/di/di.dart';

part 'home_bloc.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.loaded({
    required List<Building> buildings,
  }) = HomeStateLoaded;
}

class HomeBloc extends Cubit<HomeState>{
  final database = getIt<BuildingsDatabase>();

  HomeBloc() : super(const HomeState.loading());

  Future<void >initialize() async {
    emit(const HomeState.loading());
    var buildings = await database.readAllBuildings();
     emit(HomeState.loaded(buildings: buildings));
  }


}