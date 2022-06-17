import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yedinci_odev/cubit/anasayfa_cuibt.dart';
import 'package:yedinci_odev/cubit/yapilacak_duzenle_cubit.dart';
import 'package:yedinci_odev/cubit/yapilacak_kayit_cubit.dart';
import 'package:yedinci_odev/view/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => YapilacakKayitCubit()),
        BlocProvider(create: (context) => YapilacakDuzenleCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Anasayfa(),
      ),
    );
  }
}
