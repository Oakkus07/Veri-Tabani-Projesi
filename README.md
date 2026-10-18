# Hastane Otomasyonu Veritabanı Projesi

Bu proje, üniversite "Veri Tabanı Projesi" dersi kapsamında geliştirilmiş bir hastane otomasyon sistemi prototipidir. 

## 🎯 Projenin Amacı
Bu projenin temel amacı, bir hastanenin günlük işleyişini (muayene, tahlil, personel yönetimi) dijital ortama taşımak ve veri bütünlüğünü sağlamak için optimize edilmiş bir ilişkisel veri tabanı (RDBMS) tasarlamaktır. Proje kapsamında; hastalar, doktorlar, poliklinikler, laboratuvarlar, tahliller, hemşireler ve servisler arasındaki karmaşık veri ilişkileri (1:N ve N:M) standartlara uygun bir Varlık-İlişki (ER) modeli ile kurgulanmış ve SQL diline dökülmüştür.

## 🚀 Kullanılan Teknolojiler
* **Veritabanı Yönetim Sistemi:** MySQL
* **Sorgu Dili:** SQL (Structured Query Language) - Tablo oluşturma (DDL) ve ilişkilendirme yapıları.
* **Tasarım ve Modelleme:** Varlık-İlişki (ER) Diyagramı çizim araçları
* **Versiyon Kontrol & Barındırma:** Git ve GitHub

## ⚙️ Sistem Kuralları ve Veritabanı İlişkileri
Veritabanı şeması aşağıdaki iş kuralları (business rules) baz alınarak normalize edilmiştir:
1. Doktorlar poliklinikler altında çalışır. Bir poliklinikte birden fazla doktor çalışabilir, bir doktor birden fazla poliklinikte çalışamaz **(1:N)**.
2. Hastalar poliklinikte muayene olur. Bu durum hasta ve poliklinik arasında çoka çok ilişki doğurur **(N:M)**.
3. Hastalar tahlil yaptırabilir, tahlilleri doktorlar ister. Hasta, Doktor ve Tahlil arasında aracı bir işlem tablosu ile ilişki kurulmuştur **(N:M)**.
4. Tahliller laboratuvarda yapılır, bir tahlil iki farklı laboratuvarda yapılmaz **(1:N)**.
5. Hemşireler servislerde çalışır. Bir serviste birden fazla hemşire olabilir, aynı hemşire iki farklı servise hizmet vermez **(1:N)**.
6. Servisler polikliniklere aittir. Bir polikliniğin birden fazla servisi olabilir **(1:N)**.

## 📂 Proje İçeriği
* `schema.sql`: Yukarıdaki kurallara uygun olarak Primary Key (Birincil Anahtar) ve Foreign Key (Yabancı Anahtar) kısıtlamalarının (constraints) tanımlandığı veri tabanı oluşturma betiği.
* `diyagram.png`: Projenin mantıksal veri tabanı tasarımını gösteren Varlık-İlişki (ER) diyagramı.

## 👥 Proje Ekibi
Bu proje, aşağıdaki ekip üyeleri tarafından tasarlanmış ve geliştirilmiştir:
* **Oğuzhan Akkuş** - 455089
* **Furkan Ağır** - 455085
