import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/cubit/create_delivery_state.dart';

class CreateDeliveryCubit extends Cubit<CreateDeliveryState> {
  CreateDeliveryCubit() : super(CreateDeliveryState.initial());

  void setDropoff(String address) =>
      emit(state.copyWith(dropoffAddress: address));

  void selectPackageType(PackageType type) =>
      emit(state.copyWith(packageType: type));

  void setWeight(double weight) => emit(state.copyWith(weightKg: weight));

  void addPhoto() => emit(state.copyWith(hasPhoto: true));

  void removePhoto() => emit(state.copyWith(hasPhoto: false));
}
