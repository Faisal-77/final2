import 'package:f_f1_faisal_alshikh/home_page.dart';
import 'package:f_f1_faisal_alshikh/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:f_f1_faisal_alshikh/update_page.dart';
import 'json/users.dart';

class finalPage extends StatefulWidget {
  Users usr;
  @override


  finalPage({required this.usr});

  @override
  State<finalPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<finalPage> {
  final db = SqlDb();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(child: Text('Final Page',style: TextStyle(color: Colors.white, fontSize: 24))),
      ),
      body: Container(

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: EdgeInsets.all(15.0),
margin: EdgeInsets.all(15.0),

                    child: Text("${widget.usr.id}" ,style: TextStyle(fontSize: 40))
                ),
                Container(
                    padding: EdgeInsets.all(15.0),
                    margin: EdgeInsets.all(15.0),
                    child: Text(widget.usr.username,style: TextStyle(fontSize: 40))
                ),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              Container(
padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.all(15.0),
                  child: Text(widget.usr.number,style: TextStyle(fontSize: 40))
              ),
              Container(
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.all(15.0),
                  child: Text(widget.usr.city,style: TextStyle(fontSize: 40),)
              ),
            ],),

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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: const Text("Back Home Page",
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
                            Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>UpdatePage(usr: widget.usr)));
                    },
                    child: const Text("Update Page",
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
