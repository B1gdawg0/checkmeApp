import 'dart:math';

import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget{
  DescriptionPage({super.key});


  @override
  State<DescriptionPage> createState()=> _DescriptionPage();
}


class _DescriptionPage extends State<DescriptionPage>{


  bool _visible = true;
  var arrowExisting = BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.white.withOpacity(0.35),
                                                        Colors.white.withOpacity(0.45),
                                                        Colors.white.withOpacity(0.55),
                                                        Colors.white.withOpacity(0.65),
                                                        Colors.white.withOpacity(0.75),],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      stops: [0.0,0.25,0.5,0.75,1.0],
                      )
                    );
  @override
  void initState() {
    super.initState(); 
    Future.delayed(const Duration(seconds: 2), () { 
      if (this.mounted) { 
        setState(() { 
          _visible=false;
          arrowExisting = BoxDecoration();
        });
      }
    });
  }
  Widget fiveStarZone(double like){
    int likeInt = like.toInt();
    List<Widget> listStar = [];

    print("${like-likeInt}");

    for(int i = 0;i<likeInt;i++){
      listStar.add(Icon(Icons.star,color: Colors.amber,));
    }
    if(like-likeInt > 0){
      listStar.add(
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds){
          return LinearGradient(
            colors: [Colors.amber,Color.fromARGB(255, 82, 82, 82)],
            begin: FractionalOffset.bottomLeft,
            end: FractionalOffset.bottomRight,
            stops: [like-likeInt-0.05,1.0]
          ).createShader(bounds);
        },
        child: Icon(Icons.star),
        )
      );

      for(int i = likeInt+2;i<6;i++){
      listStar.add(Icon(Icons.star,color: Color.fromARGB(255, 82, 82, 82),));
      }
    }else{
      for(int i = likeInt+1;i<6;i++){
      listStar.add(Icon(Icons.star,color: Color.fromARGB(255, 82, 82, 82),));
      }
    }
    

    return SizedBox(
      width: 120,
      child: Row(
        children: listStar,
    ),);
  }

  Widget showImagePart(){
    return Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  child:SizedBox(
                  height: 300, 
                  child: 
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => Image.asset("assets/images/sc3.webp",fit: BoxFit.cover,),
                  ),)
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                    height: 300,
                    width: 60,
                    decoration: arrowExisting,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Visibility(
                          visible: _visible,
                          child:const SizedBox(
                            child: Icon(Icons.arrow_circle_right_outlined,size: 50,color: Color.fromARGB(255, 83, 83, 83),),
                          )
                        ),
                      ),  
                  ),
                  )
              ],
            ),
        );
  }

  Widget showLikeStat(){
    return SizedBox(
      height: 350,
      child:Row(
        children: [
          SizedBox(
            width: 200,
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ความพึงพอใจ",style: TextStyle(fontSize: 25),),
                Center(child: Text("3.3",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),),
                Center(child: fiveStarZone(3.3),)
              ],
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: ListView(
          children: [
            Center(child:Text("สำนักกีฬา",style: TextStyle(fontSize: 47,fontWeight: FontWeight.w500),)),
            Center(child: Text("สถานกีฬาในร่ม",style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 107, 107, 107)),),),

            showImagePart(),
            showLikeStat()
          ],
        ),
    );
  }
}