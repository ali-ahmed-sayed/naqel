import 'package:equatable/equatable.dart';

enum OrderFilter { all, active, completed }

enum OrderStatus { inTransit, delivered, cancelled }

class OrderItem extends Equatable {
  final String id;
  final String subtitle; // scheduled/delivered/cancelled date line
  final double price;
  final OrderStatus status;

  const OrderItem({
    required this.id,
    required this.subtitle,
    required this.price,
    required this.status,
  });

  @override
  List<Object?> get props => [id, subtitle, price, status];
}

class OrderHistoryState extends Equatable {
  final OrderFilter filter;
  final String searchQuery;
  final List<OrderItem> allOrders;

  const OrderHistoryState({
    required this.filter,
    required this.searchQuery,
    required this.allOrders,
  });

  factory OrderHistoryState.initial() => const OrderHistoryState(
    filter: OrderFilter.all,
    searchQuery: '',
    allOrders: [
      OrderItem(
        id: '#SW-9821-B',
        subtitle: 'Scheduled for: Oct 24, 2023',
        price: 42.50,
        status: OrderStatus.inTransit,
      ),
      OrderItem(
        id: '#SW-7742-X',
        subtitle: 'Delivered on Oct 20, 2023',
        price: 128.00,
        status: OrderStatus.delivered,
      ),
      OrderItem(
        id: '#SW-5510-A',
        subtitle: 'Delivered on Oct 18, 2023',
        price: 89.99,
        status: OrderStatus.delivered,
      ),
      OrderItem(
        id: '#SW-3345-K',
        subtitle: 'Cancelled on Oct 15, 2023',
        price: 0.00,
        status: OrderStatus.cancelled,
      ),
      OrderItem(
        id: '#SW-3321-K',
        subtitle: 'Delivered on Oct 12, 2023',
        price: 36.00,
        status: OrderStatus.delivered,
      ),
      OrderItem(
        id: '#SW-3112-K',
        subtitle: 'Cancelled on Oct 10, 2023',
        price: 0.00,
        status: OrderStatus.cancelled,
      ),
    ],
  );

  /// Derived list — filter + search applied. Kept as a getter rather than
  /// stored state so there's a single source of truth (allOrders).
  List<OrderItem> get visibleOrders {
    return allOrders.where((o) {
      final matchesFilter = switch (filter) {
        OrderFilter.all => true,
        OrderFilter.active => o.status == OrderStatus.inTransit,
        OrderFilter.completed => o.status == OrderStatus.delivered,
      };
      final matchesSearch =
          searchQuery.isEmpty ||
          o.id.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();
  }

  OrderHistoryState copyWith({
    OrderFilter? filter,
    String? searchQuery,
    List<OrderItem>? allOrders,
  }) {
    return OrderHistoryState(
      filter: filter ?? this.filter,
      searchQuery: searchQuery ?? this.searchQuery,
      allOrders: allOrders ?? this.allOrders,
    );
  }

  @override
  List<Object?> get props => [filter, searchQuery, allOrders];
}
