clear all
close all
clc

% Add wire sniping
% Add lasers
% Add tool box
% Voice changer
% Paint Ships name under power supply 
% Lights under powersupply
% Does magnent fit?
% Add Voice Changer

%% Constants
project_start = datetime(2019,4,29,8,0,0);
project_end = datetime(2019,8,1,5,0,0);

project = task("Space Room");
project.set_time('start',project_start);

day = task.hours_in_day;
week = task.hours_in_day*5;

%% Days Gone
Kameron = datetime(2019,4,30);
Josh = datetime(2019,4,30);
McKay = datetime(2019,4,30);

avaliablity = {Kameron,Josh,McKay};

%% Materials
mask = item("N95 Respirator Mask",5.87,"Home Depot");
wall_paint = item("Pencil Sketch Flat Bher Paint",27.98,"https://www.homedepot.com/p/BEHR-Premium-Plus-1-gal-N500-4-Pencil-Sketch-Flat-Low-Odor-Interior-Paint-and-Primer-in-One-140001/205281869");
paint_tray = item("9 in. Deep Well Plastic Paint Roller Tray",3.48,"https://www.homedepot.com/p/9-in-Deep-Well-Plastic-Paint-Roller-Tray-RM-405-SP/100142784");
paint_rollers = item("9 in. x 3/8 in. High-Density Polyester Knit Paint Roller Cover (3-Pack)",9.34,"https://www.homedepot.com/p/9-in-x-3-8-in-High-Density-Polyester-Knit-Paint-Roller-Cover-3-Pack-RS-1433/100090787");
paint_brush = item("2 in. Shortcut Polyester Angle Sash Brush",5.87,"https://www.homedepot.com/p/Wooster-2-in-Shortcut-Polyester-Angle-Sash-Brush-0Q32110020/100357411");
darkroom_door = item("Dark Room Door",2575.00,"http://www.eseco-speedmaster.com/doors.html");
plywood = item("1/2 4 ft. x 8 ft. Oriented Strand Board",17.55,"https://www.homedepot.com/p/1-2-4-ft-x-8-ft-Oriented-Strand-Board-787792/100072564");
white_paint = item("Ultra Pure White Eggshell Behr Paint",29.98,"https://www.homedepot.com/p/BEHR-Premium-Plus-1-gal-PPU18-06-Ultra-Pure-White-Eggshell-Enamel-Low-Odor-Interior-Paint-and-Primer-in-One-205001/300392551");
thin_plexi = item("48 in. x 96 in. x 1/8 in. Clear Acrylic Sheet",118,"https://www.homedepot.com/p/OPTIX-48-in-x-96-in-x-1-8-in-Clear-Acrylic-Sheet-MC-100S/205351353");
thick_plexi = item("36 in. x 72 in. x .220 in. Acrylic Sheet",136,"https://www.homedepot.com/p/OPTIX-36-in-x-72-in-x-220-in-Acrylic-Sheet-MC-24/202038053");
plexi_screws = item("#8 1-5/8 in. Lath Sharp Point Screw 1 lb.-Box (125-Pack)",5.96,"https://www.homedepot.com/p/Everbilt-8-1-5-8-in-Lath-Sharp-Point-Screw-1-lb-Box-125-Pack-116106/205142913");
wood_screws = item("#8 x 2-1/2 in. T-Star Screws (133 per Box)",9.20,"https://www.homedepot.com/p/SPAX-8-x-2-1-2-in-T-Star-Drive-Flat-Head-Partial-Thread-Yellow-Zinc-Coated-Multi-Material-Screw-133-per-Box-4191020400606/202040970");
two_by_four = item("2 in. x 4 in. x 92-5/8 in. Prime Whitewood Stud",2.74,"https://www.homedepot.com/p/2-in-x-4-in-x-92-5-8-in-Prime-Whitewood-Stud-569062/202091224");
slidding_door = item("Autoslide Automatic Patio Door Starter Kit",430,"https://shop.autoslide.com/collections/autoslide-automatic-sliding-doors/products/autoslide-starter-automatic-door-kit");
glass_walls_per_square_foot = item("Guesstimation of Glass Walls Per Square foot",75,"https://www.homeadvisor.com/cost/walls-and-ceilings/install-a-wall/#glass");
wires_120 = item("250 ft. 12/2 Solid Romex SIMpull CU NM-B W/G Wire",70.47,"https://www.homedepot.com/p/Southwire-250-ft-12-2-Solid-Romex-SIMpull-CU-NM-B-W-G-Wire-28828255/100048873");
outlet = item("Outlet",9.99,"https://www.homedepot.com/p/Leviton-15-Amp-Tamper-Resistant-Duplex-Outlet-White-10-Pack-M22-T5320-WMP/100684043");
circuit_breaker = item("Guesstimation of Circuit Breakers",500,"https://www.homeadvisor.com/cost/electrical/upgrade-an-electrical-panel/#breaker");
wire_ties = item("452 Red WING-NUT Wire Connectors (100-Pack)",11.52,"https://www.homedepot.com/p/Ideal-452-Red-WING-NUT-Wire-Connectors-100-Pack-30-452P/202894278");
electrical_box = item("1-Gang 14 cu. in. Old Work PVC Electrical Box",1.01,"https://www.homedepot.com/p/Carlon-1-Gang-14-cu-in-Old-Work-PVC-Electrical-Box-B114RB/100404027");
joint_compound = item("4.5 Gal. Plus 3 Lightweight All-Purpose Pre-Mixed Joint Compound",13.98,"https://www.homedepot.com/p/Sheetrock-4-5-Gal-Plus-3-Lightweight-All-Purpose-Pre-Mixed-Joint-Compound-381466/100321602");
corner_bead = item("2-3/8 in. x 100 ft. Original Composite Corner Bead in a Roll SO-100S",21.98,"https://www.homedepot.com/p/Strait-Flex-2-3-8-in-x-100-ft-Original-Composite-Corner-Bead-in-a-Roll-SO-100S-SO-100S/202085009");
joint_tape = item("Standard 1-7/8 in. x 500 ft. White Self-Adhesive Drywall Joint Tape",10.98,"https://www.homedepot.com/p/Saint-Gobain-ADFORS-Standard-1-7-8-in-x-500-ft-White-Self-Adhesive-Drywall-Joint-Tape-FDW8662-U/100401004");
drywall = item("UltraLight 1/2 in. x 4 ft. x 8 ft. Gypsum Board",12.33,"https://www.homedepot.com/p/Sheetrock-UltraLight-1-2-in-x-4-ft-x-8-ft-Gypsum-Board-14113411708/202530243");
flooring = item("Smooth Flex Tiles",3.69,"https://www.rubberflooringinc.com/garage/smooth-flex-tiles.html");
ladder = item("Extreme-Corrosion-Resistant Wall-Mount Ladder",979.36,"Extreme-Corrosion-Resistant Wall-Mount Ladder");
ladder_screws = item("3/8 in. x 5 in. Powerlag Hex Drive Washer Head High Corrosion Resistant Coating Lag Screw",1.70,"https://www.homedepot.com/p/SPAX-3-8-in-x-5-in-Powerlag-Hex-Drive-Washer-Head-High-Corrosion-Resistant-Coating-Lag-Screw-4571820101277/202041047");
bubble = item("PET-A-BOO Pet Window Fence Acrylic Clear Dome 16 in",59.99,"https://www.amazon.com/PET-BOO-Acrylic-Diameter-Curiosity/dp/B073ZKW694/ref=pd_rhf_dp_s_cr_simh_0_7/134-9040081-1883040?_encoding=UTF8&pd_rd_i=B073ZKW694&pd_rd_r=ce64afc4-2643-4ce0-b5f7-7ef3a3a7f976&pd_rd_w=Nawj0&pd_rd_wg=2WQk7&pf_rd_p=31caee8f-ce20-49ad-9f29-d71df297ad52&pf_rd_r=HM26BP9BZMS02Y73GS4M&psc=1&refRID=HM26BP9BZMS02Y73GS4M");
cardboard_box = item("22 in. L x 22 in. W x 21 1/2 in. D Extra-Large Moving Box",2.38,"https://www.homedepot.com/p/The-Home-Depot-22-in-L-x-22-in-W-x-21-1-2-in-D-Extra-Large-Moving-Box-1001015/202518472");
pixilights = item("Twinkle RGB Fibre Optic Light Ceiling Star Kit",199.5,"https://www.amazon.com/dp/B073CNXZQV/ref=sspa_dk_detail_4?pd_rd_i=B071JLRTP2&pd_rd_w=c4Pb0&pf_rd_p=8a8f3917-7900-4ce8-ad90-adf0d53c0985&pd_rd_wg=zcjE3&pf_rd_r=9S64E9JQ4GRTC26BCY11&pd_rd_r=f93c2990-6b61-11e9-bbed-57e65051719f&th=1");
point_LED = item("CO RODE RGB LED",13.99,"https://www.amazon.com/CO-RODE-Diode-Yellow-Flashing/dp/B0749MD16P/ref=sr_1_11?keywords=rgb+led&qid=1556641159&rnid=7801668011&s=hi&sr=1-11");
resistors = item("1/4W 1% Resistor Assortment Kit,10 Ohm - 1M Ohm",9.99,"https://www.amazon.com/REXQualis-Resistor-Assortment-Kit-Values/dp/B07D54XMFK/ref=sr_1_1_sspa?keywords=resistors&qid=1556641219&s=hi&sr=1-1-spons&psc=1");
wires = item("Hook up Wire Kit (Solid Wire Kit) 22 Gage (25 Feet)",16.50,"https://www.amazon.com/Electronix-Express-Hook-Wire-Solid/dp/B00B4ZRPEY/ref=sr_1_1?keywords=solid+wire+22+gauge&qid=1556641489&s=hi&sr=1-1");
adaptor_5v = item("inShareplus 5V Low Voltage Power Supply",7.49,"https://www.amazon.com/inShareplus-Voltage-Transformer-100-240V-Connector/dp/B07KVZHVCS/ref=sr_1_2?keywords=5v+dc+addaptor&qid=1556641599&s=hi&sr=1-2-spell");
whiteboard = item("Quartet Glass Whiteboard, Magnetic Dry Erase White Board, 2' x 1.5', Infinity, Black Surface (G2418B)",50.69,"https://www.amazon.com/Quartet-Whiteboard-Magnetic-Infinity-G3624B/dp/B00HMCIU88/ref=sr_1_1_sspa?keywords=black%2Bwhite%2Bboard&qid=1556642225&s=gateway&sr=8-1-spons&th=1");
dry_erase_marker = item("EXPO 1752226 Neon Dry Erase Markers, Bullet Tip, Assorted Colors, 5-Count",7.12,"https://www.amazon.com/Expo-Neon-Dry-Erase-Markers-Bullet-Tip-5-Pack-Assorted-Colors/dp/B0033AGVVG/ref=cm_cr_dp_d_rvw_txt?ie=UTF8&th=1");
iPad = item("12.9-inch iPad Pro",999,"https://www.apple.com/shop/buy-ipad/ipad-pro");
iMac = item("21.5?inch iMac",1099,"https://www.apple.com/shop/buy-mac/imac/21.5-inch-2.3ghz-dual-core-processor-with-turbo-boost-up-to-3.6ghz-1tb#");
developers_fee = item("Developers Fee",99,"https://developer.apple.com/develop/");
iPad_mount = item("12.9-inch iPad Pro 3rd Gen Light Grey Enclosure w. Permanent Fixed Glass Mount",148.47,"https://www.vidabox.com/kiosks/vidamount-glass-permanent-fixed-wall-ipad-pro-3rd-gen-12-9-tablet-enclosure-mount-light-grey.html?gclid=Cj0KCQjw5J_mBRDVARIsAGqGLZDYgERnERCImPrc-tqIqoKQyX6eSvfZXjF0asJg36gLlRI7jvoOQLEaApQqEALw_wcB");
Computer_stand = item("VIVO Black Sit-Stand Wall Mount",99.99,"https://www.amazon.com/VIVO-Gas-Spring-Adjustable-Workstation-STAND-SIT1K/dp/B072KNQJXM/ref=sr_1_3?keywords=keybaord&qid=1556645161&s=electronics&sr=1-3-spell");
projected_keyboard = item("AGS Wireless Laser Projection Bluetooth Virtual Keyboard for Iphone, Ipad, Smartphone and Tablets",35.99,"https://www.amazon.com/AGS-Wireless-Projection-Bluetooth-Smartphone/dp/B00MR26TUO/ref=sr_1_2?keywords=projected+keyboard&qid=1556645277&s=electronics&sr=1-2");
station_seats = item("Wise 8WD015-3-710 Standard Pilot Chair with Cushions and Mounting Plate, White",94.99,"https://www.amazon.com/Wise-8WD015-3-710-Standard-Cushions-Mounting/dp/B006ZOYIWG/ref=sr_1_3?crid=ALCT8XUNUTWN&keywords=captain+chairs+for+boats&qid=1556148033&s=gateway&sprefix=captain+chair%2Caps%2C181&sr=8-3--");
station_stand = item("attwood Corporation Economy Pedestal Adj 11.5-17.5",27,"https://www.amazon.com/Attwood-Corporation-Economy-Pedestal-17-5/dp/B001O0DESK/ref=pd_bxgy_200_img_3/134-3882929-6430841?_encoding=UTF8&pd_rd_i=B001O0DESK&pd_rd_r=99e8577c-66e7-11e9-b421-cdcde3290510&pd_rd_w=7aWdt&pd_rd_wg=hxNYo&pf_rd_p=a2006322-0bc0-4db9-a08e-d168c18ce6f0&pf_rd_r=E51JF93QY1R732PS9C71&psc=1&refRID=E51JF93QY1R732PS9C71--");
station_swivel = item("attwood 17720 Boat Seat Swivel",7.96,"https://www.amazon.com/attwood-17720-Boat-Seat-Swivel/dp/B001O0D6SI/ref=pd_bxgy_200_img_2/134-3882929-6430841?_encoding=UTF8&pd_rd_i=B001O0D6SI&pd_rd_r=99e8577c-66e7-11e9-b421-cdcde3290510&pd_rd_w=7aWdt&pd_rd_wg=hxNYo&pf_rd_p=a2006322-0bc0-4db9-a08e-d168c18ce6f0&pf_rd_r=E51JF93QY1R732PS9C71&psc=1&refRID=E51JF93QY1R732PS9C71--");
captian_seat = item("Magshion Black PU Racing Recliner Chair Set 360 Degree Swivel",169.99,"https://www.amazon.com/Magshion-Racing-Recliner-Ottoman-Theater/dp/B079YZ595K/ref=sr_1_6?keywords=white+futuristic+chair&qid=1556656167&s=gateway&sr=8-6");
LED_strip = item("TBI Pro 32.8ft 300LEDs SMD 5050 RGB",34.64,"https://www.amazon.com/Upgraded-Strip-Lights-32-8ft-Adhesive/dp/B07J9HTB78/ref=sr_1_1_sspa?keywords=rgb+led+strip&qid=1556658561&s=gateway&sr=8-1-spons&psc=1");
arduino_uno = item("ARDUINO UNO R3",20.45,"https://www.amazon.com/Arduino-A000066-ARDUINO-UNO-R3/dp/B008GRTSV6?ref_=bl_dp_s_web_2582406011");
arduino_mega = item("ARDUINO MEGA 2560 REV3",31.81,"https://www.amazon.com/ARDUINO-MEGA-2560-REV3-A000067/dp/B0046AMGW0?ref_=bl_dp_s_web_2582406011");
solder = item("MAIYUM 63-37 Tin Lead Rosin core solder wire for electrical soldering (0.8mm 50g)",6.88,"https://www.amazon.com/MAIYUM-63-37-solder-electrical-soldering/dp/B075WB98FJ/ref=sxin_2_ac_d_pm?keywords=solder&pd_rd_i=B075WB98FJ&pd_rd_r=95f8d010-5528-4e95-9ba3-8bcd7a53b373&pd_rd_w=ZrijN&pd_rd_wg=8pYFT&pf_rd_p=6034bbf7-e1cb-46a0-92a7-12ce26e57be9&pf_rd_r=3331HNJP7K6M89GM6J03&qid=1556659054&s=electronics");
usb_b = item("AmazonBasics USB 2.0 Cable - A-Male to B-Male - 16 Feet",5.99,"https://www.amazon.com/AmazonBasics-USB-2-0-Cable-Male/dp/B00BCWALHM/ref=sxin_2?keywords=usb+b&pd_rd_i=B00BCWALHM&pd_rd_r=f872851a-5953-466b-8d2e-5794b461203e&pd_rd_w=QBzV6&pd_rd_wg=8o4a9&pf_rd_p=2f202bc2-a141-4742-bd82-9252d5485b34&pf_rd_r=SGRAZDJ63GFGHVQBFH0A&qid=1556659246&s=electronics");
usb_adaptor = item("USB Wall Charger",9.99,"https://www.amazon.com/Charger-Adapter-Ailkin-Replacement-Samsung/dp/B0734SN6VR");
alien_table = item("Sisyphus Table",1299,"https://sisyphus-industries.com/product/metal-table/");
ferrotic_fluid = item("Ferrotec Magnetic Ferrofluid 4 oz",29.99+4.95,"https://www.amazon.com/dp/B00126LYAG/ref=sspa_dk_detail_0?psc=1&pd_rd_i=B00126LYAG&pd_rd_w=vqjSc&pf_rd_p=8a8f3917-7900-4ce8-ad90-adf0d53c0985&pd_rd_wg=EoDGJ&pf_rd_r=E1K2D4CSSR6KPVD6MP7R&pd_rd_r=0bb1fd26-6b8f-11e9-a637-6b060766031a");
waterproofing_plastic = item("Greenhouse Plastic Film Clear Polyethylene Cover",29.17+13.09,"https://www.amazon.com/Greenhouse-Plastic-Clear-Polyethylene-Resistant/dp/B01NC160CG/ref=pd_cp_86_1?pd_rd_w=FOcuV&pf_rd_p=ef4dc990-a9ca-4945-ae0b-f8d549198ed6&pf_rd_r=6RSG9T3Z9AKSEXKQTRVE&pd_rd_r=76d21829-6b95-11e9-aa29-13293a7f6817&pd_rd_wg=n1kj4&pd_rd_i=B01NC160CG&psc=1&refRID=6RSG9T3Z9AKSEXKQTRVE");
waterproof_caulk = item("Ultra Clear 5 oz. All Purpose Waterproof Sealant",6.98,"https://www.homedepot.com/p/DAP-Ultra-Clear-5-oz-All-Purpose-Waterproof-Sealant-18387/306641586?keyword=clear+waterproof+caulk&semanticToken=2021000100+%3E++st%3A%7Bclear+waterproof+caulk%7D%3Ast+cnn%3A%7B0%3A0%7D+cnr%3A%7B8%3A0%7D+cnb%3A%7B9%3A0%7D+cnt%3A%7B4%3A0%7D+f%3A%7Ba%7D+cnv%3A%7B0%3A0%7D+oos%3A%7B0%3A1%7D+pt%3A%7Bcaulk%7D%3Apt+dln%3A%7B583613%7D+tgr%3A%7BNo+stage+info%7D+qu%3A%7Bcaulk%7D%3Aqu");
levitating_moon = item("LEVILUNA 7.1''/18cm 3D Magnetic Levitate Moon lamp",180.99,"https://www.amazon.com/LEVILUNA-Magnetic-Levitate-Zeegine-Seamless/dp/B07HFPGN16/ref=pd_sbs_60_6/134-9040081-1883040?_encoding=UTF8&pd_rd_i=B07HFPGN16&pd_rd_r=e5fee8ea-6b98-11e9-bbed-57e65051719f&pd_rd_w=fgSsj&pd_rd_wg=A5M8m&pf_rd_p=588939de-d3f8-42f1-a3d8-d556eae5797d&pf_rd_r=046QXQXD62DGP4HY65V2&psc=1&refRID=046QXQXD62DGP4HY65V2");
white_caulk = item("Alex 10.1 oz. White Painter's All-Purpose Acrylic Latex Caulk",1.78,"https://www.homedepot.com/p/DAP-Alex-10-1-oz-White-Painter-s-All-Purpose-Acrylic-Latex-Caulk-18609/100078928");
two_by_two = item("2 in. x 2 in. x 8 ft. Furring Strip Board Lumber",1.82,"https://www.homedepot.com/p/2-in-x-2-in-x-8-ft-Furring-Strip-Board-Lumber-75800593/304600525");
aluminum_angle = item("1 in. x 96 in. Aluminum Angle with 1/16 in. Thick",10.53,"https://www.homedepot.com/p/Everbilt-1-in-x-96-in-Aluminum-Angle-with-1-16-in-Thick-800057/204325583");
fan = item("Holmes HBF2001DP-BM 20-Inch Box Fan,Black",19.99,"https://www.amazon.com/Holmes-HBF2001DP-BM-20-Inch-Black-Blade/dp/B00I8Q3082/ref=sr_1_3?keywords=square%2Bfan&qid=1556667187&s=gateway&sr=8-3&th=1");
white_paint_marker = item("SHARPIE MED WHT OB PAINT MARKER",6.20,"https://www.amazon.com/Sanford-35558-Sharpie-Oil-Based-1-Count/dp/B001PLKRZQ/ref=pd_sbs_79_1/134-9040081-1883040?_encoding=UTF8&pd_rd_i=B001PLKRZQ&pd_rd_r=5bbd9aeb-6ba1-11e9-b421-cdcde3290510&pd_rd_w=CWmUu&pd_rd_wg=rQdH8&pf_rd_p=588939de-d3f8-42f1-a3d8-d556eae5797d&pf_rd_r=04AAT0BJ949ZARE1M8K5&psc=1&refRID=04AAT0BJ949ZARE1M8K5");
strobe = item("Hideaway Strobe Lights White High Power 24W 8 Chipsets Surface Mount",42.99,"https://www.amazon.com/Hideaway-Chipsets-Surface-Waterproof-Emergency/dp/B078WMKQV3/ref=sr_1_14?keywords=strobe+lights+white&qid=1556667847&s=gateway&sr=8-14");
power_switch_tail = item("PowerSwitch Tail II",26.99,"http://www.powerswitchtail.com/");
extension_cord = item("100 ft. 16/3 Indoor/Outdoor Extension Cord, Orange",17.97,"https://www.homedepot.com/p/HDX-100-ft-16-3-Indoor-Outdoor-Extension-Cord-Orange-HD-277-525/100650619");
L_brace = item("3 in. Black Corner Brace (4-Pack)",4.18,"https://www.homedepot.com/p/Everbilt-3-in-Black-Corner-Brace-4-Pack-13741/300985591");
giant_outlet = item("VLUXPARTS 7-Way Trailer Plug Socket Extension Cable ",19.99,"https://www.amazon.com/dp/B07JWF845G/ref=sspa_dk_detail_0?psc=1");
giant_plug = item("Conntek Heavy-Duty 7-Way Plug to ROJ (25 foot)",42.42,"https://www.amazon.com/Conntek-10110-072-Inline-Trailer-6-Feet/dp/B002QOTJ3W/ref=sr_1_37?keywords=giant%2Bplug&qid=1556812483&s=gateway&sr=8-37&th=1");
light_wire = item("lychee EL Wire Neon Glowing Strobing Electroluminescent Light El Wire",7.99,"https://www.amazon.com/dp/B00EE2R6I4/ref=sspa_dk_detail_1?psc=1&pd_rd_i=B00EE2R6I4&pd_rd_w=5Xorx&pf_rd_p=8a8f3917-7900-4ce8-ad90-adf0d53c0985&pd_rd_wg=8ITxn&pf_rd_r=WFQV7NPB5G4368FNH6RF&pd_rd_r=ac5a514b-6cf8-11e9-8500-7b430b359b4b");
pretty_plywood = item("12mm - Sande Plywood ( 1/2 in. Category x 4 ft. x 8 ft.)",35.95,"https://www.homedepot.com/p/12mm-Sande-Plywood-1-2-in-Category-x-4-ft-x-8-ft-Actual-0-472-in-x-48-in-x-96-in-454532/203414055");
decorative_steel = item("36 in. x 36 in. Plain Aluminum Sheet in Silver",21.98,"https://www.homedepot.com/p/M-D-Building-Products-36-in-x-36-in-Plain-Aluminum-Sheet-in-Silver-57000/100351161");
light_tubes = item("lychee EL Wire Neon Glowing Strobing Electroluminescent Light",7.95,"https://www.amazon.com/gp/product/B013FZHD06/ref=ppx_od_dt_b_asin_title_s00?ie=UTF8&psc=1");
mosfet = item("WeiMeet RFP30N06LE 30A 60V N-Channel Power Mosfet TO-220 ESD Rated for Arduino(10 Pieces)",9.99,"https://www.amazon.com/WeiMeet-RFP30N06LE-N-Channel-Mosfet-Arduino/dp/B07CTF1JVD/ref=sr_1_1_sspa?keywords=mosfet&qid=1556910186&s=gateway&sr=8-1-spons&psc=1");
crackel_tube = item("Crackle Tube",3420,"https://strattman.com/crackle-tubes/");
plasma_tube = item("Plasma Tube 6x48",2315,"https://strattman.com/plasma-tubes/");
lightning_tube = item("Lightning Tube 6x48",2200,"https://strattman.com/lightning_tubes/");
power_supply = item("Power Supply",475,"https://strattman.com/plasma-tubes/");
two_by_ten = item("2x10",29.77,"https://www.homedepot.com/p/Construction-Select-2-in-x-10-in-x-16-ft-2-Ground-Contact-Hem-Fir-Pressure-Treated-Lumber-549000102101600/206931778");
tv_55 = item("TCL 55S405 55-Inch 4K Ultra HD Roku Smart LED TV",329.99,"https://www.amazon.com/TCL-55S405-55-Inch-Ultra-Smart/dp/B01MTGM5I9/ref=sr_1_1_sspa?keywords=tv&qid=1556913928&refinements=p_n_size_browse-bin%3A3578042011&rnid=1232878011&s=electronics&sr=1-1-spons&psc=1");
tv_40 = item("TCL 40S325 40 Inch 1080p Smart LED Roku TV (2019)",199.99,"https://www.amazon.com/TCL-40S325-Inch-1080p-Smart/dp/B07GB61TQR/ref=sr_1_3?keywords=smart+tv&qid=1556915173&refinements=p_n_size_browse-bin%3A3578041011&rnid=1232878011&s=electronics&sr=1-3");
tv_mount = item("VideoSecu ML531BE TV Wall Mount for Most 27-55 LED",25,"https://www.amazon.com/VideoSecu-ML531BE-Monitor-Articulating-Extension/dp/B000WYVBR0/ref=pd_bxgy_504_img_2/134-9040081-1883040?_encoding=UTF8&pd_rd_i=B000WYVBR0&pd_rd_r=e2db9aa8-6de2-11e9-8500-7b430b359b4b&pd_rd_w=bupwE&pd_rd_wg=2DYGA&pf_rd_p=a2006322-0bc0-4db9-a08e-d168c18ce6f0&pf_rd_r=V29FPBGAS3AK8CH4ARJS&psc=1&refRID=V29FPBGAS3AK8CH4ARJS");
usb = item("SanDisk Cruzer CZ36 16GB USB 2.0 Flash Drive, Frustration-Free Packaging- SDCZ36-016G-AFFP",5.99,"https://www.amazon.com/SanDisk-Cruzer-Frustration-Free-Packaging-SDCZ36-064G-AFFP/dp/B007JR5368/ref=sr_1_3?crid=1B93AGQ0P4UJZ&keywords=thumb%2Bdrive&qid=1556916003&s=electronics&sprefix=thum%2Celectronics%2C204&sr=1-3&th=1");
ceiling_style1 = item("Dart Ceiling Tiles",1.74,"https://www.ceilume.com/tiles/Dart/Black/");
ceiling_style2 = item("Polyline Ceiling Tiles",1.74,"https://www.ceilume.com/tiles/Polyline/Black/");
light_triangles = item("Nanoleaf Rhythm Edition Smarter Kit - 15 Pack",369.94,"https://www.amazon.com/Nanoleaf-Rhythm-Smarter-Kit-Pack/dp/B079HD9JWH/ref=sr_1_1_sspa?crid=2MRKNIX1WMXUG&keywords=nanoleaf+aurora&qid=1556916630&s=gateway&sprefix=nanoleaf+a%2Caps%2C251&sr=8-1-spons&psc=1&smid=A188WO8ADASLR0");
cord_cover = item("Muzata 40 Pack 1M/3.3ft Black Aluminum LED Channel System U1BW",109.99,"https://www.amazon.com/Muzata-Aluminum-Accessories-Installation-U1BW/dp/B07FQ6LQF8/ref=sr_1_3?keywords=Muzata+U1BW&qid=1556920009&s=industrial&sr=1-3-catcorr");
cord_cover_connector = item("Muzata Extension Connectors for U-Shape Aluminum LED Channel",13.99,"https://www.amazon.com/Muzata-Extension-Connectors-Aluminum-Connected/dp/B072KMRXSX/ref=pd_bxgy_img_2/134-9040081-1883040?_encoding=UTF8&pd_rd_i=B072KMRXSX&pd_rd_r=b8256b47-6ea5-11e9-ad38-41b6964a56af&pd_rd_w=iRM3P&pd_rd_wg=V0YZJ&pf_rd_p=a2006322-0bc0-4db9-a08e-d168c18ce6f0&pf_rd_r=YGCDG7J8MDW4GY5EXWJ2&psc=1&refRID=YGCDG7J8MDW4GY5EXWJ2");
cord_cover_corner = item("5Pair/10PCS led channel corner,L-Shape Adaptor",13.99,"https://www.amazon.com/Muzata-Extension-Connectors-Aluminum-Connected/dp/B06XSVHWKV/ref=pd_bxgy_img_2/134-9040081-1883040?_encoding=UTF8&pd_rd_i=B072KMRXSX&pd_rd_r=b8256b47-6ea5-11e9-ad38-41b6964a56af&pd_rd_w=iRM3P&pd_rd_wg=V0YZJ&pf_rd_p=a2006322-0bc0-4db9-a08e-d168c18ce6f0&pf_rd_r=YGCDG7J8MDW4GY5EXWJ2&refRID=YGCDG7J8MDW4GY5EXWJ2&th=1");
speaker = item("Pyle PDIC81RDBK, 8'' Ceiling Wall Mount Speakers",45.8,"https://www.amazon.com/Pyle-PDIC81RDBK-Ceiling-Mount-Speakers/dp/B00E94H3QC/ref=sr_1_4?crid=2M7BV27IVPYQ&keywords=black+ceiling+speakers&qid=1557151934&s=gateway&sprefix=black+speaker+in+ceiling+%2Caps%2C189&sr=8-4");
speaker_wire = item("AmazonBasics SW100ft 16-Gauge Speaker Wire - 100 Feet",11.99,"https://www.amazon.com/AmazonBasics-16-Gauge-Speaker-Wire-Feet/dp/B006LW0W5Y/ref=pd_bxgy_23_img_2/134-9040081-1883040?_encoding=UTF8&pd_rd_i=B006LW0W5Y&pd_rd_r=ffb6a639-7008-11e9-9f57-c98fbdd56605&pd_rd_w=W3N2A&pd_rd_wg=dXRyh&pf_rd_p=a2006322-0bc0-4db9-a08e-d168c18ce6f0&pf_rd_r=JVT5ZDBSGYXP28K2VP9J&psc=1&refRID=JVT5ZDBSGYXP28K2VP9J");
speaker_box = item("Lepy LP-V9S Hi-Fi Stereo Power Digital Amplifier",29.99,"https://www.amazon.com/gp/product/B00L8O8WK2/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1");
microphone_system = item("Audio-Technica PRO 44 Cardioid Condenser Boundary Microphone",99,"https://www.amazon.com/gp/product/B0002BBOOS/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1");
computer2speaker_box = item("DTOL 3.5mm Male Audio Video Extension Cable RCA Male Extension 3.5mm To RCA Cable",4.9,"https://www.amazon.com/gp/product/B00004Z5CP/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1");
mic_splitter = item("GLS Audio 6 Inch Patch Y Cable Cords",9.95,"https://www.amazon.com/gp/product/B0061OPQK8/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1");
headphone_adaptor = item("Male to Female Stereo Audio Headphone Jack Adapter",8.49,"https://www.amazon.com/gp/product/B016E5PEXC/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1");
mixer = item("Behringer Xenyx 802 Premium 8-Input 2-Bus Mixer",65.99,"https://www.amazon.com/gp/product/B000J5XS3C/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1");
magnet_lock = item("600lbs Electric Magnetic Electromagnetic Lock",28.5,"https://www.amazon.com/SKYZONAL-Electric-Magnetic-Electromagnet-Fail-Safe/dp/B01L6UHWMQ/ref=sr_1_9?keywords=small%2Belectromagnet&qid=1557338383&s=gateway&sr=8-9&th=1");
camera = item("Amcrest Prohd 1080P 4CH Video Home Security Camera System",219.99,"https://www.amazon.com/gp/product/B00YZF7PEU/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1");
hdmi_cable = item("4K HDMI Cable 25ft-HDMI 2.0",28.99,"https://www.amazon.com/25ft-HDMI-Supports-Ethernet-Return-CL3-Installation/dp/B01HFSAFP4/ref=sr_1_1_sspa?crid=QR2FO83JJPCF&keywords=hdmi+cable&qid=1557152775&refinements=p_n_feature_keywords_four_browse-bin%3A7800973011&rnid=7623517011&s=aht&sprefix=hdmi+ca%2Caps%2C235&sr=1-1-spons&psc=1");
silver_paint = item("8 oz. Metallic Sterling Silver Paint",9.98,"https://www.homedepot.com/p/Americana-Decor-8-oz-Metallic-Sterling-Silver-Paint-ADMTL07-98/300903278?storeSelection=4416,4407,4417,4409,8566");
poster = item("56 x 34.6 in Poster", 100.00, "https://posterprintshop.com/pricing/");

