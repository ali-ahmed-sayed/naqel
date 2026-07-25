import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/cubit/order_history_cubit.dart';
import 'package:naqel/features/customer/presentation/cubit/order_history_state.dart';

class FilterTabs extends StatelessWidget {
  const FilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: SwiftShipTheme.secondaryButtonFill,
              borderRadius: BorderRadius.circular(SwiftShipTheme.radiusFull),
            ),
            child: Row(
              children: OrderFilter.values.map((f) {
                final selected = state.filter == f;
                return Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        context.read<OrderHistoryCubit>().changeFilter(f),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selected
                            ? SwiftShipTheme.primaryBlue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          SwiftShipTheme.radiusFull,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        switch (f) {
                          OrderFilter.all => 'All',
                          OrderFilter.active => 'Active',
                          OrderFilter.completed => 'Completed',
                        },
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? Colors.white
                              : const Color(0xFF434656),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
