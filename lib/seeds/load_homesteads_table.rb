module Seeds::LoadHomesteadsTable 
=begin
   первичная загрузка участков 
=end

  # Seeds::LoadHomesteadsTable.load_homesteads 
  def self.load_homesteads
    nn = 0
    self.parsed_datas.each do |hom|
      nn += self.load_one_homestead(hom)
    end
    nn != 0
  end  
    
    
  def self.load_one_homestead(h)
    cost = (h[8].to_i * h[9].to_i / 100).to_s 
    hom = Homestead.create({
      :domain_id     => h[2],         ## :integer   номер территории
      :sector_id     => h[3].to_i,    ## :integer   номер сектора
      :land_use_id   => h[4].to_i,    ## :integer   категория использования
      :phase         => h[5].to_i,    ##            очередь ввода
      :site_num      => h[6].to_s,    ## :string    номер участка (ду)
      :cadastral_num => h[7].to_s,    ## :string    кадастровый номер
      :status_id     => 2,            ## :integer   статус участка
      :square_meters => h[8].to_s,    ## :string    площадь в кв метрах
      :price_for_are => h[9].to_s,    ## :string    цена за сотку
      :price_infra   => '300000',     ## :string    цена за инфраструктуру
      :price         => cost,         ## :string    цена за участок
      :discount      => 0,            ## :string    скидка/наценка
      :note          => h[12].to_s    ##            комментарий
     }
    )
    hom ? 1 : 0
  end


  ##	 2  номер  территории
  ##   3  сектор
  ##   4  категория использования
  ##   5  очередь ввода
  ##   6  номер участка (ду)
  ##   7  кадастровый номер
  ##   8  площадь в кв метрах
  ##   9  цена за сотку
  ##  10  цена за инфраструктуру
  ##  11  стоимость участка
  ##  12  Комментарий


  def self.parsed_datas
    self.datas.map{|h| self.parser_one( h.split(/\t/) ) }
  end

  
  def self.parser_one(str)
    str.map do |h|
      res = ''
      if h.to_s =~ /\d/
        res = h.to_s.gsub(/\s/, '').to_i
      else
        res = h.to_s if h.to_s.size > 3
      end
      res
    end
  end


  def self.datas
   [ ' 	1	2		3	1	1	236	1200	30000	300 000	360 000	лесные участки	 ',
     ' 	2	2		3	1	2	236	1100	30000	300 000	330 000	лесные участки	 ',
     ' 	3	2		3	1	3	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	4	2		3	1	4	236	1100	30000	300 000	330 000		 ',
     ' 	5	2		3	1	5	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	6	2		3	1	6	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	7	2		3	1	7	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	8	2		3	1	8	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	9	2		3	1	9	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	10	2		3	1	10	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	11	2		3	1	11	236	1200	30000	300 000	360 000	лесные участки	 ',
     ' 	12	2		3	1	12	236	1150	30000	300 000	345 000	лесные участки	 ',
     ' 	13	2		3	1	13	236	1200	30000	300 000	360 000	лесные участки	 ',
     ' 	14	2		3	1	14	236	1150	30000	300 000	345 000	лесные участки	 ',
     ' 	15	2		3	1	15	236	1150	30000	300 000	345 000	лесные участки	 ',
     ' 	16	2		3	1	16	236	950	30000	300 000	285 000	лесные участки	 ',
     ' 	17	2		3	1	17	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	18	2		3	1	18	236	950	30000	300 000	285 000	лесные участки	 ',
     ' 	19	2		3	1	19	236	1150	30000	300 000	345 000	лесные участки	 ',
     ' 	20	2		3	1	20	236	1200	30000	300 000	360 000	лесные участки	 ',
     ' 	21	2		3	1	21	236	1150	30000	300 000	345 000	лесные участки	 ',
     ' 	22	2		3	1	22	236	950	30000	300 000	285 000	лесные участки	 ',
     ' 	23	2		3	1	23	236	850	30000	300 000	255 000	лесные участки	 ',
     ' 	24	2		3	1	24	236	800	30000	300 000	240 000	лесные участки	 ',
     ' 	25	2		3	1	25	236	800	30000	300 000	240 000	лесные участки	 ',
     ' 	26	2		3	1	26	236	850	30000	300 000	255 000	лесные участки	 ',
     ' 	27	2		3	1	27	236	900	30000	300 000	270 000	лесные участки	 ',
     ' 	28	2		3	1	28	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	29	2		3	1	29	236	1000	30000	300 000	300 000	лесные участки	 ',
     ' 	30	2		3	1	30	236	1000	30000	300 000	300 000		 ',
     ' 	31	2		3	1	31	236	900	30000	300 000	270 000		 ',
     ' 	32	2		3	1	32	236	900	30000	300 000	270 000		 ',
     ' 	33	2		3	1	33	236	800	30000	300 000	240 000		 ',
     ' 	34	2		3	1	34	236	900	30000	300 000	270 000		 ',
     ' 	35	2		3	1	35	236	1000	30000	300 000	300 000		 ',
     ' 	36	2		3	1	36	236	900	30000	300 000	270 000		 ',
     ' 	1	3		3	1	1	295	1300	30000	300 000	390 000		 ',
     ' 	2	3		3	1	2	295	810	30000	300 000	243 000		 ',
     ' 	3	3		3	1	3	295	1200	30000	300 000	360 000		 ',
     ' 	4	3		3	1	4	295	1000	30000	300 000	300 000		 ',
     ' 	5	3		3	1	5	295	1200	30000	300 000	360 000		 ',
     ' 	6	3		3	1	6	295	1000	30000	300 000	300 000		 ',
     ' 	7	3		3	1	7	295	1200	30000	300 000	360 000		 ',
     ' 	8	3		3	1	8	295	1000	30000	300 000	300 000		 ',
     ' 	9	3		3	1	9	295	1200	30000	300 000	360 000		 ',
     ' 	10	3		3	1	10	295	1000	30000	300 000	300 000		 ',
     ' 	11	3		3	1	11	295	1200	30000	300 000	360 000		 ',
     ' 	12	3		3	1	12	295	1125	30000	300 000	337 500		 ',
     ' 	13	3		3	1	13	295	1200	30000	300 000	360 000		 ',
     ' 	14	3		3	1	14	295	1000	30000	300 000	300 000		 ',
     ' 	15	3		3	1	15	295	1200	30000	300 000	360 000		 ',
     ' 	16	3		3	1	16	295	1000	30000	300 000	300 000		 ',
     ' 	17	3		3	1	17	295	1000	30000	300 000	300 000		 ',
     ' 	18	3		3	1	18	295	1140	30000	300 000	342 000		 ',
     ' 	19	3		3	1	19	295	1100	30000	300 000	330 000		 ',
     ' 	20	3		3	1	20	295	1115	30000	300 000	334 500		 ',
     ' 	21	3		3	1	21	295	1000	30000	300 000	300 000		 ',
     ' 	22	3		3	1	22	295	1200	30000	300 000	360 000		 ',
     ' 	23	3		3	1	23	295	1000	30000	300 000	300 000		 ',
     ' 	24	3		3	1	24	295	1200	30000	300 000	360 000		 ',
     ' 	25	3		3	1	25	295	1000	30000	300 000	300 000		 ',
     ' 	26	3		3	1	26	295	1200	30000	300 000	360 000		 ',
     ' 	27	3		3	1	27	295	1000	30000	300 000	300 000		 ',
     ' 	28	3		3	1	28	295	1200	30000	300 000	360 000		 ',
     ' 	29	3		3	1	29	295	1260	30000	300 000	378 000		 ',
     ' 	30	3		3	1	30	295	1200	30000	300 000	360 000		 ',
     ' 	31	3		3	1	31	295	1250	30000	300 000	375 000		 ',
     ' 	32	3		3	1	32	295	1280	30000	300 000	384 000		 ',
     ' 	33	3		3	1	33	295	1000	30000	300 000	300 000		 ',
     ' 	34	3		3	1	34	295	900	30000	300 000	270 000		 ',
     ' 	35	3		3	1	35	295	900	30000	300 000	270 000		 ',
     ' 	36	3		3	1	36	295	1100	30000	300 000	330 000		 ',
     ' 	37	3		3	1	37	295	900	30000	300 000	270 000		 ',
     ' 	38	3		3	1	38	295	1000	30000	300 000	300 000		 ',
     ' 	39	3		3	1	39	295	900	30000	300 000	270 000		 ',
     ' 	40	3		3	1	40	295	1000	30000	300 000	300 000		 ',
     ' 	41	3		3	1	41	295	900	30000	300 000	270 000		 ',
     ' 	42	3		3	1	42	295	1000	30000	300 000	300 000		 ',
     ' 	43	3		3	1	43	295	900	30000	300 000	270 000		 ',
     ' 	44	3		3	1	44	295	1000	30000	300 000	300 000		 ',
     ' 	45	3		3	1	45	295	900	30000	300 000	270 000		 ',
     ' 	46	3		3	1	46	295	1130	30000	300 000	339 000		 ',
     ' 	47	3		3	1	47	295	1170	30000	300 000	351 000		 ',
     ' 	48	3		3	1	48	295	1250	30000	300 000	375 000		 ',
     ' 	49	3		3	1	49	295	1200	30000	300 000	360 000		 ',
     ' 	50	3		3	1	50	295	1000	30000	300 000	300 000		 ',
     ' 	51	3		3	1	51	295	1300	30000	300 000	390 000		 ',
     ' 	52	3		3	1	52	295	800	30000	300 000	240 000		 ',
     ' 	53	3		3	1	53	295	1120	30000	300 000	336 000		 ',
     ' 	54	3		3	1	54	295	900	30000	300 000	270 000		 ',
     ' 	55	3		3	1	55	295	1000	30000	300 000	300 000		 ',
     ' 	56	3		3	1	56	295	900	30000	300 000	270 000		 ',
     ' 	57	3		3	1	57	295	1000	30000	300 000	300 000		 ',
     ' 	58	3		3	1	58	295	920	30000	300 000	276 000		 ',
     ' 	59	3		3	1	59	295	1100	30000	300 000	330 000		 ',
     ' 	60	3		3	1	60	295	900	30000	300 000	270 000		 ',
     ' 	61	3		3	1	61	295	1000	30000	300 000	300 000		 ',
     ' 	62	3		3	1	62	295	900	30000	300 000	270 000		 ',
     ' 	63	3		3	1	63	295	1000	30000	300 000	300 000		 ',
     ' 	64	3		3	1	64	295	900	30000	300 000	270 000		 ',
     ' 	65	3		3	1	65	295	1000	30000	300 000	300 000		 ',
     ' 	66	3		3	1	66	295	830	30000	300 000	249 000		 ',
     ' 	67	3		3	1	67	295	1000	30000	300 000	300 000		 ',
     ' 	68	3		3	1	68	295	900	30000	300 000	270 000		 ',
     ' 	69	3		3	1	69	295	1000	30000	300 000	300 000		 ',
     ' 	70	3		3	1	70	295	900	30000	300 000	270 000		 ',
     ' 	71	3		3	1	71	295	1000	30000	300 000	300 000		 ',
     ' 	72	3		3	1	72	295	900	30000	300 000	270 000		 ',
     ' 	73	3		3	1	73	295	1000	30000	300 000	300 000		 ',
     ' 	74	3		3	1	74	295	900	30000	300 000	270 000		 ',
     ' 	75	3		3	1	75	295	1000	30000	300 000	300 000		 ',
     ' 	76	3		3	1	76	295	900	30000	300 000	270 000		 ',
     ' 	77	3		3	1	77	295	1000	30000	300 000	300 000		 ',
     ' 	78	3		3	1	78	295	950	30000	300 000	285 000		 ',
     ' 	79	3		3	1	79	295	1350	30000	300 000	405 000		 ',
     ' 	80	3		3	1	80	295	1000	30000	300 000	300 000		 ',
     ' 	81	3		3	1	81	295	900	30000	300 000	270 000		 ',
     ' 	82	3		3	1	82	295	900	30000	300 000	270 000		 ',
     ' 	83	3		3	1	83	295	900	30000	300 000	270 000		 ',
     ' 	84	3		3	1	84	295	1000	30000	300 000	300 000		 ',
     ' 	85	3		3	1	85	295	1050	30000	300 000	315 000		 ',
     ' 	86	3		3	1	86	295	1000	30000	300 000	300 000		 ',
     ' 	87	3		3	1	87	295	1000	30000	300 000	300 000		 ',
     ' 	88	3		3	1	88	295	1000	30000	300 000	300 000		 ',
     ' 	89	3		3	1	89	295	1000	30000	300 000	300 000		 ',
     ' 	90	3		3	1	90	295	900	30000	300 000	270 000		 ',
     ' 	91	3		3	1	91	295	930	30000	300 000	279 000		 ',
     ' 	92	3		3	1	92	295	900	30000	300 000	270 000		 ',
     ' 	93	3		3	1	93	295	850	30000	300 000	255 000		 ',
     ' 	94	3		3	1	94	295	1000	30000	300 000	300 000		 ',
     ' 	95	3		3	1	95	295	1000	30000	300 000	300 000		 ',
     ' 	96	3		3	1	96	295	1000	30000	300 000	300 000		 ',
     ' 	97	3		3	1	97	295	1000	30000	300 000	300 000		 ',
     ' 	98	3		3	1	98	295	1000	30000	300 000	300 000		 ',
     ' 	99	3		3	1	99	295	1000	30000	300 000	300 000		 ',
     ' 	100	3		3	1	100	295	1000	30000	300 000	300 000		 ',
     ' 	101	3		3	1	101	295	1000	30000	300 000	300 000		 ',
     ' 	102	3		3	1	102	295	1040	30000	300 000	312 000		 ',
     ' 	103	3		3	1	103	295	635	30000	300 000	190 500		 ',
     ' 	104	3		3	1	104	295	700	30000	300 000	210 000		 ',
     ' 	105	3		3	1	105	295	800	30000	300 000	240 000		 ',
     ' 	106	3		3	1	106	295	800	30000	300 000	240 000		 ',
     ' 	107	3		3	1	107	295	800	30000	300 000	240 000		 ',
     ' 	108	3		3	1	108	295	1200	30000	300 000	360 000		 ',
     ' 	109	3		3	1	109	295	1300	30000	300 000	390 000		 ',
     ' 	110	3		3	1	110	295	1000	30000	300 000	300 000		 ',
     ' 	111	3		3	1	111	295	900	30000	300 000	270 000		 ',
     ' 	112	3		3	1	112	295	1070	30000	300 000	321 000		 ',
     ' 	113	3		3	1	113	295	1100	30000	300 000	330 000		 ',
     ' 	114	3		3	1	114	295	800	30000	300 000	240 000		 ',
     ' 	115	3		3	1	115	295	800	30000	300 000	240 000		 ',
     ' 	116	3		3	1	116	295	800	30000	300 000	240 000		 ',
     ' 	117	3		3	1	117	295	800	30000	300 000	240 000		 ',
     ' 	118	3		3	1	118	295	800	30000	300 000	240 000		 ',
     ' 	119	3		3	1	119	295	800	30000	300 000	240 000		 ',
     ' 	120	3		3	1	120	295	800	30000	300 000	240 000		 ',
     ' 	121	3		3	1	121	295	800	30000	300 000	240 000		 ',
     ' 	122	3		3	1	122	295	1230	30000	300 000	369 000		 ',
     ' 	123	3		3	1	123	295	1100	30000	300 000	330 000		 ',
     ' 	1	1	101	3	1	1 	225	 1100 	180000	300 000		Прямо у воды	 ',
     ' 	2	1	101	3	1	2 	225	 1300 	180000	300 000			 ',
     ' 	3	1	101	3		3 	225	 1050 					 ',
     ' 	4	1	101	3		4 	225	 1200 					 ',
     ' 	5	1	101	3	1	5 	225	 1000 	180000	300 000			 ',
     ' 	6	1	101	3		6 	225	 1000 					 ',
     ' 	7	1	101	3		7 	225	 1200 					 ',
     ' 	8	1	101	3		8 	225	 1200 					 ',
     ' 	9	1	101	3		9 	225	 1000 					 ',
     ' 	10	1	101	3		10 	225	 1080 					 ',
     ' 	11	1	101	3		11 	225	 1500 					 ',
     ' 	12	1	101	3		12 	225	 1200					 ',
     ' 	13	1	101	3		13 	225	 1000 					 ',
     ' 	14	1	101	3		14 	225	 1000 					 ',
     ' 	15	1	101	3		15 	225	 1200 					 ',
     ' 	16	1	101	3		16 	225	 1350					 ',
     ' 	17	1	101	3		17 	225	 1000 					 ',
     ' 	18	1	101	3		18 	225	 1200 					 ',
     ' 	19	1	101	3		19 	225	 1400 					 ',
     ' 	20	1	101	3		20 	225	 1000 					 ',
     ' 	21	1	101	3		21 	225	 1550 					 ',
     ' 	22	1	101	3		22 	225	 1650 					 ',
     ' 	23	1	101	3		23 	225	 1500 					 ',
     ' 	24	1	101	3		24 	225	 1000 					 ',
     ' 	25	1	101	3		25 	225	 1200 					 ',
     ' 	26	1	101	3		26 	225	 1000 					 ',
     ' 	27	1	101	3		27 	225	 1200 					 ',
     ' 	28	1	101	3		28 	225	 1000 					 ',
     ' 	29	1	101	3		29 	225	 1200 					 ',
     ' 	30	1	101	3		30 	225	 1000 					 ',
     ' 	31	1	101	3		31 	225	 1200 					 ',
     ' 	32	1	101	3		32 	225	 1000 					 ',
     ' 	33	1	101	3		33 	225	 1200 					 ',
     ' 	34	1	101	3		34 	225	 1000 					 ',
     ' 	35	1	101	3		35 	225	 1200 					 ',
     ' 	36	1	101	3		36 	225	 1000 					 ',
     ' 	37	1	101	3		37 	225	 1350 					 ',
     ' 	38	1	101	3		38 	225	 1000 					 ',
     ' 	39	1	101	3		39 	225	 1350					 ',
     ' 	40	1	101	3		40 	225	 1000 					 ',
     ' 	41	1	101	3		41 	225	 1000 					 ',
     ' 	42	1	101	3		42 	225	 1200 					 ',
     ' 	43	1	101	3		43 	225	 1000 					 ',
     ' 	44	1	101	3		44 	225	 1000 					 ',
     ' 	45	1	101	3		45 	225	 1200 					 ',
     ' 	46	1	102	3	1	46 	225	 900 	150000	300 000			 ',
     ' 	47	1	102	3	1	47 	225	 1290 	150000	300 000			 ',
     ' 	48	1	102	3	1	48 	225	 1200 	150000	300 000			 ',
     ' 	49	1	102	3		49 	225	 1100 					 ',
     ' 	50	1	102	3		50 	225	 1100 					 ',
     ' 	51	1	102	3		51 	225	 1200 					 ',
     ' 	52	1	102	3		52 	225	 1200 					 ',
     ' 	53	1	102	3		53 	225	 1200 					 ',
     ' 	54	1	102	3		54 	225	 1350					 ',
     ' 	55	1	102	3		55 	225	 1200 					 ',
     ' 	56	1	102	3		56 	225	 1000 					 ',
     ' 	57	1	102	3		57 	225	 1200 					 ',
     ' 	58	1	102	3		58 	225	 1000 					 ',
     ' 	59	1	102	3		59 	225	 1200 					 ',
     ' 	60	1	102	3		60 	225	 1000 					 ',
     ' 	61	1	102	3		61 	225	 1200 					 ',
     ' 	62	1	102	3		62 	225	 1000 					 ',
     ' 	63	1	102	3		63 	225	 1200 					 ',
     ' 	64	1	102	3		64 	225	 1000 					 ',
     ' 	65	1	102	3		65 	225	 1200 					 ',
     ' 	66	1	102	3		66 	225	 1000 					 ',
     ' 	67	1	102	3		67 	225	 1200 					 ',
     ' 	68	1	102	3		68 	225	 1350 					 ',
     ' 	69	1	102	3		69 	225	 1200 					 ',
     ' 	70	1	102	3		70 	225	 1300 					 ',
     ' 	71	1	102	3		71 	225	 1000 					 ',
     ' 	72	1	102	3		72 	225	 800 					 ',
     ' 	73	1	102	3		73 	225	 1400 					 ',
     ' 	74	1	102	3		74 	225	 900 					 ',
     ' 	75	1	102	3		75 	225	 1000 					 ',
     ' 	76	1	102	3		76 	225	 1200 					 ',
     ' 	77	1	102	3		77 	225	 1000 					 ',
     ' 	78	1	102	3		78 	225	 1200 					 ',
     ' 	79	1	102	3		79 	225	 1000 					 ',
     ' 	80	1	102	3		80 	225	 1200 					 ',
     ' 	81	1	102	3		81 	225	 1000 					 ',
     ' 	82	1	102	3		82 	225	 1200 					 ',
     ' 	83	1	102	3		83 	225	 1000 					 ',
     ' 	84	1	102	3		84 	225	 1200 					 ',
     ' 	85	1	102	3		85 	225	 1000 					 ',
     ' 	86	1	102	3		86 	225	 1200 					 ',
     ' 	87	1	102	3		87 	225	 1000 					 ',
     ' 	88	1	102	3		88 	225	 1200 					 ',
     ' 	89	1	102	3		89 	225	 1000 					 ',
     ' 	90	1	102	3		90 	225	 1200 					 ',
     ' 	91	1	102	3	1	91 	225	 1000 	150000	300 000			 ',
     ' 	92	1	102	3		92 	225	 1200 					 ',
     ' 	93	1	102	3	1	93 	225	 1000 	150000	300 000			 ',
     ' 	94	1	102	3		94 	225	 1200 					 ',
     ' 	95	1	102	3	1	95 	225	 1000 	150000	300 000			 ',
     ' 	96	1	102	3		96 	225	 1200 					 ',
     ' 	97	1	102	3	1	97 	225	 1150 	150000	300 000			 ',
     ' 	98	1	102	3		98 	225	 1100 					 ',
     ' 	99	1	102	3	1	99 	225	 1450 	150000	300 000			 ',
     ' 	100	1	102	3	1	100 	225	 1200 	150000	300 000			 ',
     ' 	101	1	103	3		101 	225	 900 					 ',
     ' 	102	1	103	3		102 	225	 800 					 ',
     ' 	103	1	103	3		103 	225	 598 					 ',
     ' 	104	1	103	3		104 	225	 1000 					 ',
     ' 	105	1	103	3		105 	225	 1000 					 ',
     ' 	106	1	103	3		106 	225	 1000 					 ',
     ' 	107	1	103	3		107 	225	 1000 					 ',
     ' 	108	1	103	3		108 	225	 1000 					 ',
     ' 	109	1	103	3		109 	225	 1000 					 ',
     ' 	110	1	103	3		110 	225	 1000 					 ',
     ' 	111	1	103	3		111 	225	 1000 					 ',
     ' 	112	1	103	3		112 	225	 1100 					 ',
     ' 	113	1	103	3		113 	225	 1000 					 ',
     ' 	114	1	103	3		114 	225	 1250 					 ',
     ' 	115	1	103	3		115 	225	 1380 					 ',
     ' 	116	1	103	3		116 	225	 1100 					 ',
     ' 	117	1	103	3		117 	225	 1000 					 ',
     ' 	118	1	103	3		118 	225	 1000 					 ',
     ' 	119	1	103	3		119 	225	 1000 					 ',
     ' 	120	1	103	3		120 	225	 1000 					 ',
     ' 	121	1	103	3		121 	225	 1000 					 ',
     ' 	122	1	103	3		122 	225	 1000 					 ',
     ' 	123	1	103	3		123 	225	 1000 					 ',
     ' 	124	1	103	3		124 	225	 1000 					 ',
     ' 	125	1	103	3		125 	225	 1000 					 ',
     ' 	126	1	103	3		126 	225	 1000 					 ',
     ' 	127	1	103	3		127 	225	 1000 					 ',
     ' 	128	1	103	3		128 	225	 1000 					 ',
     ' 	129	1	103	3	1	129 	225	 1000 	120000	300 000			 ',
     ' 	130	1	103	3	1	130 	225	 1000 	120000	300 000			 ',
     ' 	131	1	103	3	1	131 	225	 1000 	120000	300 000			 ',
     ' 	132	1	103	3	1	132 	225	 1000 	120000	300 000			 ',
     ' 	133	1	103	3	1	133 	225	 1000 	120000	300 000			 ',
     ' 	134	1	103	3	1	134 	225	 1100 	120000	300 000			 ',
     ' 	135	1	103	3	1	135 	225	 1000 	120000	300 000			 ',
     ' 	136	1	103	3	1	136 	225	 1000 	120000	300 000			 ',
     ' 	137	1	104	3		137 	225	 900 					 ',
     ' 	138	1	104	3		138 	225	 1000 					 ',
     ' 	139	1	104	3		139 	225	 1000 					 ',
     ' 	140	1	104	3		140 	225	 1000 					 ',
     ' 	141	1	104	3		141 	225	 1000 					 ',
     ' 	142	1	104	3		142 	225	 1000 					 ',
     ' 	143	1	104	3		143 	225	 1000 					 ',
     ' 	144	1	104	3		144 	225	 1000 					 ',
     ' 	145	1	104	3	1	145 	225	 1200 	120000	300 000			 ',
     ' 	146	1	104	3	1	146 	225	 1400 	120000	300 000			 ',
     ' 	147	1	104	3		147 	225	 1200 					 ',
     ' 	148	1	104	3		148 	225	 1200 					 ',
     ' 	149	1	104	3		149 	225	 1000 					 ',
     ' 	150	1	104	3		150 	225	 1000 					 ',
     ' 	151	1	104	3		151 	225	 1000 					 ',
     ' 	152	1	104	3		152 	225	 1000 					 ',
     ' 	153	1	104	3	1	153 	225	 1300 	120000	300 000			 ',
     ' 	154	1	104	3	1	154 	225	 1400 	120000	300 000			 ',
     ' 	155	1	105	3		155 	225	 1000 					 ',
     ' 	156	1	105	3		156 	225	 1000 					 ',
     ' 	157	1	105	3		157 	225	 1000 					 ',
     ' 	158	1	105	3		158 	225	 1000 					 ',
     ' 	159	1	105	3		159 	225	 1000 					 ',
     ' 	160	1	105	3	1	160 	225	 1200 	150000	300 000			 ',
     ' 	161	1	105	3	1	161 	225	 1300 	150000	300 000			 ',
     ' 	162	1	105	3		162 	225	 1250 					 ',
     ' 	163	1	105	3	1	163 	225	 1250 	150000	300 000			 ',
     ' 	164	1	105	3	1	164 	225	 1150 	150000	300 000			 ',
     ' 	165	1	105	3	1	165 	225	 1200 	150000	300 000			 ',
     ' 	166	1	105	3	1	166 	225	 1400 	150000	300 000			 ',
     ' 	167	1	105	3	1	167 	225	 1400 	150000	300 000			 ',
     ' 	168	1	105	3	1	168 	225	 1400 	150000	300 000			 ',
     ' 	169	1	105	3		169 	225	 1000 					 ',
     ' 	170	1	105	3		170 	225	 1000 					 ',
     ' 	171	1	105	3		171 	225	 1000 					 ',
     ' 	172	1	105	3	1	172 	225	 1450 	150000	300 000			 ',
     ' 	173	1	105	3	1	173 	225	 1000 	150000	300 000			 ',
     ' 	174	1	105	3	1	174 	225	 1150 	150000	300 000			 ',
     ' 	175	1	106	3	1	175 	225	 950 	180000	300 000			 ',
     ' 	176	1	106	3	1	176 	225	 1050 	180000	300 000		Прямо у воды	 ',
     ' 	177	1	106	3	1	177 	225	 1000 	180000	300 000			 ',
     ' 	178	1	106	3	1	178 	225	 1000	180000	300 000		Прямо у воды	 ',
     ' 	179	1	106	3	1	179 	225	 1000 	180000	300 000			 ',
     ' 	180	1	106	3	1	180 	225	 1000 	180000	300 000		Прямо у воды	 ',
     ' 	181	1	106	3	1	181 	225	 1000 	180000	300 000			 ',
     ' 	182	1	106	3	1	182 	225	 1000	180000	300 000		Прямо у воды	 ',
     ' 	183	1	106	3	1	183 	225	 1000 	180000	300 000			 ',
     ' 	184	1	106	3	1	184 	225	 1000 	180000	300 000		Прямо у воды	 ',
     ' 	185	1	106	3	1	185 	225	 1000 	180000	300 000			 ',
     ' 	186	1	106	3	1	186 	225	 1000	180000	300 000		Прямо у воды	 ',
     ' 	187	1	106	3	1	187 	225	 1000 	180000	300 000			 ',
     ' 	188	1	106	3	1	188 	225	 1100 	180000	300 000		Прямо у воды	 ',
     ' 	189	1	106	3	1	189 	225	 1000 	180000	300 000			 ',
     ' 	190	1	106	3	1	190 	225	 1150	180000	300 000		Прямо у воды	 ',
     ' 	191	1	106	3	1	191 	225	 1000 	180000	300 000			 ',
     ' 	192	1	106	3	1	192 	225	 1200 	180000	300 000		Прямо у воды	 ',
     ' 	193	1	106	3	1	193 	225	 1000 	180000	300 000			 ',
     ' 	194	1	106	3	1	194 	225	 1300	180000	300 000		Прямо у воды	 ',
     ' 	195	1	106	3	1	195 	225	 1000 	180000	300 000			 ',
     ' 	196	1	106	3	1	196 	225	 1250 	180000	300 000		Прямо у воды	 ',
     ' 	197	1	106	3	1	197 	225	 1000 	180000	300 000			 ',
     ' 	198	1	106	3	1	198 	225	 1200	180000	300 000		Прямо у воды	 ',
     ' 	199	1	106	3	1	199 	225	 1000 	180000	300 000			 ',
     ' 	200	1	106	3	1	200 	225	 1080 	180000	300 000		Прямо у воды	 ',
     ' 	201	1	106	3	1	201 	225	 1000 	180000	300 000			 ',
     ' 	202	1	106	3	1	202 	225	 1100	180000	300 000		Прямо у воды	 ',
     ' 	203	1	106	3	1	203 	225	 900 	180000	300 000			 ',
     ' 	204	1	106	3	1	204 	225	 1800 	180000	300 000		Прямо у воды	 ',
     ' 	205	1	107	3	1	205 	225	 1360 	150000	300 000			 ',
     ' 	206	1	107	3	1	206 	225	 1200 	150000	300 000			 ',
     ' 	207	1	107	3	1	207 	225	 1000 	150000	300 000			 ',
     ' 	208	1	107	3	1	208 	225	 1000 	150000	300 000			 ',
     ' 	209	1	107	3	1	209 	225	 1000 	150000	300 000			 ',
     ' 	210	1	107	3	1	210 	225	 1000 	150000	300 000			 ',
     ' 	211	1	107	3	1	211 	225	 1000 	150000	300 000			 ',
     ' 	212	1	107	3	1	212 	225	 1000 	150000	300 000			 ',
     ' 	213	1	107	3	1	213 	225	 1000 	150000	300 000			 ',
     ' 	214	1	107	3	1	214 	225	 1000 	150000	300 000			 ',
     ' 	215	1	107	3	1	215 	225	 1200 	150000	300 000			 ',
     ' 	216	1	107	3	1	216 	225	 1450 	150000	300 000			 ',
     ' 	217	1	107	3	1	217 	225	 1270 	150000	300 000			 ',
     ' 	218	1	107	3	1	218 	225	 1000 	150000	300 000			 ',
     ' 	219	1	107	3	1	219 	225	 1000 	150000	300 000			 ',
     ' 	220	1	107	3	1	220 	225	 1000 	150000	300 000			 ',
     ' 	221	1	107	3	1	221 	225	 1000 	150000	300 000			 ',
     ' 	222	1	107	3	1	222 	225	 1000 	150000	300 000			 ',
     ' 	223	1	107	3	1	223 	225	 1000 	150000	300 000			 ',
     ' 	224	1	107	3	1	224 	225	 1000 	150000	300 000			 ',
     ' 	225	1	107	3	1	225 	225	 1000 	150000	300 000			 ',
     ' 	226	1	107	3	1	226 	225	 1200 	150000	300 000			 ',
     ' 	227	1	107	3	1	227 	225	 1400 	150000	300 000			 ',
     ' 	228	1	109	3		228 	225	 1150 					 ',
     ' 	229	1	109	3		229 	225	 1000 					 ',
     ' 	230	1	109	3		230 	225	 1000 					 ',
     ' 	231	1	109	3		231 	225	 1000 					 ',
     ' 	232	1	109	3		232 	225	 1350 					 ',
     ' 	233	1	109	3		233 	225	 1536 					 ',
     ' 	234	1	109	3		234 	225	 1150 					 ',
     ' 	235	1	109	3		235 	225	 1000 					 ',
     ' 	236	1	109	3		236 	225	 1000 					 ',
     ' 	237	1	109	3		237 	225	 1000 					 ',
     ' 	238	1	109	3		238 	225	 1260 					 ',
     ' 	239	1	108	3		239 	225	 1150 					 ',
     ' 	240	1	108	3		240 	225	 1200 					 ',
     ' 	241	1	108	3		241 	225	 1200 					 ',
     ' 	242	1	108	3		242 	225	 1350 					 ',
     ' 	243	1	108	3		243 	225	 1300 					 ',
     ' 	244	1	108	3		244 	225	 1250 					 ',
     ' 	245	1	110	3		245 	225	 1000 					 ',
     ' 	246	1	110	3		246 	225	 1000 					 ',
     ' 	247	1	110	3		247 	225	 1000 					 ',
     ' 	248	1	110	3		248 	225	 1000 					 ',
     ' 	249	1	110	3		249 	225	 1000 					 ',
     ' 	250	1	110	3		250 	225	 1000 					 ',
     ' 	251	1	110	3		251 	225	 1000 					 ',
     ' 	252	1	110	3		252 	225	 1000 					 ',
     ' 	253	1	110	3		253 	225	 1000 					 ',
     ' 	254	1	10	3		254 	225	 1470					 ',
     ' 	255	1	110	3		255 	225	 1160 					 ',
     ' 	256	1	110	3		256 	225	 1000 					 ',
     ' 	257	1	110	3		257 	225	 1000 					 ',
     ' 	258	1	110	3		258 	225	 1000 					 ',
     ' 	259	1	110	3		259 	225	 1000 					 ',
     ' 	260	1	110	3		260 	225	 1000 					 ',
     ' 	261	1	110	3		261 	225	 1000 					 ',
     ' 	262	1	110	3		262 	225	 1000 					 ',
     ' 	263	1	110	3		263 	225	 1300 					 ',
     ' 	264	1	110	3		264 	225	 1450 					 ',
     ' 	265	1	10	3		265 	225	 45236 					 ',
     ' 	266	1	10	3		266 	225	 25968 					 ',
     ' 	267	1	10	3		267 	225	 17980 					 ',
     ' 	268	1	10	3		268 	225	 4923 					 ',
     ' 	269	1	10	3		269 	225	 7788 					 ',
     ' 	270	1	10	3		270 	225	 181944 					 ',
     ' 	271	1	10	3		271 	225	 777					 '
   ]  
  end


end