switch_2p = item("Nilight Heavy Duty Rocker Toggle Switch",9.36,"https://www.amazon.com/Nilight-Rocker-Toggle-Switch-Waterproof/dp/B078KBC5VH/ref=sr_1_3?crid=2XQREJRP3FCWG&keywords=toggle+switch&qid=1557153529&s=industrial&sprefix=toggle+sw%2Cindustrial%2C181&sr=1-3");
siwtch_3p = item("Nilight 50098R 6Pin Heavy Duty Rocker Toggle",10.8,"https://www.amazon.com/Nilight-Rocker-Toggle-Switch-Waterproof/dp/B0002ZPBRA/ref=sr_1_3?crid=2XQREJRP3FCWG&keywords=toggle%2Bswitch&qid=1557153529&s=industrial&sprefix=toggle%2Bsw%2Cindustrial%2C181&sr=1-3&th=1");
switch_with_light = item("Safety Cover Toggle Switch with Red Indicator Light",15.94,"https://www.amazon.com/Pilot-Automotive-PL-SW52CR-Performance-Indicator/dp/B00AWYCAJS/ref=pd_sim_b2b_1/139-2918774-4109815?_encoding=UTF8&pd_rd_i=B00AWYCAJS&pd_rd_r=1494e9b0-700d-11e9-8254-d7002cb5b05b&pd_rd_w=cIwif&pd_rd_wg=iltX4&pf_rd_p=a07701e4-f565-442a-b97f-93ab23cbb7ef&pf_rd_r=8032N17YJCYQXSNDFP8K&psc=1&refRID=8032N17YJCYQXSNDFP8K");
button = item("Momentary Push Button Switch",9.96,"https://www.amazon.com/Momentary-URTONE-Stainless-Suitable-Mounting/dp/B077PHGXZR/ref=sr_1_21?keywords=robust+button&qid=1557153394&s=industrial&sr=1-21");
dial = item("2pcs Rotary Taper Potentiometer",11.88,"https://www.amazon.com/RV24YN20S-Potentiometer-Inverter-regulation-control/dp/B0795Q97C1/ref=sr_1_21?crid=13S9OL6R22L7A&keywords=rotary%2Bpotentiometer&qid=1557154036&s=industrial&sprefix=rotary%2Bpo%2Cindustrial%2C178&sr=1-21&th=1");
joy = item("Arduino Joystick",9.99,"https://www.amazon.com/SunFounder-Joystick-Module-Arduino-Raspberry/dp/B013G8KSB8/ref=sr_1_5?crid=1BIXK4MG6NG5Z&keywords=arduino+joystick&qid=1557348159&s=gateway&sprefix=arduino+joys%2Caps%2C255&sr=8-5");

