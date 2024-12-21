/obj/item/book/manual/solgov_law
	name = "Sol Central Government Law"
	desc = "A brief overview of SolGov Law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "Sol Central Government Law"

/obj/item/book/manual/solgov_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]index.php?title=Закон_ЦПСС&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}


/obj/item/book/manual/military_law
	name = "The Sol Code of Military Justice"
	desc = "A brief overview of military law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "The Sol Code of Military Justice"

/obj/item/book/manual/military_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]index.php?title=Военно-Юридический_Кодекс_ПСС&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/book/manual/sol_sop
	name = "Standard Operating Procedures"
	desc = "SOP aboard the NES Sierra."
	icon_state = "booksolregs"
	author = "The Sol Central Government"
	title = "Standard Operating Procedure"

/obj/item/book/manual/sol_sop/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]index.php?title=Стандартные_Процедуры_ЦПСС&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/book/manual/nt_sop
	name = "NT Standard Operating Procedures"
	desc = "SOP aboard the SES Sierra Democratica."
	icon = 'maps/sierra/icons/obj/library.dmi'
	icon_state = "bookNTsop"
	author = "Employee Materials"
	title = "Standard Operating Procedure"

/obj/item/book/manual/nt_sop/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]index.php?title=Стандартные_процедуры_НТ&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/book/manual/nt_tc
	name = "NT Threat Codes"
	desc = "TC aboard the SES Sierra Democratica."
	icon = 'maps/sierra/icons/obj/library.dmi'
	icon_state = "bookNTtc"
	author = "Ship Rule Materials"
	title = "Threat Codes"

/obj/item/book/manual/nt_tc/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]index.php?title=Коды_угрозы_НТ&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/folder/nt/rd

/obj/item/folder/envelope/preset/blanks
	desc = "A thick envelope. The NT logo is stamped in the corner, along with \"TOP SECRET - FOR RESEARCH DIRECTOR'S EYES ONLY\"."

/obj/item/folder/envelope/preset/blanks/Initialize()
	. = ..()
	new/obj/item/paper/sierra/blanks(src)
	new/obj/item/paper/sierra/nuke(src)

/obj/item/paper/sierra/blanks
	name = "RE: Regarding testing supplies"
	info = {"
	<tt><center><b><font color='red'>СОВЕРШЕННО СЕКРЕТНО</font></b>
	<h3>ДЕПАРТАМЕНТ ИССЛЕДОВАНИЙ И РАЗРАБОТОК NANOTRASEN</h3>
	<img src = bluentlogo.png>
	</center>
	<b>ОТ:</b> Swadian Barwuds, Руководитель Исследований и Разработок, NAS Legion<br>
	<b>КОМУ:</b> Директору Исследований SES Sierra Democratica<br>
	<b>А ТАКЖЕ:</b> Капитану SES Sierra Democratica, Агентам Внутренних Дел на борту SES Sierra Democratica<br>
	<b>ТЕМА:</b> Дополнительные материалы (пересмотр)<br>
	<hr>
	Я пересмотрел ваш отчет о проведенных экспериментах и запрос о более совершенных тестовых материалах, Директор Исследований.<br>
	Мы склонны ожидать от вашего проекта только лучшего - особенно в свете того, что этому /"лучше/" следует наступить как можно скорее. Аналитический отдел подсчитал, что на данный момент потенциальная прибыль от проведенных на судне исследований недостаточна для покрытия всех расходов. <br>
	В пределах вашего отдела вы можете найти помещение, обозначенное как \"Aux Backup Storage\". Для всех, кроме адресатов данного сообщения, в этом отсеке содержатся вторичные резервные копии базы данных ксеноботаники. В реальности там находятся ваши новые тестовые материалы - четыре человека из пробирок, у которых отсутствуют высшие нервные функции. Наш юридический департамент не обнаружил ничего нелегального в том, чтобы использовать их в медицинских опытах для более точных результатов.<br>
	Они помещены в специальные мешки с продвинутой системой поддержания жизни - их не нужно кормить, поить или выгуливать. Если вам нужны образцы - берите их. Само собой разумеется, что рядовые сотрудники вашего отдела не должны узнать об их существовании и происхождении.<br>
	Сейчас не время для того, чтобы проводить долгие научные изыскания, Директор Исследований. Мы ждем от вас впечатляющих результатов в ближайшем будущем.<br>
	<font face="Verdana" color=black><font face="Times New Roman"><i>Swadian Barwuds</i></font></font></tt><hr>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}

