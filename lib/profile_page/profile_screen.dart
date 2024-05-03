
import 'package:final_project/firebase_utils/FirebaseUtils.dart';
import 'package:final_project/model/myUser.dart';
import 'package:final_project/profile_page/EditNewPassword.dart';
import 'package:final_project/provider/Auth_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../Register/sign_up/sign_up.dart';
import '../theming.dart';
import 'edit.dart';

import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';



class ProfileScreen extends StatefulWidget {

  static const routeName ="ProfileScreen";
  ProfileScreen(
      {Key? key,required this.obsucre})
      : super(key: key);
 String? uId;
  String? name ;
  String? email;
  String? pass;
  bool obsucre;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    widget.uId=ProviderAuth.prefs.getString('id');
    widget.name=ProviderAuth.prefs.getString('name');
    widget.email=ProviderAuth.prefs.getString('email');
    widget.pass=ProviderAuth.prefs.getString('password');
  }

  Uint8List? _image;
  // @override
  // initState() {
  //   super.initState();
  //    var data= FirebaseUtils.readUser(
  //        "KFEjZBnpluahr79wdjn2VVYlTyy2");
  //   widget.name=data['name'];
  //   print(data['name']);
  //   widget.email=data['email'];
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    var authProvider=Provider.of<ProviderAuth>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile" , style: Theme.of(context).textTheme.titleLarge,),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {},
        // ),
        actions: [
          // IconButton(
          //     icon: Icon(
          //       Icons.share, color: Colors.black,
          //     ),
          //     onPressed: () {}
          // )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                ImageProfile(),
                //const SizedBox(height: 20),

                ListTile(
                  leading: Icon(Icons.person , color:Theming.primary,),
                  title: Text('${widget.name}', style: Theme.of(context).textTheme.titleMedium),
                ),

                const SizedBox(height: 10),

                ListTile(

                  leading: Icon(Icons.email , color:Theming.primary,),
                  title: Text('${widget.email}' ,style: Theme.of(context).textTheme.titleMedium,overflow:TextOverflow.ellipsis,),
                ),

                const SizedBox(height: 10),

                ListTile(
                  onTap:() {
                    Navigator.pushNamed(context,EditNewPassword.routeName);
                    setState(() {
                    });
                  },
                  leading: Icon(Icons.lock , color:Theming.primary,),
                  title: TextFormField(initialValue:'${widget.pass}',
                       style: Theme.of(context).textTheme.titleMedium,
                    readOnly: true,
                    obscureText: true,
                    decoration: InputDecoration(border: InputBorder.none,
                  ),)
                ),

                const SizedBox(height: 10),

                // ListTile(
                //   leading: Icon(Icons.phone , color:Theming.primary,),
                //   title: Text('${globalPhone}', style: Theme.of(context).textTheme.titleMedium),
                // ),


                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        EditProfile.routeName,
                        arguments: {
                          "uId":"${widget.uId}",
                          "name": '${widget.name}',
                          "email": '${widget.email}',
                          "password": '${widget.pass}',
                          "obsucre": widget.obsucre,
                        },
                      );

                      // Update the profile screen if changes were made
                      // if (result != null && result is Map<String, dynamic>) {
                      //   setState(() {
                      //     widget.name= User?.userName;
                      //     // globalEmail = result['email'];
                      //     // globalPassword= result['password'];
                      //     //globalPhone = result['phone'];
                      //   });
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Theming.primary,
                    ),
                    child:  Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget ImageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        _image != null
            ? CircleAvatar(
          radius: 85,
          backgroundImage: MemoryImage(_image!),
        )
            : const CircleAvatar(
          radius: 85,
          backgroundImage: NetworkImage(
              'https://le-cdn.hibuwebsites.com/1ed44d5e15d1405ab7c233dcf1a85b90/dms3rep/multi/opt/Untitled-design-1920w.png'),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //border: Border.all(width: 3, color: Colors.white),
                  color:Theming.primary),
              child: Icon(Icons.edit ,color: Theming.darkBlue, ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text(
            "Pick Profile Photo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                captureImage();
              },
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                selectImage();
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
  }
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  void captureImage() async {
    Uint8List img = await pickImage(ImageSource.camera);
    setState(() {
      _image = img;
    });
  }
}

