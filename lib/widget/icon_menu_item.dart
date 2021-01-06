import 'package:flutter/material.dart';

class IconMenuItem extends StatelessWidget {
  String title;
  String row1;
  IconData icon;
  Function onTap = () {};

  IconMenuItem({Key key, this.title, this.row1, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        //radius: 45.0,
        //highlightColor: Theme.of(context).primaryColorLight,
        //focusColor: Theme.of(context).primaryColorLight,
        //splashColor: Theme.of(context).primaryColorLight,
        onTap: onTap,
        child: Container(
          //color: Colors.white,
          margin: EdgeInsets.all(2.0),
          //width: 320.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            border: Border.all(
              width: 1.0,
              color: Colors.grey[200],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 8.0),
                    Container(
                      width: 60,
                      // decoration: BoxDecoration(
                      //   color: Theme.of(context).primaryColorLight,
                      //   borderRadius: BorderRadius.circular(15.0),
                      //   border: Border.all(
                      //     width: 1.0,
                      //     color: Theme.of(context).primaryColorLight,
                      //   ),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icon,
                              color: Theme.of(context).primaryColorDark,
                              size: 40)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.title,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              this.row1,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
