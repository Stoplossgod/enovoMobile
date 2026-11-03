import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';

class AddDestinationScreen extends StatefulWidget {
  const AddDestinationScreen({super.key});

  @override
  State<AddDestinationScreen> createState() => _AddDestinationScreenState();
}

class _AddDestinationScreenState extends State<AddDestinationScreen> {
  int _selectedTabIndex = 0; // 0: New Note, 1: Saved Notes

  // Controllers for Note Inputs
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  // Formatting toolbar toggles
  bool _isBold = false;
  bool _isItalic = false;
  bool _isUnderline = false;

  // Sample Saved Notes
  final List<Map<String, String>> _savedNotes = [
    {
      'title': 'Wedding Outfit Checklist',
      'snippet': 'Check tailoring, dry cleaning, and cufflink accessories...',
      'date': 'Nov 3, 2026',
      'folder': 'Personal',
    },
    {
      'title': 'Weekly Workout Routine',
      'snippet': 'Morning stretching, 5km run on Tuesday, core exercises...',
      'date': 'Nov 1, 2026',
      'folder': 'Health',
    },
    {
      'title': 'Project Roadmap Notes',
      'snippet': 'Sprint goals, team check-ins, DartNative architecture...',
      'date': 'Oct 29, 2026',
      'folder': 'Work',
    },
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

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
              // Screen Header (Note & Subtitle)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Note',
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 32,
                        fontWeight: AppTextStyles.weightDisplay,
                        color: AppColors.ink,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Capture ideas, write thoughts and keep notes',
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 14,
                        fontWeight: AppTextStyles.weightBody,
                        color: AppColors.onboardingMutedText,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Segmented Tab Switcher (New Note vs Saved Notes)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    border: Border.fromBorderSide(
                      BorderSide(color: Color(0x182D1810), width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      // New Note Tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_selectedTabIndex != 0) {
                              setState(() => _selectedTabIndex = 0);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: _selectedTabIndex == 0
                                  ? AppColors.primary
                                  : Colors.transparent,
                              borderRadius: const BorderRadius.all(Radius.circular(24)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.doc_text,
                                  size: 18,
                                  color: _selectedTabIndex == 0
                                      ? AppColors.white
                                      : AppColors.ink,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'New Note',
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.fontFamily,
                                    fontSize: 14,
                                    fontWeight: AppTextStyles.weightButtons,
                                    color: _selectedTabIndex == 0
                                        ? AppColors.white
                                        : AppColors.ink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Saved Notes Tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_selectedTabIndex != 1) {
                              setState(() => _selectedTabIndex = 1);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: _selectedTabIndex == 1
                                  ? AppColors.primary
                                  : Colors.transparent,
                              borderRadius: const BorderRadius.all(Radius.circular(24)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.bookmark,
                                  size: 18,
                                  color: _selectedTabIndex == 1
                                      ? AppColors.white
                                      : AppColors.ink,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Saved Notes',
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.fontFamily,
                                    fontSize: 14,
                                    fontWeight: AppTextStyles.weightButtons,
                                    color: _selectedTabIndex == 1
                                        ? AppColors.white
                                        : AppColors.ink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Content View (Create Note Card or Saved Notes List)
              if (_selectedTabIndex == 0) ...[
                // Main Note Creation Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      border: Border.fromBorderSide(
                        BorderSide(color: Color(0x142D1810), width: 1),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x08000000),
                          blurRadius: 16,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Card Header Row: Icon, Title & Viewfinder
                        Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFDEEE6),
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                border: Border.fromBorderSide(
                                  BorderSide(color: Color(0x28E87B4E), width: 1),
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.doc_text,
                                  color: AppColors.primary,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Create Note',
                                    style: TextStyle(
                                      fontFamily: AppTextStyles.fontFamily,
                                      fontSize: 16,
                                      fontWeight: AppTextStyles.weightCards,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Write your thoughts, ideas or reminders',
                                    style: TextStyle(
                                      fontFamily: AppTextStyles.fontFamily,
                                      fontSize: 12,
                                      fontWeight: AppTextStyles.weightHelper,
                                      color: AppColors.onboardingMutedText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.viewfinder,
                              size: 20,
                              color: AppColors.ink,
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Note title input field
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0x182D1810), width: 1),
                            ),
                          ),
                          child: TextField(
                            controller: _titleController,
                            style: const TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 14,
                              fontWeight: AppTextStyles.weightBody,
                              color: AppColors.ink,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Note title...',
                              hintStyle: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 14,
                                fontWeight: AppTextStyles.weightBody,
                                color: Color(0xFF9E958F),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        // Rich Text / Note Editor Container
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0x182D1810), width: 1),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Formatting Toolbar
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() => _isBold = !_isBold);
                                      },
                                      child: Text(
                                        'B',
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.fontFamily,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: _isBold ? AppColors.primary : AppColors.ink,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 18),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() => _isItalic = !_isItalic);
                                      },
                                      child: Text(
                                        'I',
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.fontFamily,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          color: _isItalic ? AppColors.primary : AppColors.ink,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 18),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() => _isUnderline = !_isUnderline);
                                      },
                                      child: Text(
                                        'U',
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.fontFamily,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                          color: _isUnderline ? AppColors.primary : AppColors.ink,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 18),
                                    const Icon(
                                      CupertinoIcons.list_bullet,
                                      size: 18,
                                      color: AppColors.ink,
                                    ),
                                    const SizedBox(width: 18),
                                    const Icon(
                                      CupertinoIcons.list_number,
                                      size: 18,
                                      color: AppColors.ink,
                                    ),
                                    const SizedBox(width: 18),
                                    const Icon(
                                      CupertinoIcons.link,
                                      size: 18,
                                      color: AppColors.ink,
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 1,
                                      height: 18,
                                      color: const Color(0x182D1810),
                                    ),
                                    const SizedBox(width: 14),
                                    const Icon(
                                      CupertinoIcons.photo,
                                      size: 18,
                                      color: AppColors.ink,
                                    ),
                                  ],
                                ),
                              ),

                              Container(height: 1, color: const Color(0x142D1810)),

                              // Note Content Text Area
                              Container(
                                padding: const EdgeInsets.all(14),
                                constraints: const BoxConstraints(minHeight: 180),
                                child: TextField(
                                  controller: _bodyController,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.fontFamily,
                                    fontSize: 14,
                                    fontWeight: _isBold ? FontWeight.w700 : AppTextStyles.weightBody,
                                    fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
                                    color: AppColors.ink,
                                    height: 1.5,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: 'Start writing your note...',
                                    hintStyle: TextStyle(
                                      fontFamily: AppTextStyles.fontFamily,
                                      fontSize: 14,
                                      fontWeight: AppTextStyles.weightBody,
                                      color: Color(0xFF9E958F),
                                      height: 1.5,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Bottom Action Buttons: Save Note & Add to Folder
                        Row(
                          children: [
                            // Save Note Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Save note action
                                  final title = _titleController.text.trim();
                                  final body = _bodyController.text.trim();
                                  if (title.isNotEmpty || body.isNotEmpty) {
                                    setState(() {
                                      _savedNotes.insert(0, {
                                        'title': title.isEmpty ? 'Untitled Note' : title,
                                        'snippet': body.isEmpty ? 'No additional text' : body,
                                        'date': 'Just now',
                                        'folder': 'General',
                                      });
                                      _titleController.clear();
                                      _bodyController.clear();
                                    });
                                  }
                                },
                                child: Container(
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33E87B4E),
                                        blurRadius: 8,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.checkmark,
                                        color: AppColors.white,
                                        size: 18,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Save Note',
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.fontFamily,
                                          fontSize: 14,
                                          fontWeight: AppTextStyles.weightButtons,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            // Add to Folder Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Folder selection action
                                },
                                child: Container(
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    border: Border.fromBorderSide(
                                      BorderSide(color: Color(0x182D1810), width: 1),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.folder,
                                        color: AppColors.ink,
                                        size: 18,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Add to Folder',
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.fontFamily,
                                          fontSize: 14,
                                          fontWeight: AppTextStyles.weightButtons,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ] else ...[
                // Saved Notes Tab View
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: _savedNotes.map((note) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0x142D1810), width: 1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x06000000),
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      note['title'] ?? '',
                                      style: const TextStyle(
                                        fontFamily: AppTextStyles.fontFamily,
                                        fontSize: 15,
                                        fontWeight: AppTextStyles.weightCards,
                                        color: AppColors.ink,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFDEEE6),
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Text(
                                      note['folder'] ?? 'General',
                                      style: const TextStyle(
                                        fontFamily: AppTextStyles.fontFamily,
                                        fontSize: 11,
                                        fontWeight: AppTextStyles.weightButtons,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                note['snippet'] ?? '',
                                style: const TextStyle(
                                  fontFamily: AppTextStyles.fontFamily,
                                  fontSize: 13,
                                  fontWeight: AppTextStyles.weightBody,
                                  color: AppColors.onboardingMutedText,
                                  height: 1.35,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.clock,
                                    size: 13,
                                    color: AppColors.onboardingMutedText,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    note['date'] ?? '',
                                    style: const TextStyle(
                                      fontFamily: AppTextStyles.fontFamily,
                                      fontSize: 12,
                                      fontWeight: AppTextStyles.weightHelper,
                                      color: AppColors.onboardingMutedText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
