Calculator Rust Program - README
-----------------------------------

Genel Bakış:
------------
Bu proje, Rust dilinde yazılmış basit bir hesap makinesi uygulamasıdır.
Proje dosyası: calculator.rt

Bu kod test edilirken https://www.programiz.com/rust/online-compiler/ üzerinden online compiler kullanılmıştır
alta local compiler için kod eklenmiştir ancak çalıştırılırken bu link üzerinden çalıştırılması tavsiye edilmektedir

Kodun İşleyişi:
----------------
1. Ana Program Akışı:
   - Program çalıştırıldığında kullanıcıdan hangi aritmetik işlemi yapmak istediği sorulur.
   - Kullanıcının seçimine göre ilgili aritmetik işlem (toplama, çıkarma, çarpma, bölme) gerçekleştirilir.
   - Hesaplama sonucu ekrana yazdırılır.

2. Aritmetik İşlemler:
   - Her bir aritmetik işlem için ayrı fonksiyonlar tanımlanmıştır.
   - Fonksiyonlar, iki sayı alarak işlemi gerçekleştirir ve sonucu döndürür.
   - Bölme işlemi sırasında sıfıra bölme kontrolü yapılır; eğer kullanıcı sıfıra bölme yapmaya çalışırsa, uygun hata mesajı verilir.

3. Hata Yönetimi:
   - Kullanıcı hatalı giriş yaparsa, hata mesajları ile bilgilendirilir.
   - Sıfıra bölme gibi özel durumlar için kontrol mekanizması mevcuttur.

Gereksinimler:
--------------
- Rust programlama dilinin kurulu olması (https://www.rust-lang.org/tools/install)
- Terminal veya komut istemcisi

Derleme Adımları:
------------------
1. Terminal veya komut istemcisinde, "calculator.rt" dosyasının bulunduğu dizine gidin.
2. Aşağıdaki komutu kullanarak programı derleyin:

      rustc calculator.rt

   Bu komut, kaynak kodu derleyerek çalıştırılabilir bir dosya oluşturacaktır.

Programın Çalıştırılması:
-------------------------
- Derleme işlemi tamamlandıktan sonra, oluşan çalıştırılabilir dosyayı terminalde çalıştırın:

      ./calculator      (Linux/macOS)
      calculator.exe    (Windows)

Notlar:
-------
- Bu proje eğitim amaçlı hazırlanmış basit bir örnektir.
- Daha gelişmiş özellikler eklemek isterseniz, kodu modüler yapıda geliştirebilir ve hata yönetimini genişletebilirsiniz.
- Derleme veya çalışma sırasında sorun yaşarsanız, Rust'un doğru kurulduğundan ve "calculator.rt" dosyasındaki kodun güncelliğinden emin olun.

