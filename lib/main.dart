import "package:flutter/material.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Chat Application",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Application"),
      ),
      body: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();

  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
              onPressed: () => listeyeEkle(t1.text),
              icon: const Icon(Icons.send)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                reverse: true,
                itemCount: mesajListesi.length,
                itemBuilder: (_, indexNumarasi) => mesajListesi[indexNumarasi]),
          ),
          const Divider(
            thickness: 1,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Kullanıcı1";

// ignore: must_be_immutable
class MesajBalonu extends StatelessWidget {
  String mesaj;

  MesajBalonu({super.key, required this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text(isim[0]),
          ),
          Column(
            children: <Widget>[
              Text(isim),
              Text(mesaj),
            ],
          ),
        ],
      ),
    );
  }
}
