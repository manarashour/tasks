import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool value = true;
  SharedPreferences? prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: value == true
                        ? NetworkImage(
                        'https://image.freepik.com/free-vector/floral-card_53876-91231.jpg')
                        : NetworkImage(''),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                  value: this.value,
                  onChanged: (var value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Show/Hide',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () => _saveData(), child: Text('Save'))
          ],
        ),
      ),
    );
  }
  _intializeSharedPrefs() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setBool('Save', value);
    });
  }
  @override
  void initState(){
    _LoadValue();
  }
  _LoadValue() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    value = (prefs.getBool('Save'))?? false;
  }
  _saveData() {
    _intializeSharedPrefs();
    return value;
  }
}


