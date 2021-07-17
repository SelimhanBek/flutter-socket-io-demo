import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {

  @override
  void initState() {
    initSocket();
    super.initState();
  }

  @override
  void dispose() {
    return super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (this.mounted) {
      return super.setState(fn);
    }
  }

  void initSocket() { 
    IO.Socket socket = IO.io('http://<IPv4 Adress>:<Port>', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.emit('connect_on', 'Flutter Socket.IO, Success');

    socket.on('connect_on', (data) => 
      print(data),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Text("Socket Connection"),),
      body: Container(
        alignment: Alignment.center,
        child: Center(child: Text("If you can see 'Flutter Socket.IO, Success' in console then you achived connection :)"),)
      ),
    );
  }
}
