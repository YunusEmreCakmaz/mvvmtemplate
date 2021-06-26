import 'package:flutter/material.dart';

import '../../../core/components/button/title_text_button.dart';

class FaceBookButton extends StatelessWidget {
  final Function(FaceBookModel model, {String errorMessage}) onComplete;

  FaceBookButton({Key key, this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
      title: 'FaceBook Button',
      onPressed: () {
        final isLengthSixCharacter = 'dsadada'.length == 6;

        if (isLengthSixCharacter) {
          onComplete(FaceBookModel('sada', 'dsada'));
        } else {
          onComplete(null, errorMessage: 'Error');
        }
      },
    );
  }
}

class FaceBookModel {
  final String token;
  final String mail;

  FaceBookModel(this.token, this.mail);
}
