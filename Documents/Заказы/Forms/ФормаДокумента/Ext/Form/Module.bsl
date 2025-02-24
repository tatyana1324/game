﻿
&НаСервере
Функция КлиентПриИзмененииНаСервере(Ссылка)
	Запрос = Новый Запрос;
	
	Запрос.Текст = "ВЫБРАТЬ
	               |	Клиенты.Ссылка КАК Ссылка,
	               |	Клиенты.Адрес КАК Адрес,
	               |	Клиенты.Телефон КАК Телефон,
	               |	Клиенты.ДополнительныйАдрес КАК ДополнительныйАдрес
	               |ИЗ
	               |	Справочник.Клиенты КАК Клиенты
	               |ГДЕ
	               |	Клиенты.Ссылка = &Ссылка";
	
	Запрос.УстановитьПараметр("Ссылка", Объект.Клиент);
	
	РезультатЗапроса = Запрос.Выполнить().Выгрузить();
	
	Альфа = Новый Массив(2);
	Альфа[0] = РезультатЗапроса.Получить(0).Адрес;
	Альфа[1] = РезультатЗапроса.Получить(0).Телефон;
	
	Возврат Альфа 
	
КонецФункции

&НаКлиенте
Процедура КлиентПриИзменении(Элемент)
	Бета = КлиентПриИзмененииНаСервере(Объект.Клиент);
	Объект.Адрес = Бета[0];
	Объект.Телефон = Бета[1];
КонецПроцедуры

&НаСервере
Функция ТаблицаЗаказТоварПриИзмененииНаСервере(Номенклатура)
	Запрос = Новый Запрос;
	
	Запрос.Текст = "ВЫБРАТЬ
	|	ЦенаТоваров.Номенклатура КАК Номенклатура,
	|	ЦенаТоваров.Цена КАК Цена
	|ИЗ
	|	РегистрСведений.ЦенаТоваров КАК ЦенаТоваров
	|ГДЕ
	|	ЦенаТоваров.Номенклатура = &Номенклатура";
	
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	
	РезультатЗапроса = Запрос.Выполнить().Выгрузить();
	Омега = РезультатЗапроса.Получить(0).Цена; 
	
	Возврат Омега 
КонецФункции

&НаКлиенте
Процедура ТаблицаЗаказТоварПриИзменении(Элемент)
	Стр = Элементы.ТаблицаЗаказ.ТекущиеДанные;
	Дельта = ТаблицаЗаказТоварПриИзмененииНаСервере(Стр.Номенклатура);
	Стр.Цена = Дельта;
	
	Стр = Элементы.ТаблицаЗаказ.ТекущиеДанные;
	Стр.Сумма = Стр.Количество * Стр.Цена;
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаЗаказКоличествоПриИзменении(Элемент)
	Стр = Элементы.ТаблицаЗаказ.ТекущиеДанные;
	Стр.Сумма = Стр.Количество * Стр.Цена;
КонецПроцедуры
