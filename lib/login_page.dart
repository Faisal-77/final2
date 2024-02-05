import 'package:f_f1_faisal_alshikh/home_page.dart';
import 'package:f_f1_faisal_alshikh/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:f_f1_faisal_alshikh/final_page.dart';
import 'json/users.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState()=> _HomeState() ;
}

class _HomeState extends State<LoginPage>{
  final userController = TextEditingController();
  final noController = TextEditingController();
  bool isChecked = false;
  bool isLoginTrue = false;
  final db = SqlDb();
  String error="";
  login() async{
    var user = await db.loginUser(Users(username: userController.text, number: noController.text, city: ''));
    if(user != null){
      if(!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>finalPage(usr: user)));
    }else{
      setState(() {
        isLoginTrue = true;
        const AlertDialog(title: Text("Error", style: TextStyle(backgroundColor: Colors.green),));
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(child: Text('Login Page',style: TextStyle(color: Colors.white, fontSize: 24))),
      ),
      body: Container(

        child: Column(
          children: [
            Container(

              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: userController,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(hintText: 'Name'),
              ),
            ),
            Container(

              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: noController,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(hintText: 'Number'),
              ),
            ),


            Container(
              margin: const EdgeInsets.all(15),
              width: 300,

              child: Column(

                children: [
                  const Padding(padding: EdgeInsets.all(30)),
                  MaterialButton(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    minWidth: 300,
                    height: 50,
                    color: Colors.deepPurple,
                    onPressed: () async{
                      login();
                    },
                    child: const Text("Login",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  // Spacer(flex: 1),

                  SizedBox(height: 20,),
                  MaterialButton(
                    minWidth: 300,
                    height: 50,
                    color: Colors.deepPurple,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: const Text("Back Home",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
