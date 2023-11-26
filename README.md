# kanbanboard

A new Flutter project.

## Getting Started

**main.dart;**
> + Projenin başlangıç ekranı. Bu sayfadan splash_screen.dart sayfasına geçiş yapılır.

**splash_screen.dart;**
> + Bu sayfa uygulamadaki ilk sayfadır ve sayfanın tasarımını içerir. Bu sayfada 3 saniye bekler ve home_page.dart sayfasına geçiş yapar.

**home_page.dart;**
> + Uygulamanın ana ekranın olduğu sayfa. Ana ekranın tüm tasarımları bu sayfada yer alır. Api ile ilk iletişime geçen sayfa. Tüm sayfa dinamik bir yapıdadır.
> + Eğer bir card nesnesine uzun süre basılı tutarsanız yanındaki kartlar ile **yerini değiştirebilirsiniz.** Eğer card nesnesine 1 kere basarsanız o card üzerinde bulunan bilgileri **detaylı olarak incelemek için bir pop up açılacak**.
> + Eğer yeni bir "To Do" girmek isterseniz "floatingActionButton"a tıklayın ve açılan Pop-Up ta yeni görevi girin bu girdiğiniz görev önce **API'ye kayıt ediliyor ve daha sonra ekranda gösteriliyor.** Kod yapısı hazır fakat;
> + API olarak **"Fake API" kullandım** bu sebeple API ye herhangi bir post yapmak mümkün değil ve sadece veri çekmek mümkün ama 3. paragrafta söylediğim gibi kod hazır ve çalışıyor. Bunun kanıtın proje içine yüklediğim **"Kanıt.png"'de** bulabilirsiniz.
> + "Save" butonuna bastığınız anda 4. paragrafta anlattığım üzere hata alırsınız. Bu benden kaynaklanan bir durum değil kod hazır ve çalışıyor.

API VERİ İŞLEMLERİ İÇİN **"RİVERPOD"** KULLANILDI. **(STATE MANAGEMENT)**

API VERİLERİM AŞAĞIDAKİ LİNKTEDİR. **API DEN VERİ ALMAK İSTİYORSANIZ ÖNCE BU LİNKİ AÇIN VE PROJEYİ DENEDİĞİNİZ SÜRECE KAPATMAYIN.**

> [!NOTE]
**LİNK :** [API LINK](https://api.npoint.io/8518ae46bf02ca8e885c)
