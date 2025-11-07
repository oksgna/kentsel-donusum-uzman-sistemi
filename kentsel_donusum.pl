puan_yil(Yil,2):- Yil<2000.
puan_yil(Yil,1):- Yil>2000, Yil<2018 .
puan_yil(Yil,0):-Yil>2018.
puan_kat(Kat,2):- Kat>= 8.
puan_kat(Kat,1):- Kat>= 3 ,Kat < 8.
puan_kat(Kat,0):- Kat<3.
puan_beton(zayif,2).
puan_beton(orta,1).
puan_beton(iyi,0).
puan_catlak(belirgin,2).
puan_catlak(orta,1).
puan_catlak(hafif,0).
puan_zemin(riskli,2).
puan_zemin(orta,1).
puan_zemin(saglam,0).

sor(Soru, Cevap) :-format('~w: ', [Soru]),read(Cevap).
risk_hesaplama(Yil,Kat,Beton,Catlak,Zemin,Toplam) :- 
    puan_yil(Yil,P1),
    puan_kat(Kat,P2),
    puan_beton(Beton,P3),
    puan_catlak(Catlak,P4),
    puan_zemin(Zemin,P5), 
    
    Toplam is P1+P2+P3+P4+P5.

degerlendirme(Toplam,'Yüksek risk: Kentsel dönüşüm gerekli.'):-Toplam>=6.
degerlendirme(Toplam,'Orta risk: Detaylı inceleme yapılmalı.'):-Toplam>=3.
degerlendirme(Toplam,'Düşük risk: Yapı güvenli.'):-Toplam<3.
    
tani:-
    sor('Bina kaç yılında yapıldı? ', Yil),
    sor('Bina kaç katlı? ', Kat),
    sor('Beton sağlam mı(zayif/orta/iyi)?',Beton),
    sor('Kolonlardaki çatlakların seviyesi nedir?(belirgin/orta/hafif)', Catlak),
    sor('Zemin sağlam mı?(riskli/orta/saglam)',Zemin),
    
     risk_hesaplama(Yil,Kat,Beton,Catlak,Zemin,Toplam),
    degerlendirme(Toplam,Sonuc)
    
    ->
      format('Risk Puanı: ~w --> Sonuc: ~w ', [Toplam,Sonuc]).



   

