Scheme Calculator - README
--------------------------

Genel Bakış:
------------
Bu proje, Scheme dilinde yazılmış bir hesap makinesi programıdır. Kullanıcının girdiği matematiksel ifadeleri ayrıştırarak işlemleri gerçekleştirir ve sonucu ekrana yazdırır.

Kodun İşleyişi:
---------------
1. **Tokenizasyon (`tokenize`)**:
   - Kullanıcının girdiği matematiksel ifadeyi alır ve operatörleri (`+`, `-`, `*`, `/`, `(`, `)`) ayırır.
   - Sayıları ve noktaları (`.`) destekleyerek ondalık sayılarla işlem yapabilir.
   - Boşlukları atar ve geçersiz karakterleri kontrol eder.

2. **İfade Ayrıştırma (`parse-expression`)**:
   - Sayıları ve parantezleri değerlendirerek bir matematiksel soyut sözdizimi ağacı (AST) oluşturur.
   - `parse-term` ve `parse-factor` gibi yardımcı fonksiyonlar kullanarak işlemleri sıralı bir şekilde işler.
   - `+`, `-`, `*`, `/` işlemlerini gerçekleştirir.

3. **Hesaplama (`hesapla`)**:
   - Tokenize edilen ifadeyi ayrıştırarak sonucu hesaplar.
   - Hataları kontrol eder, eksik parantezleri veya geçersiz ifadeleri yakalar.

4. **Programın Başlatılması (`baslat`)**:
   - Kullanıcıdan matematiksel bir ifade alır ve sonucu hesaplar.
   - `guard` mekanizması kullanarak hata yönetimi sağlar.
   - Sürekli olarak yeni girişler alarak döngü içinde çalışır.

Gereksinimler:
--------------
- Scheme dilini çalıştırabilen bir ortam (MIT/GNU scheme).
- Terminal veya komut satırı.

Programın Çalıştırılması:
-------------------------
1. Scheme ortamınızı açın.
   $scheme
2. Program dosyanızı yükleyin:
   (load "calculator.scm")
   2+2
3. çıkmak için ctrl+z