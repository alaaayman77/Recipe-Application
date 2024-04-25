import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'edit.dart';





class ProfileScreen extends StatefulWidget {

  ProfileScreen(
      {Key? key, required this.name, required this.email, required this.pass, required this.phone,})
      : super(key: key);

  String name;
  String email;
  String pass;
  String phone;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.share, color: Colors.black,
              ),
              onPressed: () {}
          )
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
                  leading: Icon(Icons.person),
                  title: Text(widget.name),
                ),

                const SizedBox(height: 10),

                ListTile(
                  leading: Icon(Icons.email),
                  title: Text(widget.email),
                ),

                const SizedBox(height: 10),

                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text(widget.pass),
                ),

                const SizedBox(height: 10),

                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(widget.phone),
                ),


                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EditProfile()));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Color(0xFFC8E6C9)
                      ),
                      child: const Text('Edit Profile',style: TextStyle(color: Colors.black),)),
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
                  color: Color(0xFFC8E6C9)),
              child: Icon(Icons.edit),
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

