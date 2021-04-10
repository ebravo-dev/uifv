import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final Function action;
  final IconData icon;
  final Color barckgroundColor;

  const NavigationButton(
      {Key key,
      @required this.action,
      this.icon,
      @required this.barckgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: barckgroundColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashFactory: InkRipple.splashFactory,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: icon != null
                  ? Icon(
                      icon != null ? icon : Icons.person,
                      color: icon != null ? Colors.grey.shade600 : Colors.white,
                      size: 20,
                    )
                  : Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      child: Text(
                        'R',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
            ),
            onTap: action,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
