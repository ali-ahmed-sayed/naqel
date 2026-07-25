import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/cubit/customer_home_state.dart';

// TODO: Change to CustomerHomeCubit
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void search(String query) => emit(state.copyWith(searchQuery: query));
}
