import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/cubit/order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryState.initial());

  void changeFilter(OrderFilter filter) {
    emit(state.copyWith(filter: filter));
  }

  void search(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}
