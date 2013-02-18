#!/bin/env ruby
# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Platform.create([
  {name: "iOS"},
  {name: "Android"},
  {name: "Desktop"},
  {name: "Web"},
])

Category.create([
  {title: "Activism"},
  {title: "Education"},
  {title: "Environment"},
  {title: "Governance"},
  {title: "Health"},
  {title: "Relief"},
  {title: "Social Enterprise"},
  # {title: "Media"},
  # {title: "Philanthropy"}
])

License.create([
  {name: 'Closed', url: 'https://en.wikipedia.org/wiki/Proprietary_software'},
  {name: 'GPL', url: 'http://www.gnu.org/licenses/gpl.html'},
  {name: 'MIT', url: 'http://opensource.org/licenses/MIT'},
  {name: 'LGPL', url: 'http://www.gnu.org/copyleft/lesser.html'},
  {name: 'BSD', url: 'http://opensource.org/licenses/BSD-2-Clause'},
  {name: 'Apache', url: 'http://www.apache.org/licenses/LICENSE-2.0.html'},
  {name: 'CC BY', url: 'http://creativecommons.org/licenses/by/2.0/'},
  {name: 'CC BY-SA', url: 'http://creativecommons.org/licenses/by-sa/2.0/'},
  {name: 'CC BY-ND', url: 'http://creativecommons.org/licenses/by-nd/2.0/'},
  {name: 'CC BY-NC-SA', url: 'http://creativecommons.org/licenses/by-nc-sa/2.0/'},
  {name: 'CC BY-NC-ND', url: 'http://creativecommons.org/licenses/by-nc-nd/2.0/'}
])

