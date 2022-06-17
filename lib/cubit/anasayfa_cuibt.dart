import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yedinci_odev/entiti/yapilacak.dart';
import 'package:yedinci_odev/repo/yapilacaklar_repo.dart';

class AnasayfaCubit extends Cubit<List<Yapilacak>> {
  AnasayfaCubit() : super(<Yapilacak>[]); // Boş liste oluşturuldu
  var krepo = YapilacakDioRepo();

  Future<void> yapilacakYukle() async {
    var liste = await krepo.tumYapilacaklar();
    emit(liste);
  }

  Future<void> aramaYapilacak(String aranan) async {
    var liste = await krepo.aramaSonucu(aranan);
    emit(liste);
  }

  Future<void> yapilacakSil(int yapilacak_id) async {
    await krepo.yapilacaksil(yapilacak_id);
    await yapilacakYukle();
  }
}
