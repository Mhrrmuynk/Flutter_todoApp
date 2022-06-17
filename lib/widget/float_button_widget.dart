import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:yedinci_odev/cubit/anasayfa_cuibt.dart';
import 'package:yedinci_odev/view/yapilacak_kayit.dart';

class FloatButton extends StatefulWidget {
  FloatButton({Key? key}) : super(key: key);

  @override
  State<FloatButton> createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      backgroundColor: Colors.black,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacakKayit())).then((value) {
          setState(() {
            context.read<AnasayfaCubit>().yapilacakYukle();
          });
        });
        ;
      },
    );
  }
}
