import 'package:flutter/material.dart';
import 'package:learn_flutter/ui_helper/text_theme.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: const TextTheme(
          headline1: TextStyle(fontFamily: "Branding", fontWeight: FontWeight.w500, fontSize: 40),
          headline2: TextStyle(fontFamily: "Baloo", fontWeight: FontWeight.w300, fontSize: 20),
        )
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //  Center Widget aligns its child widget to the center of the available space on the screen

  // Button are the graphical control element that provides
  // A user to trigger an even such as taking actions, making choices, searching things, and many more.
  // They can be placed anywhere in our UI like dialogs, forms, cards, toolbar, etc.
  // Types of Button
  // 1. Text Button (Flat Button)   2. Elevated Button (Raised Button)    3. Outlined Button

  // Column and Row
  // One of the most common layout patterns is t arrange widgets vertically or horizontally.
  // You can use Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

  // Inkwell Widget
  // Inkwell is the material widget in flutter
  // It is used for give onTap option to other widget like button
  // It responds to the touch action as performed by the user.
  // Inkwell will respond when the user clicks it. Tap on it.
  // There are so many gestures like double-tap, long press, tap down etc.

  // List View
  // Listview in flutter is a widget used to display items in a linear manner.
  // for example, list view is used in apps like zomato & swiggy to display a list of restaurants.
  // Since it is a scrollable widget we can display multiple items on the same screen.
  // if the scroll direction is vertical the children will be arranged one after another from top to bottom.
  // when the scroll direction is horizontal the children will be arranged from left to right.

  // List Tile have 3 main component
  // 1. Leading   2. Title & Subtitle   3.Trailing
  
  // Circle Avtar
  // It is simply a circle in which we can add background color, background image, or just some text.
  // It usually represents a user with his image or with his initials.
  // Although we can make a similar widget from the group up
  // This widget comes in handy in the fast development of an application.

  // Text Input Widget
  // A TextField is an input element which holds the alphanumeric, such as name,password, address, etc.
  // Enables the user to enter text information using a programmable code

  @override
  Widget build(BuildContext context) {

    var arrNames =  ["ram","laxman","bharat","satrudhan","Rabi", "krishna","yadav",
      "ram","laxman","bharat","satrudhan","Rabi", "krishna","yadav"];

    var email = TextEditingController();
    var password = TextEditingController();

    var time = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text("Date and Time Widget", style: mTextStyle50()),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 3
                    )
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 3
                    )
                  ),
                  suffixText: "Email",
                  prefixIcon: Icon(Icons.email, color: Colors.orange,),
                ),
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),
              Container(height: 15,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.orange,),
                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye, color: Colors.orange,)),
                  hintText: "Enter Password"
                ),
                controller: password,
                obscureText: true,
                obscuringCharacter: "*",
              ),
              ElevatedButton(onPressed: (){
                String uEmail = email.text.toString();
                String uPassword = password.text.toString();
                print("email: $uEmail");
                print("passowrd: $uPassword");
              },
              child: Text("Login")),
              Container(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                setState(() {

                });;
              }, child: Text("Current Date Time")),
              Text("Date and Time: $time", style: TextStyle(fontSize: 15),),
              Text("Date: ${DateFormat('yMMMMd').format(time)}", style: TextStyle(fontSize: 15),),
              Text("Time: ${DateFormat('jms').format(time)}", style: TextStyle(fontSize: 15),),
              Container(
                height: 20,
              ),
              Text("Date and Time Picker"),
              ElevatedButton(onPressed: () async {
                DateTime? datePicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2023));
                if(datePicker != null){
                  print("date selected: ${datePicker.year}");
                }
              }, child: Text("Show Date Picker")),
              ElevatedButton(onPressed: () async {
                DateTime? timePicker = (await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.dial
                )) as DateTime?;
                if(timePicker != null){
                  print("time selected: ${timePicker.hour} : ${timePicker.minute}");
                }
              }, child: Text("Show Time Picker")),
            ],
          ),
        ),
      )
    );
  }
}
