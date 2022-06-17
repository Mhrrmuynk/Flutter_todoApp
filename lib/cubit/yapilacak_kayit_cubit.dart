import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yedinci_odev/repo/yapilacaklar_repo.dart';

class YapilacakKayitCubit extends Cubit<void> {
  YapilacakKayitCubit() : super(0);

  var krepo = YapilacakDioRepo();
  Future<void> kayit(String yapilacak_ad) async {
    await krepo.yapilacakKayit(yapilacak_ad);
  }
}
