import 'package:flutter/material.dart';
import 'package:flutter_front/services/bookingServices.dart';
import 'package:flutter_front/services/userServices.dart';
import 'package:flutter_front/views/first_page.dart';
import 'package:flutter_front/views/user_info.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../models/booking.dart';
import '../widgets/drawer.dart';

class ListBookings extends StatefulWidget {
  const ListBookings({super.key});

  @override
  State<ListBookings> createState() => _HomePageState();
}

class _HomePageState extends State<ListBookings> {
  List<Booking>? bookings;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    bookings = await BookingServices().getBookings();
    if (bookings != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  /* deleteU(String name) async {
    await UserServices().deleteUsers(name);
  } */


  @override
  Widget build(BuildContext context) {

      BookingServices _bookingsprovider = Provider.of<BookingServices>(context);


    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('Seminari 10 Fluter LLISTAT'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: bookings?.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepPurple[100],
              child: ListTile(
                title: Text(bookings![index].name),
                subtitle: Text(bookings![index].username),
                trailing: SizedBox(
                    width: 120,
                    child: Row(
                      children: <Widget>[
                        /* Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.article),
                            onPressed: () {
                              showDialogFunc(context, users![index].name,
                              users![index].email, users![index].id);
                            },
                            tooltip: 'Details',
                          ),
                        ), */
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.home),
                            tooltip: 'Main',
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const FirstPage()));
                            },
                          ),
                        ),
                        /* Expanded(
                            child: IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Delete',
                          onPressed: () {
                            deleteU(users![index].name.toString());
                            setState(() {
                              users!.removeAt(index);
                            });
                          },
                        )), */
                        /* Expanded(
                            child: IconButton(
                          icon: const Icon(Icons.info_outline),
                          tooltip: 'More Info',
                          onPressed: () {
                             _userprovider.setUserData(users![index]);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const UserInfo()));
                          },
                        )), */
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}

showDialogFunc(context, name, email, id) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 186, 179, 230),
              ),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "USER DETAILS:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 49, 66, 86),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "NAME : $name",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 49, 66, 86),
                      ),
                    ),
                    Text(
                      "EMAIL : $email",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 49, 66, 86),
                      ),
                    ),
                    const Text(
                      " ID : id",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 49, 66, 86),
                      ),
                    )
                  ]),
            ),
          ),
        );
      });
}