/obj/item/folder/envelope/preset/captain
	desc = "A thick envelope. The NT logo is stamped in the corner, along with \"TOP SECRET - FOR CAPTAIN'S EYES ONLY\"."

/obj/item/folder/envelope/preset/captain/Initialize()
	. = ..()
	var/memo = {"
	<tt><center><b><font color='red'>СЕКРЕТНО<br>КОДОВОЕ СЛОВО: АЛЬФА</font></b>
	<h3>РАСПОРЯЖЕНИЕ ЦЕНТРАЛЬНОГО КОМАНДОВАНИЯ</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Swadian Barwuds, Руководитель Исследований и Разработок, NAS Legion<br>
	<b>КОМУ:</b> Капитану SES Sierra Democratica<br>
	<b>ТЕМА:</b> Задачи миссии (протокол \"Альфа\")<br>
	<hr>
	Капитан,<br>
	За время текущей миссии ваше судно должно посетить приведенные ниже звёздные системы. Помните, что ваши ресурсы ограничены; распорядитесь временем рационально.
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[GLOB.using_map.system_name]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>Locutus System</li>
	<br>
	Приоритетной целью являются: артефакты, неизвестные формы жизни и сигналы неизвестного происхождения.<br>
	Ни одна из этих систем не входит в юрисдикцию известных государств или организаций, поэтому у вас имеется полное право на исследование и демонтаж всех заброшенных объектов по пути.<br>
	В случае обнаружения мира, богатого полезными ископаемыми, форонового гиганта или просто планеты, подходящей для колонизации, составьте отчет и оставьте на планете маячок дальней связи.<br>
	В случае обнаружения сигнала бедствия, независимо от принадлежности оного, не игнорируйте его. Спасенный персонал представляет исключительную дипломатическую ценность.<br>
	Сообщайте обо всех представляющих ценность находках перед прыжком в следующую систему посредством факсимильной системы связи.<br>
	Не забудьте ознакомиться с дополнительными инструкциями, направленными вам Исполнительным Директором. Их точное исполнение является приоритетным по сравнению с приведенными в этом сообщении распоряжениями.<br>
	Слава NanoTrasen!<br>

	<font face="Verdana" color=black><font face="Times New Roman"><i>Swadian Barwuds</i></font></font></tt><br><hr>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}
	new/obj/item/paper/important(src, memo, "ALPHA Protocol - Mission Objectives")

	new/obj/item/paper/sierra/nuke(src)
	new/obj/item/paper/sierra/blanks(src)
	new/obj/item/paper/sierra/umbra(src)

/obj/item/folder/envelope/preset/rep
	desc = "A thick envelope. The NT logo is stamped in the corner, along with \"TOP SECRET - FOR INTERNAL AFFAIRS PERSONNEL ONLY\"."

/obj/item/folder/envelope/preset/rep/Initialize()
	. = ..()
	new/obj/item/paper/sierra/nuke(src)
	new/obj/item/paper/sierra/blanks(src)
	new/obj/item/paper/sierra/umbra(src)

/obj/item/paper/sierra/umbra
	name = "UMBRA Protocol"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "paper_words"
	info = {"
	<tt><center><b><font color='red'>СОВЕРШЕННО СЕКРЕТНО<br>КОДОВОЕ СЛОВО: УМБРА</font></b>
	<h3>ЦЕНТРАЛЬНОЕ КОМАНДОВАНИЕ</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Kim Taggert, Исполнительный Директор, NAS Legion<br>
	<b>КОМУ:</b> Капитану SES Sierra Democratica<br>
	<b>А ТАКЖЕ:</b> Агентам Внутренних Дел на борту SES Sierra Democratica<br>
	<b>ТЕМА:</b> Протокол УМБРА<br>
	<hr>
	В данном сообщении приводится описание протокола под кодовым наименованием \"Умбра\" - небольшого, но значимого дополнения к стандартным процедурам, необходимого для избежания утечек информации, критически важной для дальнейшей деятельности корпорации. В отличии от остальных СОП, информация о существовании данного протокола не должна оглашаться экипажу судна.<br>
	Данная процедура может быть инициирована исключительно по распоряжению Центрального Командования. Сообщение, которое вы получите, может не иметь стандартной печати или подписей, но у вас не должно возникнуть проблем с подтверждением легетимности данного распоряжения. Мы надеемся.<br>
	Сигналом для инициации процедуры является кодовая фраза \"Спокойного вечера, подготовитель\", использованная без иных слов в предложении. Отправка сообщения, подтверждающего введение протокола в действие, не является необходимой.<br><br>
	<li>Информация об экспедиционных находках, которые представляют угрозу NanoTrasen как организации или же человечеству в целом, должна быть отправлена Центральному Командованию под кодовым именем \"Умбра\". Мы надеемся, что у вас не возникнет проблемы с определением того, какая именно информация подпадает под данное определение.</li>
	<li>Конфидециальность данной информации имеет наивысший приоритет. Только Капитан и Агенты внутренних дел могут иметь полный, неограниченный доступ к собранным данным; Главы отделов и сотрудники Отдела Защиты Активов могут быть уведомлены о ситуации лишь в той мере, в которой это необходимо для исполнения протокола \"Умбра\". Все остальные лица, которые так или иначе получили доступ к релевантной информации, должны быть помещены под надзор Отдела Защиты Активов до окончательного выполнения процедуры.</li>
	<li>Все устройства, способные передавать информацию на межзвёздные дистанции, должны быть конфискованы из частного пользования.</li>
	<li>Вне зависимости от прогресса вашей миссии в рамках протокола \"Альфа\", вы должны немедленно совершить прыжок к системе Никс и прибыть в доки административной станции \"Полумесяц\". Дальнейшие инструкции будут переданы вам по прибытию. Не совершайте остановок по пути без критической необходимости.</li>
	<li>Исполнение данного протокола имеет приоритет над всеми иными процедурами, включая Корпоративные законы и ОПРС.</li>

	<br>
	Несмотря на то, что данные меры могут показаться чрезмерными, мы уверены, что некоторые находки, с которыми вы можете столкнуться, оправдывают столь радикальные решения. Вероятно, вы сами осознаете, почему - до тех пор продолжайте миссию в штатном режиме.
	<i>Всего наилучшего, Kim.</i></tt><br><hr>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}

/obj/item/storage/secure/briefcase/nukedisk/sierra
	desc = "A large briefcase with a digital locking system."
	startswith = list(
		/obj/item/disk/nuclear,
		/obj/item/pinpointer,
		/obj/item/folder/envelope/preset/nuke,
		/obj/item/modular_computer/laptop/preset/custom_loadout/cheap
	)

/obj/item/folder/envelope/preset/nuke
	desc = "A thick envelope. The NT logo is stamped in the corner, along with \"TOP SECRET - DELTA PROTOCOLS\"."

/obj/item/folder/envelope/preset/nuke/Initialize()
	. = ..()
	new/obj/item/paper/sierra/nuke(src)

/obj/item/paper/sierra/nuke
	name = "DELTA Protocol"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "paper_words"
	info = {"
	<tt><center><b><font color='red'>СЕКРЕТНО<br>КОДОВОЕ СЛОВО: ДЕЛЬТА</font></b>
	<h3>ЦЕНТРАЛЬНОЕ КОМАНДОВАНИЕ</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Kim Taggert, Исполнительный Директор, NAS Legion<br>
	<b>КОМУ:</b> Капитану SES Sierra Democratica<br>
	<b>А ТАКЖЕ:</b> Главам отделов SES Sierra Democratica, Агентам Внутренних Дел на борту SES Sierra Democratica<br>
	<b>ТЕМА:</b> Протокол ДЕЛЬТА<br>
	<hr>
	В данном протоколе описывается истинное назначение стандартного кода угрозы <b>\"Дельта\"</b>, а также непосредственно связанные с ним процедуры.<br>
	Согласно выводам аналитического отдела административной станции \"Легион\", текущая миссия \"Сьерры\" имеет ненулевую вероятность привести к столкновению судна и его экипажа с потенциально враждебной инопланетной цивилизацией. В целях предотвращения получения враждебными сущностями подробной информации о корпорации и её операциях, а также защиты корпоративных активов в целом, на борту судна было размещено ядерное взрывное устройство мощностью 500 килотонн в тротилловом эквиваленте.<br>
	Протокол <b>\"Дельта\"</b>, официально описанный как порядок действий при обнаружении на борту неизвестного высокомощного взрывного устройства, на самом деле является процедурой активации вышеописанной боеголовки. Точное исполнение протокола приведет к полному уничтожению судна - в связи с этим, никто, кроме целевых получателей данного сообщения, не должен быть осведомлен об истинном назначении протокола ни при каких обстоятельствах.<br>
	Размещенная на борту вашего судна ядерная боеголовка хранится в защищённом отсеке, расположенном в носовой части первой палубы судна. Шлюз доступа данного отсека помечен как <b>\"Vault\"</b>; в случае возникновения вопросов о назначении помещения от неавторизованных членов экипажа, им следует сообщить, что в данном хранилище находятся физические копии всех исследовательских данных, собранных судном за время его операций, на бумажных носителях. Аналитический отдел убежден, что данная легенда предотвратит излишний интерес к хранилищу со стороны рядовых членов экипажа \"Сьерры\".<br>
	Правом на инициацию протокола \"Дельта\" наделён исключительно капитан судна; в случае, если капитан недоступен или недееспособен, необходимо запросить подтверждение Центрального Командования посредством любой доступной защищённой системы связи.<br>
	Ниже приведена последовательность действий, которые необходимо выполнить для инициации протокола \"Дельта\":<br><br>
	<li>Если это уже не было сделано ранее, <b>диск ядерной аутентификации</b> должен быть извлечен из текущего расположения. В стандартной комплектации диск размещается в чемодане, находящемся в личном офисе капитана судна.</li>
	<li>Не менее двух членов командного состава судна должны проследовать к отсеку хранения ядерной боеголовки в носовой части первой палубы судна.</li>
	<li>Один из членов командного состава должен провести ID-картой по <b>защитной скобе</b>, расположенной на шлюзе хранилища, для её деактивации.</li>
	<li>Два члена командного состава должны использовать <b>устройства аутентификации</b>, расположенные в хранилище, для получения <b>кода активации</b> системы самоуничтожения.</li>
	<li>Присутствующие члены командного состава должны извлечь <b>урановые цилиндры</b> из их хранилищ и установить их в <b>приемники</b>.</li>
	<li><b>Диск ядерной аутентификации</b> должен быть установлен в специальный слот <b>контроллера системы самоуничтожения</b>.</li>
	<li><b>Код активации</b> должен быть введен в <b>контроллер системы самоуничтожения</b> с помощью расположенной на нём клавиатуры. </li>
	<li>Присутствующие члены командного состава должны определить, допустима ли <b>эвакуация</b> экипажа судна в сложившихся обстоятельствах, и установить <b>переключатель автоматической разблокировки спасательных капсул</b> в соответствующее положение.</li>
	<li>На консоли <b>контроллера системы самоуничтожения</b> должна быть выставлена задержка до детонации - минимальным является срок в пять минут.</li>
	<li>Сотрудник, оперирующий <b>контроллером системы самоуничтожения</b>, должен запросить финальное <b>устное подтверждение</b> ининциации самоуничтожения судна.</li>
	<li>После получения подтверждения система самоуничтожения должна быть приведена в действие.</li>
	<br>
	В момент активации боеголовки код \"Дельта\" будет автоматически объявлен на борту судна; главам рекомендуется обеспечить надлежащее исполнение стандартных процедур этого кода, при этом сохраняя секретность системы самоуничтожения по мере возможности. При необходимости процедура самоуничтожения может быть отменена посредством установки диска ядерной аутентификации в слот <b>контроллера системы самоуничтожения</b> и использованием переключателя, помеченного <b>\"Disarm\"</b>.<br>
	Мы надеемся, что данная информация вам никогда не пригодится; тем не менее, вам следует помнить, что безопасность человеческой расы в целом может быть важнее нескольких сотен жизней.<br>
	<i>Всего наилучшего, Kim.</i></tt><br><hr>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}
