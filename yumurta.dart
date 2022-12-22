import 'dart:io';

Map<String, dynamic> ekle(int identity){

  Map<String, dynamic> kayit=new Map();
  String boyut="x";
  String satici;
  int gram;

  print("~~~!GİRİŞ YAPARKEN TÜRKÇE KARAKTER KULLANMAYINIZ!~~~");

  print("Satıcının adını giriniz:");
  satici=stdin.readLineSync().toString();
  print("\n");

  print("Yumurtanın Gramını giriniz:");
  gram=int.parse(stdin.readLineSync()!);
  print("\n");

  if(gram<=40)
    boyut="S";
  else if(gram>40 && gram<=50)
    boyut="M";
  else if(gram>50)
    boyut="L";
  
  kayit={
    "id":identity,
    "Satıcı":satici,
    "Gram":gram,
    "Boyut":boyut
  };

  print("Kayıt eklendi: ");
  print(kayit);
  print("\n");

  return kayit;
}



int idBul(List liste, int giris){
  int index=-1;

  for(int i=0; i<liste.length; i++){
    
    if(liste[i]["id"]==giris){
      index=i;
      break;
    }

  }

  return index;
}



List<int> satBul(List liste, String giris){
  List<int> indisler=[];

  for(int i=0; i<liste.length; i++){
    if(liste[i]["Satıcı"].toUpperCase()==giris.toUpperCase())
      indisler.add(i);
  }

  return indisler;
}



List<int> gramBul(List liste, int kucuk, int buyuk){
  List<int> indisler=[];

  for(int i=0; i<liste.length; i++){
    if(liste[i]["Gram"]>kucuk && liste[i]["Gram"]<buyuk)
      indisler.add(i);
    else if(liste[i]["Gram"]==kucuk || liste[i]["Gram"]==buyuk)
      indisler.add(i);
  }

  return indisler;
}


List<int> boyutBul(List liste, String giris){
  List<int> indisler=[];

  giris=giris.toUpperCase();

  for(int i=0; i<liste.length; i++){
    if(liste[i]["Boyut"]==giris)
      indisler.add(i);
  }

  return indisler;
}



