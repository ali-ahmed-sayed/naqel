import 'package:equatable/equatable.dart';

class QuickAddress extends Equatable {
  final String label;
  final bool isFavorite;
  const QuickAddress({required this.label, this.isFavorite = false});

  @override
  List<Object?> get props => [label, isFavorite];
}

// TODO: Change to CustomerHomeState
class HomeState extends Equatable {
  final String searchQuery;
  final List<QuickAddress> quickAddresses;
  final String? activeOrderId;

  const HomeState({
    required this.searchQuery,
    required this.quickAddresses,
    required this.activeOrderId,
  });

  factory HomeState.initial() => const HomeState(
        searchQuery: '',
        quickAddresses: [
          QuickAddress(label: 'Home'),
          QuickAddress(label: 'Office'),
          QuickAddress(label: 'Sara', isFavorite: true),
        ],
        activeOrderId: '#SW-9821-B',
      );

  HomeState copyWith({String? searchQuery, String? activeOrderId}) {
    return HomeState(
      searchQuery: searchQuery ?? this.searchQuery,
      quickAddresses: quickAddresses,
      activeOrderId: activeOrderId ?? this.activeOrderId,
    );
  }

  @override
  List<Object?> get props => [searchQuery, quickAddresses, activeOrderId];
}
