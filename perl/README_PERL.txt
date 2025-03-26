Perl Calculator - README
------------------------

Genel Bakış:
------------
Bu proje, Perl dilinde yazılmış bir hesap makinesi uygulamasıdır. Kullanıcıdan alınan matematiksel ifadeleri işler ve sonucu ekrana yazdırır. Ayrıca değişken atamalarını destekler ve daha sonra bu değişkenler kullanılabilir.

Bu kod test edilirken https://www.tutorialspoint.com/execute_perl_online.php üzerinden online compiler kullanılmıştır
alta local compiler için kod eklenmiştir ancak çalıştırılırken bu link üzerinden çalıştırılması tavsiye edilmektedir


Kodun İşleyişi:
---------------
1. **Ana Döngü:**
   - Kullanıcıdan giriş alır.
   - Kullanıcı `q` girerse program sonlanır.
   - Giriş boşsa, döngü devam eder.
   - `goster <ifade>` komutu ile ifadeler hesaplanır ve ekrana yazdırılır.
   - `<degisken> = <ifade>` formatında değişken atanabilir.
   - Standart matematiksel işlemler yapılabilir.

2. **Matematiksel İşlemler:**
   - Program, `+`, `-`, `*`, `/` gibi işlemleri destekler.
   - Kullanıcı tarafından tanımlanan değişkenler kaydedilir ve daha sonra kullanılabilir.
   - Değişkenler hesaplama sırasında yerine konur.

3. **Hata Yönetimi:**
   - Tanımlanmamış değişkenler için varsayılan olarak `0` değeri atanır.
   - `eval` fonksiyonu ile hesaplama yapılır, hata oluşursa kullanıcıya bildirilir.

Gereksinimler:
--------------
- Perl yorumlayıcısı (Varsayılan olarak birçok Linux/Mac sisteminde yüklüdür. Windows için [Strawberry Perl](https://strawberryperl.com/) kullanılabilir.)
- Terminal veya Komut Satırı

Programın Çalıştırılması:
-------------------------
1. Terminali açın ve Perl programını aşağıdaki gibi çalıştırın:
2. Örnek kullanım:
   3 + 5
3. Programdan çıkmak için `q` girin.

Notlar:
-------
- Bu proje, temel hesaplama işlevleri için tasarlanmıştır.
- Kullanıcı tarafından atanmış değişkenler bellekte saklanır ve başka hesaplamalarda kullanılabilir.
- Hataları önlemek için girilen ifadeler işlenmeden önce temizlenir.
