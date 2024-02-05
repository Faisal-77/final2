import 'dart:io';
import 'package:f_f1_faisal_alshikh/createPage.dart';
import 'package:f_f1_faisal_alshikh/login_page.dart';
import 'package:flutter/material.dart';
import 'json/users.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Home page',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 208, 177, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text('Go To Login Page'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => createPage()));
                  },
                  child: const Text('Add new Account')),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text('Close Application')),
            ),
          ],
        ),
      ),
    );
  }
}