void main() {
  
  Map<String, dynamic> yumurta1, yumurta2, yumurta3=new Map();

  yumurta1={
    "id":1,
    "Satıcı":"Fatih",
    "Gram":60,
    "Boyut":"L"
  };

  yumurta2={
    "id":2,
    "Satıcı":"Caglayan",
    "Gram":50,
    "Boyut":"M"
  };

  yumurta3={
    "id":3,
    "Satıcı":"Mert",
    "Gram":40,
    "Boyut":"S"
  };

  List<Map<String, dynamic>> bilgi=[yumurta1,yumurta2, yumurta3];
  int id=3;

  String sec;

  while(true){

    print("Girişler:");
    print("'Q': Çıkış Yapar");
    print("'1': Listeler");
    print("'2': Kayıt Ekler");
    print("'3': Kayıt Kaldırır");
    print("'4': Kayıt Aratır");
    print("'5': Kayıt Günceller");
    print("\nGiriş Yapınız: ");
    sec=stdin.readLineSync().toString();
    print("\n");
    sec=sec.toUpperCase();
    
    if(sec=="Q")
      break;
    else if(sec=="1"){
      bilgi.forEach((i)=>{print(i)});

      print("\n");
    }
    else if(sec=="2"){
      id++;
      
      bilgi.add(ekle(id));
    }
    else if(sec=="3"){
      
      int giris=0;
      print("\nSilmek istediğiniz kaydın 'id'sini giriniz:");
      giris=int.parse(stdin.readLineSync()!);
      print("\n");

      print("Silinen veri:");
      print(bilgi[idBul(bilgi, giris)]);
      print("\n");

      bilgi.removeAt(idBul(bilgi, giris));

    }
    else if(sec=="4"){

      while(true){
        String araSec;

        print("\n   'A': ID'ye göre aratır");
        print("   'B': Satıcıya göre aratır");
        print("   'C': Grama göre aratır");
        print("   'D': Boyut'a göre aratır");
        print("   'Q': Çıkış yapar");
        print("Giriş:");
        araSec=stdin.readLineSync().toString();
        araSec=araSec.toUpperCase();
        print("\n");

        if(araSec=="Q")
          break;
        else if(araSec=="A"){
          int aranan;
        
          print("Aranacak olan ID'Yi giriniz:");
          aranan=int.parse(stdin.readLineSync()!);
          print("\n");
        
          print("Aranan kayıt bulundu:");
          print(bilgi[idBul(bilgi, aranan)]);
          print("\n");
        }
        else if(araSec=="B"){
          String tuccar;
          List<int> tuccarIndis=[];

          print("Aranacak olan satıcının adını giriniz:");
          tuccar=stdin.readLineSync().toString();
          print("\n");

          tuccarIndis=satBul(bilgi, tuccar);

          if(tuccarIndis.length>0){
            print("Aranan satıcı/satıcılar bulundu");
            
            for(int i=0; i<tuccarIndis.length; i++)
              print(bilgi[tuccarIndis[i]]);
          }
          else
            print("Aranan satıcı bulunamadı!");
          
          print("\n");
        }
        else if(araSec=="C"){
          int kucukGram;
          int buyukGram;
          List<int> gramIndis=[];
          
          print("\nGram ile arama yaparken, aralık olarak arama yapılır.");
          print("Bunun için iki farklı değer girmeniz gerekir; bir büyük bir de küçük değer.");

          print("\nKüçük değeri giriniz:");
          kucukGram=int.parse(stdin.readLineSync()!);
          print("\nBüyük değeri giriniz:");
          buyukGram=int.parse(stdin.readLineSync()!);

          gramIndis=gramBul(bilgi, kucukGram, buyukGram);

          if(gramIndis.length>0){
            print("\nGirilen değerler arasında kayıt/kayıtlar bulundu:");

            for(int i=0; i<gramIndis.length; i++)
              print(bilgi[gramIndis[i]]);
          }
          else
            print("Girilen değerler arasında kayıt bulunamadı!");

          print("\n");
        }
        else if(araSec=="D"){
          String boyutGir;
          List<int> boyutInd=[];

          print("\nLütfen giriş yapınız('S'mall, 'M'edium, 'L'arge):");
          boyutGir=stdin.readLineSync().toString();

          boyutInd=boyutBul(bilgi, boyutGir);

          if(boyutInd.length>0){
            print("\nAranan boyutta kayıt/kayılar bulundu:");
            
            for(int i=0; i<boyutInd.length; i++)
              print(bilgi[boyutInd[i]]);

            print("\n");
          }
          else
            print("\nAranan boyutta bir kayıt bulunamadı!");

          print("\n");
        }

      }

    }
    else if(sec=="5"){      
      
      while(true){
        String gunSec;
        int gunId=-1;
        int gunInd=-1;

        print("\n   'X': Satıcıyı Değitirir");
        print("   'Y': Gramajı Değiştirir");
        print("   'Q': Çıkış yapar");
        print("Giriş:");
        gunSec=stdin.readLineSync().toString();
        gunSec=gunSec.toUpperCase();
        print("\n");

        if(gunSec=="Q")
          break;
        else if(gunSec=="X"){
          print("\nGüncellemek istediğiniz değerin ID'sini giriniz:");
          gunId=int.parse(stdin.readLineSync()!);

          gunInd=idBul(bilgi, gunId);

          print("\nGüncellenmek istenen kayıt:");
          print(bilgi[gunInd]);
          print("\n");

          print("Yeni Satıcı adını giriniz (Türkçe Karakter Kullanmayınız!):");
          bilgi[gunInd]["Satıcı"]=stdin.readLineSync().toString();
          
          print("Güncel Kayıt:");
          print(bilgi[gunInd]);
          print("\n");
        }
        else if(gunSec=="Y"){
          print("\nGüncellemek istediğiniz değerin ID'sini giriniz:");
          gunId=int.parse(stdin.readLineSync()!);

          gunInd=idBul(bilgi, gunId);

          print("\nGüncellenmek istenen kayıt:");
          print(bilgi[gunInd]);
          print("\n");

          print("\nYeni gram değerini giriniz:");
          bilgi[gunInd]["Gram"]=int.parse(stdin.readLineSync()!);

          if(bilgi[gunInd]["Gram"]<=40)
            bilgi[gunInd]["Boyut"]="S";
          else if(bilgi[gunInd]["Gram"]>40 && bilgi[gunInd]["Gram"]<=50)
            bilgi[gunInd]["Boyut"]="M";
          else if(bilgi[gunInd]["Gram"]>50)
            bilgi[gunInd]["Boyut"]="L";

            print("\nGüncel Kayıt:");
            print(bilgi[gunInd]);
            print("\n");
        }

      }

    }

  }

}