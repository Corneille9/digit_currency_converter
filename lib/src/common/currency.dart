
extension StringExtension on String {
  Currency get asCurrency => Currency.values.byName(toLowerCase());
}
enum Currency {
  aed,
  afn,
  all,
  amd,
  ang,
  aoa,
  ars,
  aud,
  awg,
  azn,
  bam,
  bbd,
  bdt,
  bgn,
  bhd,
  bif,
  bmd,
  bnd,
  bob,
  brl,
  bsd,
  btn,
  bwp,
  byn,
  byr,
  bzd,
  cad,
  cdf,
  chf,
  clf,
  clp,
  cny,
  cop,
  crc,
  cuc,
  cup,
  cve,
  czk,
  djf,
  dkk,
  dop,
  dzd,
  egp,
  ern,
  etb,
  eur,
  fjd,
  fkp,
  gbp,
  gel,
  ghs,
  gip,
  gmd,
  gnf,
  gtq,
  gyd,
  hkd,
  hrk,
  htg,
  huf,
  idr,
  ils,
  inr,
  iqd,
  irr,
  isk,
  jep,
  jmd,
  jod,
  jpy,
  kes,
  kgs,
  khr,
  kmf,
  krw,
  kwd,
  kyd,
  kzt,
  lak,
  lbp,
  lkr,
  lrd,
  lsl,
  lyd,
  mad,
  mdl,
  mga,
  mkd,
  mmk,
  mnt,
  mop,
  mro,
  mur,
  mvr,
  mwk,
  mxn,
  myr,
  mzn,
  nad,
  ngn,
  nio,
  nok,
  npr,
  nzd,
  omr,
  pab,
  pen,
  pgk,
  php,
  pkr,
  pln,
  pyg,
  qar,
  ron,
  rsd,
  rub,
  rwf,
  sar,
  sbd,
  scr,
  sdg,
  sek,
  sgd,
  shp,
  sll,
  sos,
  srd,
  std,
  svc,
  szl,
  syp,
  thb,
  tjs,
  tmt,
  tnd,
  top,
  TRY,
  ttd,
  twd,
  tzs,
  uah,
  ugx,
  usd,
  uyu,
  uzs,
  vnd,
  vuv,
  xaf,
  xcd,
  xof,
  xpf,
  yer,
  zar,
  zmk,
  zmw,
  zwl,
}


