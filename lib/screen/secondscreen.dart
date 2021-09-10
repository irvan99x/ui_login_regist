import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? jeniskelamin = 'Perempuan';
  late DateTime pickedDate;
  bool ishiddenPassword = true;
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

  void kirimdata() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: [
            Text("Nama Lengkap : ${controllerNama.text}"),
            Text("Email : ${controllerEmail.text}"),
            Text("Alamat : ${controllerAlamat.text}"),
            Text("Password : ${controllerPassword.text}"),
            Text("Jenis Kelamin : $jeniskelamin"),
            Text("Tanggal Lahir : $pickedDate}"),
            ElevatedButton(
                onPressed: () => Navigator.pop(context), child: Text('Confirm'))
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text('Register'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                      hintText: 'Nama',
                      labelText: 'Nama',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              TextField(
                  controller: controllerEmail,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              TextField(
                  controller: controllerAlamat,
                  maxLines: 2,
                  decoration: InputDecoration(
                      hintText: 'Alamat',
                      labelText: 'Alamat',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0)),
                child: ListTile(
                  title: Text(
                    "Tanggal Lahir : ${pickedDate.year}, ${pickedDate.month}, ${pickedDate.day}",
                  ),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  onTap: _pickDate,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              TextField(
                  obscureText: ishiddenPassword,
                  controller: controllerPassword,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: DropdownButton<String>(
                    hint: Text('Jenis Kelamin : '),
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'Perempuan',
                        child: Text('Perempuan'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Laki-Laki',
                        child: Text('Laki-laki'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Lainnya',
                        child: Text('Lainnya'),
                      ),
                    ],
                    value: jeniskelamin,
                    onChanged: (value) {
                      setState(() {
                        jeniskelamin = value;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(
                    onPressed: () {
                      kirimdata();
                    },
                    child: Text('Daftar')),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Login"))
            ])));
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      initialDate: pickedDate,
    );

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  void _togglePasswordView() {
    setState(() {
      ishiddenPassword = !ishiddenPassword;
    });
  }
}
