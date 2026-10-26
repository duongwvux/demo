import 'package:core/firebase/core_services.dart';
import 'package:flutter/material.dart';

class HomePromo extends StatefulWidget {
  const HomePromo({super.key});

  @override
  State<HomePromo> createState() => _HomePromoState();
}

class _HomePromoState extends State<HomePromo> {
  @override
  void initState() {
    super.initState();
    CoreServices.instance.remoteConfig.onUpdated.listen((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = CoreServices.instance.remoteConfig;
    final showBanner = config.getBool('show_banner');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(config.getString('welcome_message')),
        if (showBanner)
          const Card(
            child: ListTile(
              title: Text('Ưu đãi mới'),
              subtitle: Text('Nội dung banner có thể thay đổi theo cấu hình.'),
            ),
          ),
      ],
    );
  }
}