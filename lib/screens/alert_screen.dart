import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webclient/provider/alert_provider.dart';
import 'package:webclient/services/api_test.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/alert_widget.dart';

class AlertScreen extends StatefulWidget {
  int plugId;
  AlertScreen({super.key, required this.plugId});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    context.read<AlertProvider>().updateAlert(widget.plugId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const AppBarText(
          content: '플러그 Off 로그',
        ),
        backgroundColor: AppColor.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: context.watch<AlertProvider>().alertList!.isNotEmpty
            ? ListView.separated(
                itemCount: context.watch<AlertProvider>().alertList!.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
                itemBuilder: (context, index) {
                  var alert = context.watch<AlertProvider>().alertList![index];
                  return Alert(
                      plugId: alert.plugId,
                      plugName: alert.plugName,
                      type: alert.type,
                      plugOffTime: alert.plugOffTime,
                      ownerCheck: alert.ownerCheck,
                      isToggleOn: alert.isToggleOn);
                },
              )
            : const Center(
                child: TitleText(content: '로그가 없습니다.'),
              ),
      ),
    );
  }
}
