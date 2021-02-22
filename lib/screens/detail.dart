import 'package:devlance_certificate_web/models/cert.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Detail extends StatefulWidget {
  Detail(this.cert);
  final Certificate cert;
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.red200,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Certificate',
        ),
      ),
      body: VStack([
        ListTile(
          title: Text('Name'),
          subtitle: Text(widget.cert.name),
        ),
        Divider(),
        ListTile(
          title: Text('Work'),
          subtitle: Text(widget.cert.work),
        ),
        Divider(),
        ListTile(
          title: Text('Project name'),
          subtitle: Text(widget.cert.projectName),
        ),
        Divider(),
        ListTile(
          title: Text('Issued On'),
          subtitle: Text(
              '${widget.cert.issuedOn.day}/${widget.cert.issuedOn.month}/${widget.cert.issuedOn.year}'),
        ),
        Divider(),
        ListTile(
          title: Text('Verification Code'),
          subtitle: Text(widget.cert.uniqueId),
        ),
        Divider(),
      ]),
    );
  }
}
