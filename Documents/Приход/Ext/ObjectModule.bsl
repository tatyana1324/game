﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр Наличие Приход
	Движения.Наличие.Записывать = Истина;
	Для Каждого ТекСтрокаПриход Из Приход Цикл
		Движение = Движения.Наличие.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаПриход.Номенклатура;
		Движение.Поставщик = Поставщик;
		Движение.Количество = ТекСтрокаПриход.Количество;
		Движение.Сумма = ТекСтрокаПриход.Сумма;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
