part of 'order_details_bloc.dart';

sealed class OrderDetailsState extends Equatable {
  const OrderDetailsState();
  
  @override
  List<Object> get props => [];
}

final class OrderDetailsInitial extends OrderDetailsState {}
