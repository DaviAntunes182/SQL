DROP TABLE Dependentes;

CREATE TABLE Dependentes (
    ID INT PRIMARY KEY,
    ID_Colaborador INT,
    Nome VARCHAR(255),
    Parentesco VARCHAR(50),
    DataNascimento DATE,
    CPF VARCHAR(14),
    Genero VARCHAR(15),
    FOREIGN KEY (ID_Colaborador) REFERENCES Colaboradores(ID)
);

INSERT INTO Dependentes
VALUES (1,	'42',	'Murilo Silva',	'pai',	'1958-03-16',	'87390412631',	'Masculino'),
(2,	'97',	'Milena Silveira',	'mãe',	'1968-07-28',	'82014397597',	'Feminino'),
(3,	'67',	'Ana Clara Silveira',	'filha',	'2013-05-11',	'48196752067',	'Feminino'),
(4,	'54',	'Maysa Ribeiro',	'cônjuge',	'1999-05-20',	'73165948291',	'Feminino'),
(5,	'65',	'Luiz Felipe Porto',	'pai',	'1986-06-04',	'13805697457',	'Masculino'),
(6,	'117',	'Stella Costa',	'cônjuge',	'1997-08-16',	'83746291500',	'Feminino'),
(7,	'55',	'Ana Julia Barbosa',	'cônjuge',	'2005-01-05',	'15804963260',	'Feminino'),
(8,	'90',	'Enzo Gabriel da Rocha',	'cônjuge',	'2019-06-18',	'91865720402',	'Masculino'),
(9,	'63',	'Luiz Gustavo Viana',	'pai',	'1966-09-20',	'34785920114',	'Masculino'),
(10,	'119',	'João Guilherme Silveira',	'pai',	'1969-09-07',	'61783950439',	'Masculino'),
(11,	'83',	'Julia Rezende',	'cônjuge',	'2007-09-10',	'54692381051',	'Feminino'),
(12,	'26',	'Raul Jesus',	'cônjuge',	'2004-03-05',	'79564803292',	'Masculino'),
(13,	'124',	'Evelyn da Paz',	'cônjuge',	'2012-08-05',	'69372814555',	'Feminino'),
(14,	'1',	'Gustavo Henrique da Luz',	'filho',	'2001-05-04',	'39724105652',	'Masculino'),
(15,	'87',	'Maria Clara Teixeira',	'filha',	'2021-11-18',	'40893216704',	'Feminino'),
(16,	'10',	'Milena Sales',	'mãe',	'1968-05-25',	'83410295704',	'Feminino'),
(17,	'130',	'Alexia Silveira',	'filha',	'2022-08-09',	'49207861585',	'Feminino'),
(18,	'117',	'Gustavo Barbosa',	'cônjuge',	'2001-04-10',	'78942301622',	'Masculino'),
(19,	'123',	'Vitor Hugo Monteiro',	'pai',	'1933-10-27',	'14752908379',	'Masculino'),
(20,	'150',	'Yuri Oliveira',	'cônjuge',	'2011-08-06',	'18390672413',	'Masculino'),
(21,	'18',	'Fernando Ramos',	'cônjuge',	'2012-11-01',	'74210839523',	'Masculino'),
(22,	'2',	'Giovanna das Neves',	'filha',	'2004-04-04',	'80364157984',	'Feminino'),
(23,	'92',	'Ana Júlia Duarte',	'cônjuge',	'2004-09-19',	'93624187031',	'Feminino'),
(24,	'31',	'Rafael Pires',	'filho',	'2003-03-18',	'97103625859',	'Masculino'),
(25,	'49',	'Srta. Sophie Ribeiro',	'filha',	'2008-09-04',	'69827453173',	'Feminino'),
(26,	'71',	'Julia Silveira',	'mãe',	'1936-01-19',	'94718260558',	'Feminino'),
(27,	'5',	'Maria Luiza da Rocha',	'cônjuge',	'2013-06-03',	'52890364151',	'Feminino'),
(28,	'62',	'Lucca Silva',	'cônjuge',	'1998-08-21',	'07213985450',	'Masculino'),
(29,	'63',	'Sr. Calebe Moura',	'cônjuge',	'2019-07-11',	'48219560398',	'Masculino'),
(30,	'43',	'Maria da Costa',	'cônjuge',	'2019-08-04',	'15207893432',	'Feminino'),
(31,	'100',	'Diogo Peixoto',	'pai',	'1984-09-18',	'27468359164',	'Masculino'),
(32,	'64',	'Dr. Benício Freitas',	'filho',	'2020-08-03',	'92057348610',	'Masculino'),
(33,	'15',	'Esther Melo',	'cônjuge',	'2012-06-03',	'97328015659',	'Feminino'),
(34,	'126',	'Larissa Martins',	'filha',	'2019-01-18',	'14328596098',	'Feminino'),
(35,	'142',	'Mirella Cavalcanti',	'filha',	'2004-08-17',	'62980534170',	'Feminino'),
(36,	'38',	'Rafaela Almeida',	'cônjuge',	'2014-09-06',	'07185426308',	'Feminino'),
(37,	'139',	'Clara Caldeira',	'mãe',	'1957-06-30',	'78536102977',	'Feminino'),
(38,	'13',	'Dr. Kaique Lopes',	'cônjuge',	'2019-07-29',	'85167342937',	'Masculino'),
(39,	'97',	'Maria Fernanda Ramos',	'cônjuge',	'2009-01-11',	'18970435204',	'Feminino'),
(40,	'52',	'Daniela Nascimento',	'mãe',	'1979-06-06',	'01394857675',	'Feminino'),
(41,	'15',	'Luiz Gustavo Caldeira',	'filho',	'2008-12-25',	'18754260949',	'Masculino'),
(42,	'10',	'Benício da Rosa',	'pai',	'1981-04-04',	'89637504184',	'Masculino'),
(43,	'83',	'Sra. Mirella Oliveira',	'filha',	'1998-11-13',	'89106542794',	'Feminino'),
(44,	'149',	'Levi da Paz',	'cônjuge',	'2001-09-03',	'97286534092',	'Masculino'),
(45,	'106',	'Bernardo Ferreira',	'cônjuge',	'2003-02-08',	'35289017640',	'Masculino'),
(46,	'12',	'Isabella Moraes',	'filha',	'2009-07-02',	'98764253074',	'Feminino'),
(47,	'139',	'Carlos Eduardo Caldeira',	'pai',	'1971-11-15',	'61538407280',	'Masculino'),
(48,	'129',	'Letícia da Rosa',	'filha',	'2013-03-10',	'21643850989',	'Feminino'),
(49,	'135',	'Melissa Duarte',	'filha',	'2001-03-06',	'37196248031',	'Feminino'),
(50,	'67',	'Lorena Correia',	'filha',	'2001-02-04',	'03248957123',	'Feminino'),
(51,	'133',	'Sr. Enzo Azevedo',	'pai',	'1985-08-26',	'53917862077',	'Masculino'),
(52,	'103',	'Joaquim Campos',	'cônjuge',	'2015-02-21',	'68235491060',	'Masculino'),
(53,	'64',	'Dra. Maria Julia da Rocha',	'mãe',	'1933-09-05',	'30167452916',	'Feminino'),
(54,	'129',	'Gustavo Henrique Moraes',	'filho',	'2001-07-13',	'43621750835',	'Masculino'),
(55,	'51',	'João Miguel Castro',	'filho',	'2002-03-24',	'40367591839',	'Masculino'),
(56,	'81',	'Bárbara Oliveira',	'mãe',	'1963-03-11',	'40398572160',	'Feminino'),
(57,	'116',	'Sr. Leandro Gomes',	'filho',	'2004-06-20',	'17240863913',	'Masculino'),
(58,	'110',	'Luiz Otávio Moura',	'pai',	'1967-03-09',	'27306145835',	'Masculino'),
(59,	'1',	'Amanda Oliveira',	'mãe',	'1963-11-27',	'94708253141',	'Feminino'),
(60,	'48',	'Lorena Castro',	'cônjuge',	'1998-10-01',	'49158273050',	'Feminino'),
(61,	'48',	'Joaquim da Rosa',	'cônjuge',	'2005-12-07',	'04798125601',	'Masculino'),
(62,	'12',	'Sra. Ana Carolina Farias',	'mãe',	'1968-06-04',	'96813472500',	'Feminino'),
(63,	'138',	'Sr. Emanuel Santos',	'filho',	'2008-04-15',	'64857130262',	'Masculino'),
(64,	'147',	'Bernardo Farias',	'filho',	'2002-11-06',	'72610394543',	'Masculino'),
(65,	'110',	'Dr. Lorenzo Barros',	'filho',	'1995-04-17',	'30159746884',	'Masculino'),
(66,	'92',	'Emanuel Fernandes',	'pai',	'1963-05-11',	'86315790259',	'Masculino'),
(67,	'111',	'Gustavo Henrique da Cruz',	'cônjuge',	'2007-03-04',	'32761809521',	'Masculino'),
(68,	'142',	'Isadora Fernandes',	'mãe',	'1969-02-16',	'27694085347',	'Feminino'),
(69,	'133',	'Raquel Viana',	'cônjuge',	'2013-08-12',	'97238516446',	'Feminino'),
(70,	'30',	'Eloah da Conceição',	'cônjuge',	'2020-02-02',	'39874162546',	'Feminino'),
(71,	'50',	'Alícia Costela',	'filha',	'2012-02-12',	'64872510976',	'Feminino'),
(72,	'41',	'Sra. Daniela da Rocha',	'cônjuge',	'2005-06-23',	'63981502795',	'Feminino'),
(73,	'44',	'Manuela Gonçalves',	'mãe',	'1958-10-31',	'76391052425',	'Feminino'),
(74,	'49',	'Sra. Emanuella Pinto',	'filha',	'2021-11-27',	'93781256030',	'Feminino'),
(75,	'8',	'Laís Oliveira',	'mãe',	'1941-01-28',	'62819754309',	'Feminino'),
(76,	'93',	'Gabriela Alves',	'filha',	'2015-02-21',	'13495670866',	'Feminino'),
(77,	'123',	'Isabelly da Paz',	'cônjuge',	'2010-08-14',	'85149703648',	'Feminino'),
(78,	'135',	'Catarina Peixoto',	'mãe',	'1971-07-17',	'47253860900',	'Feminino'),
(79,	'78',	'Lorenzo da Costa',	'cônjuge',	'1994-12-06',	'61745089276',	'Masculino'),
(80,	'138',	'Maria Julia Santos',	'cônjuge',	'2017-03-04',	'14832790579',	'Feminino'),
(81,	'89',	'Dra. Eloah Dias',	'cônjuge',	'2019-10-08',	'71523689021',	'Feminino'),
(82,	'93',	'Ana Beatriz Castro',	'cônjuge',	'1999-12-05',	'31278605959',	'Feminino'),
(83,	'146',	'Sr. Marcos Vinicius Rocha',	'filho',	'1997-06-07',	'38269147087',	'Masculino'),
(84,	'123',	'Dra. Maria Julia Mendes',	'cônjuge',	'2006-10-10',	'23958746047',	'Feminino'),
(85,	'5',	'Anthony Cardoso',	'filho',	'2004-12-15',	'71254836900',	'Masculino'),
(86,	'147',	'Gabrielly Moura',	'mãe',	'1977-05-25',	'71452809305',	'Feminino'),
(87,	'42',	'Elisa da Costa',	'mãe',	'1967-02-25',	'18960524794',	'Feminino'),
(88,	'141',	'Sra. Emanuelly Moreira',	'filha',	'2000-08-22',	'68217305986',	'Feminino'),
(89,	'114',	'Davi Nunes',	'pai',	'1939-03-14',	'90384721613',	'Masculino'),
(90,	'66',	'Rafaela Santos',	'mãe',	'1943-08-13',	'43612790552',	'Feminino'),
(91,	'105',	'Carlos Eduardo da Mota',	'cônjuge',	'2021-06-01',	'60317954261',	'Masculino'),
(92,	'58',	'Thiago Porto',	'pai',	'1978-05-29',	'51673920802',	'Masculino'),
(93,	'73',	'Luiz Otávio Martins',	'filho',	'2020-02-27',	'20398764565',	'Masculino'),
(94,	'3',	'Srta. Nina da Paz',	'filha',	'2005-12-22',	'94856107267',	'Feminino'),
(95,	'54',	'João Vitor Porto',	'pai',	'1969-05-25',	'25690873195',	'Masculino'),
(96,	'22',	'Dra. Ana Beatriz Caldeira',	'mãe',	'1936-12-30',	'64089521785',	'Feminino'),
(97,	'146',	'Leandro Ferreira',	'pai',	'1945-09-10',	'03791426869',	'Masculino'),
(98,	'66',	'Srta. Daniela Azevedo',	'mãe',	'1986-08-12',	'96340278140',	'Feminino'),
(99,	'67',	'Isaac Nogueira',	'filho',	'2021-04-22',	'81902357450',	'Masculino'),
(100,	'59',	'Julia Melo',	'cônjuge',	'2007-08-07',	'31624850960',	'Feminino'),
(101,	'132',	'Fernando Nogueira',	'pai',	'1932-12-13',	'61304928551',	'Masculino'),
(102,	'120',	'Pedro Vieira',	'cônjuge',	'2023-09-06',	'81049532732',	'Masculino'),
(103,	'18',	'Dra. Eduarda Barros',	'mãe',	'1956-08-27',	'76429301869',	'Feminino'),
(104,	'93',	'Calebe Oliveira',	'filho',	'2000-03-05',	'97328140631',	'Masculino'),
(105,	'89',	'Amanda Mendes',	'cônjuge',	'2023-11-01',	'85912046389',	'Feminino'),
(106,	'20',	'Sr. Yuri Jesus',	'pai',	'1987-02-28',	'81659340233',	'Masculino'),
(107,	'29',	'Dr. Vicente Carvalho',	'pai',	'1969-09-17',	'24760135871',	'Masculino'),
(108,	'2',	'Vinicius da Mota',	'filho',	'2016-10-04',	'68139502405',	'Masculino'),
(109,	'41',	'Isadora Fernandes',	'cônjuge',	'2012-03-29',	'50849163757',	'Feminino'),
(110,	'120',	'Gustavo da Cruz',	'cônjuge',	'2005-05-15',	'59632087429',	'Masculino'),
(111,	'82',	'Dr. Pietro Moura',	'cônjuge',	'1996-04-04',	'96048527101',	'Masculino'),
(112,	'54',	'Henrique Castro',	'pai',	'1988-07-03',	'68502473956',	'Masculino'),
(113,	'67',	'Otávio da Mata',	'pai',	'1963-11-13',	'24857690365',	'Masculino'),
(114,	'130',	'Srta. Sophie Ferreira',	'cônjuge',	'2011-05-07',	'53784120644',	'Feminino'),
(115,	'135',	'Murilo Souza',	'cônjuge',	'2001-08-04',	'42857369000',	'Masculino'),
(116,	'62',	'Augusto Moreira',	'cônjuge',	'1994-07-17',	'24610973804',	'Masculino'),
(117,	'54',	'Dra. Ana Moraes',	'mãe',	'1958-05-21',	'97126503407',	'Feminino'),
(118,	'74',	'Marcela Monteiro',	'cônjuge',	'2009-11-04',	'79632108540',	'Feminino'),
(119,	'116',	'Maysa Gonçalves',	'mãe',	'1986-07-20',	'69520874356',	'Feminino'),
(120,	'34',	'Valentina da Rosa',	'mãe',	'1971-02-03',	'20891354760',	'Feminino'),
(121,	'8',	'Pietra Mendes',	'cônjuge',	'2009-01-13',	'23679854137',	'Feminino'),
(122,	'69',	'Marcos Vinicius Duarte',	'cônjuge',	'1996-06-13',	'94023657107',	'Masculino'),
(123,	'53',	'Rafael Rezende',	'filho',	'2021-05-06',	'95362047116',	'Masculino'),
(124,	'12',	'Luiza Cardoso',	'filha',	'2015-03-07',	'40576298310',	'Feminino'),
(125,	'80',	'Sra. Maria Eduarda Fogaça',	'mãe',	'1962-10-10',	'42918037532',	'Feminino'),
(126,	'111',	'Elisa Mendes',	'filha',	'2015-06-25',	'03891576439',	'Feminino'),
(127,	'150',	'Murilo Jesus',	'cônjuge',	'2018-09-16',	'25089467374',	'Masculino'),
(128,	'57',	'Ian Lima',	'pai',	'1940-04-27',	'73296108521',	'Masculino'),
(129,	'20',	'Brenda Almeida',	'mãe',	'1965-12-15',	'61894057201',	'Feminino'),
(130,	'18',	'Carolina Barbosa',	'cônjuge',	'2020-12-04',	'96284150342',	'Feminino'),
(131,	'23',	'Maria Alice Mendes',	'mãe',	'1993-04-26',	'27408156976',	'Feminino'),
(132,	'36',	'Diego das Neves',	'pai',	'1951-12-26',	'02948617340',	'Masculino'),
(133,	'80',	'Sra. Maria Eduarda Castro',	'filha',	'2021-10-06',	'70652834108',	'Feminino'),
(134,	'32',	'Vitor Nunes',	'pai',	'1965-12-05',	'51047863901',	'Masculino'),
(135,	'69',	'Dra. Emilly Fogaça',	'cônjuge',	'2006-04-08',	'07163259859',	'Feminino'),
(136,	'54',	'Fernanda Jesus',	'cônjuge',	'2013-04-12',	'79124360813',	'Feminino'),
(137,	'23',	'Beatriz Rocha',	'cônjuge',	'2009-05-10',	'31562970461',	'Feminino'),
(138,	'38',	'Sr. Lucas da Cunha',	'pai',	'1990-08-05',	'63294051743',	'Masculino'),
(139,	'96',	'Mariane da Luz',	'filha',	'1994-01-01',	'34098672103',	'Feminino'),
(140,	'22',	'Sra. Ana Luiza Nascimento',	'filha',	'2018-01-25',	'78650319475',	'Feminino'),
(141,	'121',	'Bruno Cunha',	'filho',	'2016-05-26',	'95610738466',	'Masculino'),
(142,	'88',	'Lorena Moura',	'mãe',	'1979-10-29',	'05427316817',	'Feminino'),
(143,	'86',	'Emanuelly Vieira',	'filha',	'1996-04-02',	'26954031780',	'Feminino'),
(144,	'109',	'João Porto',	'cônjuge',	'2001-12-22',	'97054318684',	'Masculino'),
(145,	'6',	'Gustavo Ramos',	'pai',	'1987-04-05',	'12675398446',	'Masculino'),
(146,	'4',	'Benício Sales',	'cônjuge',	'1994-04-03',	'42703165943',	'Masculino'),
(147,	'107',	'Erick Rodrigues',	'filho',	'2000-05-21',	'17086594393',	'Masculino'),
(148,	'148',	'Bruna Fernandes',	'filha',	'2015-12-02',	'69578201494',	'Feminino'),
(149,	'100',	'Maria Eduarda Monteiro',	'cônjuge',	'2007-05-21',	'74591038297',	'Feminino'),
(150,	'33',	'Isadora Nascimento',	'filha',	'2000-03-21',	'56019372499',	'Feminino'),
(151,	'16',	'Vitor Ribeiro',	'pai',	'1969-08-04',	'53172498050',	'Masculino'),
(152,	'34',	'Gabrielly Porto',	'filha',	'2001-12-16',	'72964583137',	'Feminino'),
(153,	'86',	'Daniel Moura',	'filho',	'2001-07-04',	'72056913895',	'Masculino'),
(154,	'126',	'Nicole Farias',	'filha',	'2010-06-16',	'05192478332',	'Feminino'),
(155,	'38',	'Yago Martins',	'pai',	'1979-04-08',	'31768425035',	'Masculino'),
(156,	'150',	'Otávio Peixoto',	'pai',	'1959-11-15',	'85460739292',	'Masculino'),
(157,	'72',	'Ana Lívia Fernandes',	'mãe',	'1990-04-27',	'62049851324',	'Feminino'),
(158,	'14',	'Eduardo Lopes',	'pai',	'1973-01-25',	'23641850924',	'Masculino'),
(159,	'103',	'Davi Lucca Peixoto',	'cônjuge',	'2005-06-16',	'04956873247',	'Masculino'),
(160,	'89',	'Gabriel Farias',	'pai',	'1992-06-21',	'31425679099',	'Masculino'),
(161,	'133',	'Theo Peixoto',	'filho',	'2003-08-31',	'95672438083',	'Masculino'),
(162,	'75',	'Benício Almeida',	'filho',	'2013-06-11',	'32598706102',	'Masculino'),
(163,	'94',	'Dra. Catarina Carvalho',	'filha',	'2016-08-24',	'45760123807',	'Feminino'),
(164,	'143',	'Marcela da Rosa',	'mãe',	'1991-11-27',	'39607581202',	'Feminino'),
(165,	'106',	'Joaquim Castro',	'filho',	'2013-04-09',	'62819307469',	'Masculino'),
(166,	'75',	'Stephany Nunes',	'filha',	'2006-10-19',	'65230894792',	'Feminino'),
(167,	'98',	'Ana Sophia Dias',	'filha',	'2011-01-22',	'85732904638',	'Feminino'),
(168,	'75',	'Sr. Otávio Ramos',	'cônjuge',	'2007-12-11',	'58279341005',	'Masculino'),
(169,	'4',	'Alice da Costa',	'filha',	'2008-03-04',	'67958013493',	'Feminino'),
(170,	'82',	'Bárbara Aragão',	'filha',	'2021-03-11',	'56703812977',	'Feminino'),
(171,	'39',	'Sr. Kaique Aragão',	'filho',	'2021-04-26',	'74310652808',	'Masculino'),
(172,	'140',	'Juliana Monteiro',	'filha',	'2003-10-29',	'68507312462',	'Feminino'),
(173,	'13',	'Mariana Cavalcanti',	'cônjuge',	'2004-03-02',	'31807465993',	'Feminino'),
(174,	'20',	'Thomas Monteiro',	'filho',	'2008-08-19',	'47326085153',	'Masculino'),
(175,	'16',	'Gustavo Carvalho',	'pai',	'1984-10-13',	'18237056930',	'Masculino'),
(176,	'8',	'Gabrielly Pires',	'filha',	'2001-09-21',	'38941507693',	'Feminino'),
(177,	'32',	'Marcos Vinicius Barros',	'cônjuge',	'2019-08-16',	'46975321809',	'Masculino'),
(178,	'9',	'Pietro Costela',	'cônjuge',	'1995-09-23',	'30689574274',	'Masculino'),
(179,	'136',	'Dr. Davi Lucca Souza',	'pai',	'1966-09-02',	'80951347241',	'Masculino'),
(180,	'132',	'Isabelly Farias',	'cônjuge',	'2008-02-24',	'49037851657',	'Feminino'),
(181,	'123',	'Maitê Sales',	'cônjuge',	'2007-04-26',	'36429157873',	'Feminino'),
(182,	'136',	'Thales da Mota',	'cônjuge',	'2014-10-08',	'94708516258',	'Masculino'),
(183,	'77',	'Kamilly Duarte',	'mãe',	'1939-06-15',	'24571398050',	'Feminino'),
(184,	'141',	'Sra. Helena Teixeira',	'cônjuge',	'2002-11-11',	'58430917241',	'Feminino'),
(185,	'132',	'Clara Moura',	'cônjuge',	'1994-01-24',	'32685714090',	'Feminino'),
(186,	'26',	'Enzo Gabriel Silveira',	'filho',	'2019-03-15',	'54061389793',	'Masculino'),
(187,	'87',	'Joana Cunha',	'mãe',	'1979-10-26',	'12547693828',	'Feminino'),
(188,	'26',	'Alexandre da Conceição',	'pai',	'1988-10-15',	'35864179000',	'Masculino'),
(189,	'31',	'João Pedro Castro',	'pai',	'1936-06-09',	'03146952815',	'Masculino'),
(190,	'139',	'Dr. Luiz Henrique Costela',	'cônjuge',	'1999-07-02',	'84173526008',	'Masculino'),
(191,	'57',	'Rafaela da Rosa',	'mãe',	'1940-07-16',	'56702918402',	'Feminino'),
(192,	'32',	'Amanda Barros',	'mãe',	'1936-04-15',	'30921586795',	'Feminino'),
(193,	'60',	'Letícia Pires',	'mãe',	'1951-09-17',	'10493257616',	'Feminino'),
(194,	'18',	'Sofia Ribeiro',	'cônjuge',	'2000-11-21',	'02145367853',	'Feminino'),
(195,	'29',	'Vitor Gabriel Santos',	'filho',	'2015-03-09',	'39176502406',	'Masculino'),
(196,	'110',	'Lucca Moura',	'filho',	'1994-11-24',	'61053748957',	'Masculino'),
(197,	'6',	'Alexandre Santos',	'cônjuge',	'2004-11-12',	'04238975600',	'Masculino'),
(198,	'139',	'Pietro Nascimento',	'filho',	'1997-02-22',	'73295186464',	'Masculino'),
(199,	'6',	'Davi Lucca da Rocha',	'cônjuge',	'2011-07-28',	'86039547120',	'Masculino'),
(200,	'139',	'Alexia da Mota',	'filha',	'2011-10-03',	'60938274538',	'Feminino'),
(201,	'98',	'Vitória Cunha',	'cônjuge',	'2023-04-26',	'46028975176',	'Feminino'),
(202,	'73',	'Pedro Miguel Teixeira',	'pai',	'1975-11-18',	'96324718069',	'Masculino'),
(203,	'111',	'Dr. Bruno Farias',	'pai',	'1948-01-15',	'31628479078',	'Masculino'),
(204,	'145',	'Sophia Farias',	'filha',	'2005-04-21',	'25804763938',	'Feminino'),
(205,	'3',	'Pedro da Rosa',	'filho',	'2008-09-02',	'30248976150',	'Masculino'),
(206,	'113',	'Marina Cavalcanti',	'mãe',	'1964-01-30',	'36084971296',	'Feminino'),
(207,	'39',	'Amanda Almeida',	'filha',	'2013-01-15',	'37256190859',	'Feminino'),
(208,	'35',	'Ana Moraes',	'cônjuge',	'2014-12-06',	'67901285494',	'Feminino'),
(209,	'147',	'Rebeca Barbosa',	'cônjuge',	'2019-03-15',	'35041869251',	'Feminino'),
(210,	'35',	'Brenda Duarte',	'cônjuge',	'2013-06-02',	'76053124826',	'Feminino'),
(211,	'52',	'Francisco Gomes',	'cônjuge',	'1996-11-26',	'62408531780',	'Masculino'),
(212,	'148',	'Leandro Pinto',	'filho',	'1999-05-30',	'89514237609',	'Masculino'),
(213,	'93',	'Vitor Cardoso',	'pai',	'1964-05-17',	'52870946120',	'Masculino'),
(214,	'128',	'Sr. Luiz Gustavo Martins',	'filho',	'1996-01-09',	'80314592741',	'Masculino'),
(215,	'75',	'Bianca Martins',	'filha',	'2009-06-30',	'36254970180',	'Feminino'),
(216,	'72',	'Emanuella Campos',	'filha',	'2006-08-02',	'24051367835',	'Feminino'),
(217,	'128',	'Clarice Monteiro',	'mãe',	'1952-05-24',	'63091785475',	'Feminino'),
(218,	'44',	'Diego Melo',	'filho',	'1994-02-28',	'37091245652',	'Masculino'),
(219,	'86',	'Ana Júlia Dias',	'mãe',	'1984-04-29',	'46278593092',	'Feminino'),
(220,	'10',	'Srta. Fernanda Mendes',	'mãe',	'1948-05-14',	'09831527488',	'Feminino'),
(221,	'14',	'Luigi Silveira',	'filho',	'1994-04-16',	'36148072904',	'Masculino'),
(222,	'4',	'Isadora Almeida',	'filha',	'2013-06-30',	'81260379540',	'Feminino'),
(223,	'24',	'Pedro Miguel Alves',	'filho',	'2016-10-20',	'14582379664',	'Masculino'),
(224,	'6',	'Maria Cecília Azevedo',	'filha',	'2006-01-22',	'97540613270',	'Feminino'),
(225,	'145',	'Luiza da Mata',	'filha',	'2007-03-17',	'90581267494',	'Feminino'),
(226,	'87',	'Isabelly Gomes',	'cônjuge',	'2023-06-02',	'25681307921',	'Feminino'),
(227,	'48',	'Maria Fernanda Rocha',	'cônjuge',	'2021-04-16',	'75210639452',	'Feminino'),
(228,	'18',	'Valentina Cardoso',	'mãe',	'1985-12-26',	'02968537121',	'Feminino'),
(229,	'5',	'Marcos Vinicius Moraes',	'filho',	'2001-01-24',	'59204317841',	'Masculino'),
(230,	'39',	'Luana Souza',	'cônjuge',	'2008-10-11',	'65798324010',	'Feminino'),
(231,	'126',	'Sr. Levi Souza',	'filho',	'2005-04-28',	'10274953625',	'Masculino'),
(232,	'85',	'Stephany Correia',	'filha',	'2009-08-01',	'59817046249',	'Feminino'),
(233,	'55',	'João Lucas Viana',	'pai',	'1993-01-30',	'31859642098',	'Masculino'),
(234,	'68',	'Raul da Conceição',	'filho',	'2012-10-04',	'43960172869',	'Masculino'),
(235,	'35',	'Isabella Barros',	'filha',	'2018-03-27',	'65891427001',	'Feminino'),
(236,	'11',	'Bruna Souza',	'cônjuge',	'2015-05-06',	'71435286928',	'Feminino'),
(237,	'75',	'Noah Sales',	'cônjuge',	'1995-01-14',	'82543690115',	'Masculino'),
(238,	'16',	'João Lucas Costela',	'filho',	'2005-04-27',	'65032897159',	'Masculino'),
(239,	'62',	'Natália Alves',	'cônjuge',	'1995-03-01',	'17805432635',	'Feminino'),
(240,	'76',	'Amanda da Mota',	'filha',	'1997-08-09',	'60879251476',	'Feminino'),
(241,	'82',	'Renan Moura',	'filho',	'1997-04-03',	'91326705830',	'Masculino'),
(242,	'107',	'Alexandre Silva',	'pai',	'1991-04-21',	'12639580442',	'Masculino'),
(243,	'124',	'Evelyn Barbosa',	'mãe',	'1945-02-01',	'15430782904',	'Feminino'),
(244,	'100',	'Laura Freitas',	'filha',	'2005-07-28',	'34970861269',	'Feminino'),
(245,	'47',	'Isadora Correia',	'filha',	'2016-11-25',	'09612574316',	'Feminino'),
(246,	'59',	'Vitor Hugo Pires',	'pai',	'1942-10-02',	'97213846582',	'Masculino'),
(247,	'139',	'Luna Costa',	'mãe',	'1959-08-04',	'57093268447',	'Feminino'),
(248,	'135',	'Cauã Pereira',	'pai',	'1972-04-24',	'31672409543',	'Masculino'),
(249,	'86',	'Emilly Dias',	'mãe',	'1960-02-05',	'41762039869',	'Feminino'),
(250,	'124',	'Isabelly das Neves',	'cônjuge',	'2000-03-08',	'82634079150',	'Feminino');
