Prolog Calculator - README
--------------------------

Genel Bakış:
------------
Bu proje, Prolog dilinde yazılmış bir hesap makinesi programıdır. Kullanıcıdan matematiksel ifadeler alarak işlemi gerçekleştirir ve sonucu ekrana yazdırır. Ayrıca, sıfıra bölme gibi hataları kontrol eder.

Bu kod test edilirken https://www.tutorialspoint.com/execute_prolog_online.php üzerinden online compiler kullanılmıştır
alta local compiler için kod eklenmiştir ancak çalıştırılırken bu link üzerinden çalıştırılması tavsiye edilmektedir


Kodun İşleyişi:
---------------
1. **Ana Fonksiyon:**
   - `run/0` fonksiyonu çalıştırıldığında, kullanıcıdan bir giriş alır.
   - Kullanıcı `q` yazarak programı sonlandırabilir.
   - Kullanıcının girdisi atom olarak kontrol edilir ve `interface/2` fonksiyonuna yönlendirilir.

2. **İfade Çözümleme ve Hesaplama:**
   - `interface/2`: Girdi olarak alınan matematiksel ifadeyi değerlendirir.
   - `hesapla_ifade/2`: İfade analiz edilerek bir soyut sözdizimi ağacına (AST) dönüştürülür.
   - `hesapla/2`: AST üzerinde işlemler gerçekleştirilerek sonuç hesaplanır.

3. **Aritmetik İşlemler:**
   - `topla(X,Y)`: X ve Y'yi toplar.
   - `cikar(X,Y)`: X'ten Y'yi çıkarır.
   - `carp(X,Y)`: X ve Y'yi çarpar.
   - `bol(X,Y)`: X'i Y'ye böler, ancak Y sıfırsa hata fırlatır.

4. **Hata Yönetimi:**
   - `sifira_bolme_hatasi`: Bölme işlemi sırasında bölünen sıfırsa hata yakalanır ve kullanıcıya hata mesajı gösterilir.
   - Geçersiz girişler kontrol edilerek kullanıcı tekrar giriş yapmaya yönlendirilir.

Gereksinimler:
--------------
- Prolog derleyicisi (Örneğin, SWI-Prolog: https://www.swi-prolog.org/)
- Terminal veya komut istemcisi

Prolog Programını Çalıştırma:
-----------------------------
1. Terminali açın ve Prolog ortamına girin.
2. Program dosyanızı yüklemek için şu komutu çalıştırın:
    run.
    '2+2'.
çıkmak için:
    q.
