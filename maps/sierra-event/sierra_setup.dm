/datum/map/sierra/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound(ANNOUNCER_COMMANDREPORT, volume = 45))

/datum/map/sierra/map_info(victim)
	to_chat(victim, "<h2>Информация о карте</h2>")
	to_chat(victim, "Вы находитесь на борту <b>[station_name]</b>, супер-эсминца Центрального Правительства Супер-Земли. Основной миссией вашего звездолёта является поиск и уничтожение агентов тирании и врагов свободы - зловещих Термиспайдеров, кровожадных Хайвтоматонов, а также изменников и предателей, пытающихся разрушить великий строй Регулируемой Демократии.")
	to_chat(victim, "Экипаж звездолёта состоит из персонала Вооруженных Сил Супер-Земли - офицеров флота, бойцов звёздной пехоты, а также подразделения Адских Десантников.")
	to_chat(victim, "Помимо военного персонала, на борту супер-эсминца также присутствуют гражданские лица - представители Министерства Правды и корпоративные подрядчики, размещенные на [station_name] с целью поддержания технологического и материального превосходства Супер-Земли. Полезные ссылки:")
	to_chat(victim, "<a href='https://sierra.ss220.space/index.php/Стандартные_процедуры_ИКН_Сьерра'>Процедуры ВССЗ</a>, <a href='https://sierra.ss220.space/index.php/Корпоративные_законы'>Регуляции ВССЗ</a>, <a href='https://sierra.ss220.space/index.php/Итак,_Вы_хотите_узнать_о_мире_корпораций%3F'>Список корпораций Супер-Земли</a>.")

/datum/map/sierra/send_welcome()
	set waitfor = FALSE

	var/welcome_text = "<center><img src = scglogo.png /><br /><font size = 3><b>SES Sierra Democratica</b> Показания Сенсоров:</font><hr />"
	welcome_text += "Отчет сгенерирован [stationdate2text()] в [stationtime2text()]</center><br /><br />"
	welcome_text += "Текущая система: <b>[system_name]</b><br />"
	welcome_text += "Следующая система для прыжка: <b>[generate_system_name()]</b><br />"
	welcome_text += "Дней до Супер-Земли: <b>[rand(15,45)]</b><br />"
	welcome_text += "Дней с последнего визита в порт: <b>[rand(60,180)]</b><br />"
	welcome_text += "Результаты сканирования показали следующие потенциальные объекты для разведки:<br />"

	var/list/space_things = list()
	var/obj/overmap/sierra = map_sectors["1"]
	for(var/zlevel in map_sectors)
		var/obj/overmap/visitable/O = map_sectors[zlevel]
		if(O.name == sierra.name)
			continue
		if(istype(O, /obj/overmap/visitable/ship/landable)) //Don't show shuttles
			continue
		if(O.hide_from_reports)
			continue
		space_things |= O

	var/list/distress_calls
	for(var/obj/overmap/visitable/O in space_things)
		var/location_desc = " на текущем квадрате."
		if(O.loc != sierra.loc)
			var/bearing = get_bearing(sierra, O) //fucking triangles how do they work
			location_desc = ", по азимуту [bearing]."
		welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

	if(LAZYLEN(distress_calls))
		welcome_text += "<br><b>Обнаружены сигналы бедствия:</b><br>[jointext(distress_calls, "<br>")]<br>"
	else
		welcome_text += "<br>Сигналов бедствия не обнаружено.<br />"

	welcome_text += "<hr>"

	post_comm_message("SES Sierra Democratica Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "Сканирование сектора завершено. Информация передана в базу данных консолей связи.")
	sleep(2 SECONDS)
	minor_announcement.Announce(message = "Текущая система: [system_name]. Демократичной смены на борту [station_name].", new_sound = 'sound/misc/notice2.ogg')
