// lib/features/profile/presentation/cubit/driver_profile_state.dart
import 'package:equatable/equatable.dart';

sealed class DriverProfileState extends Equatable {
  const DriverProfileState();

  @override
  List<Object> get props => [];
}

final class DriverProfileInitial extends DriverProfileState {}
final class DriverProfileLoading extends DriverProfileState {}
final class DriverProfileSuccess extends DriverProfileState {}
final class DriverProfileFailure extends DriverProfileState {
  final String message;
  const DriverProfileFailure(this.message);

  @override
  List<Object> get props => [message];
}