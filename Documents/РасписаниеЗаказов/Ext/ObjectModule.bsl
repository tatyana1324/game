﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр РегистрРасписания Расход
	Движения.РегистрРасписания.Записывать = Истина;
	Для Каждого ТекСтрокаТаблицаРасписание Из ТаблицаРасписание Цикл
		Движение = Движения.РегистрРасписания.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Курьер = ТекСтрокаТаблицаРасписание.Курьер;
		Движение.КолВо = 1;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
