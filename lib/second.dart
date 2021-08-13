import 'package:baliza_assignment/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
class second extends StatefulWidget {
  var dp;
  var name;
  var list;
  var cur;
  var details;
  second(dp,name,images,cur,details){
    this.dp=dp;
    this.name=name;
    this.list=images;
    this.cur=cur;
    this.details=details;
  }
  @override
  _secondState createState() => _secondState(this.dp,this.name,this.list,this.cur,this.details);
}

class _secondState extends State<second> {
  var dp;var name;var images;var cur;var details;
  _secondState(dp,name,images,cur,details){
    this.dp=dp;
    this.name=name;
    this.images=images;
    this.cur=cur;
    this.details=details;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: cur,
                    fit: BoxFit.fill
                  )
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Hero(
                    tag: "assign",
                    child: AppBar(
                      toolbarHeight: 40,
                      backgroundColor: Colors.transparent,
                      leading: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 25),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image:  DecorationImage(image: dp,fit: BoxFit.fill,),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 25),
                    child: Text(name,style:GoogleFonts.recursive(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 4,left: 25),
                      child: Text(details[0],style: GoogleFonts.recursive(fontSize: 20),)),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0,left: 25),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        SizedBox(width: 10,),
                        Text(details[1],style: GoogleFonts.recursive(fontSize: 15),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 25),
                    child: Row(children: [Image(image: AssetImage('images/instagram.png',),height: 15,width: 15,),SizedBox(width: 10,),Text(details[2],style: GoogleFonts.recursive(fontSize: 15),)]),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child:  DraggableScrollableSheet(initialChildSize: 0.5,
                        maxChildSize: 0.5,
                        minChildSize: 0.5,
                        builder: (BuildContext context, ScrollController scrollController) {
                          return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                              ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Center(
                                    child: GestureDetector(
                                      onVerticalDragDown: (val){
                                        Navigator.push(context, _createRoute());
                                      },
                                      child: Container(
                                        height: 10,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all( Radius.circular(5)),
                                          color: Colors.grey
                                        ),
                                        child:  SingleChildScrollView(
                                          dragStartBehavior: DragStartBehavior.down,
                                          controller: scrollController,
                                          ),
                                        ),
                                    ),
                                    ),
                                  ),
                                DefaultTabController(length: 3,child: Column(
                                  children: [
                                    Padding(

                                      padding: EdgeInsets.only(top: 10),
                                      child: Container(
                                        child: TabBar(
                                          indicatorWeight: 0.01,
                                          labelColor: Colors.black,
                                          isScrollable: false,
                                          unselectedLabelColor: Colors.grey,
                                            tabs: [Tab(child: Text("Photos",textAlign: TextAlign.left,style: GoogleFonts.recursive(fontSize: 17,fontWeight: FontWeight.bold),),),
                                          Tab(child: Text("Likes",textAlign: TextAlign.left,style: GoogleFonts.recursive(fontSize: 16,fontWeight: FontWeight.bold)),),
                                          Tab(child: Text("Collections",textAlign: TextAlign.left,style: GoogleFonts.recursive(fontSize: 16,fontWeight: FontWeight.bold)),)]),
                                      ),
                                    ),
                                    Container(
                                      height: 293.9,
                                      width: 400,
                                      child: TabBarView(
                                        dragStartBehavior: DragStartBehavior.start,
                                          children: [

                                        Container(
                                         child: ListView.builder(itemCount: images.length,

                                             scrollDirection:Axis.horizontal,
                                             itemBuilder: (context,index){
                                              if(cur!=images[index]){
                                                return Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 20.0),
                                                      child: Container(
                                                        height: 240,
                                                        width: 240,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(image: images[index],fit: BoxFit.fill),
                                                          borderRadius: BorderRadius.all(Radius.circular(25)),
                                                        ),

                                                      ),
                                                    ),
                                                    SizedBox(width: 15,)
                                                  ],
                                                );
                                              }
                                              else{
                                                return SizedBox();
                                              }
                                             }),

                                        ),Container(child: Center(child: Text("Likes will be implemented soon",style: GoogleFonts.recursive(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)),),Container(child: Center(child: Text("Collections will be implemented soon",style: GoogleFonts.recursive(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)),)
                                      ]),
                                    )
                                  ],
                                ),)
                              ],
                            ),
                          );
                        },),
                ),
            ],
          ),
        ),
      ),
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyApp(),
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
