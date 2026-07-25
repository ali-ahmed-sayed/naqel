import 'package:equatable/equatable.dart';

enum TransactionType { deliveryEarnings, walletRecharge, commissionDeduction }

class WalletTransaction extends Equatable {
  final TransactionType type;
  final String title;
  final String subtitle; // e.g. "Order #SW-9982 • 10:45 AM"
  final double amount; // always positive; sign/credit-debit derived from isCredit
  final bool isCredit;

  const WalletTransaction({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isCredit,
  });

  @override
  List<Object?> get props => [type, title, subtitle, amount, isCredit];
}

class DriverWalletState extends Equatable {
  final double availableBalance;
  final double lowBalanceThreshold;
  final double todaysEarnings;
  final double commissionsPaid;
  final List<WalletTransaction> transactions;
  final bool isRecharging;

  const DriverWalletState({
    required this.availableBalance,
    required this.lowBalanceThreshold,
    required this.todaysEarnings,
    required this.commissionsPaid,
    required this.transactions,
    required this.isRecharging,
  });

  factory DriverWalletState.initial() => const DriverWalletState(
        availableBalance: 12.45,
        lowBalanceThreshold: 20.00,
        todaysEarnings: 142.80,
        commissionsPaid: 28.40,
        isRecharging: false,
        transactions: [
          WalletTransaction(
            type: TransactionType.deliveryEarnings,
            title: 'Delivery Earnings',
            subtitle: 'Order #SW-9982 • 10:45 AM',
            amount: 18.50,
            isCredit: true,
          ),
          WalletTransaction(
            type: TransactionType.walletRecharge,
            title: 'Wallet Recharge',
            subtitle: 'Via Visa ****4421 • 09:12 AM',
            amount: 50.00,
            isCredit: true,
          ),
          WalletTransaction(
            type: TransactionType.commissionDeduction,
            title: 'Commission Deduction',
            subtitle: 'System Fee #445 • Yesterday',
            amount: 4.20,
            isCredit: false,
          ),
          WalletTransaction(
            type: TransactionType.deliveryEarnings,
            title: 'Delivery Earnings',
            subtitle: 'Order #SW-9980 • Yesterday',
            amount: 22.00,
            isCredit: true,
          ),
        ],
      );

  bool get isLowBalance => availableBalance < lowBalanceThreshold;

  DriverWalletState copyWith({
    double? availableBalance,
    List<WalletTransaction>? transactions,
    bool? isRecharging,
  }) {
    return DriverWalletState(
      availableBalance: availableBalance ?? this.availableBalance,
      lowBalanceThreshold: lowBalanceThreshold,
      todaysEarnings: todaysEarnings,
      commissionsPaid: commissionsPaid,
      transactions: transactions ?? this.transactions,
      isRecharging: isRecharging ?? this.isRecharging,
    );
  }

  @override
  List<Object?> get props => [
        availableBalance,
        lowBalanceThreshold,
        todaysEarnings,
        commissionsPaid,
        transactions,
        isRecharging,
      ];
}
