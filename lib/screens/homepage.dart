import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devlance_certificate_web/models/cert.dart';
import 'package:devlance_certificate_web/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.red200,
      body: VStack(
        [
          "Devlance Certifcate Verifier"
              .text
              .extraBold
              .color(Colors.pinkAccent)
              .size(40)
              .makeCentered()
              .objectTopCenter(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VxBox(
                      child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter your certificate unique ID',
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ).centered().px16())
                  .rounded
                  .height(context.percentWidth * 5)
                  .width(context.screenWidth / 1.5)
                  .shadow3xl
                  .white
                  .makeCentered(),
              30.heightBox,
              ElevatedButton(
                onPressed: () async {
                  final x = await FirebaseFirestore.instance
                      .collection('cert')
                      .where('uniqueId', isEqualTo: controller.text)
                      .get();
                  if (x.docs.length == 0) {
                    context.showToast(
                        msg: 'Certificate not found', bgColor: Colors.red);
                  } else {
                    context.showToast(
                        msg: 'Certificate found!', bgColor: Colors.green);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Detail(Certificate.fromDocument(x.docs[0]))));
                  }
                },
                child: Text('Search Certificate'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent)),
              ).centered()
            ],
          ).expand()
        ],
        alignment: MainAxisAlignment.center,
        axisSize: MainAxisSize.max,
      ).p32(),
    );
  }
}
