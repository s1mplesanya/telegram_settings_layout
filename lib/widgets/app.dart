import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserProfile(title: 'Settings'),
    );
  }
}

class UserProfile extends StatelessWidget {
  List<MenuRowData> replaceImage = [
    MenuRowData.withColor(Icons.photo_camera_outlined, 'Изменить фотографию',
        const Color.fromARGB(255, 66, 154, 226)),
  ];
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, 'Избранное'),
    MenuRowData(Icons.call_sharp, 'Недавние звонки'),
    MenuRowData(Icons.computer, 'Устройства'),
    MenuRowData(Icons.folder_copy_rounded, 'Папки с чатами'),
  ];
  List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications_active, 'Уведомления и звуки'),
    MenuRowData(Icons.privacy_tip_outlined, 'Конфиденциальность'),
    MenuRowData(Icons.date_range_outlined, 'Данные и память'),
    MenuRowData(Icons.style_outlined, 'Оформление'),
    MenuRowData(Icons.language, 'Язык'),
  ];
  List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.lock_clock, 'Apple Watch'),
  ];
  List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.help, 'Помощь'),
    MenuRowData(Icons.question_answer, 'Вопросы о Telegram'),
  ];

  final String title;
  UserProfile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.grey.shade200,
          width: double.infinity,
          child: ListView(
            children: [
              const _UserInfoColumnWidget(),
              const SizedBox(
                height: 40,
              ),
              MainMenuWidget(menuRow: replaceImage),
              const SizedBox(
                height: 20,
              ),
              MainMenuWidget(
                menuRow: firstMenuRow,
              ),
              const SizedBox(
                height: 20,
              ),
              MainMenuWidget(menuRow: secondMenuRow),
              const SizedBox(
                height: 20,
              ),
              MainMenuWidget(
                menuRow: thirdMenuRow,
              ),
              const SizedBox(
                height: 20,
              ),
              MainMenuWidget(menuRow: fourthMenuRow),
            ],
          )),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;
  Color color = Colors.black;

  MenuRowData(this.icon, this.text);
  MenuRowData.withColor(this.icon, this.text, this.color);
}

class MainMenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const MainMenuWidget({super.key, required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
          children: menuRow
              .map((data) => _MenuWidgetRow(
                    data: data,
                  ))
              .toList()),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;
  const _MenuWidgetRow({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(
            data.icon,
            color: data.color,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Text(
            data.text,
            style: TextStyle(color: data.color, fontSize: 16),
          )),
          Icon(
            Icons.chevron_right,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}

class _UserInfoColumnWidget extends StatelessWidget {
  const _UserInfoColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 40,
                ),
                _AvatarWidget(),
                SizedBox(
                  height: 15,
                ),
                _UserNameWidget(),
                SizedBox(
                  height: 5,
                ),
                _UserInfoWidget(),
              ]),
        ),
        const Positioned(
          top: 10,
          right: 10,
          child: Text(
            'Изм.',
            style: TextStyle(
                color: Color.fromARGB(255, 66, 154, 226), fontSize: 16),
          ),
        ),
        const Positioned(
          top: 10,
          left: 10,
          child: Icon(
            Icons.qr_code_rounded,
            color: Color.fromARGB(255, 66, 154, 226),
          ),
        ),
      ],
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Александр',
      style: TextStyle(
          fontSize: 29, fontWeight: FontWeight.w600, letterSpacing: 0.0),
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      '+375 33 655-62-17 • @SimpleSanya',
      style: TextStyle(
          fontSize: 18,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w300,
          letterSpacing: 0),
    ));
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: const Placeholder(),
    );
  }
}
