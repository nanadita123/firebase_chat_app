import 'package:firebase_chat_app/presentation/export/bottom_nav_exports.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBackground.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(AppImages.chatIcon, 0),
          _buildItem(AppImages.searchIcon, 1),
          _buildItem(AppImages.compassIcon, 2),
          _buildItem(AppImages.userIcon, 3),
        ],
      ),
    );
  }

  Widget _buildItem(String icon, int index) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16 : 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.darkPrimary.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            AnimatedScale(
              scale: isSelected ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset(
                icon,
                height: 22,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? AppColors.darkPrimary
                      : AppColors.darkTextSecondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              AnimatedOpacity(
                opacity: isSelected ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: AppText(
                  _getLabel(index),
                  style: AppTextStyles.title.copyWith(
                    fontSize: 12,
                    color: AppColors.darkPrimary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return "Chats";
      case 1:
        return "Explore";
      case 2:
        return "Activity";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }
}