label_maker = item("Laser Engraver Printer",99.97,"https://www.amazon.com/Engraver-Meterk-Household-Engraving-Bluetooth4-0/dp/B07HP4LMN2/ref=sr_1_10?keywords=engraving&qid=1557346653&s=gateway&sr=8-10");

plumber_camera = item("50ft HD Endoscope Camera",28.99,"https://www.amazon.com/Endoscope-Borescope-Waterproof-Inspection-Adjustable/dp/B01N19YCC3/ref=sxbs_sxwds-stvp?keywords=plumber+snake+camera&pd_rd_i=B01N19YCC3&pd_rd_r=b797ee02-1085-4ee7-a074-0c571d6fc895&pd_rd_w=Ee45H&pd_rd_wg=IVfrG&pf_rd_p=a6d018ad-f20b-46c9-8920-433972c7d9b7&pf_rd_r=MV3BRGZZZQEVA6TB9CE2&qid=1557348886&s=gateway");
clear_tube = item("1-1/4 in. O.D. x 1 in. I.D. x 10 ft. PVC Clear Vinyl Tube",20.98,"https://www.homedepot.com/p/Everbilt-1-1-4-in-O-D-x-1-in-I-D-x-10-ft-PVC-Clear-Vinyl-Tube-157440/207144276");
monitor = item("Sceptre E205W-1600 20 in 75Hz Ultra Thin LED Monitor",69.99,"https://www.amazon.com/Sceptre-E205W-1600-Monitor-Speakers-Metallic/dp/B00S8W8QMG/ref=sr_1_5?keywords=small+tv+monitor&qid=1557350475&s=gateway&sr=8-5");

