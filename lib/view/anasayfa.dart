import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:yedinci_odev/cubit/anasayfa_cuibt.dart';
import 'package:yedinci_odev/view/yapilacak_kayit.dart';
import 'package:yedinci_odev/widget/blockbuilder.dart';
import 'package:yedinci_odev/widget/float_button_widget.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyoruMu = false;
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yapilacakYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(context),
      body: BlockBuilderWidget(),
      floatingActionButton: FloatButton(),
    );
  }

  AppBar AppbarWidget(BuildContext context) {
    return AppBar(
      title: aramaYapiliyoruMu
          ? TextField(
              decoration: InputDecoration(hintText: "Ara"),
              onChanged: (aramaSonucu) {
                context.read<AnasayfaCubit>().aramaYapilacak(aramaSonucu);
                print(aramaSonucu);
              },
            )
          : const Text("To Do"),
      actions: [
        aramaYapiliyoruMu
            ? IconButton(
                onPressed: () {
                  setState(() {
                    context.read<AnasayfaCubit>().yapilacakYukle();

                    aramaYapiliyoruMu = false;
                  });
                },
                icon: const Icon(Icons.cancel))
            : IconButton(
                onPressed: () {
                  setState(() {
                    aramaYapiliyoruMu = true;
                  });
                },
                icon: const Icon(Icons.search))
      ],
    );
  }
}
