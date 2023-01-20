import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class PickedIt extends StatefulWidget {
  const PickedIt({super.key});

  @override
  State<PickedIt> createState() => _PickedItState();
}

class _PickedItState extends State<PickedIt> {
  File? image;
 Future pickImage() async {
  final image = await ImagePicker().pickImage(source:ImageSource.gallery);
if(image == null) return;

// final imgTemp = File(image.path);
final imgper = await saveImgPermanently(image.path);
this.image = imgper;

 }
  String _pathText = 'Path...';
  dynamic imageFile = NetworkImage('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(children: [TextButton(onPressed: ()
{
  pickImage();
},

     //   final result = FilePicker.platform.pickFiles(allowMultiple: false)
      
     //   _pathText =result.files.first.path.toString();
      
      child:Text("Pick Image")
      ),

      
      Spacer(),image != null ? Image.file(image!, width:160,height: 100,) : Text("Ohh")
      ],),


    );
  }
}

Future saveImgPermanently(String imagePath) async{
  final dir = await getApplicationDocumentsDirectory();
  final name  = basename(imagePath);
  final image = File('${dir.path}/$name');

  return File(imagePath).copy(image.path);
}
