import 'package:firebase_chat_app/presentation/export/home_exports.dart';

class UsersList extends StatelessWidget {
  UsersList({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CommonAppBar(title: AppStrings.newChat),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(
              controller: searchController,
              hintText: AppStrings.searchUsers,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Image.asset(
                  AppImages.searchIcon,
                  height: 7,
                  width: 7,

                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
            ),

            Expanded(
              child: StreamBuilder<List<UserModel>>(
                stream: sl<AuthRemoteDataSource>().getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitFadingCircle(
                        size: 40,
                        color: theme.primaryColor,
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return _emptyState();
                  }

                  final users = snapshot.data!;

                  return ListView.separated(
                    itemCount: users.length,
                    separatorBuilder: (_, _) =>
                        Divider(color: theme.dividerColor, height: 1),
                    itemBuilder: (context, index) {
                      final user = users[index];

                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/chat', arguments: user);
                        },
                        child: ChatCardListView(user: user),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 80, color: Colors.grey),
          SizedBox(height: 12),
          Text("No users found"),
        ],
      ),
    );
  }
}