printer = item("3'1/8 80mm Thermal Receipt POS Printer",118.4,"https://www.amazon.com/Thermal-Receipt-Printer-MUNBYN-Ethernet/dp/B07585DZLW/ref=sr_1_1_sspa?crid=11A2ACXPBXG3W&keywords=receipt%2Bprinter&qid=1557154286&s=gateway&sprefix=recipt%2Bpri%2Cindustrial%2C191&sr=8-1-spons&th=1");
printer_paper = item("Gorilla Supply Thermal Receipt Paper Rolls 3 1/8",19.36,"https://www.amazon.com/Gorilla-Supply-Thermal-Receipt-Paper/dp/B00AN5QFUG/ref=pd_bxgy_229_img_2/139-2918774-4109815?_encoding=UTF8&pd_rd_i=B00AN5QFUG&pd_rd_r=1f420013-700f-11e9-93e4-9f5b0bbd650f&pd_rd_w=tNhcN&pd_rd_wg=ReDa7&pf_rd_p=a2006322-0bc0-4db9-a08e-d168c18ce6f0&pf_rd_r=VFC4K5GVFWD70AFRFGDS&psc=1&refRID=VFC4K5GVFWD70AFRFGDS");
aux_cable = item("10 Pack Male to Male Stereo Audio Aux Cable",30.75,"https://www.amazon.com/AmazonBasics-3-5mm-Stereo-Audio-Cable/dp/B07CZYC81M/ref=sr_1_3?keywords=aux%2Bcord&qid=1557155217&refinements=p_n_feature_keywords_four_browse-bin%3A7623518011&rnid=7623517011&s=aht&sr=1-3&th=1");
aux_plug = item("Headphone Audio Jack, Pack of 10",8.99,"https://www.amazon.com/Lsgoodcare-Connector-Terminals-Nuts-3-5MM-Headphone/dp/B013AP77T8/ref=sr_1_15?keywords=aux+female+panel&qid=1557155380&s=aht&sr=1-15");
laser = item("50 mw Green Dot Laser 2 Pack",21.79,"https://www.amazon.com/lights88-Green-Laser-Modules-Diodes/dp/B01MRSUG6C/ref=pd_cp_328_1?pd_rd_w=gv6Ym&pf_rd_p=ef4dc990-a9ca-4945-ae0b-f8d549198ed6&pf_rd_r=JZH9025J6SD6EAWFH0CD&pd_rd_r=936042fd-71b1-11e9-a9da-2171f603c15c&pd_rd_wg=nX1fk&pd_rd_i=B01MRSUG6C&psc=1&refRID=JZH9025J6SD6EAWFH0CD");
two_by_eight = item("2 in. x 8 in. x 16 ft. #2 Ground Contact Hem Fir Pressure-Treated Lumber",21.7,"https://www.homedepot.com/p/Construction-Select-2-in-x-8-in-x-16-ft-2-Ground-Contact-Hem-Fir-Pressure-Treated-Lumber-549000102081600/206931774");
keypad = item("4 x 4 Matrix Array 16",8.99,"https://www.amazon.com/Matrix-Membrane-Switch-Keyboard-Arduino/dp/B015M1CEIC/ref=sr_1_1_sspa?keywords=arduino+keypad&qid=1557337389&s=electronics&sr=1-1-spons&psc=1&smid=A13Q34JY4ZWN5V");
metal_box = item("Metallic AC Disconnect",8.98,"https://www.homedepot.com/p/Halex-60-AMP-120-240-Volt-Non-Fuse-Metallic-AC-Disconnect-HNF60R/205785642");



