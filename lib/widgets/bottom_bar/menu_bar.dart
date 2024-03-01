import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  MenuBar({this.onChange});

  Function(MenuBarEnum)? onChange;

  @override
  MenuBarState createState() => MenuBarState();
}

class MenuBarState extends State<MenuBar>{
  int selecIcon=0;
  List<MenuIcon> menuIconList=[
    MenuIcon(
      icon: Icons.map, 
      selectedIcon: Icons.map,
      title: "แผนที่", 
      type: MenuBarEnum.f
    ),
    MenuIcon(
      icon: Icons.favorite_border,
      selectedIcon: Icons.favorite,
      title: 'ที่ถูกใจ', 
      type: MenuBarEnum.f
    ),
    MenuIcon(
      icon: Icons.account_circle,
      selectedIcon: Icons.account_circle_outlined,
      title: 'โปรไฟล์', 
      type: MenuBarEnum.f
    )
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      height: 63,
      decoration: BoxDecoration(
        color: const Color(0XFF455A64),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10)
        ),
        border: Border.all(
          color: Colors.grey.shade50,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0,4)
          )
        ]
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selecIcon,
        type: BottomNavigationBarType.fixed,
        items: List.generate(menuIconList.length, (index){
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  selecIcon == index ? menuIconList[index].selectedIcon : menuIconList[index].icon,
                  color: selecIcon == index ? Colors.white : Colors.grey,
                ),
                SizedBox(height: 6),
                Text(
                  menuIconList[index].title ?? '',
                  style: TextStyle(
                    color: selecIcon == index ? Colors.white : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }),
        onTap: (index) {
          setState(() {
            selecIcon = index; 
          });
          if (widget.onChange != null) {
            widget.onChange!(menuIconList[index].type);
          }
        },
      ),
    );
  }
}

class MenuIcon {
  MenuIcon({
    required this.icon,
    required this.selectedIcon,
    this.title,
    required this.type
  });
  IconData icon;
  IconData selectedIcon;
  String? title;
  MenuBarEnum type;
}

enum MenuBarEnum {
  f
}
