import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {

   // Form
  final GlobalKey<FormState> _formKey = GlobalKey();

  // TextField
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _text3 = TextEditingController();
  int gender = 0;
  double? _bmi;
  String isRadio = "";
  bool isCheck  =false;

  List<Fruit> fruits = [];
  String _message = " enter yout wegiht and height here ";

   void _calculate(){
    final double? height = double.tryParse(_height.value.text);
    final double? weight = double.tryParse(_weight.value.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = " must be positive munbers ";
      });
      return;
    }
    setState(() {
      _bmi = weight / (height*height);
    });
  }


  @override
  void initState() {
    super.initState();
    fruits = Fruit.getFruit();
    print(fruits[0].engName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculation"),
      ),
      body: Form(
        key: _formKey,
        child: ListView( 
          children: [
            //Center(child: Text("\nHeight")),
            TextFormField(
              controller: _height,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffixText: "cm",
                labelText: "Height"),
              onChanged: (value) {
                setState(() {});
              },
            ),
            TextFormField(
              controller: _weight,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffixText: "kg",
                labelText: "Weight"),
              onChanged: (value) {
                setState(() {});
              },
            ),

            Center(child: Text("\nSex")),
            RadioListTile(
              title: Text("Male"),
              value: "Male",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("Female"),
              value: "Female",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile( 
              title: Text("Other (LGBT+)"),
              value: "Other",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile( 
              title: Text("Not Specify"),
              value: "Not",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            Column(
              children: createFruitCheckbox(),
            ),


            
          ],
        ),
      ),
    );
  }
  
  List<Widget> createFruitCheckbox() {
    List<Widget> myfruit = [];

    for( Fruit fruit in fruits) {
      print(fruit.thName);
      myfruit.add(
        CheckboxListTile(
              title: Text(fruit.thName),
              value: fruit.isCheck ,
              onChanged: (value) {
                setState(() {
                  fruit.isCheck = value!;
                });
              },
            ),
      );

    }


    return myfruit;


  }
}



class Fruit {
  String engName;
  String thName;
  bool isCheck;

  Fruit(this.engName,  this.thName, this.isCheck);

  static List<Fruit> getFruit() {
    return <Fruit>[
      Fruit("1", "apple", false),
      Fruit("2", "banana", false),
      Fruit("3", "orange", true),
      Fruit("4", "papaya", false),
      Fruit("5", "coconut", false),
    ];
  }


  
}