infinity_mirror = item("GODMORGON Mirror", 49.99, "https://www.ikea.com/us/en/catalog/products/10182165/?gclid=Cj0KCQjwtr_mBRDeARIsALfBZA6zTZYwnGwpY1CyI6FsbQ3nlHzi867zbg47LhTFUbrHKlo-30sIsM0aAqE9EALw_wcB#/50149131");
infinity_glass_film = item("BDF S05 Window Film Daytime Privacy One Way Mirror Silver", 39.99, "https://www.amazon.com/dp/B00FQPGH9W/ref=sspa_dk_detail_3?psc=1&pd_rd_i=B00FQPGH9W&pd_rd_w=OtHU8&pf_rd_p=8a8f3917-7900-4ce8-ad90-adf0d53c0985&pd_rd_wg=d03tv&pf_rd_r=21XD9403NED5B5SB9JSF&pd_rd_r=137f0a2e-7009-11e9-8500-7b430b359b4b");
infinity_led = item("LE 12V LED Strip Light, Flexible, Waterproof, SMD 2835, 16.4ft Tape Light", 9.50, "https://www.amazon.com/Flexible-Waterproof-Christmas-Kitchen-Daylight/dp/B00HSF66JO/ref=sr_1_7?keywords=white%2Bled%2Bstrips&qid=1557152458&s=gateway&sr=8-7&th=1");
infinity_plexiglass = item("36 in. x 48 in. x .093 in. Acrylic Sheet", 44.73, "https://www.homedepot.com/p/OPTIX-36-in-x-48-in-x-093-in-Acrylic-Sheet-MC-09/202038045?MERCH=REC-_-PIPHorizontal2_rr-_-301414281-_-202038045-_-N");
infinity_frame = item("2 in. x 4 in. x 96 in. Premium Kiln-Dried Whitewood Stud", 2.87, "https://www.homedepot.com/p/2-in-x-4-in-x-96-in-Premium-Kiln-Dried-Whitewood-Stud-161640/202091220");
% switchboard_cables = item("FosPower Audio Cable (1 FT), Stereo Audio 3.5mm Auxiliary Short Cord Male to Male Aux Cable", 5.49, "https://www.amazon.com/FosPower-Stereo-Auxiliary-iPhone-Samsung/dp/B0100NK0VU/ref=sr_1_3?keywords=male+to+male+short+cables&qid=1557153457&s=gateway&sr=8-3");
infinity_wire_support = item("9 ft. 100 lb. Stainless Steel Hanging Wire", 4.48, "https://www.homedepot.com/p/OOK-9-ft-100-lb-Stainless-Steel-Hanging-Wire-50116/100069689");
grate = item("24 in. x 3/4 in. x 24 in. Plain Expanded Metal Sheet", 19.97, "https://www.homedepot.com/p/Everbilt-24-in-x-3-4-in-x-24-in-Plain-Expanded-Metal-Sheet-801427/204225784");
print = item("Print per page",0.15,"https://lib.byu.edu/faq/244761/");
bind = item("Spiral Binding",20.19,"https://www.officedepot.com/catalog/search.do?Ntt=spiral+binding&searchSuggestion=true");
blue_paint = item("Blue Paint",34.98,"https://www.homedepot.com/p/BEHR-1-gal-S-H-580-Navy-Blue-Satin-Enamel-Alkyd-Interior-Exterior-Paint-793001/302141254");
black_paint = item("Black Paint",34.98,"https://www.homedepot.com/p/BEHR-1-gal-S-H-580-Navy-Blue-Satin-Enamel-Alkyd-Interior-Exterior-Paint-793001/302141254");

