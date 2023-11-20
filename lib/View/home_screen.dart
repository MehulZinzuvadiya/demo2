import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController txtname = TextEditingController();
  TextEditingController txtaddress = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtgender = TextEditingController();
  String? name;
  var phone;
  var address;
  var email;
  bool ms = true;
  bool exgen = false;
  bool _customTileExpanded = false;
  String gen = "Male";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Validation Form"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: txtname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black87,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  hintText: "Enter Name",
                ),
                validator: ValidationBuilder().required().maxLength(30).build(),
                onSaved: (newValue) {
                  newValue = txtname.text;
                  name = newValue;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtphone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black87,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  hintText: "Enter Mobile",
                ),
                validator: ValidationBuilder().required().phone().build(),
                onSaved: (newValue) {
                  newValue = txtphone.text;
                  phone = newValue;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtemail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black87,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  hintText: "Enter Email",
                ),
                validator: ValidationBuilder().required().email().build(),
                onSaved: (newValue) {
                  newValue = txtemail.text;
                  email = newValue;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtaddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black87,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  hintText: "Enter Address",
                ),
                validator:
                    ValidationBuilder().required().maxLength(100).build(),
                onSaved: (newValue) {
                  newValue = txtaddress.text;
                  address = newValue;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ExpansionTile(
                maintainState: ms,
                onExpansionChanged: (value) {
                  setState(() {
                    exgen = value;
                    _customTileExpanded = value;
                  });
                },
                title: Text(
                  "Gender",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: exgen ? FontWeight.bold : FontWeight.normal),
                ),
                leading: Icon(
                  Icons.female_outlined,
                  color: exgen ? Colors.black : Colors.black54,
                ),
                trailing: Icon(_customTileExpanded
                    ? Icons.expand_circle_down
                    : Icons.arrow_drop_down),
                children: [
                  Row(
                    children: [
                      Radio(
                          value: "Male",
                          groupValue: gen,
                          onChanged: (value) {
                            setState(() {
                              gen = value!;
                            });
                          }),
                      Text(
                        "Male",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "Female",
                          groupValue: gen,
                          onChanged: (value) {
                            setState(() {
                              gen = value!;
                            });
                          }),
                      Text(
                        "Female",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "Other",
                          groupValue: gen,
                          onChanged: (value) {
                            setState(() {
                              gen = value!;
                            });
                          }),
                      Text(
                        "Other",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Get.snackbar("Data", "Received");
                      print("name is:$name");
                      print("phone number is:$phone");
                      print("email is:$email");
                      print("address is:$address");
                    }
                  },
                  child: const Text("Submit")),
            ],
          ),
        ),
      ),
    ));
  }
}
