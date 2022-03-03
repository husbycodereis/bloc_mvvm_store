import 'package:bloc_mvvm_hwa/feature/home/cubit/home_cubit.dart';
import 'package:bloc_mvvm_hwa/feature/home/service/home_service.dart';
import 'package:bloc_mvvm_hwa/product/constant/application_constant.dart';
import 'package:bloc_mvvm_hwa/product/network/product_network_manager.dart';
import 'package:bloc_mvvm_hwa/product/widget/loading_center.dart';
import 'package:bloc_mvvm_hwa/product/widget/product_card.dart';
import 'package:bloc_mvvm_hwa/product/widget/product_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(HomeService(ProductNetworkManager())),
      child: Scaffold(
          appBar: AppBar(
            title: dropdownProject(),
            centerTitle: false,
            actions: [_loadingCenter()],
          ),
          body: buildListView()),
    );
  }

  Widget dropdownProject() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ProductDropdownWidget(
          items: state.categories ?? [],
          onSelected: (categories) {
            context.read<HomeCubit>().selectedCategories(categories);
          },
        );
      },
    );
  }

  Widget buildListView() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isInitial) {
          context.read<HomeCubit>().scrollListener();
        }
      },
      builder: (context, state) {
        return ListView.builder(
            controller: context.read<HomeCubit>().scrollController,
            itemCount: state.items?.length ?? kZero.toInt(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  state.items.isNotNullOrEmpty && index == state.items!.length - 1
                      ? const LoadingCenter()
                      : const SizedBox.shrink(),
                  ProductCard(model: state.items?[index]),
                ],
              );
            });
      },
    );
  }

  Widget _loadingCenter() {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? kOne : kZero,
          duration: context.durationLow,
          child: const LoadingCenter(),
        );
      },
    );
  }
}
