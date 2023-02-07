import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String text;

  const CustomDropdown({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late GlobalKey actionKey;
  late double height, width, xPosition, yPosition;
  bool isDropdownOpen = false;
  late OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox =
        actionKey.currentContext?.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: xPosition + 16,
          width: width - 31.1,
          top: yPosition + height - 24,
          height: height * 2,
          child: Dropdown(
            itemHeight: height,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropdownOpen) {
            floatingDropdown.remove();
          } else {
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context)?.insert(floatingDropdown);
          }

          isDropdownOpen = !isDropdownOpen;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xfff4f4f4)),
          color: const Color(0xffffffff),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/IMG.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    color: Color(0xff222222),
                  ),
                ),
                const Text(
                  '49,65€',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    color: Color(0xffa0c81c),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(
                'assets/images/arrow-down.png',
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dropdown extends StatelessWidget {
  double? itemHeight;

  Dropdown({Key? key, this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: itemHeight! * 1.5,
          decoration: const BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              border: Border.symmetric(
                  vertical: BorderSide(color: Color(0xfff4f4f4)),
                  horizontal: BorderSide(color: Color(0xfff4f4f4))),
              boxShadow: [
                BoxShadow(
                  color: Color(0x19000000),
                  offset: Offset(0, 25),
                  blurRadius: 25,
                )
              ]),
          child: Column(
            children: [
              DropDownMenuItem(
                title: "Einzahlen",
                iconImageLeading: "assets/images/hand.png",
                iconImageTrailing: "assets/images/icon.png",
              ),
              DropDownMenuItem(
                title: "Auszahlen",
                iconImageLeading: "assets/images/trolly.png",
                iconImageTrailing: "assets/images/icon.png",
              ),
              DropDownMenuItem(
                title: "Gutschein",
                iconImageLeading: "assets/images/men.png",
                iconImageTrailing: "assets/images/icon.png",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DropDownMenuItem extends StatelessWidget {
  String iconImageLeading;
  String title;
  String iconImageTrailing;

  DropDownMenuItem(
      {Key? key,
      required this.iconImageLeading,
      required this.iconImageTrailing,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 17, 18, 17),
        width: double.infinity,
        height: 56,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: Image.asset(
                iconImageLeading,
                width: 22,
                height: 22,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                  color: Color(0xff222222),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(
                iconImageTrailing,
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
