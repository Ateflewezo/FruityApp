import 'package:flutter/material.dart';
import 'package:fruity/Model/ModelMyOrders.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';

class Wait extends StatelessWidget {
  final DatumMyOrder order;
  final Function onTap;

  const Wait({Key key, this.order, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.shade100.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    An.text("${order.orderNumber}",
                        size: fontSizeTitle + 4, fontWeight: FontWeight.bold),
                    An.text("${order.orderCreated}",
                        size: fontSizeTitle, color: ColorApp.subTitle(context)),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(10)),
                      child: An.text("${order.status}",
                          fontWeight: FontWeight.bold,
                          size: fontSizeSubTitle,
                          color: Colors.amber),
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_outlined))
            ],
          )),
    );
  }
}
