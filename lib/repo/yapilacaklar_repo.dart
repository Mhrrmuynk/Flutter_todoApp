import 'package:yedinci_odev/entiti/yapilacak.dart';
import 'package:yedinci_odev/sqlite/veritabani_yardimcisi.dart';

class YapilacakDioRepo {
  Future<List<Yapilacak>> tumYapilacaklar() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("select * from yapilacaklar");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacak(yapilacak_id: satir["yapilacak_id"], yapilacak_ad: satir["yapilacak_ad"]);
    });
  }

  Future<List<Yapilacak>> aramaSonucu(String Arama) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("select * from yapilacaklar where yapilacak_ad like '%$Arama%'");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacak(
        yapilacak_id: satir["yapilacak_id"],
        yapilacak_ad: satir["yapilacak_ad"],
      );
    });
  }

  Future<void> yapilacakKayit(String yapilacak_ad) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgi = Map<String, dynamic>();
    bilgi["yapilacak_ad"] = yapilacak_ad;
    await db.insert("yapilacaklar", bilgi);

    print("Kisi kayit : $yapilacak_ad,");
  }

  Future<void> yapilacakGuncelle(int yapilacak_id, String yapilacak_ad) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["yapilacak_ad"] = yapilacak_ad;
    await db.update("yapilacaklar", bilgiler, where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
    print("Kisi kayit: $yapilacak_id,$yapilacak_ad");
  }

  Future<void> yapilacaksil(int yapilacak_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("yapilacaklar", where: "yapilacak_id  = ?", whereArgs: [yapilacak_id]);
  }
}
