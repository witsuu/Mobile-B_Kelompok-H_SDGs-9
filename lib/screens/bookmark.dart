import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bookmark screen"),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Wrap(
                runSpacing: 20,
                children: [
                  _listBookmark('Wisata Gunung Bromo',
                      'Probolinggo, Jawa Timur', 'bromo.png'),
                  _listBookmark(
                      'Kawah Ijen', 'Bondowoso, Jawa Timur', 'ijen.jpg'),
                  _listBookmark('Candi Borobudur', 'Magelang, Jawa Tengah',
                      'borobudur.jpg'),
                ],
              ),
            )
          ],
        ));
  }

  Widget _listBookmark(String nama, String alamat, String gambar) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 280,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/$gambar'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(this.context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nama,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600)),
              Text(alamat,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ))
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
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
        Positioned(
          top: -9,
          right: 0,
          child: Row(
            children: [
              Icon(
                Icons.bookmark,
                color: Colors.red,
                size: 60,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
