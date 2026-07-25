import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/features/customer/presentation/cubit/order_history_state.dart';
import 'package:naqel/features/customer/presentation/widgets/order_history/avatar_stack.dart';

class OrderCard extends StatelessWidget {
  final OrderItem order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    if (order.status == OrderStatus.inTransit) {
      return Container(
        decoration: BoxDecoration(
          color: SwiftShipTheme.surfaceWhite,
          borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
          border: const Border(
            left: BorderSide(color: SwiftShipTheme.primaryBlue, width: 4),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: SwiftShipTheme.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(
                      SwiftShipTheme.radiusMd,
                    ),
                  ),
                  child: const Icon(
                    Icons.inventory_2_rounded,
                    color: SwiftShipTheme.primaryBlue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IN TRANSIT',
                        style: TextStyle(
                          color: SwiftShipTheme.accentOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        order.id,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        order.subtitle,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${order.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const AvatarStack(),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(140, 44),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Track Now'),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    final isCancelled = order.status == OrderStatus.cancelled;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SwiftShipTheme.secondaryButtonFill.withOpacity(0.5),
        borderRadius: BorderRadius.circular(SwiftShipTheme.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isCancelled
                      ? Icons.cancel_outlined
                      : Icons.check_circle_outline,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isCancelled
                      ? SwiftShipTheme.errorBg
                      : SwiftShipTheme.successGreen,
                  borderRadius: BorderRadius.circular(
                    SwiftShipTheme.radiusFull,
                  ),
                ),
                child: Text(
                  isCancelled ? 'Cancelled' : 'Delivered',
                  style: TextStyle(
                    color: isCancelled
                        ? SwiftShipTheme.errorRed
                        : SwiftShipTheme.successText,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(order.id, style: Theme.of(context).textTheme.titleLarge),
          Text(order.subtitle, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${order.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                isCancelled ? 'Refund Status ›' : 'Details ›',
                style: const TextStyle(
                  color: SwiftShipTheme.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
