part of 'main_layout_cubit.dart';

@immutable
sealed class MainLayoutState {}

final class MainLayoutInitial extends MainLayoutState {}

/// Theme Toggle States
final class toggleToLight extends MainLayoutState {}
final class toggleToDark extends MainLayoutState {}

/// Get Products States
final class getProductsLoading extends MainLayoutState {}
final class getProductsSuccess extends MainLayoutState {
  final MainLayoutResponseEntity mainLayoutResponseEntity;

  getProductsSuccess({required this.mainLayoutResponseEntity});
}
final class getProductsFailure extends MainLayoutState {
  final String errorMessage;

  getProductsFailure({required this.errorMessage});
}

/// Get Categories States
final class getCategoryLoading extends MainLayoutState {}
final class getCategorySuccess extends MainLayoutState {
  final CategoryResponseEntity categoryResponseEntity;

  getCategorySuccess({required this.categoryResponseEntity});
}
final class getCategoryError extends MainLayoutState {
  final String errorMessage;

  getCategoryError({required this.errorMessage});
}

///get all brands
final class getBrandsLoading extends MainLayoutState {}
final class getBrandsSuccess extends MainLayoutState {
  final BrandResponseEntity brandResponseEntity;

  getBrandsSuccess({required this.brandResponseEntity});
}
final class getBrandsError extends MainLayoutState {
  final String errorMessage;

  getBrandsError({required this.errorMessage});
}

