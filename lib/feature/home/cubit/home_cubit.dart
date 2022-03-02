import 'package:bloc/bloc.dart';
import 'package:bloc_mvvm_hwa/feature/home/model/product_model.dart';
import 'package:bloc_mvvm_hwa/feature/home/service/IHomeService.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(const HomeState(items: [])) {
    fetchAllItems();
  }
  final IHomeService homeService;

  void fetchAllItems() async {
    _toggleLoading();
    final response = await homeService.fetchAllProducts();
    emit(state.copyWith(items: response ?? []));
    _toggleLoading();
  }

  void fetchAllCategories() async {
    final response = await homeService.fetchAllCategories();
    emit(state.copyWith(categories: response));
  }

  void _toggleLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