%% Tasks

project.materials = [wood_screws*2,joint_compound,joint_tape*2,developers_fee,solder];

construction = task("Contractor Construction",{project,0});
    demolition = task("Demolition",{construction,0});
        demolition.materials = mask;
        bathroom = task("Bathroom",{demolition,0});
            sink = task("Sink",{bathroom,0},2);
            toilet = task("Toilet",{bathroom,0},2);
            rm_walls = task("Walls",{sink,1},4);
                rm_walls.starts_when(toilet,1);
            plug = task("Plug Drains",{sink,1},1);
                plug.starts_when(toilet,1);
            bathroom.add_subtask([sink,toilet,rm_walls,plug]);
        platform = task("Platform",{demolition,0},2);
        ceiling_tiles = task("Remove Ceiling Tiles",{demolition,0},1);
        demolition.add_subtask([bathroom,platform,ceiling_tiles]);
    teleport = task("Teleport Door",{demolition,1});
        teleport_hole = task("Cut Hole",{teleport,0},1);
        secure = task("Secure Door",{teleport_hole,1},1);
        frame = task("Frame in Door",{secure,1},3);
        teleport.materials = darkroom_door;
        teleport.add_subtask([teleport_hole,secure,frame])
    paint = task("Paint Walls",{teleport,1},8);
        paint.materials = [ceil((10*(10+31+15+19+6+13))/200)*wall_paint,2*paint_tray,paint_rollers,paint_brush];
    circuit_breakers = task("Circit Breakers",{project,0},40);
        circuit_breakers.materials = circuit_breaker;
    electrical = task("Wire Outlets",{demolition,1},20);
        electrical.materials = [3*wires_120,4*outlet,wire_ties,4*electrical_box];
        electrical.starts_when(circuit_breakers,1);
    desk = task("Desk",{electrical,1});
        desk.starts_when(paint,1);
        base = task("Base",{desk,0},8);
            base.materials = [3*plywood,15*two_by_four];
        desk_electrical = task("Electrical",{base,1},1);
        top = task("Top",{desk_electrical,1},5);
            top.materials = 6*plywood;
        paint_desk = task("Paint",{top,1},5);
            paint_desk.materials = ceil((5*5*4 + 10*(4+2+2))/200)*white_paint;
        plexiglass_cover = task("Cover with Plexiglass",{paint_desk,1},5);
            plexiglass_cover.materials = [4*thin_plexi,plexi_screws];
        desk.add_subtask([base,desk_electrical,top,top,paint_desk,plexiglass_cover])
    warpdrive = task("Warp Drive Room",{platform,1});
        warpdrive.starts_when(electrical,1);
        extend_floors = task("Cover Floors",{warpdrive,0},2);
            extend_floors.materials = plywood;
        drive_platform = task("Drive Platform",{extend_floors,1},4);
            drive_platform.materials = [4*two_by_four,2*plywood,corner_bead,3*drywall];
            paint.starts_when(drive_platform,1);
        glass_walls = task("Glass Walls",{drive_platform,1},15);
            glass_walls.materials = glass_walls_per_square_foot*(8*10);
        sliding_door = task("Sliding Door",{glass_walls,1},10);
            sliding_door.materials = [glass_walls_per_square_foot*(3*10),slidding_door];
        warpdrive.add_subtask([extend_floors,drive_platform,glass_walls,sliding_door])
    powersupply = task("Power Supply",{paint,1},5);
        powersupply.starts_when(electrical,1);
        powersupply.materials = [3*plywood,6*two_by_four];
    patch_holes = task("Patch Holes",{demolition,1},4);
        desk.starts_when(patch_holes,1);
        patch_holes.materials = drywall;
    construction.add_subtask([demolition,teleport,paint,circuit_breakers,electrical,desk,warpdrive,powersupply])
    
