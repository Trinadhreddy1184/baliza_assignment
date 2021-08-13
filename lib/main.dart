import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baliza_assignment/second.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map details={'Caleb Goerge':['@calebgeorge','Dayton,OH',''],'Teemu Pannanen':['@xteemu','Stockholm,Sweden','instagram/teemography'],'Leonard Cotte':['@leonardcotte','Ohio,USA','instagram/leonardcotte']};
  Map profiles={'Caleb Goerge':[AssetImage('images/caleb george.jpg')],'Teemu Pannanen':[AssetImage('images/2.jpg'),AssetImage('images/1.jpg'),AssetImage('images/3.jpg')],'Leonard Cotte':[AssetImage('images/leonardocotte1.jpg'),AssetImage('images/leonardocotte.jpg')]};
  List dp=[AssetImage('images/caleb.jpg'),AssetImage('images/teemu.jpg'),AssetImage('images/leonard.jpg'),AssetImage('images/leonard.jpg')];
  List users=['Caleb Goerge','Teemu Pannanen','Leonard Cotte','Leonard Cotte'];
  List images=[AssetImage('images/caleb george.jpg'),AssetImage('images/2.jpg'),AssetImage('images/leonardocotte1.jpg'),AssetImage('images/leonardocotte.jpg')];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: ListView.builder(
                itemCount: images.length,
                  itemBuilder: (context,index){
                return Stack(
                  children: [
                    Image(image: images[index],height: 240,fit:BoxFit.cover,width: 400,),
                    Padding(
                      padding: const EdgeInsets.only(top: 180,left: 20,bottom: 10),
                      child: GestureDetector(
                        onTap:(){
                            Navigator.push(context,_createRoute(dp[index],users[index],profiles[users[index]],images[index],details[users[index]]));
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Container(
                                 height: 40,
                                 width: 40,
                                 decoration: BoxDecoration(
                                   image:  DecorationImage(image: dp[index],fit: BoxFit.fill,),
                                   borderRadius: BorderRadius.all(Radius.circular(40)),
                                 ),
                                 ),
                              SizedBox(width: 10,),
                              Text(users[index],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                    )

                  ],
                );
              }),
          ),
            Container(
              height: 40,
              child: Hero(
                tag: 'assign',
                child: AppBar(
                  toolbarHeight: 40,
                  title: Text("Plants"),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
                ),
              ),
            ),
          ],
        ),

    ),
    ),
    );
  }
  Route _createRoute(dp,name,images,cur,details) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => second(dp,name,images,cur,details),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        const curve = Curves.easeInOutBack;

        var tween = Tween(begin:begin, end:end).chain(CurveTween(curve: curve));
        return SlideTransition(
          transformHitTests: true,
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}