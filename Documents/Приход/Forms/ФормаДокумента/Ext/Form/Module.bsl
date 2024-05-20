﻿&НаСервере
Функция ПолучитьЦенуНоменклатурыПоставщика(Номенклатура)
	Запрос = Новый Запрос;
	
	Запрос.Текст = "ВЫБРАТЬ
	               |	ЦеныПоставщиков.Номенклатура КАК Номенклатура,
	               |	ЦеныПоставщиков.Цена КАК Цена
	               |ИЗ
	               |	РегистрСведений.ЦеныПоставщиков КАК ЦеныПоставщиков
	               |ГДЕ
	               |	ЦеныПоставщиков.Номенклатура = &Номенклатура";
	
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	
	Результат = Запрос.Выполнить().Выгрузить();
	ЦенаНоменклатуры = Результат.Получить(0).Цена; 
	
	Возврат ЦенаНоменклатуры 
КонецФункции

&НаСервере
Функция ПолучитьНоменклатуруПоставщика(Поставщик)
	Запрос = Новый Запрос;
	
	Запрос.Текст = "ВЫБРАТЬ
	               |	ЦеныПоставщиков.Поставщик КАК Поставщик,
	               |	ЦеныПоставщиков.Номенклатура КАК Номенклатура
	               |ИЗ
	               |	РегистрСведений.ЦеныПоставщиков КАК ЦеныПоставщиков
	               |ГДЕ
	               |	ЦеныПоставщиков.Поставщик = &Поставщик";
	
	Запрос.УстановитьПараметр("Поставщик", Поставщик);
	
	Результат = Запрос.Выполнить().Выгрузить();
	НоменклатураПоставщика = Результат.Получить(0).Номенклатура; 
	
	Возврат НоменклатураПоставщика
КонецФункции

&НаКлиенте
Процедура ПриходНоменклатураПриИзменении(Элемент)
	// Получение цены номенклатуры поставщика
	Стр = Элементы.Приход.ТекущиеДанные;
	ЦенаПоставщика = ПолучитьЦенуНоменклатурыПоставщика(Стр.Номенклатура);
	Стр.Цена = ЦенаПоставщика;
	Стр.Сумма = Стр.Количество * Стр.Цена;
КонецПроцедуры

&НаКлиенте
Процедура ПриходПоставщикПриИзменении(Элемент)
	// Получение номенклатуры поставщика
	Стр = Элементы.Приход.ТекущиеДанные;
	НоменклатураПоставщика = ПолучитьНоменклатуруПоставщика(Стр.Поставщик);
	Стр.Номенклатура = НоменклатураПоставщика;
	
	// Получение цены номенклатуры поставщика, при изменении поставщика
	ЦенаПоставщика = ПолучитьЦенуНоменклатурыПоставщика(Стр.Номенклатура);
	Стр.Цена = ЦенаПоставщика;
	Стр.Сумма = Стр.Количество * Стр.Цена;
КонецПроцедуры 

&НаКлиенте
Процедура ПриходКоличествоПриИзменении(Элемент)
	Стр = Элементы.Приход.ТекущиеДанные;
	Стр.Сумма = Стр.Количество * Стр.Цена;
КонецПроцедуры

&НаКлиенте
Процедура ПриходЦенаЗаШтукуПриИзменении(Элемент)
	Стр = Элементы.Приход.ТекущиеДанные;
	Стр.Сумма = Стр.Количество * Стр.Цена;
КонецПроцедуры
