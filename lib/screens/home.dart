import 'package:flutter/material.dart';
import 'package:latihan/screens/detailed.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              //borderRadius: BorderRadius.only(
              //bottomLeft: Radius.circular(10),
              //bottomRight: Radius.circular(10))
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Form(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50)),
                  height: 45,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Temukan destinasi',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
                SizedBox(height: 10.0),
                GestureDetector(
                    onTap: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Detail()))
                        },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bromo.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(children: [
                          Positioned(
                            bottom: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Gunung Bromo',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600)),
                                Text('Probolinggo, Jawa Timur',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ))
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ]))),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.white.withOpacity(0.25),
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  _listContent(
                      ' Borobudur', 'Jogjakarta, Jawa Tengah', 'borobudur.jpg'),
                  _listContent(
                      'Kawah Ijen', 'Bondowoso, Jawa Timur', 'ijen.jpg'),
                  _listContent(
                      'Gunung Bromo', 'Probolinggo, Jawa Timur', 'bromo.png'),
                  _listContent(
                      'Kawah Ijen', 'Bondowoso, Jawa Timur', 'ijen.jpg'),
                  _listContent(
                      ' Borobudur', 'Jogjakarta, Jawa Tengah', 'borobudur.jpg'),
                  _listContent(
                      'Gunung Bromo', 'Probolinggo, Jawa Timur', 'bromo.png'),
                ],
              ))
        ],
      ),
    );
  }

  Widget _listContent(String nama, String alamat, String gambar) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Detail()))
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(220, 210, 210, 1),
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 140,
              width: MediaQuery.of(context).size.width / 2.0,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/$gambar'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 10, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nama,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(alamat,
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
