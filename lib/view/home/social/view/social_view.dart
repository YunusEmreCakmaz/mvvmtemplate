import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_widgets/animation/social_card_animation.dart';
import '../../../_product/_widgets/list-tile/friend_card.dart';
import '../viewmodel/social_view_model.dart';

class SocialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Container(
        color: context.colors.background,
        padding: context.paddingLow,
        child: Scaffold(
            appBar: buildAppBar(context),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextFindFriend(context),
                Spacer(flex: 2),
                TextField(
                  onChanged: (value) {
                    viewModel.fetchAllSearchQuery(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: context.colors.onSecondary.withOpacity(0.3),
                    ),
                  ),
                ),
                Spacer(flex: 2),
                Expanded(
                  flex: 90,
                  child: Observer(builder: (_) => buildListViewUser(viewModel)),
                )
              ],
            )),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: () {},
        child: Text(LocaleKeys.home_social_cancel.locale),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            LocaleKeys.home_social_next.locale,
            style: context.textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.w600,
              color: context.theme.buttonTheme.colorScheme.onError,
            ),
          ),
        )
      ],
    );
  }

  Text buildTextFindFriend(BuildContext context) {
    return Text(
      LocaleKeys.home_social_findFriends.locale,
      style: context.textTheme.headline4.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colors.onSecondary,
      ),
    );
  }

  Widget buildListViewUser(SocialViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.socialUserList.length,
      itemBuilder: (context, index) {
        viewModel.fetchAllUserLoading(index);
        return OpenContainerSocailWrapper(
          socialUser: viewModel.socialUserList[index],
          closedBuilder: (BuildContext _, VoidCallback openContainer) => FriendCard(
            user: viewModel.socialUserList[index],
            onPressed: openContainer,
          ),
        );
      },
    );
  }
}
