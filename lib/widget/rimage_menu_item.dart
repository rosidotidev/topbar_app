import 'package:flutter/material.dart';

class RImageMenuItem extends StatelessWidget {
  String title;
  String row1;
  String imageUrl;
  String langValue;
  Color borderColor;
  Function onTap = () {};

  RImageMenuItem(
      {Key key,
      this.title,
      this.row1 = '',
      this.langValue = '',
      this.imageUrl,
      this.borderColor,
      this.onTap})
      : super(key: key);

  Widget _buildRoundImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
        border: Border.all(
          width: 2.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: ClipOval(
        child: Image(
          height: 60.0,
          width: 60.0,
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          //fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              width: 3.0,
              color: borderColor,
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
                      width: 90,
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
                        children: [_buildRoundImage(context)],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 4.0),
                            Text(
                              this.title,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
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
