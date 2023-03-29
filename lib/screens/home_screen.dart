import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _formdata = TextEditingController();
  String textValue = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text("Good Afternoon, Anisha" ,
                   style: TextStyle(
                    fontSize: 24,
                   ),
                   ),
                const Padding(
                padding: EdgeInsets.only(top:20.0),
                  child: Text(
                    "It's Tuesday, 28th Mar 2023",
                      style: TextStyle(
                      fontSize: 24,
                      ),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _formdata,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter an item",
                      // prefixIcon: Icon(Icons.airplane_ticket),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    textValue=_formdata.text;
                    print(_formdata.text);
                    setState(() {
                      
                    });
                  },
                  child: Text("Add"),
                ),
                if(textValue != "")
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ), 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(textValue),
                      // Text("Course for 4th sem"),
                      Icon(Icons.home),
                    ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } 
}