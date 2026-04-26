import 'package:firebase_chat_app/presentation/export/home_exports.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const AppText(
          "Chats",
          style: AppTextStyles.title,
          color: Colors.white,
        ),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 12),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),

      body: Column(
        children: [
          CustomTextField(
            controller: searchController,
            hintText: AppStrings.searchUsers,
            prefixIcon: Image.asset(AppImages.searchIcon,height: 12,width: 12,),
          ),

          Expanded(
            child: StreamBuilder<List<UserModel>>(
              stream: sl<AuthRemoteDataSource>().getUsers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CommonSpinkit();
                }

                final users = snapshot.data!;

                if (users.isEmpty) {
                  return buildEmptyState();
                }

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return ChatCardListView(user: user);
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: isDark
            ? AppColors.darkPrimary
            : AppColors.lightPrimary,
        child: Center(
          child: Image.asset(
            AppImages.chatIcon,
            color: AppColors.lightBackground,
          ),
        ),
        onPressed: () {
          AppNavigator.pushNamed(context, AppRoutes.usersList);
        },
      ),
    );
  }

  Widget buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            "No chats yet",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            "Start a conversation now!",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
