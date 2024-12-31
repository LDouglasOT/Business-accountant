import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retailer/Config/Colors.dart';

class Cartcard extends StatelessWidget {
  const Cartcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              clipBehavior: Clip.antiAlias,
              child: Image.network('https://www.shutterstock.com/shutterstock/photos/1775086994/display_1500/stock-photo-brand-new-electrical-socket-isolated-on-gray-wall-renovated-studio-apartment-power-supply-1775086994.jpg',height:60,width:60,fit: BoxFit.cover,),
              ),
          ),
          SizedBox(width: 10,),
           Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text('Sockets',style:GoogleFonts.lato(fontWeight:FontWeight.bold,fontSize:17,color:Colors.black)),
                Text('UGX 15,000',style:GoogleFonts.lato(fontWeight:FontWeight.bold,fontSize:15,color:Colors.black)),
                Text('20 pieces',style:GoogleFonts.lato(fontWeight:FontWeight.bold,fontSize:12,color:Colors.black))
              ],    
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.height*0.1,),
          Align(
            alignment: Alignment.topLeft,
            child:Row(children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add)),
            Text("5",style: TextStyle(color: AppColors.primary),),
            IconButton(onPressed: (){}, icon: Icon(Icons.remove))
          ],),
        )
      ],
    ),
  );
 }
}