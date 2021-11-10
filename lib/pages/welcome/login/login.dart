import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/welcome/components/welcome.dart';
import 'package:lyexamination/pages/welcome/controller.dart';
import 'package:lyexamination/pages/welcome/login/form.dart';
import 'package:lyexamination/service.dart';

class WelcomeLoginPage extends StatelessWidget {
  WelcomeLoginPage({Key? key}) : super(key: key);

  final AppGlobeService a = Get.find();
  final WelcomeController w = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(child: SizedBox(height: 32)),
          WelcomeComponent(),
          tip,
          form,
          buttons,
        ],
      ),
    );
  }

  Widget get tip => Container(
        margin: const EdgeInsets.only(top: 16, left: 16),
        child: Obx(() => Text('请使用您的\u9F99\u5CA9\u5BB6\u6821帐号登录',
            style: a.theme.value.textTheme.headline6)),
      );

  Widget get form => Container(
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: FormComponent(),
      );

  Widget get buttons => Container(
        margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: Row(
          children: [
            Expanded(flex: 1, child: aboutButton),
            const SizedBox(width: 8),
            Expanded(flex: 2, child: nextButton),
          ],
        ),
      );

  EdgeInsets get buttonEdge => const EdgeInsets.only(top: 14, bottom: 14);

  RoundedRectangleBorder get buttonShape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  Widget get aboutButton => OutlinedButton(
        onPressed: () => Messenger.snackBar('正在开发中哦'),
        style:
            OutlinedButton.styleFrom(padding: buttonEdge, shape: buttonShape),
        child: const Text('了解详情'),
      );

  Widget get nextButton => ElevatedButton(
        onPressed: () => w.go(),
        style: ElevatedButton.styleFrom(
            elevation: 0, padding: buttonEdge, shape: buttonShape),
        child: const Text('下一步'),
      );
}
