import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Connexion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a global key that will uniquely identify the Form widget
  final formKey = GlobalKey<FormState>();

  // Controllers to retrieve inputs value
  final emailController = TextEditingController();

  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(":)"),
          content: new Text("Bonjour " + emailController.text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @protected
  void logIn() {
    setState(() {
      if (formKey.currentState.validate()) {
        _showDialog();
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new Form(
        key: formKey,
        child: Padding(
          padding: new EdgeInsets.all(20),
          child: new Column(
            children: <Widget>[
              new TextFormField(
                controller: emailController,
                keyboardType: TextInputType
                    .emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                    hintText: 'me@example.com', labelText: 'Adresse email'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez saisir votre adresse email';
                  }

                  RegExp regExp = new RegExp(emailPattern);
                  if (!regExp.hasMatch(value)) {
                    return "Veuillez saisir une adresse email valide.";
                  }
                },
              ),
              new TextFormField(
                obscureText: true, // Use secure text for passwords.
                decoration: new InputDecoration(
                    hintText: '***', labelText: 'Mot de passe'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez saisir votre mot de passe';
                  }
                },
              ),
              new Container(
                child: Hero(
                    tag: "fabHero",
                    child: new RaisedButton(
                      child: new Text('Login'),
                      onPressed: logIn,
                    )),
                margin: new EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
