import 'package:flutter/material.dart';
import 'package:loc/features/gallery_feature/data/models/user_model.dart';

class UsersList extends StatelessWidget {
  const UsersList({required this.users, super.key});
  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //physics: NeverScrollableScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ExpansionTile(
          expandedAlignment: Alignment.topLeft,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
          leading: Text("${user.id}"),
          title: Text("${user.name}"),
          subtitle: Text("${user.username}"),
          trailing: Text("${user.phone}"),
          children: [
            Text("${user.email}"),
            Text("${user.website}"),
            Text('${user.address?.zipcode}, ${user.address?.suite}, ${user.address?.street}, ${user.address?.city}'),
            Text("${user.company?.name}"),
            Text("${user.company?.catchPhrase}"),
            Text("${user.company?.bs}"),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
