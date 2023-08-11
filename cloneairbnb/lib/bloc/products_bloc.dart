// import 'dart:async';
//
// import 'package:airbnbtest/model/products.dart';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'products_event.dart';
//
// part 'products_state.dart';

import 'package:airbnbtest/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../products.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    final ProductsRepository _productsRepository = ProductsRepository();
    on<GetProducts>(
      (event, emit) async {
        try {
          emit(ProductsLoading());
          final productsList = await _productsRepository.getListProducts();
          emit(ProductsLoaded(productsList));
        } catch (e) {
          emit(ProductsError(e.toString()));
        }
      },
    );
  }
}
