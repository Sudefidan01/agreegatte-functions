--Aggregate Functions (Hazır Fonksiyonlar)
--Sql sorgu dili içierisnde tüm programlama dillerinde olduğu gibi hazır fonksiyonlar vardır
--Bunlardan en sık kullanılanları örnekler halinde işleyelim

--Count(<Kolon>)
--Sql içerisinde bir tabloda kolona bağlı olarak o veriden kaç adet veri var ise bilgisini sayısal ifade olarak geri döndürür

--Count(<Kolon>) fonksiyonu Select içerisinde kullanılır

--Syntax
--Select COUNT(<Kolon>) from <tablo>

--Örnek
--Kaç adet müşterim var
select count(CustomerID) as [Toplam Müşteri Adı] from Customers

--Distinct(<Kolon>)
--Bir sorgu içerisindeki verileri belirtilen kolon adına göre kendini tekrarlayan veriler var ise bu verileri süzer ve tek veri halinde listeler

--Syntax
--Select distinct(<kolon>) from <tablo>

--Örnek
--Hangi ülkelere ihracat yapıyorum
Select distinct(Country) from Customers

--TOp x
--Sql sorgusu içerisinde kaç adet veri listelemek istediğimizi belirttimiz bir fonksiyondur
--Top fonksiyonunda parantez bulunmaz
--Top ifadesinden sonra sayı türünden listelemek istediğiniz veri sayısını yazmanız  gerekmektedir
--Sadece select ifadesi içerisinde kullanılabilir

--Syntax
--Select top x from <Tablo>

--Örnek
--İlk 5 müşteriyi listeleyelim
select top 5 * from Customers

--Fiyatı en pahalı olan 5 ürünü listeleyelim
--(Products)(UnitPrice)
select
	top 5 ProductName,UnitPrice
from Products
order by UnitPrice desc

--Kargo ücreti 1'den büyük en ucuz olan 10 siparişi listeleyelim
--(orders)(freight)
select
	Top 10 Freight
from Orders
where Freight>1
order by Freight asc

--Sum(<Kolon>)
--Sql sorgusu içerisinde belirtilen sayısal kolonun toplam değerini verir
--Geriye ondalıklı değer döndürür

--Syntax
--Select Sum(<Kolon>) from <Tablo>

--Örnek
--Müşterilerin ödediği toplam kargo ücreti
select
	sum(Freight) as TotalFreight
from Orders

--Elimde toplam ne kadarlık ürün var
--(Products)(unitprice,unitsinstock)
select
	sum(UnitPrice*UnitsInStock) as Total
from Products

--Şimdiye kadar toplam ne kadarlık satış yapmışım
--(order details)
select
	sum((UnitPrice*Quantity)*(1-Discount)) as TotalOrder
from [Order Details]

--AVG(<Kolon>)
--Sorgu içerisinde belirtilen kolonun ortalamasını hesaplar
--Sadece sayısalar veriler için kullanılır

--Syntax
--Select AVG(<Kolon>) from <Tablo>

--Örnek
--Ürünlerimin ortalama fiyatı ne kadardır
select
	AVG(UnitPrice) as AveragePrice
from Products

--Siparişlerimin ortalama kargo ücretini hesaplayalım
select
	avg(Freight) as AverageFreight
from Orders

--Max(<kolon>)
--Sql sorgusu içerisinde belirtilen kolonun max değerini verir
--Sadece sayısal evriler için kullanılır

--Örnek
--En pahalı kargo ücreti nekadardır
select
	max(Freight)as MaxFreight
from Orders

--Min(<Kolon>)
--Sql sorgusu içerisinde belirtilen kolonun minimum değerini verir
--Sadece sayısal evriler için kullanılır

--Örnek
--En ucuz ürün fiyatı ne kadardır
select
	min(UnitPrice)
from Products

--Getdate()
--Şuanki zamanı bize yyyy-mm-dd hh:mm:ss tipinde geri döndürür

Select GETDATE()

--Year(<kolon>)
--Fonksiyonun içerisinde belirtilmiş olan tarih bilgisinin yıl değerini döndürür

--Örnek
-- 2010-03-25 tarihinin yıl bilgisini döndürelim
select YEAR('2010-03-25')

--Örnek
--Çalışanlarımın ad , soyad ve yaş bilgilerini listeleyelim
select
	(FirstName+ ' '+LastName) as [Full Name],
	(YEAR(GETDATE())-YEAR(BirthDate)) as Age
from Employees
order by Age desc

--Month(<Kolon>)
--Parantez içerisindeki tarih bilgisinin ay bilgisini geriye döndürür
--Day(<Kolon>)
--Parantez içerisindeki tarih bilgisinin gün bilgisini geriye döndürür

--Şuanki tarihin ay ve gün bilgilerini yazdıralım
select 
	DAY(GETDATE()) as Gün,
	MONTH(GETDATE()) as Ay
