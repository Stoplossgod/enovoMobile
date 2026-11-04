import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/routes.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';
import 'package:enovo_mobile_app/shared_widget/shared_appbar_widget.dart';
import 'package:enovo_mobile_app/shared_widget/shared_button_widget.dart';
import 'package:enovo_mobile_app/shared_widget/text_field_widget.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _timezoneController;

  bool _isSaving = false;
  bool _isSavedSuccess = false;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: 'Abdulazeez Ridwan');
    _usernameController = TextEditingController(text: 'abdulazeezridwan004');
    _emailController = TextEditingController(
      text: 'abdulazeezridwan004@gmail.com',
    );
    _timezoneController = TextEditingController(
      text: 'UTC+01:00 (West Africa Time)',
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _timezoneController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_isSaving) return;

    setState(() {
      _isSaving = true;
      _isSavedSuccess = false;
    });

    // Simulate saving update
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() {
          _isSaving = false;
          _isSavedSuccess = true;
        });

        // Auto pop or keep state
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) {
            AppRouter.pop(context);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.page,
      appBar: SharedAppBar(
        titleText: 'Profile Update',
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
              const SizedBox(height: 8),

              // Avatar with camera badge
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 84,
                      height: 84,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x33E87B4E),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.person,
                          color: AppColors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(
                            BorderSide(color: Color(0x182D1810), width: 1),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.camera_fill,
                            size: 14,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Card Container with Profile Fields
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Full Name Field
                    AppTextField(
                      label: 'Full Name',
                      hintText: 'Enter your full name',
                      controller: _fullNameController,
                      prefixIcon: CupertinoIcons.person,
                      textCapitalization: TextCapitalization.words,
                    ),

                    const SizedBox(height: 18),

                    // Username Field
                    AppTextField(
                      label: 'Username',
                      hintText: 'Enter username',
                      controller: _usernameController,
                      prefixIcon: CupertinoIcons.at,
                      textCapitalization: TextCapitalization.none,
                    ),

                    const SizedBox(height: 18),

                    // Email Field
                    AppTextField(
                      label: 'Email',
                      hintText: 'Enter your email address',
                      controller: _emailController,
                      prefixIcon: CupertinoIcons.envelope,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 18),

                    // Timezone Field
                    AppTextField(
                      label: 'Timezone',
                      hintText: 'Select your timezone',
                      controller: _timezoneController,
                      prefixIcon: CupertinoIcons.globe,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Success Notification Banner (if saved)
              if (_isSavedSuccess) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEDF7ED),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.checkmark_circle_fill,
                        color: Color(0xFF2E7D32),
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Profile updated successfully!',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 14,
                          fontWeight: AppTextStyles.weightButtons,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Save Button (Using Reusable AppButton)
              AppButton(
                text: 'Save Changes',
                isLoading: _isSaving,
                onPressed: _handleSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
