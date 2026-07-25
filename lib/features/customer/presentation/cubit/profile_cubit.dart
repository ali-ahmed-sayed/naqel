import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/features/customer/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());

  void toggleEditName() => emit(state.copyWith(isEditingName: !state.isEditingName));

  void updateName(String name) => emit(state.copyWith(fullName: name, isEditingName: false));

  void signOut() {
    // Minimal visual view: no auth wiring yet, just a hook for the UI button.
  }
}
