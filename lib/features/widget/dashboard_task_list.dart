import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';

/// Data model representing a task item on the dashboard.
class DashboardTaskItem {
  final String id;
  String timeHour;
  String timePeriod;
  String title;
  String? note;
  bool isCompleted;
  bool isSkipped;

  DashboardTaskItem({
    required this.id,
    required this.timeHour,
    required this.timePeriod,
    required this.title,
    this.note,
    this.isCompleted = false,
    this.isSkipped = false,
  });
}

class DashboardTaskList extends StatefulWidget {
  final List<DashboardTaskItem>? initialTasks;
  final ValueChanged<int>? onTasksCountChanged;

  const DashboardTaskList({
    super.key,
    this.initialTasks,
    this.onTasksCountChanged,
  });

  @override
  State<DashboardTaskList> createState() => _DashboardTaskListState();
}

class _DashboardTaskListState extends State<DashboardTaskList> {
  late List<DashboardTaskItem> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = widget.initialTasks ??
        [
          DashboardTaskItem(
            id: '1',
            timeHour: '6:00',
            timePeriod: 'PM',
            title:
                'Try on wedding outfit to check for necessary dry cleaning or repairs',
            note: 'i have a weeding this week',
            isCompleted: false,
          ),
          DashboardTaskItem(
            id: '2',
            timeHour: '11:30',
            timePeriod: 'AM',
            title:
                'Review product design mockups with mobile engineering team',
            note: 'check the design system guidelines',
            isCompleted: false,
          ),
          DashboardTaskItem(
            id: '3',
            timeHour: '2:15',
            timePeriod: 'PM',
            title:
                'Pick up freshly ground Ethiopian roast from local cafe',
            note: 'medium roast beans',
            isCompleted: false,
          ),
          DashboardTaskItem(
            id: '4',
            timeHour: '4:45',
            timePeriod: 'PM',
            title:
                'Draft weekly retrospective notes and intentional goals',
            note: 'track productivity score',
            isCompleted: false,
          ),
          DashboardTaskItem(
            id: '5',
            timeHour: '8:00',
            timePeriod: 'PM',
            title:
                'Evening 30-minute restorative yoga and stretching',
            note: 'mindfulness and mobility',
            isCompleted: false,
          ),
        ];
  }

  void _markDone(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _skipTask(int index) {
    setState(() {
      _tasks[index].isSkipped = !_tasks[index].isSkipped;
    });
  }

  void _editTask(int index) {
    setState(() {
      // Toggle state or edit handler
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      widget.onTasksCountChanged?.call(_tasks.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_tasks.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(18)),
            border: Border.fromBorderSide(
              BorderSide(color: Color(0x122D1810), width: 1),
            ),
          ),
          child: const Center(
            child: Text(
              'No tasks for today. You are all caught up!',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 13,
                fontWeight: AppTextStyles.weightBody,
                color: AppColors.onboardingMutedText,
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(_tasks.length, (index) {
          final task = _tasks[index];
          return _DashboardTaskCard(
            key: ValueKey(task.id),
            task: task,
            onDone: () => _markDone(index),
            onSkip: () => _skipTask(index),
            onEdit: () => _editTask(index),
            onDelete: () => _deleteTask(index),
          );
        }),
      ),
    );
  }
}

class _DashboardTaskCard extends StatelessWidget {
  final DashboardTaskItem task;
  final VoidCallback onDone;
  final VoidCallback onSkip;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _DashboardTaskCard({
    super.key,
    required this.task,
    required this.onDone,
    required this.onSkip,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        border: Border.fromBorderSide(
          BorderSide(color: Color(0x122D1810), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Time Column
          SizedBox(
            width: 46,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  task.timeHour,
                  style: const TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 15,
                    fontWeight: AppTextStyles.weightCards,
                    color: AppColors.ink,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  task.timePeriod,
                  style: const TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 11,
                    fontWeight: AppTextStyles.weightButtons,
                    color: AppColors.onboardingMutedText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Right Content & Action Buttons Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  task.title,
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 14,
                    fontWeight: AppTextStyles.weightCards,
                    color: task.isCompleted
                        ? AppColors.onboardingMutedText
                        : AppColors.ink,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 3),

                // Note in Blue
                if (task.note != null && task.note!.isNotEmpty) ...[
                  Text(
                    task.note!,
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12,
                      fontWeight: AppTextStyles.weightBody,
                      color: Color(0xFF2E6EE8),
                    ),
                  ),
                  const SizedBox(height: 10),
                ] else ...[
                  const SizedBox(height: 8),
                ],

                // Action Buttons Row: Done, Skip, Edit, Delete
                Row(
                  children: [
                    // Done Button
                    GestureDetector(
                      onTap: onDone,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: task.isCompleted
                              ? const Color(0xFFC7F2D5)
                              : const Color(0xFFE3F7EB),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.checkmark,
                              size: 12,
                              color: Color(0xFF1E8E4D),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Done',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 12,
                                fontWeight: AppTextStyles.weightButtons,
                                color: Color(0xFF1E8E4D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Skip Button
                    GestureDetector(
                      onTap: onSkip,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: task.isSkipped
                              ? const Color(0xFFFFE4B0)
                              : const Color(0xFFFFF1D6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.forward_end,
                              size: 11,
                              color: Color(0xFFB5740D),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Skip',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 12,
                                fontWeight: AppTextStyles.weightButtons,
                                color: Color(0xFFB5740D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Edit Button
                    GestureDetector(
                      onTap: onEdit,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF1F3F5),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.pencil,
                              size: 12,
                              color: Color(0xFF4B5563),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Edit',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 12,
                                fontWeight: AppTextStyles.weightButtons,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Delete Button
                    GestureDetector(
                      onTap: onDelete,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFDE8E8),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.trash,
                            size: 13,
                            color: Color(0xFFE04F4F),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
