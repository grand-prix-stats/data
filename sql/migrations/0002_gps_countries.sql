-- ----------------------------------------------------------------
-- gpsNationalities
-- ----------------------------------------------------------------
drop table if exists gpsNationalities;

create table gpsNationalities (
  name varchar(64) not null,
  code varchar(2) not null,
  primary key (name),
  unique key (name, code)
) engine=MyISAM default charset=utf8mb4;

insert into gpsNationalities (name, code)
values
    ('American',          'us'),
    ('American-Italian',  'us'),
    ('Argentine',         'ar'),
    ('Argentine-Italian', 'ar'),
    ('Australian',        'au'),
    ('Austrian',          'at'),
    ('Belgian',           'be'),
    ('Brazilian',         'br'),
    ('British',           'gb'),
    ('Canadian',          'ca'),
    ('Chilean',           'cl'),
    ('Colombian',         'co'),
    ('Czech',             'cz'),
    ('Danish',            'dk'),
    ('Dutch',             'nl'),
    ('East German',       'de'),
    ('Finnish',           'fi'),
    ('French',            'fr'),
    ('German',            'de'),
    ('Hungarian',         'hu'),
    ('Indian',            'in'),
    ('Indonesian',        'id'),
    ('Irish',             'ie'),
    ('Italian',           'it'),
    ('Japanese',          'jp'),
    ('Liechtensteiner',   'li'),
    ('Malaysian',         'my'),
    ('Mexican',           'mx'),
    ('Monegasque',        'mc'),
    ('New Zealander',     'nz'),
    ('Polish',            'pl'),
    ('Portuguese',        'pt'),
    ('Rhodesian',         'zw'),
    ('Russian',           'ru'),
    ('South African',     'za'),
    ('Spanish',           'es'),
    ('Swedish',           'se'),
    ('Swiss',             'ch'),
    ('Thai',              'th'),
    ('Uruguayan',         'uy'),
    ('Venezuelan',        've');


-- ----------------------------------------------------------------
-- gpsCountries
-- ----------------------------------------------------------------
drop table if exists gpsCountries;

create table gpsCountries (
  code varchar(2) not null,
  countryRef varchar(64) not null,
  name varchar(64) not null,
  flag varchar(6) not null,
  primary key (code),
  unique key (countryRef),
  unique key (name)
) engine=MyISAM default charset=utf8mb4;

insert into gpsCountries (name, countryRef, code, flag)
values
    ('Argentina',      'argentina',      'ar', '🇦🇷'),
    ('Australia',      'australia',      'au', '🇦🇺'),
    ('Austria',        'austria',        'at', '🇦🇹'),
    ('Azerbaijan',     'azerbaijan',     'az', '🇦🇿'),
    ('Bahrain',        'bahrain',        'bh', '🇧🇭'),
    ('Belgium',        'belgium',        'be', '🇧🇪'),
    ('Brazil',         'brazil',         'br', '🇧🇷'),
    ('Canada',         'canada',         'ca', '🇨🇦'),
    ('Chile',          'chile',          'cl', '🇨🇱'),
    ('China',          'china',          'cn', '🇨🇳'),
    ('Colombia',       'colombia',       'co', '🇨🇴'),
    ('Czech Republic', 'czech_republic', 'cz', '🇨🇿'),
    ('Denmark',        'denmark',        'dk', '🇩🇰'),
    ('Finland',        'finland',        'fi', '🇫🇮'),
    ('France',         'france',         'fr', '🇫🇷'),
    ('Germany',        'germany',        'de', '🇩🇪'),
    ('Hungary',        'hungary',        'hu', '🇭🇺'),
    ('India',          'india',          'in', '🇮🇳'),
    ('Indonesia',      'indonesia',      'id', '🇮🇩'),
    ('Italy',          'italy',          'it', '🇮🇹'),
    ('Ireland',        'ireland',        'ie', '🇮🇪'),
    ('Japan',          'japan',          'jp', '🇯🇵'),
    ('Korea',          'korea',          'kr', '🇰🇷'),
    ('Liechtenstein',  'liechtenstein',  'li', '🇱🇮'),
    ('Malaysia',       'malaysia',       'my', '🇲🇾'),
    ('Mexico',         'mexico',         'mx', '🇲🇽'),
    ('Monaco',         'monaco',         'mc', '🇲🇨'),
    ('Morocco',        'morocco',        'ma', '🇲🇦'),
    ('Netherlands',    'netherlands',    'nl', '🇳🇱'),
    ('New Zealand',    'new_zealand',    'nz', '🇳🇿'),
    ('Poland',         'poland',         'pl', '🇵🇱'),
    ('Portugal',       'portugal',       'pt', '🇵🇹'),
    ('Qatar',          'qatar',          'qa', '🇶🇦'),
    ('Russia',         'russia',         'ru', '🇷🇺'),
    ('Saudi Arabia',   'saudi_arabia',   'sa', '🇸🇦'),
    ('Singapore',      'singapore',      'sg', '🇸🇬'),
    ('South Africa',   'south_africa',   'za', '🇿🇦'),
    ('Spain',          'spain',          'es', '🇪🇸'),
    ('Sweden',         'sweden',         'se', '🇸🇪'),
    ('Switzerland',    'switzerland',    'ch', '🇨🇭'),
    ('Rhodesia',       'rhodesia',       'zw', '🇿🇼'),
    ('Thailand',       'thailand',       'th', '🇹🇭'),
    ('Turkey',         'turkey',         'tr', '🇹🇷'),
    ('UAE',            'uae',            'ae', '🇦🇪'),
    ('UK',             'uk',             'gb', '🇬🇧'),
    ('Uruguay',        'uruguay',        'uy', '🇺🇾'),
    ('USA',            'usa',            'us', '🇺🇸'),
    ('Venezuela',      'venezuela',      've', '🇻🇪'),
    ('Vietnam',        'vietnam',        'vn', '🇻🇳');
