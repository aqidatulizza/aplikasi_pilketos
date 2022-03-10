import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';

class Kandidat extends StatefulWidget {
  const Kandidat({Key? key}) : super(key: key);

  @override
  _KandidatState createState() => _KandidatState();
}

class _KandidatState extends State<Kandidat> {
  List nama = [
    "llllllllllllllllllllll",
    "SI B",
    "SI C",
    "SI D",
    "SI E",
    "SI D",
    "SI E",
    "SI F",
    "SI G",
    "SI H"
  ];
  List kelas = [
    "XI RPL A",
    "XI RPL B",
    "XI RPL C",
    "XI RPL D",
    "XI RPL E",
    "XI RPL F",
    "XI RPL G",
    "XI RPL H",
    "XI RPL I",
    "XI RPL J",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Kandidat Ketua Osis',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 28.0,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 55.0,
                                height: 55.0,
                                child: CircleAvatar(
                                  backgroundColor: primaryColor,
                                  foregroundColor: primaryColor,
                                  radius: 50.0,
                                  child: ClipRRect(
                                    child:
                                        Image.asset('assets/images/user.jpg'),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    nama[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    kelas[index],
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              height: 30.0,
                              onPressed: () {},
                              color: Color(0xfffB33030),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                'Vote',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          EntryItem(
                        data[index],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry> children;
  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  Entry('Visi dan Misi', <Entry>[
    Entry('Visi', <Entry>[
      Entry(
          'Membentuk OSIS yang mampu mewadahi kreasi, inovasi, serta prestasi siswa di berbagai bidang dengan tetap menjunjung karakter berakhlak mulia.')
    ]),
    Entry('Misi', <Entry>[
      Entry('Misi 1'),
    ])
  ])
];

class EntryItem extends StatelessWidget {
  final Entry entry;

  const EntryItem(this.entry);

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title, style: TextStyle(fontSize: 13.0)),
      );
    }

    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
