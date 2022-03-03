import 'package:bloc/bloc.dart';
import 'package:bloc_mvvm_hwa/feature/home/model/product_model.dart';
import 'package:bloc_mvvm_hwa/feature/home/service/IHomeService.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int pageNumber = 1;
  HomeCubit(this.homeService) : super(const HomeState(items: [])) {
    initHome();
  }

  Future<void> initHome() async {
    await Future.microtask(() => emit(const HomeState(isInitial: true)));
    await Future.wait([fetchAllItems(), fetchAllCategories()]);
  }

  void scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > scrollController.position.maxScrollExtent) {
        fetchNewItems();
      }
    });
  }

  void selectedCategories(String data) {
    emit(state.copyWith(selectedItems: state.items?.where((element) => element.category == data).toList()));
  }

  Future<void> fetchNewItems() async {
    if (state.isLoading ?? false) {
      return;
    }
    pageNumber++;
    _toggleLoading();
    final response = await homeService.fetchAllProducts(count: pageNumber * 5);
    _toggleLoading();
    emit(state.copyWith(items: response, pageNumber: pageNumber));
  }

  final IHomeService homeService;
  ScrollController scrollController = ScrollController();

  Future<void> fetchAllItems() async {
    _toggleLoading();
    final response = await homeService.fetchAllProducts();
    emit(state.copyWith(items: response ?? []));
    _toggleLoading();
  }

  Future<void> fetchAllCategories() async {
    final response = await homeService.fetchAllCategories();
    emit(state.copyWith(categories: response));
  }

  void _toggleLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
