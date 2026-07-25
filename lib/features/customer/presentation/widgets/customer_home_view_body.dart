import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:naqel/core/widgets/swift_ship_bottom_nav.dart';
import 'package:naqel/features/customer/presentation/cubit/customer_home_cubit.dart';
import 'package:naqel/features/customer/presentation/cubit/customer_home_state.dart';

class CustomerHomeViewBody extends StatelessWidget {
  const CustomerHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Map placeholder background
          Positioned.fill(
            child: Image.asset(
              "assets/Images/map_placeholder.png",
              fit: .cover,
            ),
          ),
          SafeArea(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      color: SwiftShipTheme.backgroundColor.withAlpha(150),
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SwiftShip',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(color: SwiftShipTheme.primaryBlue),
                          ),
                          const CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.black26,
                            backgroundImage: AssetImage(
                              "assets/Images/user_avatar.jpg",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        onChanged: context.read<HomeCubit>().search,
                        decoration: const InputDecoration(
                          hintText: 'Where to send?',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.quickAddresses.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final address = state.quickAddresses[index];
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  SwiftShipTheme.radiusFull,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    address.isFavorite
                                        ? Icons.favorite_border
                                        : (address.label == 'Home'
                                              ? Icons.home_outlined
                                              : Icons.work_outline),
                                    size: 16,
                                    color: SwiftShipTheme.primaryBlue,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    address.label,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (state.activeOrderId != null)
                            GestureDetector(
                              onTap: () => context.go("live-tracking"),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(
                                    SwiftShipTheme.radiusLg,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: SwiftShipTheme.primaryBlue
                                            .withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.local_shipping_outlined,
                                        color: SwiftShipTheme.primaryBlue,
                                        size: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'IN TRANSIT',
                                            style: TextStyle(
                                              color: SwiftShipTheme.primaryBlue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                          Text(
                                            'Order ${state.activeOrderId}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(Icons.chevron_right),
                                  ],
                                ),
                              ),
                            ),
                          GestureDetector(
                            onTap: () => context.go("create-delivery"),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: SwiftShipTheme.primaryBlue,
                                borderRadius: BorderRadius.circular(
                                  SwiftShipTheme.radiusLg,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'SHIP ANYTHING, ANYWHERE',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Create New\nDelivery',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.white.withOpacity(
                                      0.2,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SwiftShipBottomNav(
        activeTab: SwiftShipTab.home,
        onTap: (tab) {
          switch (tab) {
            case SwiftShipTab.home:
              break;
            case SwiftShipTab.history:
              context.go('/order-history');
              break;
            case SwiftShipTab.profile:
              context.go('/profile-customer');
              break;
          }
        },
      ),
    );
  }
}
