import 'package:checkme/dataController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Items extends StatefulWidget{
  String name = "";
  String path = "";
  double like = 0.0;
  int comment = 0;
  int number = 0;
  Items({super.key, required this.name, required this.like, required this.comment, required this.number, required this.path});

  @override
  State<Items> createState()=> _Items();
}



class _Items extends State<Items>{

  bool isLove = false;
  Widget heartIcon = Icon(Icons.favorite_outline, color:  Colors.red,);


  Widget getIconZone(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(2.5, 0, 5, 0),
            child: SizedBox(height: 100,width: 70,
            child: 
              Column(
                children: [
                  Icon(Icons.star, color: Colors.amber,),
                  Text("${widget.like}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Text("ความพอใจ")
                ],
              ),),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 2.5, 0),
            child: SizedBox(height: 100,width: 75,
            child: 
              Column(
                children: [
                  Icon(Icons.comment, color: Colors.purple,),
                  Text("${widget.comment}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Text("ความคิดเห็น")
                  ],
              ),),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(height: 100,width: 75,child: 
          Column(
            children: [
              Icon(Icons.wheelchair_pickup, color: Colors.blue,),
              Text("${widget.number}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text("จำนวน")
            ],
          ),)
          ),


          
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataController>(builder: (context, passer, child) => 
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "./description");
        },
        child: 
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12.0)),color: Color.fromARGB(255, 212, 217, 245)),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 160,
                            width: 140,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset("assets/images/${widget.path}", fit: BoxFit.cover,),
                            ),
                          ),
              
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
                            child: Column(
                              children: [
                                SizedBox(width: 200,height: 30 , child: Center(child: Text("${widget.name}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),),),

                                getIconZone()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ),


                Container(
                  margin: EdgeInsets.fromLTRB(0, 13, 25, 0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        isLove = !isLove;
                        if(isLove) heartIcon = Icon(Icons.favorite, color: Colors.red,);
                        else heartIcon = Icon(Icons.favorite_outline, color: Colors.red,);
                      }),
                      child: heartIcon,
                    ),
                  ),
                )
              ],
          ),
      ),);
  }
}