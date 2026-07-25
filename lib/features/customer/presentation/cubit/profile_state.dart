import 'package:equatable/equatable.dart';

class SavedAddress extends Equatable {
  final String label;
  final String details;
  final bool isHome;

  const SavedAddress({required this.label, required this.details, required this.isHome});

  @override
  List<Object?> get props => [label, details, isHome];
}

class ProfileState extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String memberSince;
  final List<SavedAddress> addresses;
  final bool isEditingName;

  const ProfileState({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.memberSince,
    required this.addresses,
    required this.isEditingName,
  });

  factory ProfileState.initial() => const ProfileState(
        fullName: 'Alexander Sterling',
        phoneNumber: '+1 (555) 012-3456',
        email: 'a.sterling@velocitymail.com',
        memberSince: 'MEMBER SINCE 2023',
        isEditingName: false,
        addresses: [
          SavedAddress(
            label: 'Home',
            details: '1248 Oakwood Avenue, Brooklyn, NY 11201',
            isHome: true,
          ),
          SavedAddress(
            label: 'Office',
            details: '75 Hudson St, Manhattan, NY 10013',
            isHome: false,
          ),
        ],
      );

  ProfileState copyWith({String? fullName, bool? isEditingName}) {
    return ProfileState(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber,
      email: email,
      memberSince: memberSince,
      addresses: addresses,
      isEditingName: isEditingName ?? this.isEditingName,
    );
  }

  @override
  List<Object?> get props =>
      [fullName, phoneNumber, email, memberSince, addresses, isEditingName];
}