building = task("Building/Instilation",{project,0});
    floor = task("Floor",{construction,1},6);
        floor.starts_when(patch_holes,1);
        floor.materials = flooring*ceil((31*10+15*5)*1.2);
    circuit_scramble = task("Circuit Scramble",{building,0},1);
        circuit_scramble_prototype = task("Prototype",{circuit_scramble,0},8);
            circuit_scramble_prototype.materials = light_wire;
        circuit_scramble_frame = task("Frame",{circuit_scramble_prototype,3},4);
            circuit_scramble_frame.materials = [two_by_two*2,pretty_plywood,decorative_steel];
        circuit_scramble_electrical = task("Electrical",{circuit_scramble_frame,1});
            circuit_scramble_electrical.materials = [arduino_mega,wires,mosfet,usb_b,usb_adaptor,switch_2p,light_wire*4];
        circuit_scramble_code = task("Code",{circuit_scramble_prototype,1},2);
        circuit_scramble_install = task("Install",{circuit_scramble_code,1},2);
            circuit_scramble_install.starts_when(circuit_scramble_electrical,1);
            circuit_scramble_install.starts_when(powersupply,1)
            circuit_scramble_install.starts_when(electrical,1);
        circuit_scramble.add_subtask([circuit_scramble_prototype,circuit_scramble_frame,circuit_scramble_electrical,circuit_scramble_code,circuit_scramble_install])
    switch_board = task("Switch Board",{building,0});
        switch_board_prototype = task("Prototype",{switch_board,0},8);
        switch_board_frame = task("Frame",{switch_board_prototype,1},4);
            switch_board_frame.materials = [two_by_two*2,pretty_plywood*2,decorative_steel*2];
        switch_board_electrical = task("Electrical",{switch_board_frame,1},3);
            switch_board_electrical.materials = [arduino_uno,wires,mosfet,usb_b,usb_adaptor,switch_2p,light_wire*4,aux_plug*3,aux_cable*3];
        switch_board_code = task("Code",{switch_board_prototype,1},2);
        switch_board_install = task("Install",{switch_board_prototype,1},2);
            switch_board_install.starts_when(switch_board_electrical,1);
            switch_board_install.starts_when(powersupply,1);
            switch_board_install.starts_when(electrical,1);
        switch_board.add_subtask([switch_board_prototype,switch_board_frame,switch_board_electrical,switch_board_code,switch_board_install])
    lasers = task("Lasers",{floor,1});
        lasers_prototype = task("Prototype",{lasers,0},6);
        lasers_frame = task("Frame",{lasers_prototype,1},3);
            lasers_frame.materials = two_by_eight;
        lasers_electrical = task("Electrical",{lasers_frame,1},2);
            lasers_electrical.materials = [arduino_uno,wires,mosfet,usb_b,usb_adaptor,laser*6];
        lasers_install = task("Install",{lasers_electrical,1},1);
    pole_cover = task("Pole Cover", {building,0}, 1);
        pole_cover.materials = [two_by_four*5, drywall];
    escape_pod = task("Teleport Door",{teleport,1},5);
        escape_pod.materials = decorative_steel*4;
    constilation = task("Constilation Viewer",{paint,1});
        constilation_ladder = task("Ladder",{constilation,0},1);
            constilation_ladder.materials = [ladder,ladder_screws*4,two_by_four];
        constilation_lights = task("Lights",{constilation,0},5);
            constilation_lights.materials = [cardboard_box,pixilights,point_LED,resistors,wires,adaptor_5v];
            constilation_lights.starts_when(electrical,1);
        constilation_bubble = task("Bubble",{constilation_lights,1},1);
            constilation_bubble.materials = bubble;
        constillation_frame = task("Bubble Frame", {constillation,0},1);
            constillation_frame.materials = [two_by_four, pretty_plywood];
        constilation.add_subtask([constilation_ladder,constilation_lights,constilation_bubble,constillation_frame]);
    blackboard = task("Whiteboard",{paint,1},1);
        blackboard.materials = [whiteboard,dry_erase_marker];
    captian_chair = task("Captian's Chair",{building,0},1);
        captian_chair_secure = task("Secure",{captian_chair,0},5);
            captian_chair_secure.materials = captian_seat;
        captian_chair_augment = task("Augment",{captian_chair_secure,1},5);
            captian_chair_augment.materials = two_by_four;
        captian_chair_electrical = task("Electrical",{captian_chair_augment,1},5);
            captian_chair_electrical.materials = [LED_strip,wires,arduino_uno,usb_b,usb_adaptor];
            captian_chair.starts_when(electrical,1);
        captian_chair_paint = task("Paint",{captian_chair_electrical,1},3);
            captian_chair_paint.materials = white_paint;
        captian_chair.add_subtask([captian_chair_secure,captian_chair_augment,captian_chair_electrical,captian_chair_paint]);
    computer = task("Captian's Computer",{building,0});
        computer_code = task("Code Computer",{computer,0},20);
            computer_code.note = "Ensure user's can't fiddle with other components";
        computer_stand = task("Stand",{computer,0},2);
            computer_stand.materials = [iPad_mount,Computer_stand];
        computer_keyboard = task("Projected Keyboard",{computer,0},3);
            computer_keyboard.materials = projected_keyboard;
        computer_install = task("Install",{computer_stand,1},1);
            computer_install.starts_when(computer_keyboard,1);
            computer_install.starts_when(electrical,1);
            computer_install.materials = iPad;
        computer.add_subtask([computer_code,computer_stand,computer_keyboard,computer_install]);
    hologram = task("Hologram",{building,0});
        timer = task("Timer",{hologram,0},10);
        videos = task("Videos",{hologram,0},20);
        hologram_frame = task("Frame",{desk,1},6);
            hologram_frame.materials = [2*two_by_four,pretty_plywood,thick_plexi,tv_55,tv_mount];
            hologram_frame.starts_when(electrical,1);
        hologram_paint = task("Paint",{hologram_frame,1},2);
            hologram_paint.materials = white_paint;
        hologram_controller = task("Controller",{timer,1},15);
            hologram_controller.materials = hdmi_cable;
            hologram_controller.starts_when(videos,1)
            hologram_controller.starts_when(electrical,1);
            hologram_controller.note = "Game Master's Computer?";
        hologram.add_subtask([timer,videos,hologram_frame,hologram_paint,hologram_controller]);
    fans = task("Fans",{electrical,1});
        fans.materials = fan*2;
        fans_paint = task("Paint Code",{fans,0},1);
            fans_paint.materials = white_paint_marker;
        fans_strobe = task("Paint Install Strobe",{warpdrive,1},2);
            fans_strobe.materials = strobe;
            fans_strobe.starts_when(electrical,1);
        fans_strobe_controller = task("Strobe Controller",{fans_strobe,1},3);
            fans_strobe_controller.materials = [arduino_uno,usb_b,usb_adaptor,wires,power_switch_tail,extension_cord];
        fans_install = task("Install",{fans_strobe,1},2);
            fans_install.starts_when(fans_paint,1);
            fans_install.materials = 2*L_brace;
        fans_outlet_electrical = task("Outlet Electrical",{powersupply,1},3);
            fans_outlet_electrical.materials = [wires,arduino_uno,usb_b,usb_adaptor,giant_outlet];
        fans_outlet_connection = task("Outlet Connection",{powersupply,1},3);
            fans_outlet_connection.materials = giant_plug;
        fans_outlet_lock = task("Outlet Lock",{fans_outlet_electrical,1},1);
            fans_outlet_lock.starts_when(fans_outlet_connection,1);
        fans.add_subtask([fans_paint,fans_strobe,fans_strobe_controller,fans_install,fans_outlet_electrical,fans_outlet_connection,fans_outlet_lock]);
    crackel = task("Crackle Tube",{building,0});
        crackel_powersupply = task("Power Suply",{crackel,0},1);
            crackel_powersupply.materials = power_supply;
            crackel_powersupply.starts_when(electrical,1);
        crackel_electrical = task("Electrical",{crackel_powersupply,1},3);
            crackel_electrical.materials = [wires,arduino_uno,usb_b,usb_adaptor];
            drive_platform.starts_when(crackel_electrical,1);
        crackel_frame = task("Frame",{drive_platform,1},4);
            crackel_frame.materials = [pretty_plywood,two_by_four,two_by_ten,two_by_two*4,thick_plexi,crackel_tube];
            crackel_frame.starts_when(crackel_electrical,1);
        crackel_paint = task("Paint",{crackel_frame,1},1);
        crackel.add_subtask([crackel_powersupply,crackel_electrical,crackel_frame,crackel_paint]);
    infinity_mirrors = task("Infinity Mirrors",{glass_walls,1});
        infinity_mirrors_frame = task("Frame",{infinity_mirrors,0},4);
            infinity_mirrors_frame.materials = [infinity_frame,infinity_mirror,infinity_glass_film,infinity_plexiglass,infinity_wire_support,grate];
        infinity_mirrors_electrical = task("Electrical",{infinity_mirrors_frame,1},2);
            infinity_mirrors_electrical.materials = infinity_led*2;
        infinity_paint = task("Paint",{infinity_mirrors_electrical,1},2);
        infinity_mirrors_grate = task("Grate",{infinity_paint,1},2);
        infinity_mirrors_step_indicator = task("Step Indicator",{infinity_mirrors_grate,1},2);
        infinity_mirrors.add_subtask([infinity_mirrors_frame,infinity_mirrors_electrical,infinity_paint,infinity_mirrors_grate,infinity_mirrors_step_indicator]);
    starchart = task("Start Chart Poster",{building,0});
        starchart.materials = [thin_plexi, poster];
    window = task("Window",{building,0});
        window_frame = task("Frame",{desk,1},4);
            window_frame.materials = [two_by_four,tv_55,tv_mount];
        window_animation = task("Animation",{window,0},10);
        window_electrical = task("Electrical",{window_frame,1},3);
        window_paint = task("Paint",{window_electrical,1},3);
        window.add_subtask([window_frame,window_animation,window_electrical,window_paint]);
    ceiling = task("Ceiling",{electrical,1},6);
    	ceiling.materials = [((31*10+15*5)*1)*ceiling_style1,ceil((31*10+15*5)*0.3)*ceiling_style2];
        ceiling.starts_when(paint,1);
    lighting = task("Lighting",{electrical,1});
        lighting.note = "https://www.google.com/search?q=controlling+led+strip+with+arduino&oq=controlling+a+led+strip+w&aqs=chrome.1.69i57j0l5.5392j0j1&sourceid=chrome&ie=UTF-8#kpvalbx=1";
        lighting.starts_when(paint,1);
        lighting_frame = task("Frame",{lighting,0},15);
        lighting_frame.materials = ceil(2*(10+31+15+19+6+13)/(8*8)*1.2)*pretty_plywood;
        lighting_electrical = task("Electrical",{lighting_frame,1},3);
            lighting_electrical.materials = [4*wires,solder,arduino_mega,usb_b,usb_adaptor,mosfet*2,LED_strip*ceil((10+31+15+19+6+13)/32*10),light_triangles*ceil(((10+31+15+19+6+13)/0.75*2*1.2)/15),cord_cover*ceil(30*32/3.3*1/40)];
        lighting_code = task("Code",{lighting_electrical,1},6);
        lighting_paint = task("Paint",{lighting_electrical,1},3);
        lighting.add_subtask([lighting_frame,lighting_electrical,lighting_code,lighting_paint]);
    wall = task("Wall Acents",{paint,1});
        wall.starts_when(electrical,1);
        wall_frame = task("Frame",{wall,0},4);
        wall_electrical = task("Electrical",{wall_frame,1},1);
        wall_paint = task("Paint",{wall_electrical,1},3);
        wall_code = task("Code",{wall_electrical,1},15);
        wall.add_subtask([wall_frame,wall_electrical,wall_paint,wall_code]);
    speakers = task("Speakers",{electrical,1},3);
    	speakers.materials = [speaker*2,speaker_wire*2,speaker_box*2,computer2speaker_box];
        ceiling.starts_when(speakers,1);
    microphone = task("Microphone",{ceiling,1},2);
    	microphone.materials = [microphone_system*2,mic_splitter,headphone_adaptor,mixer];
        microphone.starts_when(electrical,1);
    cameras = task("Cameras",{electrical,1},3);
    	cameras.materials = camera;
    gm_computer = task("Game Master's Computer",{building,0});
        gm_computer.materials = iMac;
        gm_comp_code = task("Code",{lighting,1},30);
            gm_comp_code.starts_when(hologram,1);
        gm_comp_Install = task("Install",{gm_computer,0},1);
        gm_computer.add_subtask([gm_comp_code,gm_comp_Install]);
    decorate_power_supply = task("Decorate Power Supply",{powersupply,1},5);
        decorate_power_supply.note = "Paint Ship's Name";
        decorate_power_supply.materials = [blue_paint,black_paint];
    	decorate_power_supply.materials = silver_paint;
        decorate_power_supply.starts_when(lighting,1);
        decorate_power_supply.starts_when(circuit_scramble,1);
        decorate_power_supply.starts_when(switch_board,1);
        decorate_power_supply.starts_when(fans,1);
    create_manual = task("Ship's Manual",{building,0});
        manual_write = task("Write",{create_manual,0},10);
        manual_print = task("print",{manual_write,1},1);
        manual_print.materials = [print*100,bind];
        create_manual.add_subtask([manual_write,manual_print]);
    NASA_printer = task("NASA Printer",{top,1});
    	NASA_printer.materials = [printer,printer_paper];
        NASA_frame = task("Frame",{NASA_printer,0},3);
            NASA_frame.materials = two_by_four;
            paint_desk.starts_when(NASA_frame,1);
        NASA_electrical = task("Electrical",{NASA_frame,1},1);
        NASA_code = task("Code",{NASA_electrical,1},20);
        NASA_printer.add_subtask([NASA_frame,NASA_electrical,NASA_code]);
    main_power_controller = task("Main Power Controller",{lighting,1});
        main_power_controller.starts_when(electrical,1);
        main_power_controller.starts_when(wall,1);
        main_power_controller.starts_when(crackel,1);
        main_power_controller.starts_when(starchart,1);
        main_power_controller.starts_when(circuit_scramble,1);
        main_power_controller.starts_when(switch_board,1);
        main_power_controller.starts_when(fans,1);
        power_electrical = task("Electrical",{main_power_controller,0},10);
            power_electrical.materials = [arduino_uno,usb_b,usb_adaptor,wires,power_switch_tail];
        power_code = task("Code",{main_power_controller,0},10);
        main_power_controller.add_subtask([power_electrical,power_code]);
    emergency_power_rerouting = task("Emergency Power Rerouting Switch",{electrical,1});
        emergency_power_rerouting.starts_when(circuit_scramble,1);
        emergency_power_rerouting.starts_when(switch_board,1);
        emergency_power_rerouting.starts_when(fans,1);
        emergencey_frame = task("Frame",{emergency_power_rerouting,0},3);
            emergencey_frame.materials = [two_by_four*6, pretty_plywood*2];
        emergencey_electrical = task("Electrical",{emergencey_frame,1},3);
            emergencey_electrical.materials = [arduino_uno,usb_b,usb_adaptor,wires*2,switch_with_light,power_switch_tail];
        emercencey_paint = task("Paint",{emergencey_electrical,1},2);
        emergency_power_rerouting.add_subtask([emergencey_frame,emergencey_electrical,emercencey_paint]);
    conclusion = task("Conclusion",{building,0});
        conclusion.materials = [switch_2p,siwtch_3p,switch_with_light*2,button,dial,arduino_mega,usb_b,usb_adaptor,wires*4];
        left_desk = task("Left Station",{desk_electrical,1});
            left_frame = task("Frame",{left_desk,0},3);
                left_frame.materials = [two_by_four*2, pretty_plywood];
            left_electrical = task("Electrical",{left_frame,1},3);
            left_desk.add_subtask([left_frame,left_electrical]);
        right_desk = task("Right Station",{desk_electrical,1});
            right_frame = task("Frame",{right_desk,0},3);
                right_frame.materials = [two_by_four*2, pretty_plywood];
            right_electrical = task("Electrical",{right_frame,1},3);
            right_desk.add_subtask([right_frame,right_electrical]);
        captian_station = task("Captian Station",{captian_chair_electrical,1});
            captian_frame = task("Frame",{captian_station,0},3);
                captain_frame.materials = [two_by_four, pretty_plywood];
            captian_electrical = task("Electrical",{captian_frame,0},3);
                captian_chair_paint.starts_when(captian_electrical,1);
            captian_station.add_subtask([captian_frame,captian_electrical]);
         engineer_station = task("Engineer",{powersupply,1});
            engineer_frame = task("Frame",{engineer_station,0},2);
                engineer_frame.materials = [two_by_two, pretty_plywood];
            engineer_electrical = task("Electrical",{engineer_frame,1},2);
                decorate_power_supply.starts_when(engineer_electrical,1);
            engineer_station.add_subtask([engineer_frame,engineer_electrical]);
        top.starts_when(left_desk,1)
        top.starts_when(right_desk,1)
        conclusion_code = task("Code",{left_desk,1},10);
            conclusion_code.starts_when(right_desk,1);
            conclusion_code.starts_when(captian_station,1);
            conclusion_code.starts_when(engineer_station,1);
        conclusion.add_subtask([left_desk,right_desk,captian_station,engineer_station,conclusion_code]);
    building.add_subtask([lasers,floor,circuit_scramble,switch_board,escape_pod,constilation,blackboard,captian_chair,computer,ipads,seats,hologram,alien,moon,hatch,fans,crackel,infinity_mirrors,starchart,window,ceiling,lighting,wall,speakers,microphone,cameras,gm_computer,decorate_power_supply,create_manual,NASA_printer,main_power_controller,emergency_power_rerouting,conclusion]);
    
testing = task("Testing",{building,1});
testing.starts_when(construction,1);
    test_group = task("Test Groups",{testing,0},week);
    employees = task("Run Employees",{test_group,1},week);
    testing.add_subtask([test_group,employees]);
    
logistical = task("Logistical Tasks",{project,0});
    touch_up_paint = task("Touch Up Paint",{building,1},3);
    order = task("Order Parts",{logistical,0},3*week);
%         building.starts_when(order,1);
        order.note = "Don't forget: blackboard markers and roller for switch board";
%     advertise = task("Advertise");
%         advertise.set_time('start',project_start);
%         advertise.set_time('stop',project_end);
    flowchart = task("Flow Chart",{test_group,1},2);
    train = task("Train Employees",{employees,1},2*week);    
    clean = task("Clean",{building,1},4);
        clean.starts_when(construction,1);
        testing.starts_when(clean,1);
    logistical.add_subtask([touch_up_paint,order,flowchart,train,clean]);

project.add_subtask([construction,building,testing,logistical])

% project.update(project_start,project_end,avaliablity);

%% Output
% project.gantt(2);
% construction.gantt;
% building.gantt(1);
project.budget;
project.bill_of_materials;
project.task_list;




