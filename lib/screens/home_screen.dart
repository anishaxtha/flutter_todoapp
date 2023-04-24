import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/task_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _formData = TextEditingController();
  String textValue = "";

  //  this list will contain all the todos
  List todoList = [];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(" kk:mm:ss \n EEE d MMM").format(now);
    // var decoration;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 181, 165, 197),
     
      
      body: Container(
        constraints: BoxConstraints.expand(),
        // height: 200,
        // width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/hex.png"),
            fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Text(
                    "Good Afternoon, Anisha \n \t Have a wonderful day!" ,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 246, 243, 243),
                      fontSize: 24,
                    ),
                  ),
                ),
            
                 Padding(
                  padding: EdgeInsets.only(top: 1.0),
                  child: Text(
                    "Its ${formattedDate}  ",
                    style: TextStyle(
                      color: Color.fromARGB(225, 66, 137, 224),
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _formData,
                    decoration: InputDecoration(
                      // focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white
                        )
                      ),
                      // fillColor: Colors.white70,
                      hintText: "Enter an item",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic
                      )
                      // prefixIcon: Icon(Icons.airplane_ticket),
                    ),
                  ),
                ),
              
                TextButton(
                  onPressed: () {
                    // textValue=_formData.text;
                    // map
                    todoList.add({
                      "task": _formData.text,
                      "icon": Icons.task,
                      "checked": false,
                    });
                    _formData.text = "";
                    print(_formData.text);
                    setState(() {});
                  },
                  child: Text(
                    "Add an item",
                   style: TextStyle(
                      color: Color.fromARGB(222, 41, 213, 236),
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    var item = todoList[index];
                    return Container(
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
                          Checkbox(
                              value: item['checked'],
                              onChanged: (value) {
                                for (var i = 0; i < todoList.length; i++) {
                                  if (todoList[i] == item) {
                                    // print(todoList[i]);
                                    setState(() {
                                      todoList[i]['checked']=
                                      !todoList[i]['checked'];
                                    });
                                  }
                                }
                              }),
                          GestureDetector(
                            onTap: (){
                              print("tap");
                              Get.to(
                                TaskScreen(title: item['task'],),
                                // transition: Transition.rightToLeft,
                                // transition: Transition.zoom,
                                transition: Transition.fade,
                              

                              );
                              // Navigator.push(
                              // context,
                              //  MaterialPageRoute(
                              //   builder: (_)=>TaskScreen(),
                              //   ),
                              //   );
                            },
                            child: Text(item['task'])),
                          Icon(item['icon']),
                          // Text("Course for 4th sem"),
                          // Icon(Icons.task_outlined),
                        ],
                      ),
                    );
                  },
                )
                // if(textValue != "")
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}


