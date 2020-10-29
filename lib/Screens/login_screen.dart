
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';





class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  _logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(

      body:
      Center(
        child:
        _isLoggedIn
            ?
        Container(
          height: double.infinity,
          width: double.infinity,
        color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(backgroundImage: NetworkImage(_googleSignIn.currentUser.photoUrl),
                  radius: 60),
              Text(_googleSignIn.currentUser.displayName, style: Theme.of(context).textTheme.headline1 ),
              Text(_googleSignIn.currentUser.email,style: Theme.of(context).textTheme.headline2),

              Container(
                margin: EdgeInsets.all(deviceWidth* .05),
                width: deviceWidth * .3,
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: (){
                    _logout();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.red),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.logout,color: Colors.red,),
                      Text("Logout")
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
            :
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://i.pinimg.com/originals/03/e4/34/03e434b76fb44df5af6231797854c4aa.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child: Center(
            child:
            Container(
              width: deviceWidth * .7,
              child: RaisedButton(
                color: Colors.white,
                onPressed: (){
                  _login();
                  _getCurrentLocation();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.red),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FaIcon(FontAwesomeIcons.google,color: Colors.cyan,),
                    Text("Sign In with Google")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


void _getCurrentLocation() async
{
  final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  print(position);
}