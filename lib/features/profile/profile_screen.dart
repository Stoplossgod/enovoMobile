import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';

class ProfileDestinationScreen extends StatefulWidget {
  const ProfileDestinationScreen({super.key});

  @override
  State<ProfileDestinationScreen> createState() => _ProfileDestinationScreenState();
}

class _ProfileDestinationScreenState extends State<ProfileDestinationScreen> {
  // Navigation & Settings items
  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Profile update',
      'icon': CupertinoIcons.person_crop_circle,
    },
    {
      'title': 'Notifications',
      'icon': CupertinoIcons.bell,
    },
    {
      'title': 'Folders',
      'icon': CupertinoIcons.folder,
    },
    {
      'title': 'Backups',
      'icon': CupertinoIcons.cloud_upload,
    },
    {
      'title': 'Subscription',
      'icon': CupertinoIcons.creditcard,
    },
    {
      'title': 'Privacy security',
      'icon': CupertinoIcons.lock_shield,
    },
    {
      'title': 'Log out',
      'icon': CupertinoIcons.square_arrow_right,
      'isDestructive': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Header
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  children: [
                    // Orange Circular Avatar
                    Container(
                      width: 68,
                      height: 68,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x33E87B4E),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.person,
                          color: AppColors.white,
                          size: 32,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // User Info Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'abdulazeezridwan004',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 18,
                              fontWeight: AppTextStyles.weightCards,
                              color: AppColors.ink,
                              height: 1.25,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Flutter Developer',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 14,
                              fontWeight: AppTextStyles.weightBody,
                              color: Color(0xFF68717E),
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Edit Profile Button
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          border: Border.fromBorderSide(
                            BorderSide(color: Color(0x182D1810), width: 1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x06000000),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.pencil,
                            color: AppColors.primary,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Settings & Management List Tile Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.fromBorderSide(
                      BorderSide(color: Color(0x142D1810), width: 1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x06000000),
                        blurRadius: 12,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: List.generate(_menuItems.length, (index) {
                      final item = _menuItems[index];
                      final isLast = index == _menuItems.length - 1;
                      final isDestructive = (item['isDestructive'] as bool?) ?? false;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: Row(
                                children: [
                                  // Leading Icon Box
                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: isDestructive
                                          ? const Color(0xFFFDE8E8)
                                          : const Color(0xFFFDEEE6),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        item['icon'] as IconData,
                                        color: isDestructive
                                            ? AppColors.danger
                                            : AppColors.primary,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),

                                  // Title Text
                                  Expanded(
                                    child: Text(
                                      item['title'] as String,
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.fontFamily,
                                        fontSize: 15,
                                        fontWeight: AppTextStyles.weightCards,
                                        color: isDestructive
                                            ? AppColors.danger
                                            : AppColors.ink,
                                      ),
                                    ),
                                  ),

                                  // Trailing Arrow
                                  const Icon(
                                    CupertinoIcons.chevron_forward,
                                    size: 16,
                                    color: Color(0xFFB0A8A2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!isLast)
                            Padding(
                              padding: const EdgeInsets.only(left: 68, right: 16),
                              child: Container(
                                height: 1,
                                color: const Color(0x0E2D1810),
                              ),
                            ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