Language.create([
  {name: "Antekish"},
  {name: "'Are'are"},
  {name: "'Auhelawa"},
  {name: "A'Tong"},
  {name: "Aari"},
  {name: "Abanyom"},
  {name: "Abaza"},
  {name: "Abkhaz"},
  {name: "Abujmaria"},
  {name: "Acehnese"},
  {name: "Adamorobe Sign Language"},
  {name: "Adele"},
  {name: "Adyghe"},
  {name: "Afar"},
  {name: "Afrikaans"},
  {name: "Afro-Seminole Creole"},
  {name: "Aimaq"},
  {name: "Aini"},
  {name: "Ainu"},
  {name: "Akan"},
  {name: "Akawaio"},
  {name: "Aklanon"},
  {name: "Albanian"},
  {name: "Aleut"},
  {name: "Algonquin"},
  {name: "Alsatian"},
  {name: "Altay"},
  {name: "Alutor"},
  {name: "American Sign Language"},
  {name: "Amharic"},
  {name: "Anda"},
  {name: "Amdang"},
  {name: "Angika"},
  {name: "Anyin"},
  {name: "Ao"},
  {name: "A-Pucikwar"},
  {name: "Arabic"},
  {name: "Aragonese"},
  {name: "Aramaic"},
  {name: "Are"},
  {name: "Argobba"},
  {name: "Aromanian"},
  {name: "Armenian"},
  {name: "Arvanitic"},
  {name: "Ashkun"},
  {name: "Assamese"},
  {name: "Assyrian Neo-Aramaic"},
  {name: "Ateso"},
  {name: "Asi"},
  {name: "Asturian"},
  {name: "Auslan"},
  {name: "Austro-Bavarian"},
  {name: "Avar"},
  {name: "Avestan"},
  {name: "Awadhi"},
  {name: "Aymara"},
  {name: "Azerbaijani"},
  {name: "Badaga"},
  {name: "Badeshi"},
  {name: "Bahnar"},
  {name: "Balinese"},
  {name: "Balochi"},
  {name: "Balti"},
  {name: "Bambara"},
  {name: "Banjar"},
  {name: "Banyumasan"},
  {name: "Bartangi"},
  {name: "Basaa"},
  {name: "Bashkardi"},
  {name: "Bashkir"},
  {name: "Basque"},
  {name: "Batak Karo"},
  {name: "Batak Toba"},
  {name: "Bats"},
  {name: "Beja"},
  {name: "Belarusian"},
  {name: "Belhare"},
  {name: "Berta"},
  {name: "Bemba"},
  {name: "Bengali"},
  {name: "Bezhta"},
  {name: "Berber"},
  {name: "Betawi"},
  {name: "Bete"},
  {name: "Bété"},
  {name: "Bhili"},
  {name: "Bhojpuri"},
  {name: "Bijil Neo-Aramaic"},
  {name: "Bikol"},
  {name: "Bikya"},
  {name: "Bissa"},
  {name: "Blackfoot"},
  {name: "Boholano"},
  {name: "Bohtan Neo-Aramaic"},
  {name: "Bonan"},
  {name: "Bororo"},
  {name: "Bodo"},
  {name: "Bosnian"},
  {name: "Brahui"},
  {name: "Breton"},
  {name: "British Sign Language"},
  {name: "Bua"},
  {name: "Buginese"},
  {name: "Bukusu"},
  {name: "Bulgarian"},
  {name: "Bunjevac"},
  {name: "Burmese"},
  {name: "Burushaski"},
  {name: "Buryat"},
  {name: "Caluyanon"},
  {name: "Cantonese"},
  {name: "Catalan"},
  {name: "Cayuga"},
  {name: "Cebuano"},
  {name: "Chabacano"},
  {name: "Chaga"},
  {name: "Chakma"},
  {name: "Chaldean Neo-Aramaic"},
  {name: "Chamorro"},
  {name: "Chaouia"},
  {name: "Chechen"},
  {name: "Chenchu"},
  {name: "Chenoua"},
  {name: "Cherokee"},
  {name: "Cheyenne"},
  {name: "Chhattisgarhi"},
  {name: "Chickasaw"},
  {name: "Chintang"},
  {name: "Chilcotin"},
  {name: "Chinese"},
  {name: "Chiricahua"},
  {name: "Chichewa"},
  {name: "Chipewyan"},
  {name: "Chittagonian"},
  {name: "Choctaw"},
  {name: "Chorasmian"},
  {name: "Chukchi"},
  {name: "Chulym"},
  {name: "Church Slavonic"},
  {name: "Chuukese"},
  {name: "Chuvash"},
  {name: "Cocoma"},
  {name: "Cocopa"},
  {name: "Coeur d’Alene"},
  {name: "Comanche"},
  {name: "Comorian"},
  {name: "Cornish"},
  {name: "Corsican"},
  {name: "Cree"},
  {name: "Crimean Tatar"},
  {name: "Croatian"},
  {name: "Cuyonon"},
  {name: "Czech"},
  {name: "Dagbani"},
  {name: "Dahlik"},
  {name: "Dalecarlian"},
  {name: "Dameli"},
  {name: "Danish"},
  {name: "Dargin"},
  {name: "Dari (Zoroastrian)"},
  {name: "Dari-Persian"},
  {name: "Daur"},
  {name: "Dena'ina"},
  {name: "Dhatki"},
  {name: "Dhivehi"},
  {name: "Dida"},
  {name: "Dioula"},
  {name: "Dogri"},
  {name: "Dogrib"},
  {name: "Dolgan"},
  {name: "Domaaki"},
  {name: "Dongxiang"},
  {name: "Duala"},
  {name: "Dungan"},
  {name: "Dutch"},
  {name: "Dzhidi"},
  {name: "Dzongkha"},
  {name: "Eastern Yugur"},
  {name: "Egyptian Arabic"},
  {name: "Ekoti"},
  {name: "Enets"},
  {name: "English"},
  {name: "Erzya"},
  {name: "Esperanto"},
  {name: "Estonian"},
  {name: "Even"},
  {name: "Evenk"},
  {name: "Ewe"},
  {name: "Extremaduran"},
  {name: "Faeroese"},
  {name: "Fang"},
  {name: "Fijian"},
  {name: "Filipino"},
  {name: "Finnish"},
  {name: "Finnish Sign Language"},
  {name: "Flemish language"},
  {name: "Fon"},
  {name: "Franco-Provençal"},
  {name: "French"},
  {name: "French Sign Language"},
  {name: "Frisian, North"},
  {name: "Frisian, Saterland"},
  {name: "Frisian, West"},
  {name: "Friulian"},
  {name: "Fula"},
  {name: "Fur"},
  {name: "Ga"},
  {name: "Gadaba"},
  {name: "Gagauz"},
  {name: "Galician"},
  {name: "Gan"},
  {name: "Ganda"},
  {name: "Gangte"},
  {name: "Garhwali"},
  {name: "Gayo"},
  {name: "Gen"},
  {name: "Georgian"},
  {name: "German"},
  {name: "German Sign Language"},
  {name: "Gikuyu"},
  {name: "Gilbertese"},
  {name: "Gileki"},
  {name: "Goaria"},
  {name: "Gondi"},
  {name: "Gorani"},
  {name: "Gawar-Bati"},
  {name: "Greek"},
  {name: "Guaraní"},
  {name: "Guinea-Bissau Creole"},
  {name: "Gujarati"},
  {name: "Gula Iro"},
  {name: "Gullah"},
  {name: "Gusii"},
  {name: "Gwichʼin"},
  {name: "Hadza"},
  {name: "Haida"},
  {name: "Haitian Creole"},
  {name: "Hakka"},
  {name: "Hän"},
  {name: "Harari"},
  {name: "Harauti"},
  {name: "Harsusi"},
  {name: "Haryanavi"},
  {name: "Harzani"},
  {name: "Hausa"},
  {name: "Havasupai"},
  {name: "Hawaiian"},
  {name: "Hawaii Pidgin Sign Language"},
  {name: "Hazaragi"},
  {name: "Hebrew"},
  {name: "Herero"},
  {name: "Hértevin"},
  {name: "Hiligaynon"},
  {name: "Hindi"},
  {name: "Hinukh"},
  {name: "Hiri Motu"},
  {name: "Hixkaryana"},
  {name: "Hmong"},
  {name: "Ho"},
  {name: "Hobyót"},
  {name: "Hopi"},
  {name: "Hulaulá"},
  {name: "Hungarian"},
  {name: "Hutterite German"},
  {name: "Ibibio"},
  {name: "Iban"},
  {name: "Ibanag"},
  {name: "Icelandic"},
  {name: "Ifè"},
  {name: "Igbo"},
  {name: "Ikalanga"},
  {name: "Ili Turki"},
  {name: "Ilokano"},
  {name: "Inari Sami"},
  {name: "Indonesian"},
  {name: "Ingrian"},
  {name: "Ingush"},
  {name: "Inuktitut"},
  {name: "Inupiaq"},
  {name: "Inuvialuktun"},
  {name: "Iraqw"},
  {name: "Irish"},
  {name: "Irish Sign Language"},
  {name: "Irula"},
  {name: "Isan"},
  {name: "Ishkashimi"},
  {name: "Istro-Romanian"},
  {name: "Italian"},
  {name: "Itelmen"},
  {name: "Jacaltec"},
  {name: "Jalaa"},
  {name: "Japanese"},
  {name: "Jaqaru"},
  {name: "Jarai"},
  {name: "Javanese"},
  {name: "Jibbali"},
  {name: "Jewish Babylonian Aramaic"},
  {name: "Jicarilla Apache"},
  {name: "Juang"},
  {name: "Jurchen"},
  {name: "Kabardian"},
  {name: "Kabyle"},
  {name: "Kachin"},
  {name: "Kalaallisut"},
  {name: "Kalami"},
  {name: "Kalasha"},
  {name: "Kalmyk"},
  {name: "Kalto"},
  {name: "Kankanai"},
  {name: "Kannada"},
  {name: "Kaonde"},
  {name: "Kapampangan"},
  {name: "Karachay-Balkar"},
  {name: "Karagas"},
  {name: "Karaim"},
  {name: "Karakalpak"},
  {name: "Karelian"},
  {name: "Kashmiri"},
  {name: "Kashubian"},
  {name: "Kazakh"},
  {name: "Kerek"},
  {name: "Ket"},
  {name: "Khakas"},
  {name: "Khalaj"},
  {name: "Kham"},
  {name: "Khandeshi"},
  {name: "Khanty"},
  {name: "Khasi"},
  {name: "Khitan"},
  {name: "Khmer"},
  {name: "Khmu"},
  {name: "Khowar"},
  {name: "Kildin Sami"},
  {name: "Kimatuumbi"},
  {name: "Kinaray-a"},
  {name: "Kinyarwanda"},
  {name: "Kirombo"},
  {name: "Kirundi"},
  {name: "Kivunjo"},
  {name: "Klallam"},
  {name: "Kodava Takk"},
  {name: "Kohistani"},
  {name: "Kolami"},
  {name: "Komi"},
  {name: "Konkani"},
  {name: "Kongo"},
  {name: "Koraga"},
  {name: "Korandje"},
  {name: "Korean"},
  {name: "Korku"},
  {name: "Korowai"},
  {name: "Korwa"},
  {name: "Koryak"},
  {name: "Kosraean"},
  {name: "Kota"},
  {name: "Koyra Chiini"},
  {name: "Koy Sanjaq Surat"},
  {name: "Koya"},
  {name: "Krymchak"},
  {name: "Kujarge"},
  {name: "Kui"},
  {name: "Kumauni"},
  {name: "Kumyk"},
  {name: "Kumzari"},
  {name: "ǃKung"},
  {name: "Kurdish"},
  {name: "Kurukh"},
  {name: "Kusunda"},
  {name: "Kutenai"},
  {name: "Kwanyama"},
  {name: "Kxoe"},
  {name: "Kyrgyz"},
  {name: "Laal"},
  {name: "Ladakhi"},
  {name: "Ladin"},
  {name: "Ladino"},
  {name: "Laki"},
  {name: "Lakota"},
  {name: "Lambadi"},
  {name: "Lao"},
  {name: "Larestani"},
  {name: "Latin"},
  {name: "Latvian"},
  {name: "Laz"},
  {name: "Leonese"},
  {name: "Lezgi"},
  {name: "Ligbi"},
  {name: "Limburgish"},
  {name: "Lingala"},
  {name: "Lipan Apache"},
  {name: "Lisan al-Dawat"},
  {name: "Lishana Deni"},
  {name: "Lishanid Noshan"},
  {name: "Lithuanian"},
  {name: "Livonian"},
  {name: "Lombard"},
  {name: "Lotha"},
  {name: "Low German"},
  {name: "Lower Sorbian"},
  {name: "Lozi"},
  {name: "Ludic"},
  {name: "Lunda"},
  {name: "Luri"},
  {name: "Lushootseed"},
  {name: "Lusoga"},
  {name: "Luvale"},
  {name: "Luwati"},
  {name: "Luxembourgish"},
  {name: "Macedonian"},
  {name: "Magadhi"},
  {name: "Maguindanao"},
  {name: "Maithili"},
  {name: "Makasar"},
  {name: "Makhuwa"},
  {name: "Makhuwa-Meetto"},
  {name: "Malagasy"},
  {name: "Malay"},
  {name: "Malayalam"},
  {name: "Malaysian Sign Language"},
  {name: "Maltese"},
  {name: "Malto"},
  {name: "Malvi"},
  {name: "Mam"},
  {name: "Manchu"},
  {name: "Mandaic"},
  {name: "Mandarin"},
  {name: "Mandinka"},
  {name: "Mansi"},
  {name: "Manx"},
  {name: "Manyika"},
  {name: "Maori"},
  {name: "Mapudungun"},
  {name: "Maranao"},
  {name: "Marathi"},
  {name: "Mari"},
  {name: "Maria"},
  {name: "Marquesan"},
  {name: "Marshallese"},
  {name: "Martha's Vineyard Sign Language"},
  {name: "Masaba"},
  {name: "Masbatenyo"},
  {name: "Meitei"},
  {name: "Mauritian Creole"},
  {name: "Maya"},
  {name: "Mazandarani"},
  {name: "Meänkieli"},
  {name: "Megleno-Romanian"},
  {name: "Megrelian"},
  {name: "Mehri"},
  {name: "Menominee"},
  {name: "Mentawai"},
  {name: "Meroitic"},
  {name: "Mescalero Apache"},
  {name: "Meru"},
  {name: "Michif"},
  {name: "Mikasuki"},
  {name: "Mi'kmaq"},
  {name: "Minangkabau"},
  {name: "Mirandese"},
  {name: "Mobilian Jargon"},
  {name: "Moghol"},
  {name: "Mohawk"},
  {name: "Moksha"},
  {name: "Molengue"},
  {name: "Mon"},
  {name: "Mongolian"},
  {name: "Mono"},
  {name: "Mono"},
  {name: "Mono"},
  {name: "Montagnais"},
  {name: "Montenegrin"},
  {name: "Motu"},
  {name: "Muher"},
  {name: "Mundari"},
  {name: "Munji"},
  {name: "Muria"},
  {name: "Nafaanra"},
  {name: "Nagarchal"},
  {name: "Nahuatl"},
  {name: "Nama"},
  {name: "Nanai"},
  {name: "Nauruan"},
  {name: "Navajo"},
  {name: "Ndau"},
  {name: "Ndebele"},
  {name: "Ndonga"},
  {name: "Neapolitan"},
  {name: "Negidal"},
  {name: "Nenets"},
  {name: "Nepal Bhasa"},
  {name: "Nepali"},
  {name: "New Zealand Sign Language"},
  {name: "Nihali"},
  {name: "Nganasan"},
  {name: "Ngumba"},
  {name: "Nheengatu"},
  {name: "Nias"},
  {name: "Nicaraguan Sign Language"},
  {name: "Niellim"},
  {name: "Nigerian Pidgin"},
  {name: "Nisenan"},
  {name: "Niuean"},
  {name: "Nivkh"},
  {name: "Nogai"},
  {name: "Norfuk"},
  {name: "Norman"},
  {name: "Northern Sami"},
  {name: "Northern Sotho"},
  {name: "Northern Straits Salish"},
  {name: "Northern Yukaghir"},
  {name: "Norwegian"},
  {name: "Nuer"},
  {name: "Nuxálk"},
  {name: "Nyabwa"},
  {name: "Nyah Kur"},
  {name: "Nyangumarta"},
  {name: "Nyoro"},
  {name: "Nǀu"},
  {name: "Occitan or Provençal"},
  {name: "Ojibwe"},
  {name: "Okinawan"},
  {name: "Olonets Karelian"},
  {name: "Omagua"},
  {name: "Ongota"},
  {name: "Oriya"},
  {name: "Ormuri"},
  {name: "Oroch"},
  {name: "Orok"},
  {name: "Oromo"},
  {name: "Ossetic"},
  {name: "Páez"},
  {name: "Palauan"},
  {name: "Pangasinan"},
  {name: "Papiamento"},
  {name: "Parachi"},
  {name: "Parya"},
  {name: "Pashto"},
  {name: "Pennsylvania Dutch"},
  {name: "Persian"},
  {name: "Phalura"},
  {name: "Phuthi"},
  {name: "Picard"},
  {name: "Pirahã"},
  {name: "Plautdietsch"},
  {name: "Polish"},
  {name: "Portuguese"},
  {name: "Pothohari"},
  {name: "Pradhan"},
  {name: "Puelche"},
  {name: "Puma"},
  {name: "Punjabi"},
  {name: "Qashqai"},
  {name: "Quebec Sign Language"},
  {name: "Quechua"},
  {name: "Rajasthani"},
  {name: "Ratagnon"},
  {name: "Réunion Creole"},
  {name: "Romanian"},
  {name: "Romansh"},
  {name: "Romany"},
  {name: "Romblomanon"},
  {name: "Rotokas"},
  {name: "Runyankole language"},
  {name: "Russian"},
  {name: "Russian Sign Language"},
  {name: "Ruthenian"},
  {name: "Salar"},
  {name: "Samoan"},
  {name: "Sandawe"},
  {name: "Sango"},
  {name: "Sanskrit"},
  {name: "Santali"},
  {name: "Sara"},
  {name: "Saraiki"},
  {name: "Saramaccan"},
  {name: "Sardinian"},
  {name: "Sarikoli"},
  {name: "Saurashtra"},
  {name: "Savara"},
  {name: "Savi"},
  {name: "Sawai"},
  {name: "Scots"},
  {name: "Scots Gaelic"},
  {name: "Selangor Sign Language"},
  {name: "Selkup"},
  {name: "Semnani"},
  {name: "Senaya"},
  {name: "Serbian"},
  {name: "Serbo-Croatian"},
  {name: "Sesotho"},
  {name: "Seto"},
  {name: "Seychellois Creole"},
  {name: "Shimaore"},
  {name: "Shina"},
  {name: "Shona"},
  {name: "Shor"},
  {name: "Shoshoni"},
  {name: "Shughni"},
  {name: "Shumashti"},
  {name: "Shuswap"},
  {name: "Sicilian"},
  {name: "Sidamo"},
  {name: "Sika"},
  {name: "Silesian"},
  {name: "Silt'e"},
  {name: "Sindhi"},
  {name: "Sinhalese"},
  {name: "Sioux"},
  {name: "Sivandi"},
  {name: "Skolt Sami"},
  {name: "Slavey"},
  {name: "Slovak"},
  {name: "Slovene"},
  {name: "Soddo"},
  {name: "Somali"},
  {name: "Sonjo"},
  {name: "Sonsorolese"},
  {name: "Soqotri"},
  {name: "Sora"},
  {name: "Sorbian, Lower"},
  {name: "Sorbian, Upper"},
  {name: "Sourashtra"},
  {name: "Southern Sami"},
  {name: "South Estonian"},
  {name: "Southern Yukaghir"},
  {name: "Spanish"},
  {name: "Sranan Tongo"},
  {name: "St'at'imcets"},
  {name: "Sucite"},
  {name: "Suba"},
  {name: "Sundanese"},
  {name: "Supyire"},
  {name: "Surigaonon"},
  {name: "Susu"},
  {name: "Svan"},
  {name: "Swahili"},
  {name: "Swati"},
  {name: "Swedish"},
  {name: "Syriac"},
  {name: "Tabasaran"},
  {name: "Tachelhit"},
  {name: "Tagalog"},
  {name: "Tahitian"},
  {name: "Taiwanese Sign Language"},
  {name: "Tajik"},
  {name: "Takestani"},
  {name: "Talysh"},
  {name: "Tamil"},
  {name: "Tanacross"},
  {name: "Tangut"},
  {name: "Tarifit"},
  {name: "Tat"},
  {name: "Tatar"},
  {name: "Tausug"},
  {name: "Tehuelche"},
  {name: "Telugu"},
  {name: "Tetum"},
  {name: "Tepehua language"},
  {name: "Tepehuán language"},
  {name: "Thai"},
  {name: "Tharu"},
  {name: "Tibetan"},
  {name: "Tigre"},
  {name: "Tigrinya"},
  {name: "Timbisha"},
  {name: "Tiv"},
  {name: "Tlingit"},
  {name: "Tobian"},
  {name: "Toda"},
  {name: "Tok Pisin"},
  {name: "Tokelauan"},
  {name: "Tonga"},
  {name: "Tongan"},
  {name: "Torwali"},
  {name: "Tregami"},
  {name: "Tsat"},
  {name: "Tsez"},
  {name: "Tshiluba"},
  {name: "Tsimshian"},
  {name: "Tsonga"},
  {name: "Tswana"},
  {name: "Tu"},
  {name: "Tuareg languages"},
  {name: "Tulu"},
  {name: "Tumbuka"},
  {name: "Tupiniquim"},
  {name: "Turkish"},
  {name: "Turkmen"},
  {name: "Turoyo"},
  {name: "Tuvaluan"},
  {name: "Tuvan"},
  {name: "Udihe"},
  {name: "Udmurt"},
  {name: "Ukrainian"},
  {name: "Ulch"},
  {name: "Unserdeutsch"},
  {name: "Upper Sorbian"},
  {name: "Urdu"},
  {name: "Uripiv"},
  {name: "Urum"},
  {name: "Ute"},
  {name: "Uyghur"},
  {name: "Uzbek"},
  {name: "Vafsi"},
  {name: "Valencian"},
  {name: "Valencian Sign Language"},
  {name: "Vasi-vari"},
  {name: "Venda"},
  {name: "Venetian"},
  {name: "Veps"},
  {name: "Vietnamese"},
  {name: "Võro"},
  {name: "Votic"},
  {name: "Waddar"},
  {name: "Waigali"},
  {name: "Waima"},
  {name: "Wakhi"},
  {name: "Walloon"},
  {name: "Waray-Waray"},
  {name: "Washo"},
  {name: "Welsh"},
  {name: "Western Neo-Aramaic"},
  {name: "Wolane (Silt'e)"},
  {name: "Wolof"},
  {name: "Wu"},
  {name: "Xhosa"},
  {name: "Xiang"},
  {name: "Xibe"},
  {name: "Xipaya"},
  {name: "ǃXóõ"},
  {name: "Yaaku language"},
  {name: "Yaeyama language"},
  {name: "Yaghnobi"},
  {name: "Yakut"},
  {name: "Yankunytjatjara language"},
  {name: "Yanomami"},
  {name: "Yanyuwa"},
  {name: "Yapese"},
  {name: "Yaqui"},
  {name: "Yauma"},
  {name: "Yavapai"},
  {name: "Yazdi"},
  {name: "Yazgulyam"},
  {name: "Yemenite Hebrew"},
  {name: "Yeni language"},
  {name: "Yevanic language"},
  {name: "Yi language"},
  {name: "Yiddish"},
  {name: "Yidgha"},
  {name: "Yogur"},
  {name: "Yokutsan languages"},
  {name: "Yonaguni language"},
  {name: "Yorùbá language"},
  {name: "Yucatec Maya language"},
  {name: "Yucatec Maya Sign Language"},
  {name: "Yuchi language"},
  {name: "Yugur"},
  {name: "Yukaghir languages"},
  {name: "Yupik language"},
  {name: "Yurats language"},
  {name: "Yurok language"},
  {name: "Záparo"},
  {name: "Zapotec"},
  {name: "Zazaki"},
  {name: "Zhuang"},
  {name: "Zoque"},
  {name: "Zulu"},
  {name: "Zuñi"},
  {name: "Zway"}
])

# connection = ActiveRecord::Base.connection();
# connection.execute(data)

# ActiveRecord::Base.connection.execute(File.read("#{Rails.root}/db/data/locations.sql"))