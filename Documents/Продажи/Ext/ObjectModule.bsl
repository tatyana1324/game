﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр Наличие Расход

	Для каждого ТекТоварыЗаказа Из ТоварыЗаказа Цикл
		Движения.Наличие.Записывать = Истина;
		Движение = Движения.Наличие.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекТоварыЗаказа.Номенклатура;
	   	Движение.Количество = ТекТоварыЗаказа.Количество;
		Движение.Цена = ТекТоварыЗаказа.Цена;
		Движение.Сумма = ТекТоварыЗаказа.Сумма;
	КонецЦикла;
	Движение.Поставщик = Поставщик;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Заказы") Тогда
		// Заполнение шапки
		Клиент = ДанныеЗаполнения.Клиент;
		СсылкаЗаказ = ДанныеЗаполнения.Ссылка;
		Для Каждого ТекСтрокаТаблицаЗаказ Из ДанныеЗаполнения.ТаблицаЗаказ Цикл
			НоваяСтрока = Товары.Добавить();
			НоваяСтрока.НоменклатураНаша = ТекСтрокаТаблицаЗаказ.Номенклатура;
			НоваяСтрока.ЦенаНаша = ТекСтрокаТаблицаЗаказ.Цена;
			НоваяСтрока = ТоварыЗаказа.Добавить();
			НоваяСтрока.Количество = ТекСтрокаТаблицаЗаказ.Количество;
			НоваяСтрока.Номенклатура = ТекСтрокаТаблицаЗаказ.Номенклатура;
			НоваяСтрока.Сумма = ТекСтрокаТаблицаЗаказ.Сумма;
			НоваяСтрока.Цена = ТекСтрокаТаблицаЗаказ.Цена;
		КонецЦикла;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры
