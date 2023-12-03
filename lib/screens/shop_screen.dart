import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webclient/models/menu_model.dart';
import 'package:webclient/provider/user_provider.dart';
import 'package:webclient/services/api_test.dart';
import 'package:webclient/style.dart';
import 'package:webclient/widgets/menu_widget.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late Future<List<MenuModel>> menuList;

  @override
  void initState() {
    super.initState();
    menuList = ApiTest.testGetMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const AppBarText(
          content: '상점',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.text, width: 1.5),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(5, 5),
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(
                        content:
                            '${context.read<UserProvider>().user!.userName} 님'),
                    const NormalText(content: '사용 가능 하신 마일리지는 '),
                    Row(
                      children: [
                        TitleText(
                            content:
                                '${context.watch<UserProvider>().mailleage}'),
                        const NormalText(content: ' point입니다.'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const HeadingText(content: '메뉴 리스트'),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: menuList,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: TitleText(content: '상점 준비 중입니다.'),
                  );
                }
                return Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    children: snapshot.data!
                        .map(
                          (menu) => GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const HeadingText(content: '메뉴'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Image(
                                          image:
                                              AssetImage('assets/coffee.png'),
                                          width: 100,
                                          height: 100,
                                        ),
                                        NormalText(content: menu.name),
                                        BoldText(
                                            content: '${menu.price} point'),
                                        CaptionText(content: menu.description),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('취소'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        //구매

                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('구매'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Menu(
                              name: menu.name,
                              price: menu.price,
                              description: menu.description,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
