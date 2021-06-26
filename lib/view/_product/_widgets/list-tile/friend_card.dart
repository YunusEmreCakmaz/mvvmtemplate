import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../home/social/model/social_user_model.dart';

class FriendCard extends StatelessWidget {
  final SocialUser user;
  final VoidCallback onPressed;

  const FriendCard({Key key, this.user, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.image),
      ),
      title: Text(user.name),
      subtitle: Text(user.company),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonTheme.colorScheme.onError),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        child: Text(
          LocaleKeys.home_social_follow.locale,
          style: TextStyle(color: context.colors.background),
        ),
      ),
    );
  }
}
