import 'package:firebase_chat_app/presentation/export/home_exports.dart';

class ChatCardListView extends StatelessWidget {
 final UserModel user;

  const ChatCardListView({super.key,  required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: 50,
              width: 50,
              child: CachedNetworkImage(
                imageUrl: user.image ?? "",

                placeholder: (context, url) => const Center(
                  child: SpinKitCircle(size: 20, color: Colors.grey),
                ),

                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.person, color: Colors.white),
                ),

                fit: BoxFit.cover,
              ),
            ),
          ),

          AppSpacing.h12,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(user.name, style: AppTextStyles.medium),

                AppSpacing.v4,

                AppText(
                  "Hello vvbvn",
                  style: AppTextStyles.small,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ],
            ),
          ),

          AppText(
            "2:30 PM",
            style: AppTextStyles.small,
            color: theme.textTheme.bodySmall?.color,
          ),
        ],
      ),
    );
  }
}
