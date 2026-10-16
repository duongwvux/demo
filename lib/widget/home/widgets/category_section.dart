import 'package:flutter/material.dart';
import 'package:core/widget/category_shortcut_widget.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryShortcutWidget(
            label: "Examine",
            icon: Icon(Icons.find_in_page),
            onTap: null,
          ),
          SizedBox(width: 8,),
          CategoryShortcutWidget(
            label: "Ripple",
            icon: Icon(Icons.waves),
          ),
          SizedBox(width: 8,),
          CategoryShortcutWidget(
            label: "Wallet",
            icon: Icon(Icons.wallet),
            onTap: null,
          ),
          SizedBox(width: 8,),
          CategoryShortcutWidget(
            label: "Markets",
            icon: Icon(Icons.map),
            onTap: null,
          ),
          SizedBox(width: 8,),
          CategoryShortcutWidget(
            label: "Settings",
            icon: Icon(Icons.settings),
            onTap: null,
          ),
          SizedBox(width: 8,),
          CategoryShortcutWidget(
            label: "Features",
            icon: Icon(Icons.featured_video),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
