String Lang = "";

Map<String, Map<String, String>> Words = {
  'ru' : {
    'Name' : "Прогноз материнских осложнений при беременности",
    'Start' : "Начать",
    'AI_Test' : "AI Тест",
    'Online_consultation' : "Онлайн\nмедицинская\nконсультация",
    'Perinatal_locations' : "Перинаталь-\nные центры",
    'About_app' : "О приложении",
    'СhangesDuringPregnancy' : "Риски при береммен-\nности",
    'Change_lang' : "Изменить язык",
    'Cancel' : "Отмена",

    'Please_enter_data' : "Пожалуйста, введите следующие данные:",
    'Enter_age' : "Ваш возраст:",
    'Enter_systolic_pressure' : "Систолическое артериальное давление:",
    'Enter_diastolic_pressure' : "Диастолическое артериальное давление:",
    'Enter_glucose_amount' : "Сахар в крови:",
    'Enter_body_temperature' : "Температура тела:",
    'Enter_pulse' : "Пульс в минуту:",

    'No_connectivity' : "Нет сети!",
    'Plese_check_connectivity' : "Пожалуйста, проверьте подключение к сети Интернет",

    'ageErrorText' : "* Введите целое число от 15 до 70!",
    'systolicBloodPressureErrorText' : "* Введите целое число от 60 до 250!",
    'diastolicBloodPressureErrorText' : "* Введите целое число от 40 до 120!",
    'glucoseAmountErrorText' : "* Введите целое число от 2.0 до 20.0!",
    'bodyTemperatureErrorText' : "* Введите целое число от 35.0 до 41.0!",
    'pulseErrorText' : "* Введите целое число от 40 до 180!",

    'low risk title' : "Низкий риск осложнений!",
    'low risk text' : "Вам не о чем беспокоиться. У вас почти все нормально. "
        "Но следует обратиться  к гинекологу вовремя. Специалист даст вам больше "
        "рекомендаций с объективной точки зрения.",

    'medium risk title' : "Средний риск осложнений!",
    'medium risk text' : "Обратите внимание на свой рацион. Ешьте больше "
        "фруктов и овощей. Избегайте цитрусовых. Делайте утреннюю зарядку. "
        "Избегайте стрессов и нервозности. Вам ни в коем случае нельзя болеть. "
        "И обязательно обратитесь к гинекологу. "
        "Специалист вам даст необходимые рекомендации.",

    'high risk title' : "Высокий риск осложнений!",
    'high risk text' : "Мы рекомендуем вам немедленно обратиться к гинекологу. "
        "Также обязательно пройдите проверку УЗИ.",

    'LocationsScreenTitle' : "Перинатальные центры",
    'Map' : "Карта",
    'Distance' : "Расстояние от вас сюда",
    'm' : "м",
    'km' : "км",
    'gettingLocation' : "Определение Вашей локации...",

    'locationName1' : "Городской перинатальный центр №1",
    "locationAddress1" : "г.Ташкент, улица А.Ходжаева, 1a",

    'locationName2' : "Республиканский перинатальный центр",
    "locationAddress2" : "г.Ташкент, улица Богишамол, 223",

    'locationName3' : "Ташкентский областной перинатальный центр",
    'locationAddress3' : "г.Чирчик, проспект Навои, 121",

    'locationName4' : "Городской Перинатальный центр",
    'locationAddress4' : "г.Ташкент, улица Кукча Дарвоза, 42",

    'locationName5' : "Перинатальный центр Республики Каракалпакистан",
    'locationAddress5' : "г.Нукус, улица Найман, 6 ",

    'locationName6' : "Андижанский областной перинатальный центр",
    'locationAddress6' : "г.Андижан, улица Ташкент, 42",

    'locationName7' : "Бухарский областной перинатальный центр",
    'locationAddress7' : "г.Бухара, улица Намазгох, 102/1",

    'locationName8' : "Джизакский областной перинатальный центр",
    'locationAddress8' : "г.Джизак, улица Калия, 1",

    'locationName9' : "Навоийский областной перинатальный центр",
    'locationAddress9' : "г.Навоий, улица Ибн Сино, 20",

    'locationName10' : "Наманганский перинатальный центр",
    'locationAddress10' : "г. Наманган, проспект Бабура, 143А",

    'locationName11' : "Самаркандский областной перинатальный центр",
    'locationAddress11' : "г.Самарканд, улица А.Кушчи, 3",

    'locationName12' : "Сурхандарьинский областной перинатальный центр",
    'locationAddress12' : "г.Термез, улица И.Каримова, 288",

    'locationName13' : "Сырдарьинский областной перинатальный центр",
    'locationAddress13' : "г.Гулистан, улица Бирлашган, 1",

    'locationName14' : "Ферганский областной перинатальный центр",
    'locationAddress14' : "г.Фергана, улица Ойбека, 5",

    'locationName15' : "Хорезмский областной перинатальный центр",
    'locationAddress15' : "г.Ургенч, улица Аль-Хоразмий, 114",

    'changesDuringPregnancyTitle' : "Риски при беременности",
    'trimester' : "триместр",

    'normalRiskType' : "нормальное изменение,\nкоторое не является причиной волнения",
    'doubtRiskType' : "сомнительно, стоит посоветоваться с врачом",
    'problemRiskType' : "нужно незамедлительно обратиться к врачу",

    'Recommendations' : "Рекомендации",

    ////////////////////////////////////////////////////////////////////////

    // I - триместр

    'I-1-title' : "Изменения грудных желез",
    'I-1-1' : "Нагрубание, повышение чувствительности",
    'I-1-2' : "Увеличение и потемнение соска",
    'I-1-3' : "Полосы растяжения",
    'I-1-recommendationText' : "Являются следствием подготовки груди "
        "к рождению ребенка.",

    'I-2-title' : "Проблемы пищеварения",
    'I-2-1' : "Тошнота",
    'I-2-2' : "Рвота",
    'I-2-3' : "Извращение вкуса",
    'I-2-4' : "Потребность в странных продуктах",
    'I-2-recommendationText' : "Часто помогает обильное питье и частое питание "
        "малыми порциями. Старайтесь не употреблять жиры и жирные или острые "
        "продукты. Лучше всего употреблять растительную пищу местного "
        "происхождения. Если рвота становится чрезмерной, обратитесь к врачу.",

    'I-3-title' : "Запор",
    'I-3-recommendationText' : "Старайтесь употреблять разнообразную пищу "
        "растительного, а не животного происхождения. Употребление разнообразных "
        "овощей и фруктов, предпочтительно в свежем виде и местного происхождения, "
        "а также употребление хлеба грубого помола, а не белого могут помочь "
        "избежать запора.",

    'I-4-title' : "Усталость, быстрая утомляемость",
    'I-4-recommendationText' : "Частый отдых и прогулки на свежем воздухе",

    'I-5-title' : "Частые позывы к мочеиспусканию",
    'I-5-recommendationText' : "За счет увеличения функциональной активности почек.\n"
                              "При появлении жжения и боли обратитесь к врачу",

    'I-6-title' : "Изменения в настроении",
    'I-6-1' : "Периоды депрессии",
    'I-6-2' : "Раздражительность",
    'I-6-recommendationText' : "Полезно заниматься своими обычными делами, "
        "попытайтесь давать себе каждый день задания, дома или вне его, чтобы "
        "мысли были заняты. Если перепады настроения становятся слишком резкими, "
        "проконсультируйтесь с врачом (желательно на прием приходить вместе с "
        "мужем).",

    'I-7-title' : "Пигментация некоторых участков кожи (лицо, грудь, живот и т.д.)",
    'I-7-recommendationText' : "Обычное явление во время беременности, чаще "
        "всего исчезает после родов.",

    'I-8-title' : "Боль в животе",
    'I-8-recommendationText' : "Непрекращающаяся сильная боль в животе может "
        "указать на осложнения, и о ней следует сообщить врачу.",

    'I-9-title' : "Кровотечение",
    'I-9-recommendationText' : "Если кровотечение не прекращается, становится "
        "обильнее и приобретает ярко-красную окраску, а также сопровождается "
        "болезненными ощущениями, то необходимо незамедлительно обратится "
        "к врачу.",

    ////////////////////////////////////////////////////////////////////////

    // II - триместр

    'II-1-title' : "Рост матки",
    'II-1-recommendationText' : "Регулярное измерение высоты матки дает "
        "информацию о развитии ребенка. Вы, посоветовавшись с врачом сами, "
        "можете измерять высоту матки и результат измерения вносить в график. "
        "При нормальной одноплодной беременности, расстояние в сантиметрах "
        "приблизительно соответствует гестационному сроку плода начиная с 24 "
        "недели беременности. Если размер матки не изменяется, это может "
        "указать на задержку развития ребенка и появится необходимость "
        "консультации врача.",

    'II-2-title' : "Отечность ног и рук",
    'II-2-recommendationText' : "Полезно поднимать ноги при каждой возможности. "
        "Если наблюдается внезапная или ярко выраженная отечность, необходимо "
        "сообщить об этом врачу.",

    'II-3-title' : "Варикозное расширение вен",
    'II-3-recommendationText' : "Старайтесь не проводить много времени на "
        "ногах. Нежелательно сидеть со скрещенными ногами. А также поможет "
        "ношение обуви без каблуков и обтягивающих, эластичных колготок. Если "
        "вены болезненны или вызывают зуд, следует проконсультироваться "
        "с врачом.",

    'II-4-title' : "Геморрой",
    'II-4-1' : "Зуд в области заднего прохода",
    'II-4-2' : "Жжение",
    'II-4-3' : "Боль при опорожнении кишечника",
    'II-4-4' : "Кровотечение из прямой кишки после акта дефекации",
    'II-4-recommendationText' : "Наилучшее лечение геморроя – это его "
        "профилактика запора. Старайтесь употреблять разнообразную пищу "
        "растительного, а не животного происхождения, а также употребляйте "
        "разнообразные овощи и фрукты, предпочтительно в свежем виде и "
        "местного происхождения. Если болезненность усиливается, посоветуйтесь "
        "с врачом.",

    'II-5-title' : "Мочеиспускание",
    'II-5-1' : "Частое мочеиспускание",
    'II-5-2' : "Задержка мочи",
    'II-5-3' : "Недержание мочи",
    'II-5-recommendationText' : "  Поможет положение женщины в коленно-"
        "локтевой позиции (без перемещений).\n  Если мочеиспускание становится "
        "болезненным, следует обратиться к врачу. ",

    'II-6-title' : "Ощущение движение плода",
    'II-6-recommendationText' : "Необходимо прислушиваться к шевелениям плода. "
        "При резких изменениях двигательной активности и при отсутствии "
        "движений в течение 24 часов и дольше обратитесь врачу.",

    'II-7-title' : "Реакция плода на изменение эмоционального состояния матери",
    'II-7-recommendationText' : "Подумайте о ребенке прежде, чем вовлечь "
        "себя в спор",

    'II-8-title' : "Боли в пояснице",
    'II-8-recommendationText' : "Полезно делать суставную гимнастику и "
        "физические упражнения. Например: при выполнении домашних работ "
        "(стирка, приготовление пищи, подметание двора и др.) старайтесь "
        "не сгибать позвоночник.",

    'II-9-title' : "Неудобства во время сна и отдыха",
    'II-9-recommendationText' : "Наилучшей позой является позиция на левом боку. "
        "Необходимо попробовать найти оптимальное положение, подкладывая "
        "подушки и подушечки",

    'II-10-title' : "Вагинальные выделения",
    'II-10-recommendationText' : "Необходимо поддерживать наружные половые "
        "органы в чистоте и сухости, не носите тугие трусики и тщательно "
        "ополаскивайте вход во влагалище после каждого туалета. Старайтесь "
        "не подвергать эту область воздействию таких раздражителей, как "
        "хозяйственное или туалетное мыло, пена для ванн и парфюмерия. "
        "Для ополаскивания можно пользоваться настоями ромашки, череды, "
        "зеленного чая или просто теплой водой. Если выделения имеют сильный "
        "запах, сопровождаются зудом, имеют желто-зеленую окраску или "
        "кровянистые вкрапления, следует сообщить об этом врачу.",

    'II-11-title' : "Растяжения на коже",
    'II-11-recommendationText' : "Являются следствием гормональных изменений во "
        "время беременности. После родов полосы остаются, но изменяют окраску и "
        "станут гораздо менее заметными.",

    'II-12-title' : "Зуд и сыпь",
    'II-12-recommendationText' : "Кожу необходимо держать чистой, часто "
        "купаться. Если наблюдается сыпь, которая держится более 2-3 дней, "
        "следует сообщить врачу.",

    ////////////////////////////////////////////////////////////////////////

    // III - триместр

    'III-1-title' : "Изжога",
    'III-1-recommendationText' : "Избегайте жирной, калорийной и острой еды "
        "перед сном. Так же поможет частое питание малыми порциями. Во время "
        "сна рекомендуется подложить под верхнюю часть туловища высокую "
        "подушку.",

    'III-2-title' : "Одышка",
    'III-2-recommendationText' : "Хорошо помогает прогулка на свежем воздухе. "
        "Если одышка мешает вам спать, следует приподнять голову и плечи, "
        "подложив под них подушки. Но если вы задыхаетесь, следует "
        "посоветоваться с врачом.",

    'III-3-title' : "Судороги в ногах",
    'III-3-recommendationText' : "Лучше сразу подняться и глубоко помассировать "
        "то место, которое свело судорогой, чтобы увеличить снабжение кровью. "
        "Если судороги повторяются снова и снова, следует посоветоваться "
        "с врачом.",

    'III-4-title' : "Головные боли",
    'III-4-recommendationText' : "Частые головные боли могут объясняться "
        "повышенным кровяным давлением или заболеванием сердца. Следует "
        "немедленно обратиться к врачу.",

    'III-5-title' : "Обморок",
    'III-5-recommendationText' : "Часто случается, если вы лежите на спине, "
        "так как вес матки давит на главную артерию и вызывает падение "
        "кровеносного давления. Необходимо немедленно перевернуться на бок.",

    'III-6-title' : "Кровотечение десен",
    'III-6-recommendationText' : "Если кровотечение продолжается и становится "
        "обильным, следует проконсультироваться с врачом.",

    'III-7-title' : "Кровотечение из носа",
    'III-7-recommendationText' : "Если кровотечение из носа становится сильным, "
        "надо зажать нос между большим и указательным пальцами секунд на 30. "
        "Не нужно запрокидывать голову назад или засовывать в нос лед, так как "
        "это не поможет и в результате вы только наглотаетесь крови, "
        "что не очень приятно. Если кровотечение становится регулярным, "
        "нужно проконсультироваться с врачом.",

    'III-8-title' : "Бессонница",
    'III-8-recommendationText' : "Попробуйте восполнить недостаток сна "
        "послеобеденным отдыхом. Если вы совсем не спите по ночам, вам следует "
        "сказать об этом врачу.",

    'III-9-title' : "Перепады настроения",
    'III-9-recommendationText' : "Полезно заниматься своими обычными делами, "
        "попытайтесь давать себе каждый день задания, дома или вне его, чтобы "
        "мысли были заняты. Если перепады настроения становятся слишком "
        "резкими, проконсультируйтесь с врачом (желательно на прием приходите "
        "вместе с мужем).",

    'III-10-title' : "Истечение жидкости из влагалища, "
        "иногда с небольшим выходом крови",
    'III-10-recommendationText' : "Как можно скорее обратитесь к врачу.",

    'III-11-title' : "Ощущение тяжести в нижней части живота",
    'III-11-recommendationText' : "Полежать на левом боку 1-2 часа после приема пищи",

    'III-12-title' : "Выделение молока из грудей",
    'III-12-recommendationText' : "Идет подготовка к кормлению ребенка.",

    'III-13-title' : "Нерегулярные (ложные) схватки",
    'III-13-recommendationText' : "Если боли становятся сильными, необходимо "
        "поставить в известность врача.",

    'III-14-title' : "Кровотечение",
    'III-14-recommendationText' : "Важно незамедлительно обратится к врачу, "
        "даже если кровотечение необильное.",

    'III-15-title' : "Выход слизистой пробки из влагалища",
    'III-15-recommendationText' : "Это может говорить о начале родовой "
        "деятельности, необходимо сообщить врачу.",

    'MainMenu' : "Главное меню",

    'AboutAppText' : "    Мобильное приложение Homila AI с помощью алгоритмов "
        "машинного обучения определяет риск материнских осложнений при "
        "беременности, принимая такие входные данные, как возраст, "
        "систолическое и диастолическое артериальное давление, уровень сахара "
        "в крови, температура тела и пульс. Для формирования алгоритма была "
        "использована база данных, содержащий 1014 записей. Точность результатов "
        "составляет 92%. Помимо того, приложение содержит информацию о "
        "перинатальных центрах Узбекистана (адрес, контакты, геолокация), а "
        "также о признаках беременности в периодах беременности (в триместрах) "
        "с рекомендациями, подтвержденными соответствующими нормативными "
        "документами Республики Узбекистан.\n"
        "    Приложение разработано Центром Передовых Технологий и "
        "Стратегических Инициатив Ташкентского Педиатрического "
        "Медицинского Института.",

    'InProcess' : "Данная функция сейчас в стадии разработки",

    'TermsTitle' : "Условия использования",
    'TermsSubtitle' : "Начиная тест, вы принимаете к сведению и соглашаетесь "
        "со следующими условиями:",
    'Terms1' : "Этот тест не является полноценной диагностикой. Результаты "
        "предназначены для информационных целей и не являются квалифицированным "
        "медицинским диагнозом.",
    'Terms2' : "Ваши данные в безопасности. Предоставляемая Вами информация "
        "анонимна и не будет передана третьим лицам."

  },

  'uz' : {
    'Name' : "Homila davridagi asoratlar prognozi",
    'Start' : "Boshlash",
    'AI_Test' : "AI Test",
    'Online_consultation' : "Onlayn\ntibbiy\nmaslahat",
    'Perinatal_locations' : "Perinatal\nmarkazlar",
    'About_app' : "Ilova haqida",
    'СhangesDuringPregnancy' : "Homiladorlik davridagi xavflar",
    'Change_lang' : "Tilni o‘zgartirish",
    'Cancel' : "Bekor",

    'Please_enter_data' : "Marhamat, quyidagi ma'lumotrani kiriting:",
    'Enter_age' : "Yoshingiz:",
    'Enter_systolic_pressure' : "Sistolik arterial qon bosimingiz:",
    'Enter_diastolic_pressure' : "Diastolik arterial qon bosimingiz:",
    'Enter_glucose_amount' : "Qoningizdagi qand miqdori:",
    'Enter_body_temperature' : "Tana harorati (35.0 dan 41.0 gacha):",
    'Enter_pulse' : "Puls (bir daqiqada puls soni):",

    'No_connectivity' : "Internet yo‘q!",
    'Plese_check_connectivity' : "Iltimos, Internet tarmog‘i ulanganligini tekshiring",

    'ageErrorText' : "* 15 dan 70 gacha bo‘lgan butun son kiriting!",
    'systolicBloodPressureErrorText' : "* 60 dan 250 gacha bo‘lgan butun son kiriting!",

    'low risk title' : "Asoratlar xavfi past!",
    'low risk text' : "Havotirlanishingizga hojat yo‘q. Sizda deyarli barchasi normada. "
        "Lekin o‘z vaqtida ginekolog qabuliga borib turing. U sizga obyektiv "
        "ko‘ruvda yana o‘z tavsiyalarini berishi mumkin.",

    'medium risk title' : "Asoratlar xavfi o‘rta!",
    'medium risk text' : "Ovqatlanish ratsioningizga e’tibor bering. Ko‘proq "
        "meva va sabzavotlar iste’mol qiling. Sitrus mevalardan cheklaning. "
        "Tonggi badantarbiya mashqlari bilan shug‘ullaning. Stress va "
        "asabiylashishdan saqlaning. Shamollash sizga aslo mumkin emas. "
        "Va albatta ginekolog huzuriga boring. U o‘z kerakli maslahatlarini "
        "beradi.",

    'high risk title' : "Asoratlar xavfi yuqori!",
    'high risk text' : "Sizga zudlik bilan ginekolog qabuliga borishingizni "
        "tavsiya etamiz. Bundan tashqari, albatta UTT tekshiruvidan ham o‘ting.",

    'LocationsScreenTitle' : "Perinatal markazlar",
    'Map' : "Xarita",
    'Distance' : "Sizdan bu yergacha masofa",
    'm' : "m",
    'km' : "km",
    'gettingLocation' : "Sizning lokatsiyangizni aniqlash...",

    'locationName1' : "№1 shahar perinatal markazi",
    'locationAddress1' : "Toshkent sh., A.Xojayev ko‘chasi, 1a",

    'locationName2' : "Respublika perinatal markazi",
    "locationAddress2" : "Toshkent sh., Bog‘ishamol ko‘chasi, 223",

    'locationName3' : "Toshkent viloyat perinatal markazi",
    'locationAddress3' : "Chirchiq sh., Navoiy shox ko‘chasi, 121",

    'locationName4' : "Shahar perinatal markazi",
    'locationAddress4' : "Toshkent sh., Ko‘kcha Darvoza ko‘chasi, 42",

    'locationName5' : "Qoraqalpog‘iston Respublikasi perinatal markazi",
    'locationAddress5' : "Nukus sh., Nayman ko‘chasi, 6 ",

    'locationName6' : "Andijon viloyat perinatal markazi",
    'locationAddress6' : "Andijon sh., Toshkent ko‘chasi, 42",

    'locationName7' : "Buxoro viloyat perinatal markazi",
    'locationAddress7' : "Buxoro sh., Namozgoh ko‘chasi, 102/1",

    'locationName8' : "Jizzax viloyat perinatal markazi",
    'locationAddress8' : "Jizzax sh., Qaliya ko‘chasi, 1",

    'locationName9' : "Navoiy viloyat perinatal markazi",
    'locationAddress9' : "Navoiy sh., Ibn Sino ko‘chasi, 20",

    'locationName10' : "Namangan perinatal markazi",
    'locationAddress10' : "Namangan sh., Bobur shox ko‘chasi, 143А",

    'locationName11' : "Samarqand viloyat perinatal markazi",
    'locationAddress11' : "Samarqand sh., A.Qushchi ko‘chasi, 3",

    'locationName12' : "Surxondaryo viloyat perinatal markazi",
    'locationAddress12' : "Termiz sh., I.Karimov ko‘chasi, 288",

    'locationName13' : "Sirdaryo viloyat perinatal markazi",
    'locationAddress13' : "Guliston sh., Birlashgan ko‘chasi, 1",

    'locationName14' : "Farg‘ona viloyat perinatal markazi",
    'locationAddress14' : "Farg‘ona sh., Oybek ko‘chasi, 5",

    'locationName15' : "Xorazm viloyat perinatal markazi",
    'locationAddress15' : "Urganch sh., Al-Xorazmiy ko‘chasi, 114",

    'changesDuringPregnancyTitle' : "Homila davridagi xavflar",
    'trimester' : "trimestr",

    'normalRiskType' : "havotirlanishga sabab bo‘lmaydigan\nnormal o‘zgarish",
    'doubtRiskType' : "shubhali, shifokor bilan maslahatlashish lozim",
    'problemRiskType' : "zudlik bilan shifokorga murojaat etish lozim",

    'Recommendations' : "Tavsiyalar",

    //////////////////////////////////////////////////

    // I trimester

    'I-1-title' : "Ko‘krak bezlarida o‘zgarish",
    'I-1-1' : "Dag‘allashish, sezgirligining ortishi",
    'I-1-2' : "So‘rg‘ichlarning kattalashishi va qorayishi",
    'I-1-3' : "Terining yorilishlari",
    'I-1-recommendationText' : "Ko‘krak bezining bola tug‘ilishiga tayyorlanishi",

    'I-2-title' : "Ovqat hazm qilish muammolari",
    'I-2-1' : "Ko‘ngil aynishi",
    'I-2-2' : "Qusish",
    'I-2-3' : "Ta’m sezish buzilishi",
    'I-2-4' : "Antiqa mahsulotlarga ehtiyoj ortishi",
    'I-2-recommendationText' : "Ko‘p xollarda ko‘p suyuqlik ichish va taomni "
        "kam-kamdan tez-tez iste’mol qilish yordam beradi. Yog‘ va yog‘li yoki "
        "achchiq mahsulotlarni iste’mol qilmaslikka harakat qiling. Imkoni "
        "boricha mahalliy o‘simlik yog‘larini iste’mol qiling. Agar qusish "
        "kuchaysa vrachga murojaat eting.",

    'I-3-title' : "Qabziyat",
    'I-3-recommendationText' : "Imkoni boricha go‘sht mahsulotlari emas, balki "
        "turli xil o‘simlik mahsulotlarini iste’mol qiling. Turli xil yangi va "
        "mahalliy meva va sabzavotlarni, hamda oq non o‘rniga yirik yanchilgan "
        "bug‘doy unidan tayyorlangan nonni iste’mol qiling.",

    'I-4-title' : "Holsizlik, tez charchash",
    'I-4-recommendationText' : "Tez-tez dam oling va toza havoda sayr qiling",

    'I-5-title' : "Tez-tez siyish",
    'I-5-recommendationText' : "Bu xolat buyraklarning funktsional faolligi "
        "ortishi hisobiga kuzatiladi.\n"
        "Diqqat! Achishish va og'riq paydo bo'lsa, shifokorga murojaat qiling!",

    'I-6-title' : "Kayfiyat o‘zgarishi",
    'I-6-1' : "Depressiya holatlari",
    'I-6-2' : "Ta’sirchanlik",
    'I-6-recommendationText' : "Odatdagi ishlar bilan shug‘ullanish foydali, "
        "fikrni chalg‘itish uchun har kuni uyda yoki boshqa joyda bo‘lsa ham "
        "ish bilan mashg‘ul bo‘ling. Agar kayfiyat o‘zgarishi kuchaysa, "
        "shifokor bilan maslahatlashing (qabulga eringiz bilan borishingiz "
        "maqsadga muvofiq).",

    'I-7-title' : "Terining ba’zi qismlarida dog‘larning ko‘payishi "
        "(yuz, ko‘krak, qorin va b.)",
    'I-7-recommendationText' : "Homiladorlik davridagi oddiy holat bo‘lib, "
        "odatda tug‘ruqdan so'ng o‘tib ketadi.",

    'I-8-title' : "Qorinda og‘riq",
    'I-8-recommendationText' : "Qorin sohasidagi to‘xtovsiz kuchli og‘riq biror "
        "bir asoratdan darak berishi mumkin, shu sababli shifokorga murojaat "
        "qilish lozim.",

    'I-9-title' : "Qon ketishi",
    'I-9-recommendationText' : "Agar qon ketishi to‘xtamasa va og‘riq bilan "
        "kuzatilsa, zudlik bilan shifokorga murojaat etish lozim.",

    ////////////////////////////////////////////////////////////////////////

    // II - trimester

    'II-1-title' : "Bachadon o‘sishi",
    'II-1-recommendationText' : "Bachadon tubi balandligini muntazzam o‘lchab "
        "borish homilaning o‘sishi haqida ma’lumot beradi. O‘zingiz shifokor "
        "bilan maslahatlashib, bachadon tubi balandligini o‘lchashingiz va "
        "ma’lumotlarni jadvalga kiritib borishingiz mumkin. Asoratsiz "
        "kechayotgan bitta homilali homiladorlikda homiladorlikning 24 "
        "haftasidan boshlab bachadon tubi balandligi santimetrdagi o‘lchami "
        "taxminan gestatsiya muddatiga mos keladi. Agar bachadon o‘lchamlari "
        "o‘zgarmasa, bu homila o‘sishdan to‘xtaganligini bildirishi mumkin, "
        "bu holatda shifokor bilan maslahatlashish lozim.",

    'II-2-title' : "Oyoq va qo‘llar shishi",
    'II-2-recommendationText' : "Imkoniyat tug‘ilganda oyoqlarni ko‘tarib "
        "qo‘yish lozim. Agar shishlar to‘satdan paydo bo‘lsa yoki kuchli "
        "shishlar bo‘lsa, shifokorga murojaat eting.",

    'II-3-title' : "Venalarning varikoz kengayishi",
    'II-3-recommendationText' : "Uzoq vaqt oyokda turmaslikka harakat qiling. "
        "O‘tirganda oyoqlarni chalishtirmaslikka harakat qiling. Shuningdek "
        "past oyoq kiyim kiyish va siqib turuvchi elastik kolgotkalar kiyish "
        "ham yordam beradi. Agar venalarda og‘riq yoki qichishish bo‘lsa, "
        "shifokorga murojaat kiling.",

    'II-4-title' : "Gemorroy (bavosil)",
    'II-4-1' : "Orqa chiqaruv sohasida qichishish",
    'II-4-2' : "Achishish",
    'II-4-3' : "Ichaklarni bo‘shatishda og‘riq",
    'II-4-4' : "Defekatsiya aktidan so'ng ichaklardan qon ketishi",
    'II-4-recommendationText' : "Gemorroyni davolashning eng yaxshi usuli – "
        "qabziyatning oldini olish. Imkoni boricha go‘sht mahsulotlarini emas, "
        "balki turli xil o‘simlik mahsulotlarini iste’mol qiling. Turli xil "
        "yangi mahalliy meva va sabzavotlarni iste’mol qiling. Agar og‘riq "
        "kuchaysa shifokorga murojaat kiling.",

    'II-5-title' : "Siyish",
    'II-5-1' : "Tez-tez siyish",
    'II-5-2' : "Siydik tutilishi",
    'II-5-3' : "Siydik tuta olmaslik",
    'II-5-recommendationText' : "  Tizza-tirsak holatida harakatsiz turish "
        "yordam beradi. Agar siyish og‘riq bilan kuzatilsa, shifokorga murojaat "
        "qiling.",

    'II-6-title' : "Homila qimirlashini his etish",
    'II-6-recommendationText' : "Homila qimirlashini kuzatib borish lozim. "
        "Homila harakati to‘satdan o‘zgarsa yoki 24 soat va undan ortiq vaqt "
        "davomida qimirlamasa, shifokorga murojaat qiling.",

    'II-7-title' : "Onaning ruhiy holati o‘zgarishiga homilaning reaktsiyasi",
    'II-7-recommendationText' : "Kayfiyatingizni buzilishdan oldin "
        "homilangiz haqida o‘ylang",

    'II-8-title' : "Belda og‘riq",
    'II-8-recommendationText' : "Bo‘g‘imlar gimnastikasi va jismoniy mashqlarni "
        "bajarish foyda beradi. Masalan: uy ishlarini bajarishda (kir yuvish, "
        "ovqat tayyorlash, hovli supurish va b.) egilmaslikka harakat qiling.",

    'II-9-title' : "Uyqu va dam olish vaqtidagi noqulayliklar",
    'II-9-recommendationText' : "Chap yonboshda yotish eng qulay holat "
        "hisoblanadi. Yostiq va yostiqchalar qo‘yib, qulay holatni "
        "egallashga harakat qiling",

    'II-10-title' : "Qin ajralmalari",
    'II-10-recommendationText' : "Tashqi jinsiy a’zolarni doimo toza va quruq "
        "saqlang, tor ich kiyim kiymang, har bir hojatdan so‘ng qin dahlizini "
        "tozalab yuving. Bu sohaga kir sovun, atir sovun, vanna uchun ko‘piklar "
        "va parfyumeriya kabi ta’sirlovchi vositalarni ishlatmang. Chayish "
        "uchun moychechak, qora qiz, ko‘k choy damlamasi yoki oddiy iliq "
        "suvni ishlating. Agar ajralmalar kuchli hidli, qichishish bilan, "
        "sarg‘ish-yashil rangda yoki qon quyqalari bilan kuzatilsa, "
        "shifokorga murojaat kiling.",

    'II-11-title' : "Teri yorilishlari",
    'II-11-recommendationText' : "Homiladorlik davridagi gormonal o‘zgarishlar "
        "natijasi hisoblanadi. Tug‘ruqdan so‘ng tanada chiziqlar qoladi, "
        "lekin keynchalik rangi o‘zgarib, sezilarsiz bo‘lib qoladi.",

    'II-12-title' : "Qichishish va toshmalar",
    'II-12-recommendationText' : "Tez-tez cho‘milib, teringizni toza tuting. "
        "Agar 2-3 kundan ortiq toshamalar toshishi kuzatilsa, shifokorga "
        "murojaat kiling.",


    ////////////////////////////////////////////////////////////////////////

    // III - trimester

    'III-1-title' : "Zarda bo‘lish",
    'III-1-recommendationText' : "Uyqudan oldin yog‘li, kaloriyali va achchiq "
        "taomlar yemang. Kam-kamdan tez-tez ovqatlanish ham yordam beradi. "
        "Uxlaganda balandroq yostiqda yotish kerak.",

    'III-2-title' : "Hansirash",
    'III-2-recommendationText' : "Toza havoda sayr qilish, bosh va yelka tagiga "
        "yostiq qo‘yib ko'tarib yotish foyda beradi. Agar bo‘g‘ilsangiz "
        "shifokorga murojaat kiling.",

    'III-3-title' : "Oyoqlarda tirishish",
    'III-3-recommendationText' : "Zudlik bilan turib, oyoqning tortishgan "
        "joyini uqalab, qon kelishini kuchaytirish lozim. Agar tirishishlar "
        "tez-tez qaytalansa, vrachga murojaat kiling.",

    'III-4-title' : "Bosh  og‘rig‘i",
    'III-4-recommendationText' : "Tez-tez bosh og‘rishi, qon bosimining "
        "ko‘tarilishi yoki yurak kasalliklaridan darak beradi. Zudlik bilan "
        "shifokorga murojaat qilish lozim.",

    'III-5-title' : "Hushdan ketish",
    'III-5-recommendationText' : "Ko‘p hollarda chalqancha yotganingizda ro‘y "
        "beradi, bachadon og‘irligi bilan katta arteriyani bosib qo‘yish qon "
        "bosimining pasayishiga olib keladi. Zudlik bilan yonboshga "
        "yotish kerak.",

    'III-6-title' : "Milklar qonashi",
    'III-6-recommendationText' : "Agar qon ketishi kuchli va davomli bo‘lsa, "
        "shifokorga murojaat eting.",

    'III-7-title' : "Burun qonashi",
    'III-7-recommendationText' : "Agar burundan kuchli qon ketsa, bosh va "
        "ko‘rsatkich barmoq bilan burunni 30 sekund bosib turish lozim. Boshni "
        "orqaga tashlash yoki burun ichiga muz qo‘yish kerak emas, chunki bunda "
        "qon ketishi to‘xtamasdan ichingizga yutishingiz mumkin. Agar qon "
        "ketishi muntazzam bo‘lsa shifokorga murojaat kiling.",

    'III-8-title' : "Uyqusizlik",
    'III-8-recommendationText' : "Kunduzi uxlashga harakat qiling. Agar kechasi "
        "umuman uxlay olmasangiz shifokorga murojaat eting.",

    'III-9-title' : "Kayfiyat o‘zgarishlari",
    'III-9-recommendationText' : "Odatdagi ishlar bilan shug‘ullanish foydali, "
        "fikrni chalg‘itish uchun har kuni uyda yoki boshqa joyda bo‘lsa ham "
        "ish bilan mashg‘ul bo‘ling. Agar kayfiyat o‘zgarishi kuchaysa, vrach "
        "bilan maslahatlashing (qabulga eringiz bilan kelishingiz maqsadga "
        "muvofiq).",

    'III-10-title' : "Qindan suyuqlik kelishi, ba’zi holatlarda qon ajralishi",
    'III-10-recommendationText' : "Zudlik bilan shifokorga murojaat eting.",

    'III-11-title' : "Qorin pastida og‘irlik his qilish",
    'III-11-recommendationText' : "Ovqatlangandan so‘ng 1-2 soat chap "
        "yonboshingizda yoting.",

    'III-12-title' : "Ko‘krakdan sut kelishi",
    'III-12-recommendationText' : "Bolani emizishga tayyorgarlik boshlanayapti.",

    'III-13-title' : "Nomuntazzam (soxta) dardlar",
    'III-13-recommendationText' : "Agar kuchli bo‘lsa, shifokorga "
        "murojaat qiling.",

    'III-14-title' : "Qon ketishi",
    'III-14-recommendationText' : "Hattoki, kam miqdorda qindan qon ketsa ham "
        "shifokorga murojaat qiling.",

    'III-15-title' : "Qindan shilliq tiqin ketishi",
    'III-15-recommendationText' : "Bu tug‘ruq boshlanishidan darak beradi, "
        "shifokorga murojaat kiling.",

    'MainMenu' : "Bosh menyu",

    'AboutAppText' : "    Homila AI mobil ilovasi yosh, sistolik va diastolik "
        "arterial qon bosim, qondagi qand miqdori, tana harorati va puls kabi "
        "ma’lumotlarni qabul qiladi va mashinaviy o‘qitish algoritmlari "
        "yordamida homila davridagi asoratlar xavfini aniqlaydi. Algortmni "
        "tuzishda 1014 ta yozuvdan tashkil topgan ma’lumotlar bazasidan "
        "foydalanildi. Natijalar aniqligi 92%ni tashkil qiladi. Bundan "
        "tashqari, ilova O‘zbekistondagi perinatal markazlar (manzil, "
        "bog‘lanish, geolokatsiya) haqida, shuningdek homiladorlik davrlari "
        "(trimestrlari)dagi belgilar va O‘zbekiston Respublikasining tegishli "
        "normative hujjatlari bilan tasdiqlangan tavsiyalar haqidagi "
        "ma‘lumotlarni o‘z ichiga olgan.\n"
        "    Ilova Toshkent Pediatriya Tibbiyot Instituti Ilg‘or "
        "Texnologiyalar va Strategik Tashabbuslar Markazi tominidan "
        "ishlab chiqildi.",

    'InProcess' : "Ushbu funksiya hozirda ishlab chiqish jarayonida",

    'TermsTitle' : "Foydalanish shartlari",
    'TermsSubtitle' : "Testni boshlashingiz quyidagi shartlarni inobatga "
        "olishingizni va roziligingizni bildiradi:",
    'Terms1' : "Ushbu test to‘liq diagnostika hisoblanmaydi. Natijalar faqat "
        "ma’lumot berish uchun mo‘ljallangan va ular malakali tashxis emas.",
    'Terms2' : "Ma’lumotlaringiz xavfsizligi ta’minlanadi. Siz berayotgan "
        "ma’lumotlar anonim va ular uchinchi shaxslarga taqdim etilmaydi."
  }
};