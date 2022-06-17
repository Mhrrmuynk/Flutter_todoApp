import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:yedinci_odev/cubit/yapilacak_kayit_cubit.dart';

class YapilacakKayit extends StatefulWidget {
  YapilacakKayit({Key? key}) : super(key: key);

  @override
  State<YapilacakKayit> createState() => _YapilacakKayitState();
}

class _YapilacakKayitState extends State<YapilacakKayit> {
  var tfyapilacak = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("yapilacak Kayit"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfyapilacak,
                decoration: const InputDecoration(hintText: "Yapilacak"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<YapilacakKayitCubit>().kayit(tfyapilacak.text);
                  },
                  child: const Text("Kaydet")),
            ],
          ),
        ),
      ),
    );
  }
}
