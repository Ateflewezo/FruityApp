import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
      height: 50,
      child: Row(
        children: [

          // ========== Box Filter ========================
          new Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(child: Icon(Icons.filter_alt_outlined)),
          ),


          // ========== Box Search ========================
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text("أكتب ما تبحث عنه وسنجده لك"),
                  new Icon(Icons.search),
                ],
              ),
            ),
          ),


          new Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black,
            ),
            child: Center(child: Text("AR",style: TextStyle(color: Colors.white,fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}
