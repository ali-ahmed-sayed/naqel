import 'package:equatable/equatable.dart';

enum ApprovalStepStatus { completed, current, locked }

class ApprovalStep extends Equatable {
  final String title;
  final String subtitle;
  final ApprovalStepStatus status;

  const ApprovalStep({
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  List<Object?> get props => [title, subtitle, status];
}

enum ApplicationStatus { Activated, Checked, Verified, Submitted }

class ApplicationStatusState extends Equatable {
  /// The single source of truth for this screen — comes straight from the
  /// driver's auth document (`DriverEntity.isApproved`). Everything else
  /// below (headline, journey steps, CTA) is derived from this flag rather
  /// than being a permanently-"pending" screen.
  final ApplicationStatus applicationStatus;

  final int totalSteps;
  final int submittedSteps; // "STEP 4 OF 4 SUBMITTED"
  final String estimatedTimeText;
  final String queueNumber;
  final String applicationId;
  final List<ApprovalStep> journey;
  final bool isRefreshing;

  const ApplicationStatusState({
    this.applicationStatus = ApplicationStatus.Submitted,
    required this.totalSteps,
    required this.submittedSteps,
    required this.estimatedTimeText,
    required this.queueNumber,
    required this.applicationId,
    required this.journey,
    required this.isRefreshing,
  });

  /// [isApproved] should be read from the driver's auth document
  /// (`DriverEntity.isApproved`) right after signup or on re-entry to this
  /// screen — see [ApplicationStatusCubit].
  factory ApplicationStatusState.initial({
    required ApplicationStatus? applicationStatus,
  }) => ApplicationStatusState(
    applicationStatus: applicationStatus ?? ApplicationStatus.Submitted,
    totalSteps: 4,
    submittedSteps: 4,
    estimatedTimeText: 'Usually takes 24-48 hours',
    queueNumber: '#2,481',
    applicationId: 'SWFT-990-21A',
    isRefreshing: false,
    journey: applicationStatus == ApplicationStatus.Activated
        ? const [
            ApprovalStep(
              title: 'Application Submitted',
              subtitle: 'Received on May 24, 10:42 AM',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Document Verification',
              subtitle: 'Checking ID, License, and Insurance',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Background Check',
              subtitle: 'Standard safety screening protocol',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Account Activation',
              subtitle: 'Full access to SwiftShip Driver app',
              status: ApprovalStepStatus.completed,
            ),
          ]
        : applicationStatus == ApplicationStatus.Checked
        ? const [
            ApprovalStep(
              title: 'Application Submitted',
              subtitle: 'Received on May 24, 10:42 AM',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Document Verification',
              subtitle: 'Checking ID, License, and Insurance',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Background Check',
              subtitle: 'Standard safety screening protocol',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Account Activation',
              subtitle: 'Full access to SwiftShip Driver app',
              status: ApprovalStepStatus.current,
            ),
          ]
        : applicationStatus == ApplicationStatus.Verified
        ? const [
            ApprovalStep(
              title: 'Application Submitted',
              subtitle: 'Received on May 24, 10:42 AM',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Document Verification',
              subtitle: 'Checking ID, License, and Insurance',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Background Check',
              subtitle: 'Standard safety screening protocol',
              status: ApprovalStepStatus.current,
            ),
            ApprovalStep(
              title: 'Account Activation',
              subtitle: 'Full access to SwiftShip Driver app',
              status: ApprovalStepStatus.locked,
            ),
          ]
        : applicationStatus == ApplicationStatus.Submitted
        ? const [
            ApprovalStep(
              title: 'Application Submitted',
              subtitle: 'Received on May 24, 10:42 AM',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Document Verification',
              subtitle: 'Checking ID, License, and Insurance',
              status: ApprovalStepStatus.current,
            ),
            ApprovalStep(
              title: 'Background Check',
              subtitle: 'Standard safety screening protocol',
              status: ApprovalStepStatus.locked,
            ),
            ApprovalStep(
              title: 'Account Activation',
              subtitle: 'Full access to SwiftShip Driver app',
              status: ApprovalStepStatus.locked,
            ),
          ]
        : const [
            ApprovalStep(
              title: 'Application Submitted',
              subtitle: 'Received on May 24, 10:42 AM',
              status: ApprovalStepStatus.completed,
            ),
            ApprovalStep(
              title: 'Document Verification',
              subtitle: 'Checking ID, License, and Insurance',
              status: ApprovalStepStatus.current,
            ),
            ApprovalStep(
              title: 'Background Check',
              subtitle: 'Standard safety screening protocol',
              status: ApprovalStepStatus.locked,
            ),
            ApprovalStep(
              title: 'Account Activation',
              subtitle: 'Full access to SwiftShip Driver app',
              status: ApprovalStepStatus.locked,
            ),
          ],
  );

  /// The step currently "in progress" — drives the "Review in Progress" card.
  /// Always null once approved (nothing left "in progress").
  ApprovalStep? get currentStep =>
      journey.where((s) => s.status == ApprovalStepStatus.current).firstOrNull;

  ApplicationStatusState copyWith({
    ApplicationStatus? applicationStatus,
    List<ApprovalStep>? journey,
    bool? isRefreshing,
  }) {
    return ApplicationStatusState(
      applicationStatus: applicationStatus ?? this.applicationStatus,
      totalSteps: totalSteps,
      submittedSteps: submittedSteps,
      estimatedTimeText: estimatedTimeText,
      queueNumber: queueNumber,
      applicationId: applicationId,
      journey: journey ?? this.journey,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object?> get props => [
    applicationStatus,
    totalSteps,
    submittedSteps,
    estimatedTimeText,
    queueNumber,
    applicationId,
    journey,
    isRefreshing,
  ];
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
