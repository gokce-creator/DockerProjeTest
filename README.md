DockerProjeTest

Bu proje, .NET 9.0 kullanılarak oluşturulmuş bir örnek uygulamayı Docker container içinde çalıştırmak için hazırlanmıştır. Proje, Dockerfile aracılığıyla iki aşamalı bir süreçle build ve runtime ortamlarını yapılandırır.

--------Özellikler-----------

Çok aşamalı build desteği: Kodun derlenmesi ve çalıştırılması için ayrı aşamalar içerir.

.NET 9.0 uyumlu: Modern .NET framework ile geliştirilmiştir.

Docker kullanımı: Uygulama, kolay taşınabilir bir container olarak çalıştırılır.

------Gereksinimler--------

Docker kurulu olmalıdır. .NET SDK ve runtime bilgisi gerekmez; Docker ile çalıştırabilirsiniz.

-------Kullanım---------

Terminalde Docker image oluşturun:
docker build -t dockerprojetest: .

Container'ı çalıştırın:
docker run -d -p 81:81 dockerprojetest

Uygulamaya erişin:

Tarayıcınızda http://localhost:81 adresine giderek uygulamayı kontrol edebilirsiniz.

Dockerfile Açıklaması
Build aşaması:

Proje dosyasını (DockerProjeTest.csproj) kopyalar ve bağımlılıkları restore eder.
Kodları derleyip /app dizinine yayımlar.

Runtime aşaması:

Build aşamasından alınan derlenmiş kodları bir çalışma ortamına taşır.
Uygulamanın dotnet DockerProjeTest.dll komutuyla çalıştırılmasını sağlar.

Notlar

Bu proje yalnızca Docker ile bir .NET uygulamasının containerize edilmesini göstermek amacıyla hazırlanmıştır. Uygulamanın işlevselliği hakkında detay bulunmamaktadır.
