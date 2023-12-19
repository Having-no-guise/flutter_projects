import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController lifeStoryController = TextEditingController();
  String selectedCountry = "Select Country";

  List<String> countries = [
    "Select Country",
    "Country 1",
    "Country 2",
    "Country 3",
    "Country 4",
    "Country 5",
    "Country 6",
    "Country 7",
    "Country 8",
    "Country 9",
    "Country 10",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Register Page', style: TextStyle(color: Colors.white),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: emailAddressController,
              decoration: InputDecoration(labelText: 'Email Address'),
            ),
            DropdownButton<String>(
              value: selectedCountry,
              items: countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value!;
                });
              },
            ),

            TextField(
              controller: lifeStoryController,
              decoration: InputDecoration(labelText: 'Life Story'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Обработка нажатия кнопки Submit Form
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Registration Successfully'),
                      content: Text('${fullNameController.text} is now a verified account'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Add New User'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserInfoPage(
                                  userName: fullNameController.text,
                                  country: selectedCountry,
                                  lifeStory: lifeStoryController.text,
                                  phoneNumber: phoneNumberController.text,
                                  email: emailAddressController.text,
                                ),
                              ),
                            );
                          },
                          child: Text('Verified'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('Submit Form'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  final String userName;
  final String country;
  final String lifeStory;
  final String phoneNumber;
  final String email;

  UserInfoPage({
    required this.userName,
    required this.country,
    required this.lifeStory,
    required this.phoneNumber,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('User Info', style: TextStyle(color: Colors.white),)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('User Name: $userName'),
              leading: Icon(Icons.person),
              trailing: country != "Select Country" ? Text('Country: $country') : null,
            ),
            if (phoneNumber.isNotEmpty)
              ListTile(
                title: Text('Phone Number: $phoneNumber'),
                leading: Icon(Icons.phone),
              ),
            if (email.isNotEmpty)
              ListTile(
                title: Text('Email: $email'),
                leading: Icon(Icons.email),
              ),
            if (lifeStory.isNotEmpty)
              ListTile(
                title: Text('Life Story: $lifeStory'),
                leading: Icon(Icons.book),
              ),
          ],
        ),
      ),
    );
  }
}