class AllCurrency {
  static const allCurrencyWithCountries = {
    "aed": "United Arab Emirates Dirham",
    "afn": "Afghan afghani",
    "all": "Albanian lek",
    "amd": "Armenian dram",
    "ang": "Netherlands Antillean Guilder",
    "aoa": "Angolan kwanza",
    "ars": "Argentine peso",
    "aud": "Australian dollar",
    "awg": "Aruban florin",
    "azn": "Azerbaijani manat",
    "bam": "Bosnia-Herzegovina Convertible Mark",
    "bbd": "Bajan dollar",
    "bdt": "Bangladeshi taka",
    "bgn": "Bulgarian lev",
    "bhd": "Bahraini dinar",
    "bif": "Burundian Franc",
    "bmd": "Bermudan dollar",
    "bnd": "Brunei dollar",
    "bob": "Bolivian boliviano",
    "brl": "Brazilian real",
    "bsd": "Bahamian dollar",
    "btn": "Bhutan currency",
    "bwp": "Botswanan Pula",
    "byn": "New Belarusian Ruble",
    "byr": "Belarusian Ruble",
    "bzd": "Belize dollar",
    "cad": "Canadian dollar",
    "cdf": "Congolese franc",
    "chf": "Swiss franc",
    "clf": "Chilean Unit of Account (UF)",
    "clp": "Chilean peso",
    "cny": "Chinese Yuan",
    "cop": "Colombian peso",
    "crc": "Costa Rican Colón",
    "cuc": "Cuban peso",
    "cup": "Cuban Peso",
    "cve": "Cape Verdean escudo",
    "czk": "Czech koruna",
    "djf": "Djiboutian franc",
    "dkk": "Danish krone",
    "dop": "Dominican peso",
    "dzd": "Algerian dinar",
    "egp": "Egyptian pound",
    "ern": "Eritrean nakfa",
    "etb": "Ethiopian birr",
    "eur": "Euro",
    "fjd": "Fijian dollar",
    "fkp": "Falkland Islands pound",
    "gbp": "Pound sterling",
    "gel": "Georgian lari",
    "ghs": "Ghanaian cedi",
    "gip": "Gibraltar pound",
    "gmd": "Gambian dalasi",
    "gnf": "Guinean franc",
    "gtq": "Guatemalan quetzal",
    "gyd": "Guyanaese Dollar",
    "hkd": "Hong Kong dollar",
    "hnl": "Honduran lempira",
    "hrk": "Croatian kuna",
    "htg": "Haitian gourde",
    "huf": "Hungarian forint",
    "idr": "Indonesian rupiah",
    "ils": "Israeli New Shekel",
    "inr": "Indian rupee",
    "iqd": "Iraqi dinar",
    "irr": "Iranian rial",
    "isk": "Icelandic króna",
    "jep": "Jersey Pound",
    "jmd": "Jamaican dollar",
    "jod": "Jordanian dinar",
    "jpy": "Japanese yen",
    "kes": "Kenyan shilling",
    "kgs": "Kyrgystani Som",
    "khr": "Cambodian riel",
    "kmf": "Comorian franc",
    "kpw": "North Korean won",
    "krw": "South Korean won",
    "kwd": "Kuwaiti dinar",
    "kyd": "Cayman Islands dollar",
    "kzt": "Kazakhstani tenge",
    "lak": "Laotian Kip",
    "lbp": "Lebanese pound",
    "lkr": "Sri Lankan rupee",
    "lrd": "Liberian dollar",
    "lsl": "Lesotho loti",
    "ltl": "Lithuanian litas",
    "lvl": "Latvian lats",
    "lyd": "Libyan dinar",
    "mad": "Moroccan dirham",
    "mdl": "Moldovan leu",
    "mga": "Malagasy ariary",
    "mkd": "Macedonian denar",
    "mmk": "Myanmar Kyat",
    "mnt": "Mongolian tugrik",
    "mop": "Macanese pataca",
    "mro": "Mauritanian ouguiya",
    "mur": "Mauritian rupee",
    "mvr": "Maldivian rufiyaa",
    "mwk": "Malawian kwacha",
    "mxn": "Mexican peso",
    "myr": "Malaysian ringgit",
    "mzn": "Mozambican Metical",
    "nad": "Namibian dollar",
    "ngn": "Nigerian naira",
    "nio": "Nicaraguan córdoba",
    "nok": "Norwegian krone",
    "npr": "Nepalese rupee",
    "nzd": "New Zealand dollar",
    "omr": "Omani rial",
    "pab": "Panamanian balboa",
    "pen": "Sol",
    "pgk": "Papua New Guinean kina",
    "php": "Philippine peso",
    "pkr": "Pakistani rupee",
    "pln": "Poland złoty",
    "pyg": "Paraguayan guarani",
    "qar": "Qatari Rial",
    "ron": "Romanian leu",
    "rsd": "Serbian dinar",
    "rub": "Russian ruble",
    "rwf": "Rwandan Franc",
    "sar": "Saudi riyal",
    "sbd": "Solomon Islands dollar",
    "scr": "Seychellois rupee",
    "sdg": "Sudanese pound",
    "sek": "Swedish krona",
    "sgd": "Singapore dollar",
    "shp": "Saint Helena pound",
    "sll": "Sierra Leonean leone",
    "sos": "Somali shilling",
    "srd": "Surinamese dollar",
    "std": "São Tomé and Príncipe Dobra (pre-2018)",
    "svc": "Salvadoran Colón",
    "syp": "Syrian pound",
    "szl": "Swazi lilangeni",
    "thb": "Thai baht",
    "tjs": "Tajikistani somoni",
    "tmt": "Turkmenistani manat",
    "tnd": "Tunisian dinar",
    "top": "Tongan Paʻanga",
    "try": "Turkish lira",
    "ttd": "Trinidad & Tobago Dollar",
    "twd": "New Taiwan dollar",
    "tzs": "Tanzanian shilling",
    "uah": "Ukrainian hryvnia",
    "ugx": "Ugandan shilling",
    "usd": "United States dollar",
    "uyu": "Uruguayan peso",
    "uzs": "Uzbekistani som",
    "vnd": "Vietnamese dong",
    "vuv": "Vanuatu vatu",
    "xaf": "Central African CFA franc",
    "xcd": "East Caribbean dollar",
    "xof": "West African CFA franc",
    "xpf": "CFP franc",
    "yer": "Yemeni rial",
    "zar": "South African rand",
    "zmk": "Zambian kwacha",
    "zmw": "Zambian Kwacha",
    "zwl": "Zimbabwean Dollar"
  };
}
