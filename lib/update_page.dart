
import 'package:f_f1_faisal_alshikh/sqldb.dart';
import 'package:flutter/material.dart';
import 'json/users.dart';
import 'package:f_f1_faisal_alshikh/login_page.dart';
import 'package:f_f1_faisal_alshikh/final_page.dart';
class UpdatePage extends StatelessWidget {
  final db = SqlDb();
  final userController = TextEditingController();
  final noController = TextEditingController();
  final cityController = TextEditingController();

  Users usr;

  @override
  UpdatePage({required this.usr});

  updateU() async {
    usr.username = userController.text.toString();
    usr.number = noController.text.toString();
    usr.city = cityController.text.toString();

    // print(this.usr.username);
    var response = await db.updateUser(usr);
    if (response > 0) {

      print("Ok");
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Update Page')),
        backgroundColor: Colors.deepPurple,
      ),
      body:Container(

        child: Column(
          children: [
            Row(

              children: [
                Container(
                  width: 150,
                    padding: EdgeInsets.symmetric(horizontal: 40 ,vertical: 15),
                    child: Text("${usr.id}" ,style: TextStyle(fontSize: 32))
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40 ,vertical: 15),
width: 250,
                    child:TextFormField(
                       controller: userController,

                      style: const TextStyle(fontSize: 22),
                       decoration: InputDecoration(hintText: '${usr.username}'),

                    ),
                ),


              ],
            ),
            Row(

              children: [

                Container(
                  width: 210,
                  padding: EdgeInsets.symmetric(horizontal: 40 ,vertical: 15),

                  child: TextFormField(
                      controller: noController,
                      style: const TextStyle(fontSize: 22),
                      decoration: InputDecoration(hintText: '${usr.number}'),
                    ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 40 ,vertical: 15),

                  child: TextFormField(
                      controller: cityController,
                      style: const TextStyle(fontSize: 22),
                      decoration: InputDecoration(hintText: '${usr.city}'),
                    ),
                ),
              ],),

            Container(
              margin: const EdgeInsets.all(8),
              width: 300,

              child: Column(

                children: [
                  const Padding(padding: EdgeInsets.all(30)),

                  MaterialButton(

                    minWidth: 300,
                    height: 50,
                    color: Colors.deepPurple,
                    onPressed: () async{
                      updateU();
                    },
                    child: const Text("Update Data",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),

                  MaterialButton(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    minWidth: 300,
                    height: 50,
                    color: Colors.deepPurple,
                    onPressed: () async{
                      await db.deleteUser(usr);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text("Delete Data",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),
                  MaterialButton(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    minWidth: 300,
                    height: 50,
                    color: Colors.deepPurple,
                    onPressed: () async{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>finalPage(usr: usr)));
                    },
                    child: const Text("Back Final Page",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  // Spacer(flex: 1),




                ],
              ),
            ),



          ],
        ),
      ) ,
    );
  }
}