import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yedinci_odev/cubit/anasayfa_cuibt.dart';
import 'package:yedinci_odev/entiti/yapilacak.dart';
import 'package:yedinci_odev/view/yapilacak_duzenleme.dart';
import 'dart:math' as math;

class BlockBuilderWidget extends StatefulWidget {
  BlockBuilderWidget({Key? key}) : super(key: key);

  @override
  State<BlockBuilderWidget> createState() => _BlockBuilderWidgetState();
  int conter = 0;
}

class _BlockBuilderWidgetState extends State<BlockBuilderWidget> {
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yapilacakYukle();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnasayfaCubit, List<Yapilacak>>(
      builder: (context, yapilacaklarListe) {
        if (yapilacaklarListe.isNotEmpty) {
          return listView(yapilacaklarListe);
        } else {
          return const Center(
            child: Text("Tebrikler herşeyi tamamladiniz"),
          );
        }
      },
    );
    ;
  }

  ListView listView(List<Yapilacak> yapilacaklarListe) {
    return ListView.builder(
        itemCount: yapilacaklarListe.length,
        itemBuilder: (context, index) {
          var yapilacak = yapilacaklarListe[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacaklarDuzenleme(yapilacak: yapilacak))).then((value) {
                context.read<AnasayfaCubit>().yapilacakYukle();
              });
            },
            child: CardTasarim(yapilacak: yapilacak, index: index),
          );
        });
  }
}

class CardTasarim extends StatelessWidget {
  int index;

  CardTasarim({
    Key? key,
    required this.yapilacak,
    required this.index,
  }) : super(key: key);

  final Yapilacak yapilacak;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0), shape: BoxShape.circle),
          child: Center(child: Text((++index).toString())),
        ),
        title: Text(yapilacak.yapilacak_ad),
        trailing: IconButton(
            onPressed: () {
              SnacBar(context);
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.black45,
            )),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> SnacBar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${yapilacak.yapilacak_ad}  silinsin mi  "),
        action: SnackBarAction(
            label: "Evet",
            onPressed: () {
              context.read<AnasayfaCubit>().yapilacakSil(yapilacak.yapilacak_id);
              print(" kisi sil ${yapilacak.yapilacak_ad}");
            }),
      ),
    );
  }
}
