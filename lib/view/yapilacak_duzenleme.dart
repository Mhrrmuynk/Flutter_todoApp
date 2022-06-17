import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:yedinci_odev/cubit/yapilacak_duzenle_cubit.dart';
import 'package:yedinci_odev/entiti/yapilacak.dart';

class YapilacaklarDuzenleme extends StatefulWidget {
  Yapilacak yapilacak;
  YapilacaklarDuzenleme({required this.yapilacak});

  @override
  State<YapilacaklarDuzenleme> createState() => _YapilacaklarDuzenlemeState();
}

class _YapilacaklarDuzenlemeState extends State<YapilacaklarDuzenleme> {
  var tfyap = TextEditingController();

  @override
  void initState() {
    super.initState();
    var yapilacak = widget.yapilacak;
    tfyap.text = yapilacak.yapilacak_ad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yapilacak Duzenle"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfyap,
                decoration: InputDecoration(hintText: "Yapilacak"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<YapilacakDuzenleCubit>().guncelle(widget.yapilacak.yapilacak_id, tfyap.text);
                  },
                  child: const Text("Kaydet")),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
