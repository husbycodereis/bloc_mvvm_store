part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.items,
    this.selectedItems,
    this.isLoading,
    this.categories,
    this.isInitial = false,
    this.pageNumber,
  });

  final List<ProductModel>? items;
  final List<ProductModel>? selectedItems;
  final bool? isLoading;
  final List<String>? categories;
  final bool isInitial;
  final int? pageNumber;

  @override
  List<Object?> get props => [items, isLoading, categories, pageNumber, selectedItems];

  HomeState copyWith({
    List<ProductModel>? items,
    List<ProductModel>? selectedItems,
    bool? isLoading,
    List<String>? categories,
    bool? isInitial,
    int? pageNumber,
  }) {
    return HomeState(
      items: items ?? this.items,
      selectedItems: selectedItems ?? this.selectedItems,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      isInitial: isInitial ?? this.isInitial,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }
}
