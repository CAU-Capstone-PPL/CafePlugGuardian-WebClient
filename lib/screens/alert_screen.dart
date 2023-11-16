import 'package:flutter/material.dart';
import 'package:webclient/models/alert_model.dart';
import 'package:webclient/services/api_test.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/alert_widget.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  late Future<List<AlertModel>> alerts;

  @override
  void initState() {
    super.initState();
    alerts = ApiTest.tsetGetAlertList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const AppBarText(
          content: '플러그 보호 알람',
        ),
        backgroundColor: AppColor.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: alerts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  var alert = snapshot.data![index];
                  return Alert(
                    plugId: alert.plugId,
                    plugName: alert.plugName,
                    blockingTime: alert.blockingTime,
                    check: alert.check,
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
