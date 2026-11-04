import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/routes.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';
import 'package:enovo_mobile_app/shared_widget/shared_appbar_widget.dart';
import 'package:enovo_mobile_app/shared_widget/shared_button_widget.dart';

/// Notification delivery level modes for radio selection.
enum NotificationDeliveryMode { all, important, disabled }

/// Notification pause duration / quiet hours schedule modes.
enum PauseScheduleMode {
  none,
  for1Hour,
  for8Hours,
  untilTomorrow,
  customSchedule,
}

class ProfileNotificationScreen extends StatefulWidget {
  const ProfileNotificationScreen({super.key});

  @override
  State<ProfileNotificationScreen> createState() =>
      _ProfileNotificationScreenState();
}

class _ProfileNotificationScreenState extends State<ProfileNotificationScreen> {
  // Radio selection state
  NotificationDeliveryMode _deliveryMode = NotificationDeliveryMode.all;
  PauseScheduleMode _pauseMode = PauseScheduleMode.none;

  // Quiet hours schedule state
  String _startTime = '10:00 PM';
  String _endTime = '07:00 AM';
  final Set<String> _activeDays = {
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  };

  bool _isSaving = false;
  bool _isSavedSuccess = false;

  void _handleSave() {
    if (_isSaving) return;

    setState(() {
      _isSaving = true;
      _isSavedSuccess = false;
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() {
          _isSaving = false;
          _isSavedSuccess = true;
        });

        Future.delayed(const Duration(milliseconds: 900), () {
          if (mounted) {
            AppRouter.pop(context);
          }
        });
      }
    });
  }

  void _toggleDay(String day) {
    setState(() {
      if (_activeDays.contains(day)) {
        if (_activeDays.length > 1) {
          _activeDays.remove(day);
        }
      } else {
        _activeDays.add(day);
      }
    });
  }

  void _cycleStartTime() {
    final times = ['08:00 PM', '09:00 PM', '10:00 PM', '11:00 PM', '12:00 AM'];
    final currentIndex = times.indexOf(_startTime);
    final nextIndex = (currentIndex + 1) % times.length;
    setState(() {
      _startTime = times[nextIndex];
    });
  }

  void _cycleEndTime() {
    final times = ['06:00 AM', '07:00 AM', '08:00 AM', '09:00 AM', '10:00 AM'];
    final currentIndex = times.indexOf(_endTime);
    final nextIndex = (currentIndex + 1) % times.length;
    setState(() {
      _endTime = times[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDeliveryDisabled =
        _deliveryMode == NotificationDeliveryMode.disabled;

    return Scaffold(
      backgroundColor: AppColors.page,
      appBar: SharedAppBar(
        titleText: 'Notifications',
        onBackTap: () => AppRouter.pop(context),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Success feedback banner
              if (_isSavedSuccess) ...[
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.fromBorderSide(
                      BorderSide(color: Color(0xFF81C784), width: 1),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.checkmark_circle_fill,
                        color: Color(0xFF2E7D32),
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Notification preferences saved successfully',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 13,
                            fontWeight: AppTextStyles.weightCards,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // -------------------------------------------------------------
              // Section 1: Enable or Disable Notification
              // -------------------------------------------------------------
              _buildSectionHeader(
                title: 'NOTIFICATION DELIVERY',
                subtitle: 'Control how and when you receive alerts from Enovo',
              ),
              const SizedBox(height: 12),

              _RadioOptionCard<NotificationDeliveryMode>(
                value: NotificationDeliveryMode.all,
                groupValue: _deliveryMode,
                title: 'All Notifications (Enabled)',
                subtitle: 'Receive alerts, task deadlines, and daily reminders',
                icon: CupertinoIcons.bell_fill,
                onSelected: (val) {
                  setState(() => _deliveryMode = val);
                },
              ),
              const SizedBox(height: 10),

              _RadioOptionCard<NotificationDeliveryMode>(
                value: NotificationDeliveryMode.important,
                groupValue: _deliveryMode,
                title: 'Important Only',
                subtitle: 'Only urgent task milestones and security alerts',
                icon: CupertinoIcons.exclamationmark_bubble_fill,
                onSelected: (val) {
                  setState(() => _deliveryMode = val);
                },
              ),
              const SizedBox(height: 10),

              _RadioOptionCard<NotificationDeliveryMode>(
                value: NotificationDeliveryMode.disabled,
                groupValue: _deliveryMode,
                title: 'Disable Notifications',
                subtitle: 'Turn off all push notifications and sound alerts',
                icon: CupertinoIcons.bell_slash_fill,
                isDestructive: true,
                onSelected: (val) {
                  setState(() => _deliveryMode = val);
                },
              ),

              const SizedBox(height: 28),

              // -------------------------------------------------------------
              // Section 2: Pause Notifications During Specific Times
              // -------------------------------------------------------------
              _buildSectionHeader(
                title: 'PAUSE NOTIFICATIONS',
                subtitle: isDeliveryDisabled
                    ? 'Notifications are currently disabled above'
                    : 'Temporarily mute alerts or schedule quiet hours',
              ),
              const SizedBox(height: 12),

              Opacity(
                opacity: isDeliveryDisabled ? 0.45 : 1.0,
                child: IgnorePointer(
                  ignoring: isDeliveryDisabled,
                  child: Column(
                    children: [
                      _RadioOptionCard<PauseScheduleMode>(
                        value: PauseScheduleMode.none,
                        groupValue: _pauseMode,
                        title: "Don't Pause",
                        subtitle: 'Notifications will be delivered normally',
                        icon: CupertinoIcons.play_circle_fill,
                        onSelected: (val) {
                          setState(() => _pauseMode = val);
                        },
                      ),
                      const SizedBox(height: 10),

                      _RadioOptionCard<PauseScheduleMode>(
                        value: PauseScheduleMode.for1Hour,
                        groupValue: _pauseMode,
                        title: 'Pause for 1 Hour',
                        subtitle: 'Mute alerts for the next 60 minutes',
                        icon: CupertinoIcons.timer,
                        onSelected: (val) {
                          setState(() => _pauseMode = val);
                        },
                      ),
                      const SizedBox(height: 10),

                      _RadioOptionCard<PauseScheduleMode>(
                        value: PauseScheduleMode.for8Hours,
                        groupValue: _pauseMode,
                        title: 'Pause for 8 Hours',
                        subtitle: 'Mute alerts for the rest of your workday',
                        icon: CupertinoIcons.hourglass,
                        onSelected: (val) {
                          setState(() => _pauseMode = val);
                        },
                      ),
                      const SizedBox(height: 10),

                      _RadioOptionCard<PauseScheduleMode>(
                        value: PauseScheduleMode.untilTomorrow,
                        groupValue: _pauseMode,
                        title: 'Until Tomorrow Morning',
                        subtitle: 'Resume all alerts tomorrow at 8:00 AM',
                        icon: CupertinoIcons.sunrise_fill,
                        onSelected: (val) {
                          setState(() => _pauseMode = val);
                        },
                      ),
                      const SizedBox(height: 10),

                      _RadioOptionCard<PauseScheduleMode>(
                        value: PauseScheduleMode.customSchedule,
                        groupValue: _pauseMode,
                        title: 'During Specific Times (Quiet Hours)',
                        subtitle:
                            'Automatically mute alerts every day during set hours',
                        icon: CupertinoIcons.moon_fill,
                        onSelected: (val) {
                          setState(() => _pauseMode = val);
                        },
                      ),

                      // Expandable quiet hours settings card
                      if (_pauseMode == PauseScheduleMode.customSchedule &&
                          !isDeliveryDisabled) ...[
                        const SizedBox(height: 12),
                        _buildQuietHoursCard(),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Save Action Button
              SharedButton(
                text: 'Save Preferences',
                onPressed: _handleSave,
                isLoading: _isSaving,
                // icon: CupertinoIcons.checkmark_alt,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Header with uppercase tracking label and subtitle
  Widget _buildSectionHeader({
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 12,
            fontWeight: AppTextStyles.weightCards,
            color: AppColors.onboardingMutedText,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 13,
            fontWeight: AppTextStyles.weightBody,
            color: Color(0xFF8A7F77),
          ),
        ),
      ],
    );
  }

  /// Detailed quiet hours schedule configuration card
  Widget _buildQuietHoursCard() {
    const allDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.fromBorderSide(
          BorderSide(color: Color(0x1F2D1810), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                CupertinoIcons.clock_fill,
                color: AppColors.primary,
                size: 16,
              ),
              SizedBox(width: 8),
              Text(
                'Quiet Hours Time Range',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 14,
                  fontWeight: AppTextStyles.weightCards,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Start Time & End Time Selectors
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _cycleStartTime,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF9F5F0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.fromBorderSide(
                        BorderSide(color: Color(0x1A2D1810), width: 1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'MUTE FROM',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 10,
                            fontWeight: AppTextStyles.weightCards,
                            color: AppColors.onboardingMutedText,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _startTime,
                              style: const TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 15,
                                fontWeight: AppTextStyles.weightCards,
                                color: AppColors.ink,
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.chevron_up_chevron_down,
                              size: 14,
                              color: Color(0xFF9E948C),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: _cycleEndTime,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF9F5F0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.fromBorderSide(
                        BorderSide(color: Color(0x1A2D1810), width: 1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'RESUME AT',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 10,
                            fontWeight: AppTextStyles.weightCards,
                            color: AppColors.onboardingMutedText,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _endTime,
                              style: const TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 15,
                                fontWeight: AppTextStyles.weightCards,
                                color: AppColors.ink,
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.chevron_up_chevron_down,
                              size: 14,
                              color: Color(0xFF9E948C),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            'ACTIVE DAYS',
            style: TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              fontSize: 11,
              fontWeight: AppTextStyles.weightCards,
              color: AppColors.onboardingMutedText,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 10),

          // Day of week chips
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: allDays.map((day) {
              final isSelected = _activeDays.contains(day);
              return GestureDetector(
                onTap: () => _toggleDay(day),
                child: Container(
                  width: 40,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : const Color(0xFFF9F5F0),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: isSelected
                            ? AppColors.primary
                            : const Color(0x182D1810),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      day.substring(0, 1),
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 13,
                        fontWeight: AppTextStyles.weightCards,
                        color: isSelected ? AppColors.white : AppColors.ink,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

/// Reusable Radio Option Card matching Enovo design system.
///
/// Features an icon pill, title, subtitle, and an authentic circular radio indicator.
class _RadioOptionCard<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final String subtitle;
  final IconData icon;
  final ValueChanged<T> onSelected;
  final bool isDestructive;

  const _RadioOptionCard({
    required this.value,
    required this.groupValue,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onSelected,
    this.isDestructive = false,
  });

  bool get isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    final activeColor = isDestructive ? AppColors.danger : AppColors.primary;

    return GestureDetector(
      onTap: () => onSelected(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.fromBorderSide(
            BorderSide(
              color: isSelected ? activeColor : const Color(0x182D1810),
              width: isSelected ? 1.5 : 1.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? (isDestructive
                        ? const Color(0x14C94F4F)
                        : const Color(0x14E87B4E))
                  : const Color(0x05000000),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon Badge
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? (isDestructive
                          ? const Color(0xFFFDE8E8)
                          : const Color(0xFFFDEEE6))
                    : const Color(0xFFF5EFE7),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: isSelected ? activeColor : const Color(0xFF8A7F77),
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Content text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 15,
                      fontWeight: AppTextStyles.weightCards,
                      color: isDestructive && isSelected
                          ? AppColors.danger
                          : AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12,
                      fontWeight: AppTextStyles.weightBody,
                      color: AppColors.onboardingMutedText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Circular Radio Button Indicator
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: isSelected ? activeColor : const Color(0xFFC4B8B0),
                    width: isSelected ? 6.5 : 2.0,
                  ),
                ),
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
