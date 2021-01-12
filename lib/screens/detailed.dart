import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 310,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bromo.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Wisata Gunung Bromo',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                          Row(
                            children: [
                              Row(
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
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text('5',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Mountain',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text('2.329 mdpl',
                              style: TextStyle(
                                fontSize: 10,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_pin, size: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kabupaten Probolinggo, Jawa Timur',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () => null,
                                    child: Text('Lihat Lokasi',
                                        style: TextStyle(
                                            color: Colors.blueAccent)),
                                  )
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            size: 20,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 5, top: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Domestic : IDR 29.000 - 34.000 (Hari Libur)',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                      'Foreigner: IDR 220.000 - 320.000 (Hari Libur)',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600))
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Deskripsi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                          'Gunung Bromo (Bahasa Sansekerta: Brahma, Dewa utama agama Hindu) adalah sebuah gunung bereeapi aktif di Jawa Timur,Indonesia. Terletak di 4 wilayah kabupaten, yakni Kabupaten Probolinggi, Pasuruan, Lumajang dan Malang. Gunung Bromo termasuk dalam kawasan Taman Nasional Bromo Tengger Semeru'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Gunung Bromo bertautan antara lembah dan ngarai dengan kaldera atau lautan pasir seluas 10Km2. Gunung Bromo memiliki sebuah kawah dengan garis tengah -+ 800 m (Utara-Selatan) dan -+ 600 m (Timur-Barat). Sedangkan daerah bahayanya berupa lingkaran dengan jari-jari 4km dari pusat kawah Bromo.'),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            '0 Review',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(children: [
                          _listReview(),
                        ]),
                      ),
                      FlatButton(
                          onPressed: () => {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('5 Review lainnya'),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 18,
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listReview() {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/yao-ming.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Witsudi'),
                Row(
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
                      Icons.star_border,
                      color: Colors.grey,
                      size: 12,
                    ),
                  ],
                ),
                Text('Isi review dari reviewer')
              ],
            )
          ],
        ));
  }

  Widget _createReview() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/yao-ming.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(100)),
          ),
          Column(
            children: [
              Row(
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
                    Icons.star_border,
                    color: Colors.white,
                    size: 12,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
