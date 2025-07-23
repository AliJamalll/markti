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


