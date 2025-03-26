Calculator Ada Program - README

Genel Bakış:
--------------
Bu proje, Ada dilinde yazılmış basit bir hesap makinesi uygulamasıdır.
Proje dosyası: calculator.adb

Bu kod test edilirken https://www.tutorialspoint.com/compile_ada_online.php üzerinden online compiler kullanılmıştır
alta local compiler için kod eklenmiştir ancak çalıştırılırken bu link üzerinden çalıştırılması tavsiye edilmektedir

Kodun İşleyişi:
------------------
1. Ana Program Akışı:
   - Program çalıştırıldığında, kullanıcıdan hangi işlemi yapmak istediği sorulur.
   - Kullanıcının seçimine göre ilgili aritmetik işlem (toplama, çıkarma, çarpma, bölme) gerçekleştirilir.
   - Hesaplama sonucu ekrana yazdırılır.

2. Aritmetik İşlemler:
   - Her aritmetik işlem için ayrı fonksiyonlar/alt programlar tanımlanmıştır.
   - İki sayıyı alarak işlemi gerçekleştirir ve sonucu döndürür.
   - Bölme işlemi sırasında sıfıra bölme kontrolü yapılır; eğer bölme sıfıra yapılmaya çalışılırsa hata mesajı verilir.

3. Hata Yönetimi:
   - Kullanıcı hatalı veri girişi yaparsa uygun hata mesajları gösterilir.
   - Sıfıra bölme gibi durumlarda, program hatayı tespit eder ve kullanıcıyı bilgilendirir.

Gereksinimler:
---------------
- GNAT Ada Derleyicisi (GNAT Community Edition veya sisteminizin paket yöneticisi aracılığıyla kurulabilir)
- Desteklenen işletim sistemleri: Linux, macOS veya Windows

Derleme Adımları:
------------------
1. Terminal veya komut istemcisinde, calculator.adb dosyasının bulunduğu dizine gidin.
2. Aşağıdaki komutu kullanarak programı derleyin:
   
   gnatmake calculator.adb

   Bu komut, dosyayı derleyerek çalıştırılabilir bir dosya oluşturur.

Programın Çalıştırılması:
---------------------------
- Linux/macOS:
   ./calculator

- Windows:
   calculator.exe

Notlar:
--------
- Bu proje, eğitim amaçlı hazırlanmış basit bir örnektir.
- Daha gelişmiş özellikler veya hata yönetimi için kodu modüler yapıda geliştirebilirsiniz.
- Derleme veya çalışma sırasında sorun yaşarsanız, GNAT Ada derleyicisinin doğru kurulup kurulmadığını ve calculator.adb dosyasındaki kodun güncelliğini kontrol edin.
