import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yedinci_odev/entiti/yapilacak.dart';
import 'package:yedinci_odev/repo/yapilacaklar_repo.dart';

class YapilacakDuzenleCubit extends Cubit<List<Yapilacak>> {
  YapilacakDuzenleCubit() : super(<Yapilacak>[]); // Boş liste oluşturuldu
  var krepo = YapilacakDioRepo();
  Future<void> guncelle(int yapilacak_id, String yapilacak_ad) async {
    await krepo.yapilacakGuncelle(yapilacak_id, yapilacak_ad);
  }
}
