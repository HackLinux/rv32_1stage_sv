module CtlPath(
    input  io_imem_req_ready,
    output io_imem_req_valid,
    //output[31:0] io_imem_req_bits_addr
    //output[31:0] io_imem_req_bits_data
    output io_imem_req_bits_fcn,
    output[2:0] io_imem_req_bits_typ,
    input  io_imem_resp_valid,
    input [31:0] io_imem_resp_bits_data,
    input  io_dmem_req_ready,
    output io_dmem_req_valid,
    //output[31:0] io_dmem_req_bits_addr
    //output[31:0] io_dmem_req_bits_data
    output io_dmem_req_bits_fcn,
    output[2:0] io_dmem_req_bits_typ,
    input  io_dmem_resp_valid,
    input [31:0] io_dmem_resp_bits_data,
    input [31:0] io_dat_inst,
    input  io_dat_br_eq,
    input  io_dat_br_lt,
    input  io_dat_br_ltu,
    input [7:0] io_dat_status_ip,
    input [7:0] io_dat_status_im,
    input [6:0] io_dat_status_zero,
    input  io_dat_status_er,
    input  io_dat_status_vm,
    input  io_dat_status_s64,
    input  io_dat_status_u64,
    input  io_dat_status_ef,
    input  io_dat_status_pei,
    input  io_dat_status_ei,
    input  io_dat_status_ps,
    input  io_dat_status_s,
    output io_ctl_stall,
    output[2:0] io_ctl_pc_sel,
    output[1:0] io_ctl_op1_sel,
    output[2:0] io_ctl_op2_sel,
    output[3:0] io_ctl_alu_fun,
    output[2:0] io_ctl_wb_sel,
    output io_ctl_wa_sel,
    output io_ctl_rf_wen,
    output[1:0] io_ctl_csr_cmd,
    output io_ctl_exception,
    output[5:0] io_ctl_exc_cause,
    output io_ctl_sret,
    output io_ctl_debug_dmem_val,
    output[2:0] io_ctl_debug_dmem_typ,
    input  io_resetSignal
);

  wire[2:0] cs_msk_sel;
  wire[2:0] T0;
  wire[2:0] T1;
  wire[2:0] T2;
  wire[2:0] T3;
  wire[2:0] T4;
  wire[2:0] T5;
  wire[2:0] T6;
  wire T7;
  wire[31:0] T8;
  wire T9;
  wire[31:0] T10;
  wire T11;
  wire[31:0] T12;
  wire T13;
  wire[31:0] T14;
  wire T15;
  wire[31:0] T16;
  wire T17;
  wire[31:0] T18;
  wire T19;
  wire[31:0] T20;
  wire T21;
  wire[31:0] T22;
  wire T23;
  wire cs_mem_en;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  wire T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire[31:0] T70;
  wire T71;
  wire[31:0] T72;
  wire T73;
  wire T74;
  wire T75;
  wire[31:0] T76;
  wire T77;
  wire[31:0] T78;
  wire T79;
  wire[31:0] T80;
  wire T81;
  wire[31:0] T82;
  wire T83;
  wire[31:0] T84;
  wire T85;
  wire[31:0] T86;
  wire T87;
  wire[31:0] T88;
  wire T89;
  wire[31:0] T90;
  wire T91;
  wire[31:0] T92;
  wire T93;
  wire[31:0] T94;
  wire T95;
  wire[31:0] T96;
  wire T97;
  wire[31:0] T98;
  wire T99;
  wire[31:0] T100;
  wire T101;
  wire[31:0] T102;
  wire T103;
  wire[31:0] T104;
  wire T105;
  wire[31:0] T106;
  wire T107;
  wire[31:0] T108;
  wire T109;
  wire[31:0] T110;
  wire T111;
  wire[31:0] T112;
  wire T113;
  wire[31:0] T114;
  wire T115;
  wire[31:0] T116;
  wire T117;
  wire[31:0] T118;
  wire T119;
  wire[31:0] T120;
  wire T121;
  wire[31:0] T122;
  wire T123;
  wire[31:0] T124;
  wire T125;
  wire[31:0] T126;
  wire T127;
  wire[31:0] T128;
  wire T129;
  wire[31:0] T130;
  wire T131;
  wire[31:0] T132;
  wire T133;
  wire[31:0] T134;
  wire T135;
  wire[31:0] T136;
  wire T137;
  wire[31:0] T138;
  wire T139;
  wire[31:0] T140;
  wire T141;
  wire[31:0] T142;
  wire T143;
  wire[31:0] T144;
  wire T145;
  wire cs_sret;
  wire T146;
  wire T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire T164;
  wire T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire T172;
  wire T173;
  wire T174;
  wire T175;
  wire T176;
  wire T177;
  wire T178;
  wire T179;
  wire T180;
  wire T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire T186;
  wire T187;
  wire T188;
  wire[5:0] T189;
  wire[4:0] T190;
  wire[4:0] T191;
  wire[4:0] T192;
  wire T193;
  wire cs_syscall;
  wire T194;
  wire T195;
  wire T196;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  wire T210;
  wire T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire T226;
  wire T227;
  wire T228;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire exc_priv;
  wire T236;
  wire T237;
  wire cs_privileged;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire T242;
  wire T243;
  wire T244;
  wire T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire T250;
  wire T251;
  wire T252;
  wire T253;
  wire T254;
  wire T255;
  wire T256;
  wire T257;
  wire T258;
  wire T259;
  wire T260;
  wire T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire T266;
  wire T267;
  wire T268;
  wire T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire T274;
  wire T275;
  wire T276;
  wire T277;
  wire T278;
  wire T279;
  wire T280;
  wire exc_illegal;
  wire T281;
  wire T282;
  wire T283;
  wire T284;
  wire cs_val_inst;
  wire T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire T290;
  wire T291;
  wire T292;
  wire T293;
  wire T294;
  wire T295;
  wire T296;
  wire T297;
  wire T298;
  wire T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire T306;
  wire T307;
  wire T308;
  wire T309;
  wire T310;
  wire T311;
  wire T312;
  wire T313;
  wire T314;
  wire T315;
  wire T316;
  wire T317;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire T322;
  wire T323;
  wire T324;
  wire T325;
  wire T326;
  wire T327;
  wire T328;
  wire T329;
  wire exception;
  wire T330;
  wire T331;
  wire T332;
  wire[1:0] T333;
  wire[1:0] cs_csr_cmd;
  wire[1:0] T334;
  wire[1:0] T335;
  wire[1:0] T336;
  wire[1:0] T337;
  wire[1:0] T338;
  wire[1:0] T339;
  wire[1:0] T340;
  wire[1:0] T341;
  wire[1:0] T342;
  wire[1:0] T343;
  wire[1:0] T344;
  wire[1:0] T345;
  wire[1:0] T346;
  wire[1:0] T347;
  wire[1:0] T348;
  wire[1:0] T349;
  wire[1:0] T350;
  wire[1:0] T351;
  wire[1:0] T352;
  wire[1:0] T353;
  wire[1:0] T354;
  wire[1:0] T355;
  wire[1:0] T356;
  wire[1:0] T357;
  wire[1:0] T358;
  wire[1:0] T359;
  wire[1:0] T360;
  wire[1:0] T361;
  wire[1:0] T362;
  wire[1:0] T363;
  wire[1:0] T364;
  wire[1:0] T365;
  wire[1:0] T366;
  wire[1:0] T367;
  wire[1:0] T368;
  wire[1:0] T369;
  wire[1:0] T370;
  wire[1:0] T371;
  wire[1:0] T372;
  wire[1:0] T373;
  wire[1:0] T374;
  wire[1:0] T375;
  wire stall;
  wire T376;
  wire T377;
  wire T378;
  wire T379;
  wire T380;
  wire T381;
  wire T382;
  wire T383;
  wire T384;
  wire cs_rf_wen;
  wire T385;
  wire T386;
  wire T387;
  wire T388;
  wire T389;
  wire T390;
  wire T391;
  wire T392;
  wire T393;
  wire T394;
  wire T395;
  wire T396;
  wire T397;
  wire T398;
  wire T399;
  wire T400;
  wire T401;
  wire T402;
  wire T403;
  wire T404;
  wire T405;
  wire T406;
  wire T407;
  wire T408;
  wire T409;
  wire T410;
  wire T411;
  wire T412;
  wire T413;
  wire T414;
  wire T415;
  wire T416;
  wire T417;
  wire T418;
  wire T419;
  wire T420;
  wire T421;
  wire T422;
  wire T423;
  wire T424;
  wire T425;
  wire T426;
  wire[2:0] T427;
  wire[1:0] cs_wb_sel;
  wire[1:0] T428;
  wire[1:0] T429;
  wire[1:0] T430;
  wire[1:0] T431;
  wire[1:0] T432;
  wire[1:0] T433;
  wire[1:0] T434;
  wire[1:0] T435;
  wire[1:0] T436;
  wire[1:0] T437;
  wire[1:0] T438;
  wire[1:0] T439;
  wire[1:0] T440;
  wire[1:0] T441;
  wire[1:0] T442;
  wire[1:0] T443;
  wire[1:0] T444;
  wire[1:0] T445;
  wire[1:0] T446;
  wire[1:0] T447;
  wire[1:0] T448;
  wire[1:0] T449;
  wire[1:0] T450;
  wire[1:0] T451;
  wire[1:0] T452;
  wire[1:0] T453;
  wire[1:0] T454;
  wire[1:0] T455;
  wire[1:0] T456;
  wire[1:0] T457;
  wire[1:0] T458;
  wire[1:0] T459;
  wire[1:0] T460;
  wire[1:0] T461;
  wire[1:0] T462;
  wire[1:0] T463;
  wire[1:0] T464;
  wire[1:0] T465;
  wire[1:0] T466;
  wire[1:0] T467;
  wire[1:0] T468;
  wire[1:0] T469;
  wire[3:0] cs_alu_fun;
  wire[3:0] T470;
  wire[3:0] T471;
  wire[3:0] T472;
  wire[3:0] T473;
  wire[3:0] T474;
  wire[3:0] T475;
  wire[3:0] T476;
  wire[3:0] T477;
  wire[3:0] T478;
  wire[3:0] T479;
  wire[3:0] T480;
  wire[3:0] T481;
  wire[3:0] T482;
  wire[3:0] T483;
  wire[3:0] T484;
  wire[3:0] T485;
  wire[3:0] T486;
  wire[3:0] T487;
  wire[3:0] T488;
  wire[3:0] T489;
  wire[3:0] T490;
  wire[3:0] T491;
  wire[3:0] T492;
  wire[3:0] T493;
  wire[3:0] T494;
  wire[3:0] T495;
  wire[3:0] T496;
  wire[3:0] T497;
  wire[3:0] T498;
  wire[3:0] T499;
  wire[3:0] T500;
  wire[3:0] T501;
  wire[3:0] T502;
  wire[3:0] T503;
  wire[3:0] T504;
  wire[3:0] T505;
  wire[3:0] T506;
  wire[3:0] T507;
  wire[3:0] T508;
  wire[3:0] T509;
  wire[3:0] T510;
  wire[3:0] T511;
  wire[2:0] cs_op2_sel;
  wire[2:0] T512;
  wire[2:0] T513;
  wire[2:0] T514;
  wire[2:0] T515;
  wire[2:0] T516;
  wire[2:0] T517;
  wire[2:0] T518;
  wire[2:0] T519;
  wire[2:0] T520;
  wire[2:0] T521;
  wire[2:0] T522;
  wire[2:0] T523;
  wire[2:0] T524;
  wire[2:0] T525;
  wire[2:0] T526;
  wire[2:0] T527;
  wire[2:0] T528;
  wire[2:0] T529;
  wire[2:0] T530;
  wire[2:0] T531;
  wire[2:0] T532;
  wire[2:0] T533;
  wire[2:0] T534;
  wire[2:0] T535;
  wire[2:0] T536;
  wire[2:0] T537;
  wire[2:0] T538;
  wire[2:0] T539;
  wire[2:0] T540;
  wire[2:0] T541;
  wire[2:0] T542;
  wire[2:0] T543;
  wire[2:0] T544;
  wire[2:0] T545;
  wire[2:0] T546;
  wire[2:0] T547;
  wire[2:0] T548;
  wire[2:0] T549;
  wire[2:0] T550;
  wire[2:0] T551;
  wire[2:0] T552;
  wire[2:0] T553;
  wire[1:0] cs_op1_sel;
  wire[1:0] T554;
  wire[1:0] T555;
  wire[1:0] T556;
  wire[1:0] T557;
  wire[1:0] T558;
  wire[1:0] T559;
  wire[1:0] T560;
  wire[1:0] T561;
  wire[1:0] T562;
  wire[1:0] T563;
  wire[1:0] T564;
  wire[1:0] T565;
  wire[1:0] T566;
  wire[1:0] T567;
  wire[1:0] T568;
  wire[1:0] T569;
  wire[1:0] T570;
  wire[1:0] T571;
  wire[1:0] T572;
  wire[1:0] T573;
  wire[1:0] T574;
  wire[1:0] T575;
  wire[1:0] T576;
  wire[1:0] T577;
  wire[1:0] T578;
  wire[1:0] T579;
  wire[1:0] T580;
  wire[1:0] T581;
  wire[1:0] T582;
  wire[1:0] T583;
  wire[1:0] T584;
  wire[1:0] T585;
  wire[1:0] T586;
  wire[1:0] T587;
  wire[1:0] T588;
  wire[1:0] T589;
  wire[1:0] T590;
  wire[1:0] T591;
  wire[1:0] T592;
  wire[1:0] T593;
  wire[1:0] T594;
  wire[1:0] T595;
  wire[2:0] ctrl_pc_sel;
  wire[2:0] T596;
  wire[2:0] T597;
  wire[2:0] T598;
  wire[2:0] T599;
  wire[2:0] T600;
  wire[2:0] T601;
  wire[2:0] T602;
  wire[2:0] T603;
  wire[2:0] T604;
  wire T605;
  wire[3:0] cs_br_type;
  wire[3:0] T606;
  wire[3:0] T607;
  wire[3:0] T608;
  wire[3:0] T609;
  wire[3:0] T610;
  wire[3:0] T611;
  wire[3:0] T612;
  wire[3:0] T613;
  wire[3:0] T614;
  wire[3:0] T615;
  wire[3:0] T616;
  wire[3:0] T617;
  wire[3:0] T618;
  wire[3:0] T619;
  wire[3:0] T620;
  wire[3:0] T621;
  wire[3:0] T622;
  wire[3:0] T623;
  wire[3:0] T624;
  wire[3:0] T625;
  wire[3:0] T626;
  wire[3:0] T627;
  wire[3:0] T628;
  wire[3:0] T629;
  wire[3:0] T630;
  wire[3:0] T631;
  wire[3:0] T632;
  wire[3:0] T633;
  wire[3:0] T634;
  wire[3:0] T635;
  wire[3:0] T636;
  wire[3:0] T637;
  wire[3:0] T638;
  wire[3:0] T639;
  wire[3:0] T640;
  wire[3:0] T641;
  wire T642;
  wire[2:0] T643;
  wire T644;
  wire[2:0] T645;
  wire T646;
  wire[2:0] T647;
  wire T648;
  wire T649;
  wire[2:0] T650;
  wire T651;
  wire T652;
  wire[2:0] T653;
  wire T654;
  wire[2:0] T655;
  wire T656;
  wire T657;
  wire T658;
  wire T659;
  wire T660;
  wire cs_mem_fcn;
  wire T661;
  wire T662;
  wire T663;
  wire T664;
  wire T665;
  wire T666;
  wire T667;


  assign io_ctl_debug_dmem_typ = cs_msk_sel;
  assign cs_msk_sel = T21 ? 3'h3 : T0;
  assign T0 = T19 ? 3'h1 : T1;
  assign T1 = T17 ? 3'h5 : T2;
  assign T2 = T15 ? 3'h2 : T3;
  assign T3 = T13 ? 3'h6 : T4;
  assign T4 = T11 ? 3'h3 : T5;
  assign T5 = T9 ? 3'h1 : T6;
  assign T6 = T7 ? 3'h2 : 3'h0;
  assign T7 = T8 == 32'h1023;
  assign T8 = io_dat_inst & 32'h707f;
  assign T9 = T10 == 32'h23;
  assign T10 = io_dat_inst & 32'h707f;
  assign T11 = T12 == 32'h2023;
  assign T12 = io_dat_inst & 32'h707f;
  assign T13 = T14 == 32'h5003;
  assign T14 = io_dat_inst & 32'h707f;
  assign T15 = T16 == 32'h1003;
  assign T16 = io_dat_inst & 32'h707f;
  assign T17 = T18 == 32'h4003;
  assign T18 = io_dat_inst & 32'h707f;
  assign T19 = T20 == 32'h3;
  assign T20 = io_dat_inst & 32'h707f;
  assign T21 = T22 == 32'h2003;
  assign T22 = io_dat_inst & 32'h707f;
  assign io_ctl_debug_dmem_val = T23;
  assign T23 = cs_mem_en;
  assign cs_mem_en = T21 ? 1'h1 : T24;
  assign T24 = T19 ? 1'h1 : T25;
  assign T25 = T17 ? 1'h1 : T26;
  assign T26 = T15 ? 1'h1 : T27;
  assign T27 = T13 ? 1'h1 : T28;
  assign T28 = T11 ? 1'h1 : T29;
  assign T29 = T9 ? 1'h1 : T30;
  assign T30 = T7 ? 1'h1 : T31;
  assign T31 = T143 ? 1'h0 : T32;
  assign T32 = T141 ? 1'h0 : T33;
  assign T33 = T139 ? 1'h0 : T34;
  assign T34 = T137 ? 1'h0 : T35;
  assign T35 = T135 ? 1'h0 : T36;
  assign T36 = T133 ? 1'h0 : T37;
  assign T37 = T131 ? 1'h0 : T38;
  assign T38 = T129 ? 1'h0 : T39;
  assign T39 = T127 ? 1'h0 : T40;
  assign T40 = T125 ? 1'h0 : T41;
  assign T41 = T123 ? 1'h0 : T42;
  assign T42 = T121 ? 1'h0 : T43;
  assign T43 = T119 ? 1'h0 : T44;
  assign T44 = T117 ? 1'h0 : T45;
  assign T45 = T115 ? 1'h0 : T46;
  assign T46 = T113 ? 1'h0 : T47;
  assign T47 = T111 ? 1'h0 : T48;
  assign T48 = T109 ? 1'h0 : T49;
  assign T49 = T107 ? 1'h0 : T50;
  assign T50 = T105 ? 1'h0 : T51;
  assign T51 = T103 ? 1'h0 : T52;
  assign T52 = T101 ? 1'h0 : T53;
  assign T53 = T99 ? 1'h0 : T54;
  assign T54 = T97 ? 1'h0 : T55;
  assign T55 = T95 ? 1'h0 : T56;
  assign T56 = T93 ? 1'h0 : T57;
  assign T57 = T91 ? 1'h0 : T58;
  assign T58 = T89 ? 1'h0 : T59;
  assign T59 = T87 ? 1'h0 : T60;
  assign T60 = T85 ? 1'h0 : T61;
  assign T61 = T83 ? 1'h0 : T62;
  assign T62 = T81 ? 1'h0 : T63;
  assign T63 = T79 ? 1'h0 : T64;
  assign T64 = T77 ? 1'h0 : T65;
  assign T65 = T75 ? 1'h0 : T66;
  assign T66 = T74 ? 1'h0 : T67;
  assign T67 = T73 ? 1'h0 : T68;
  assign T68 = T71 ? 1'h0 : T69;
  assign T69 = T70 == 32'hf;
  assign T70 = io_dat_inst & 32'h707f;
  assign T71 = T72 == 32'h100f;
  assign T72 = io_dat_inst & 32'h707f;
  assign T73 = io_dat_inst == 32'h80000073;
  assign T74 = io_dat_inst == 32'h73;
  assign T75 = T76 == 32'h7073;
  assign T76 = io_dat_inst & 32'h707f;
  assign T77 = T78 == 32'h3073;
  assign T78 = io_dat_inst & 32'h707f;
  assign T79 = T80 == 32'h2073;
  assign T80 = io_dat_inst & 32'h707f;
  assign T81 = T82 == 32'h1073;
  assign T82 = io_dat_inst & 32'h707f;
  assign T83 = T84 == 32'h6073;
  assign T84 = io_dat_inst & 32'h707f;
  assign T85 = T86 == 32'h5073;
  assign T86 = io_dat_inst & 32'h707f;
  assign T87 = T88 == 32'h6063;
  assign T88 = io_dat_inst & 32'h707f;
  assign T89 = T90 == 32'h4063;
  assign T90 = io_dat_inst & 32'h707f;
  assign T91 = T92 == 32'h7063;
  assign T92 = io_dat_inst & 32'h707f;
  assign T93 = T94 == 32'h5063;
  assign T94 = io_dat_inst & 32'h707f;
  assign T95 = T96 == 32'h1063;
  assign T96 = io_dat_inst & 32'h707f;
  assign T97 = T98 == 32'h63;
  assign T98 = io_dat_inst & 32'h707f;
  assign T99 = T100 == 32'h67;
  assign T100 = io_dat_inst & 32'h707f;
  assign T101 = T102 == 32'h6f;
  assign T102 = io_dat_inst & 32'h7f;
  assign T103 = T104 == 32'h5033;
  assign T104 = io_dat_inst & 32'hfe00707f;
  assign T105 = T106 == 32'h40005033;
  assign T106 = io_dat_inst & 32'hfe00707f;
  assign T107 = T108 == 32'h4033;
  assign T108 = io_dat_inst & 32'hfe00707f;
  assign T109 = T110 == 32'h6033;
  assign T110 = io_dat_inst & 32'hfe00707f;
  assign T111 = T112 == 32'h7033;
  assign T112 = io_dat_inst & 32'hfe00707f;
  assign T113 = T114 == 32'h3033;
  assign T114 = io_dat_inst & 32'hfe00707f;
  assign T115 = T116 == 32'h2033;
  assign T116 = io_dat_inst & 32'hfe00707f;
  assign T117 = T118 == 32'h40000033;
  assign T118 = io_dat_inst & 32'hfe00707f;
  assign T119 = T120 == 32'h33;
  assign T120 = io_dat_inst & 32'hfe00707f;
  assign T121 = T122 == 32'h1033;
  assign T122 = io_dat_inst & 32'hfe00707f;
  assign T123 = T124 == 32'h5013;
  assign T124 = io_dat_inst & 32'hfc00707f;
  assign T125 = T126 == 32'h40005013;
  assign T126 = io_dat_inst & 32'hfc00707f;
  assign T127 = T128 == 32'h1013;
  assign T128 = io_dat_inst & 32'hfc00707f;
  assign T129 = T130 == 32'h3013;
  assign T130 = io_dat_inst & 32'h707f;
  assign T131 = T132 == 32'h2013;
  assign T132 = io_dat_inst & 32'h707f;
  assign T133 = T134 == 32'h4013;
  assign T134 = io_dat_inst & 32'h707f;
  assign T135 = T136 == 32'h6013;
  assign T136 = io_dat_inst & 32'h707f;
  assign T137 = T138 == 32'h7013;
  assign T138 = io_dat_inst & 32'h707f;
  assign T139 = T140 == 32'h13;
  assign T140 = io_dat_inst & 32'h707f;
  assign T141 = T142 == 32'h37;
  assign T142 = io_dat_inst & 32'h7f;
  assign T143 = T144 == 32'h17;
  assign T144 = io_dat_inst & 32'h7f;
  assign io_ctl_sret = T145;
  assign T145 = cs_sret;
  assign cs_sret = T21 ? 1'h0 : T146;
  assign T146 = T19 ? 1'h0 : T147;
  assign T147 = T17 ? 1'h0 : T148;
  assign T148 = T15 ? 1'h0 : T149;
  assign T149 = T13 ? 1'h0 : T150;
  assign T150 = T11 ? 1'h0 : T151;
  assign T151 = T9 ? 1'h0 : T152;
  assign T152 = T7 ? 1'h0 : T153;
  assign T153 = T143 ? 1'h0 : T154;
  assign T154 = T141 ? 1'h0 : T155;
  assign T155 = T139 ? 1'h0 : T156;
  assign T156 = T137 ? 1'h0 : T157;
  assign T157 = T135 ? 1'h0 : T158;
  assign T158 = T133 ? 1'h0 : T159;
  assign T159 = T131 ? 1'h0 : T160;
  assign T160 = T129 ? 1'h0 : T161;
  assign T161 = T127 ? 1'h0 : T162;
  assign T162 = T125 ? 1'h0 : T163;
  assign T163 = T123 ? 1'h0 : T164;
  assign T164 = T121 ? 1'h0 : T165;
  assign T165 = T119 ? 1'h0 : T166;
  assign T166 = T117 ? 1'h0 : T167;
  assign T167 = T115 ? 1'h0 : T168;
  assign T168 = T113 ? 1'h0 : T169;
  assign T169 = T111 ? 1'h0 : T170;
  assign T170 = T109 ? 1'h0 : T171;
  assign T171 = T107 ? 1'h0 : T172;
  assign T172 = T105 ? 1'h0 : T173;
  assign T173 = T103 ? 1'h0 : T174;
  assign T174 = T101 ? 1'h0 : T175;
  assign T175 = T99 ? 1'h0 : T176;
  assign T176 = T97 ? 1'h0 : T177;
  assign T177 = T95 ? 1'h0 : T178;
  assign T178 = T93 ? 1'h0 : T179;
  assign T179 = T91 ? 1'h0 : T180;
  assign T180 = T89 ? 1'h0 : T181;
  assign T181 = T87 ? 1'h0 : T182;
  assign T182 = T85 ? 1'h0 : T183;
  assign T183 = T83 ? 1'h0 : T184;
  assign T184 = T81 ? 1'h0 : T185;
  assign T185 = T79 ? 1'h0 : T186;
  assign T186 = T77 ? 1'h0 : T187;
  assign T187 = T75 ? 1'h0 : T188;
  assign T188 = T74 ? 1'h0 : T73;
  assign io_ctl_exc_cause = T189;
  assign T189 = {1'h0, T190};
  assign T190 = exc_illegal ? 5'h2 : T191;
  assign T191 = exc_priv ? 5'h3 : T192;
  assign T192 = T193 ? 5'h6 : 5'h0;
  assign T193 = cs_syscall;
  assign cs_syscall = T21 ? 1'h0 : T194;
  assign T194 = T19 ? 1'h0 : T195;
  assign T195 = T17 ? 1'h0 : T196;
  assign T196 = T15 ? 1'h0 : T197;
  assign T197 = T13 ? 1'h0 : T198;
  assign T198 = T11 ? 1'h0 : T199;
  assign T199 = T9 ? 1'h0 : T200;
  assign T200 = T7 ? 1'h0 : T201;
  assign T201 = T143 ? 1'h0 : T202;
  assign T202 = T141 ? 1'h0 : T203;
  assign T203 = T139 ? 1'h0 : T204;
  assign T204 = T137 ? 1'h0 : T205;
  assign T205 = T135 ? 1'h0 : T206;
  assign T206 = T133 ? 1'h0 : T207;
  assign T207 = T131 ? 1'h0 : T208;
  assign T208 = T129 ? 1'h0 : T209;
  assign T209 = T127 ? 1'h0 : T210;
  assign T210 = T125 ? 1'h0 : T211;
  assign T211 = T123 ? 1'h0 : T212;
  assign T212 = T121 ? 1'h0 : T213;
  assign T213 = T119 ? 1'h0 : T214;
  assign T214 = T117 ? 1'h0 : T215;
  assign T215 = T115 ? 1'h0 : T216;
  assign T216 = T113 ? 1'h0 : T217;
  assign T217 = T111 ? 1'h0 : T218;
  assign T218 = T109 ? 1'h0 : T219;
  assign T219 = T107 ? 1'h0 : T220;
  assign T220 = T105 ? 1'h0 : T221;
  assign T221 = T103 ? 1'h0 : T222;
  assign T222 = T101 ? 1'h0 : T223;
  assign T223 = T99 ? 1'h0 : T224;
  assign T224 = T97 ? 1'h0 : T225;
  assign T225 = T95 ? 1'h0 : T226;
  assign T226 = T93 ? 1'h0 : T227;
  assign T227 = T91 ? 1'h0 : T228;
  assign T228 = T89 ? 1'h0 : T229;
  assign T229 = T87 ? 1'h0 : T230;
  assign T230 = T85 ? 1'h0 : T231;
  assign T231 = T83 ? 1'h0 : T232;
  assign T232 = T81 ? 1'h0 : T233;
  assign T233 = T79 ? 1'h0 : T234;
  assign T234 = T77 ? 1'h0 : T235;
  assign T235 = T75 ? 1'h0 : T74;
  assign exc_priv = T237 & T236;
  assign T236 = io_dat_status_s ^ 1'h1;
  assign T237 = cs_privileged;
  assign cs_privileged = T21 ? 1'h0 : T238;
  assign T238 = T19 ? 1'h0 : T239;
  assign T239 = T17 ? 1'h0 : T240;
  assign T240 = T15 ? 1'h0 : T241;
  assign T241 = T13 ? 1'h0 : T242;
  assign T242 = T11 ? 1'h0 : T243;
  assign T243 = T9 ? 1'h0 : T244;
  assign T244 = T7 ? 1'h0 : T245;
  assign T245 = T143 ? 1'h0 : T246;
  assign T246 = T141 ? 1'h0 : T247;
  assign T247 = T139 ? 1'h0 : T248;
  assign T248 = T137 ? 1'h0 : T249;
  assign T249 = T135 ? 1'h0 : T250;
  assign T250 = T133 ? 1'h0 : T251;
  assign T251 = T131 ? 1'h0 : T252;
  assign T252 = T129 ? 1'h0 : T253;
  assign T253 = T127 ? 1'h0 : T254;
  assign T254 = T125 ? 1'h0 : T255;
  assign T255 = T123 ? 1'h0 : T256;
  assign T256 = T121 ? 1'h0 : T257;
  assign T257 = T119 ? 1'h0 : T258;
  assign T258 = T117 ? 1'h0 : T259;
  assign T259 = T115 ? 1'h0 : T260;
  assign T260 = T113 ? 1'h0 : T261;
  assign T261 = T111 ? 1'h0 : T262;
  assign T262 = T109 ? 1'h0 : T263;
  assign T263 = T107 ? 1'h0 : T264;
  assign T264 = T105 ? 1'h0 : T265;
  assign T265 = T103 ? 1'h0 : T266;
  assign T266 = T101 ? 1'h0 : T267;
  assign T267 = T99 ? 1'h0 : T268;
  assign T268 = T97 ? 1'h0 : T269;
  assign T269 = T95 ? 1'h0 : T270;
  assign T270 = T93 ? 1'h0 : T271;
  assign T271 = T91 ? 1'h0 : T272;
  assign T272 = T89 ? 1'h0 : T273;
  assign T273 = T87 ? 1'h0 : T274;
  assign T274 = T85 ? 1'h0 : T275;
  assign T275 = T83 ? 1'h0 : T276;
  assign T276 = T81 ? 1'h0 : T277;
  assign T277 = T79 ? 1'h0 : T278;
  assign T278 = T77 ? 1'h0 : T279;
  assign T279 = T75 ? 1'h0 : T280;
  assign T280 = T74 ? 1'h0 : T73;
  assign exc_illegal = T283 | T281;
  assign T281 = T282 & io_dat_status_ei;
  assign T282 = cs_sret;
  assign T283 = T284 & io_imem_resp_valid;
  assign T284 = cs_val_inst ^ 1'h1;
  assign cs_val_inst = T21 ? 1'h1 : T285;
  assign T285 = T19 ? 1'h1 : T286;
  assign T286 = T17 ? 1'h1 : T287;
  assign T287 = T15 ? 1'h1 : T288;
  assign T288 = T13 ? 1'h1 : T289;
  assign T289 = T11 ? 1'h1 : T290;
  assign T290 = T9 ? 1'h1 : T291;
  assign T291 = T7 ? 1'h1 : T292;
  assign T292 = T143 ? 1'h1 : T293;
  assign T293 = T141 ? 1'h1 : T294;
  assign T294 = T139 ? 1'h1 : T295;
  assign T295 = T137 ? 1'h1 : T296;
  assign T296 = T135 ? 1'h1 : T297;
  assign T297 = T133 ? 1'h1 : T298;
  assign T298 = T131 ? 1'h1 : T299;
  assign T299 = T129 ? 1'h1 : T300;
  assign T300 = T127 ? 1'h1 : T301;
  assign T301 = T125 ? 1'h1 : T302;
  assign T302 = T123 ? 1'h1 : T303;
  assign T303 = T121 ? 1'h1 : T304;
  assign T304 = T119 ? 1'h1 : T305;
  assign T305 = T117 ? 1'h1 : T306;
  assign T306 = T115 ? 1'h1 : T307;
  assign T307 = T113 ? 1'h1 : T308;
  assign T308 = T111 ? 1'h1 : T309;
  assign T309 = T109 ? 1'h1 : T310;
  assign T310 = T107 ? 1'h1 : T311;
  assign T311 = T105 ? 1'h1 : T312;
  assign T312 = T103 ? 1'h1 : T313;
  assign T313 = T101 ? 1'h1 : T314;
  assign T314 = T99 ? 1'h1 : T315;
  assign T315 = T97 ? 1'h1 : T316;
  assign T316 = T95 ? 1'h1 : T317;
  assign T317 = T93 ? 1'h1 : T318;
  assign T318 = T91 ? 1'h1 : T319;
  assign T319 = T89 ? 1'h1 : T320;
  assign T320 = T87 ? 1'h1 : T321;
  assign T321 = T85 ? 1'h1 : T322;
  assign T322 = T83 ? 1'h1 : T323;
  assign T323 = T81 ? 1'h1 : T324;
  assign T324 = T79 ? 1'h1 : T325;
  assign T325 = T77 ? 1'h1 : T326;
  assign T326 = T75 ? 1'h1 : T327;
  assign T327 = T74 ? 1'h1 : T328;
  assign T328 = T73 ? 1'h1 : T329;
  assign T329 = T71 ? 1'h1 : T69;
  assign io_ctl_exception = exception;
  assign exception = T330;
  assign T330 = T331 | exc_priv;
  assign T331 = T332 | exc_illegal;
  assign T332 = cs_syscall;
  assign io_ctl_csr_cmd = T333;
  assign T333 = stall ? 2'h0 : cs_csr_cmd;
  assign cs_csr_cmd = T21 ? 2'h0 : T334;
  assign T334 = T19 ? 2'h0 : T335;
  assign T335 = T17 ? 2'h0 : T336;
  assign T336 = T15 ? 2'h0 : T337;
  assign T337 = T13 ? 2'h0 : T338;
  assign T338 = T11 ? 2'h0 : T339;
  assign T339 = T9 ? 2'h0 : T340;
  assign T340 = T7 ? 2'h0 : T341;
  assign T341 = T143 ? 2'h0 : T342;
  assign T342 = T141 ? 2'h0 : T343;
  assign T343 = T139 ? 2'h0 : T344;
  assign T344 = T137 ? 2'h0 : T345;
  assign T345 = T135 ? 2'h0 : T346;
  assign T346 = T133 ? 2'h0 : T347;
  assign T347 = T131 ? 2'h0 : T348;
  assign T348 = T129 ? 2'h0 : T349;
  assign T349 = T127 ? 2'h0 : T350;
  assign T350 = T125 ? 2'h0 : T351;
  assign T351 = T123 ? 2'h0 : T352;
  assign T352 = T121 ? 2'h0 : T353;
  assign T353 = T119 ? 2'h0 : T354;
  assign T354 = T117 ? 2'h0 : T355;
  assign T355 = T115 ? 2'h0 : T356;
  assign T356 = T113 ? 2'h0 : T357;
  assign T357 = T111 ? 2'h0 : T358;
  assign T358 = T109 ? 2'h0 : T359;
  assign T359 = T107 ? 2'h0 : T360;
  assign T360 = T105 ? 2'h0 : T361;
  assign T361 = T103 ? 2'h0 : T362;
  assign T362 = T101 ? 2'h0 : T363;
  assign T363 = T99 ? 2'h0 : T364;
  assign T364 = T97 ? 2'h0 : T365;
  assign T365 = T95 ? 2'h0 : T366;
  assign T366 = T93 ? 2'h0 : T367;
  assign T367 = T91 ? 2'h0 : T368;
  assign T368 = T89 ? 2'h0 : T369;
  assign T369 = T87 ? 2'h0 : T370;
  assign T370 = T85 ? 2'h1 : T371;
  assign T371 = T83 ? 2'h2 : T372;
  assign T372 = T81 ? 2'h1 : T373;
  assign T373 = T79 ? 2'h2 : T374;
  assign T374 = T77 ? 2'h3 : T375;
  assign T375 = T75 ? 2'h3 : 2'h0;
  assign stall = T376 | io_resetSignal;
  assign T376 = T382 | T377;
  assign T377 = T378 ^ 1'h1;
  assign T378 = T380 | T379;
  assign T379 = cs_mem_en ^ 1'h1;
  assign T380 = T381 & io_dmem_resp_valid;
  assign T381 = cs_mem_en;
  assign T382 = io_imem_resp_valid ^ 1'h1;
  assign io_ctl_rf_wen = T383;
  assign T383 = stall ? 1'h0 : T384;
  assign T384 = cs_rf_wen;
  assign cs_rf_wen = T21 ? 1'h1 : T385;
  assign T385 = T19 ? 1'h1 : T386;
  assign T386 = T17 ? 1'h1 : T387;
  assign T387 = T15 ? 1'h1 : T388;
  assign T388 = T13 ? 1'h1 : T389;
  assign T389 = T11 ? 1'h0 : T390;
  assign T390 = T9 ? 1'h0 : T391;
  assign T391 = T7 ? 1'h0 : T392;
  assign T392 = T143 ? 1'h1 : T393;
  assign T393 = T141 ? 1'h1 : T394;
  assign T394 = T139 ? 1'h1 : T395;
  assign T395 = T137 ? 1'h1 : T396;
  assign T396 = T135 ? 1'h1 : T397;
  assign T397 = T133 ? 1'h1 : T398;
  assign T398 = T131 ? 1'h1 : T399;
  assign T399 = T129 ? 1'h1 : T400;
  assign T400 = T127 ? 1'h1 : T401;
  assign T401 = T125 ? 1'h1 : T402;
  assign T402 = T123 ? 1'h1 : T403;
  assign T403 = T121 ? 1'h1 : T404;
  assign T404 = T119 ? 1'h1 : T405;
  assign T405 = T117 ? 1'h1 : T406;
  assign T406 = T115 ? 1'h1 : T407;
  assign T407 = T113 ? 1'h1 : T408;
  assign T408 = T111 ? 1'h1 : T409;
  assign T409 = T109 ? 1'h1 : T410;
  assign T410 = T107 ? 1'h1 : T411;
  assign T411 = T105 ? 1'h1 : T412;
  assign T412 = T103 ? 1'h1 : T413;
  assign T413 = T101 ? 1'h1 : T414;
  assign T414 = T99 ? 1'h1 : T415;
  assign T415 = T97 ? 1'h0 : T416;
  assign T416 = T95 ? 1'h0 : T417;
  assign T417 = T93 ? 1'h0 : T418;
  assign T418 = T91 ? 1'h0 : T419;
  assign T419 = T89 ? 1'h0 : T420;
  assign T420 = T87 ? 1'h0 : T421;
  assign T421 = T85 ? 1'h1 : T422;
  assign T422 = T83 ? 1'h1 : T423;
  assign T423 = T81 ? 1'h1 : T424;
  assign T424 = T79 ? 1'h1 : T425;
  assign T425 = T77 ? 1'h1 : T75;
  assign io_ctl_wa_sel = T426;
  assign T426 = 1'h1;
  assign io_ctl_wb_sel = T427;
  assign T427 = {1'h0, cs_wb_sel};
  assign cs_wb_sel = T21 ? 2'h1 : T428;
  assign T428 = T19 ? 2'h1 : T429;
  assign T429 = T17 ? 2'h1 : T430;
  assign T430 = T15 ? 2'h1 : T431;
  assign T431 = T13 ? 2'h1 : T432;
  assign T432 = T11 ? 2'h0 : T433;
  assign T433 = T9 ? 2'h0 : T434;
  assign T434 = T7 ? 2'h0 : T435;
  assign T435 = T143 ? 2'h0 : T436;
  assign T436 = T141 ? 2'h0 : T437;
  assign T437 = T139 ? 2'h0 : T438;
  assign T438 = T137 ? 2'h0 : T439;
  assign T439 = T135 ? 2'h0 : T440;
  assign T440 = T133 ? 2'h0 : T441;
  assign T441 = T131 ? 2'h0 : T442;
  assign T442 = T129 ? 2'h0 : T443;
  assign T443 = T127 ? 2'h0 : T444;
  assign T444 = T125 ? 2'h0 : T445;
  assign T445 = T123 ? 2'h0 : T446;
  assign T446 = T121 ? 2'h0 : T447;
  assign T447 = T119 ? 2'h0 : T448;
  assign T448 = T117 ? 2'h0 : T449;
  assign T449 = T115 ? 2'h0 : T450;
  assign T450 = T113 ? 2'h0 : T451;
  assign T451 = T111 ? 2'h0 : T452;
  assign T452 = T109 ? 2'h0 : T453;
  assign T453 = T107 ? 2'h0 : T454;
  assign T454 = T105 ? 2'h0 : T455;
  assign T455 = T103 ? 2'h0 : T456;
  assign T456 = T101 ? 2'h2 : T457;
  assign T457 = T99 ? 2'h2 : T458;
  assign T458 = T97 ? 2'h0 : T459;
  assign T459 = T95 ? 2'h0 : T460;
  assign T460 = T93 ? 2'h0 : T461;
  assign T461 = T91 ? 2'h0 : T462;
  assign T462 = T89 ? 2'h0 : T463;
  assign T463 = T87 ? 2'h0 : T464;
  assign T464 = T85 ? 2'h3 : T465;
  assign T465 = T83 ? 2'h3 : T466;
  assign T466 = T81 ? 2'h3 : T467;
  assign T467 = T79 ? 2'h3 : T468;
  assign T468 = T77 ? 2'h3 : T469;
  assign T469 = T75 ? 2'h3 : 2'h0;
  assign io_ctl_alu_fun = cs_alu_fun;
  assign cs_alu_fun = T21 ? 4'h1 : T470;
  assign T470 = T19 ? 4'h1 : T471;
  assign T471 = T17 ? 4'h1 : T472;
  assign T472 = T15 ? 4'h1 : T473;
  assign T473 = T13 ? 4'h1 : T474;
  assign T474 = T11 ? 4'h1 : T475;
  assign T475 = T9 ? 4'h1 : T476;
  assign T476 = T7 ? 4'h1 : T477;
  assign T477 = T143 ? 4'h1 : T478;
  assign T478 = T141 ? 4'hb : T479;
  assign T479 = T139 ? 4'h1 : T480;
  assign T480 = T137 ? 4'h6 : T481;
  assign T481 = T135 ? 4'h7 : T482;
  assign T482 = T133 ? 4'h8 : T483;
  assign T483 = T131 ? 4'h9 : T484;
  assign T484 = T129 ? 4'ha : T485;
  assign T485 = T127 ? 4'h3 : T486;
  assign T486 = T125 ? 4'h5 : T487;
  assign T487 = T123 ? 4'h4 : T488;
  assign T488 = T121 ? 4'h3 : T489;
  assign T489 = T119 ? 4'h1 : T490;
  assign T490 = T117 ? 4'h2 : T491;
  assign T491 = T115 ? 4'h9 : T492;
  assign T492 = T113 ? 4'ha : T493;
  assign T493 = T111 ? 4'h6 : T494;
  assign T494 = T109 ? 4'h7 : T495;
  assign T495 = T107 ? 4'h8 : T496;
  assign T496 = T105 ? 4'h5 : T497;
  assign T497 = T103 ? 4'h4 : T498;
  assign T498 = T101 ? 4'h0 : T499;
  assign T499 = T99 ? 4'h0 : T500;
  assign T500 = T97 ? 4'h0 : T501;
  assign T501 = T95 ? 4'h0 : T502;
  assign T502 = T93 ? 4'h0 : T503;
  assign T503 = T91 ? 4'h0 : T504;
  assign T504 = T89 ? 4'h0 : T505;
  assign T505 = T87 ? 4'h0 : T506;
  assign T506 = T85 ? 4'hb : T507;
  assign T507 = T83 ? 4'hb : T508;
  assign T508 = T81 ? 4'hb : T509;
  assign T509 = T79 ? 4'hb : T510;
  assign T510 = T77 ? 4'hb : T511;
  assign T511 = T75 ? 4'hb : 4'h0;
  assign io_ctl_op2_sel = cs_op2_sel;
  assign cs_op2_sel = T21 ? 3'h1 : T512;
  assign T512 = T19 ? 3'h1 : T513;
  assign T513 = T17 ? 3'h1 : T514;
  assign T514 = T15 ? 3'h1 : T515;
  assign T515 = T13 ? 3'h1 : T516;
  assign T516 = T11 ? 3'h3 : T517;
  assign T517 = T9 ? 3'h3 : T518;
  assign T518 = T7 ? 3'h3 : T519;
  assign T519 = T143 ? 3'h4 : T520;
  assign T520 = T141 ? 3'h4 : T521;
  assign T521 = T139 ? 3'h1 : T522;
  assign T522 = T137 ? 3'h1 : T523;
  assign T523 = T135 ? 3'h1 : T524;
  assign T524 = T133 ? 3'h1 : T525;
  assign T525 = T131 ? 3'h1 : T526;
  assign T526 = T129 ? 3'h1 : T527;
  assign T527 = T127 ? 3'h1 : T528;
  assign T528 = T125 ? 3'h1 : T529;
  assign T529 = T123 ? 3'h1 : T530;
  assign T530 = T121 ? 3'h0 : T531;
  assign T531 = T119 ? 3'h0 : T532;
  assign T532 = T117 ? 3'h0 : T533;
  assign T533 = T115 ? 3'h0 : T534;
  assign T534 = T113 ? 3'h0 : T535;
  assign T535 = T111 ? 3'h0 : T536;
  assign T536 = T109 ? 3'h0 : T537;
  assign T537 = T107 ? 3'h0 : T538;
  assign T538 = T105 ? 3'h0 : T539;
  assign T539 = T103 ? 3'h0 : T540;
  assign T540 = T101 ? 3'h5 : T541;
  assign T541 = T99 ? 3'h1 : T542;
  assign T542 = T97 ? 3'h2 : T543;
  assign T543 = T95 ? 3'h2 : T544;
  assign T544 = T93 ? 3'h2 : T545;
  assign T545 = T91 ? 3'h2 : T546;
  assign T546 = T89 ? 3'h2 : T547;
  assign T547 = T87 ? 3'h2 : T548;
  assign T548 = T85 ? 3'h1 : T549;
  assign T549 = T83 ? 3'h1 : T550;
  assign T550 = T81 ? 3'h1 : T551;
  assign T551 = T79 ? 3'h1 : T552;
  assign T552 = T77 ? 3'h1 : T553;
  assign T553 = T75 ? 3'h1 : 3'h0;
  assign io_ctl_op1_sel = cs_op1_sel;
  assign cs_op1_sel = T21 ? 2'h0 : T554;
  assign T554 = T19 ? 2'h0 : T555;
  assign T555 = T17 ? 2'h0 : T556;
  assign T556 = T15 ? 2'h0 : T557;
  assign T557 = T13 ? 2'h0 : T558;
  assign T558 = T11 ? 2'h0 : T559;
  assign T559 = T9 ? 2'h0 : T560;
  assign T560 = T7 ? 2'h0 : T561;
  assign T561 = T143 ? 2'h1 : T562;
  assign T562 = T141 ? 2'h0 : T563;
  assign T563 = T139 ? 2'h0 : T564;
  assign T564 = T137 ? 2'h0 : T565;
  assign T565 = T135 ? 2'h0 : T566;
  assign T566 = T133 ? 2'h0 : T567;
  assign T567 = T131 ? 2'h0 : T568;
  assign T568 = T129 ? 2'h0 : T569;
  assign T569 = T127 ? 2'h0 : T570;
  assign T570 = T125 ? 2'h0 : T571;
  assign T571 = T123 ? 2'h0 : T572;
  assign T572 = T121 ? 2'h0 : T573;
  assign T573 = T119 ? 2'h0 : T574;
  assign T574 = T117 ? 2'h0 : T575;
  assign T575 = T115 ? 2'h0 : T576;
  assign T576 = T113 ? 2'h0 : T577;
  assign T577 = T111 ? 2'h0 : T578;
  assign T578 = T109 ? 2'h0 : T579;
  assign T579 = T107 ? 2'h0 : T580;
  assign T580 = T105 ? 2'h0 : T581;
  assign T581 = T103 ? 2'h0 : T582;
  assign T582 = T101 ? 2'h0 : T583;
  assign T583 = T99 ? 2'h0 : T584;
  assign T584 = T97 ? 2'h0 : T585;
  assign T585 = T95 ? 2'h0 : T586;
  assign T586 = T93 ? 2'h0 : T587;
  assign T587 = T91 ? 2'h0 : T588;
  assign T588 = T89 ? 2'h0 : T589;
  assign T589 = T87 ? 2'h0 : T590;
  assign T590 = T85 ? 2'h3 : T591;
  assign T591 = T83 ? 2'h3 : T592;
  assign T592 = T81 ? 2'h0 : T593;
  assign T593 = T79 ? 2'h0 : T594;
  assign T594 = T77 ? 2'h0 : T595;
  assign T595 = T75 ? 2'h3 : 2'h0;
  assign io_ctl_pc_sel = ctrl_pc_sel;
  assign ctrl_pc_sel = T659 ? 3'h4 : T596;
  assign T596 = T658 ? 3'h0 : T597;
  assign T597 = T657 ? T655 : T598;
  assign T598 = T654 ? T653 : T599;
  assign T599 = T652 ? T650 : T600;
  assign T600 = T649 ? T647 : T601;
  assign T601 = T646 ? T645 : T602;
  assign T602 = T644 ? T643 : T603;
  assign T603 = T642 ? 3'h2 : T604;
  assign T604 = T605 ? 3'h3 : 3'h0;
  assign T605 = cs_br_type == 4'h8;
  assign cs_br_type = T21 ? 4'h0 : T606;
  assign T606 = T19 ? 4'h0 : T607;
  assign T607 = T17 ? 4'h0 : T608;
  assign T608 = T15 ? 4'h0 : T609;
  assign T609 = T13 ? 4'h0 : T610;
  assign T610 = T11 ? 4'h0 : T611;
  assign T611 = T9 ? 4'h0 : T612;
  assign T612 = T7 ? 4'h0 : T613;
  assign T613 = T143 ? 4'h0 : T614;
  assign T614 = T141 ? 4'h0 : T615;
  assign T615 = T139 ? 4'h0 : T616;
  assign T616 = T137 ? 4'h0 : T617;
  assign T617 = T135 ? 4'h0 : T618;
  assign T618 = T133 ? 4'h0 : T619;
  assign T619 = T131 ? 4'h0 : T620;
  assign T620 = T129 ? 4'h0 : T621;
  assign T621 = T127 ? 4'h0 : T622;
  assign T622 = T125 ? 4'h0 : T623;
  assign T623 = T123 ? 4'h0 : T624;
  assign T624 = T121 ? 4'h0 : T625;
  assign T625 = T119 ? 4'h0 : T626;
  assign T626 = T117 ? 4'h0 : T627;
  assign T627 = T115 ? 4'h0 : T628;
  assign T628 = T113 ? 4'h0 : T629;
  assign T629 = T111 ? 4'h0 : T630;
  assign T630 = T109 ? 4'h0 : T631;
  assign T631 = T107 ? 4'h0 : T632;
  assign T632 = T105 ? 4'h0 : T633;
  assign T633 = T103 ? 4'h0 : T634;
  assign T634 = T101 ? 4'h7 : T635;
  assign T635 = T99 ? 4'h8 : T636;
  assign T636 = T97 ? 4'h2 : T637;
  assign T637 = T95 ? 4'h1 : T638;
  assign T638 = T93 ? 4'h3 : T639;
  assign T639 = T91 ? 4'h4 : T640;
  assign T640 = T89 ? 4'h5 : T641;
  assign T641 = T87 ? 4'h6 : 4'h0;
  assign T642 = cs_br_type == 4'h7;
  assign T643 = io_dat_br_ltu ? 3'h1 : 3'h0;
  assign T644 = cs_br_type == 4'h6;
  assign T645 = io_dat_br_lt ? 3'h1 : 3'h0;
  assign T646 = cs_br_type == 4'h5;
  assign T647 = T648 ? 3'h1 : 3'h0;
  assign T648 = io_dat_br_ltu ^ 1'h1;
  assign T649 = cs_br_type == 4'h4;
  assign T650 = T651 ? 3'h1 : 3'h0;
  assign T651 = io_dat_br_lt ^ 1'h1;
  assign T652 = cs_br_type == 4'h3;
  assign T653 = io_dat_br_eq ? 3'h1 : 3'h0;
  assign T654 = cs_br_type == 4'h2;
  assign T655 = T656 ? 3'h1 : 3'h0;
  assign T656 = io_dat_br_eq ^ 1'h1;
  assign T657 = cs_br_type == 4'h1;
  assign T658 = cs_br_type == 4'h0;
  assign T659 = exception | T660;
  assign T660 = cs_sret;
  assign io_ctl_stall = stall;
  assign io_dmem_req_bits_typ = cs_msk_sel;
  assign io_dmem_req_bits_fcn = cs_mem_fcn;
  assign cs_mem_fcn = T21 ? 1'h0 : T661;
  assign T661 = T19 ? 1'h0 : T662;
  assign T662 = T17 ? 1'h0 : T663;
  assign T663 = T15 ? 1'h0 : T664;
  assign T664 = T13 ? 1'h0 : T665;
  assign T665 = T11 ? 1'h1 : T666;
  assign T666 = T9 ? 1'h1 : T7;
  assign io_dmem_req_valid = T667;
  assign T667 = cs_mem_en;
  assign io_imem_req_bits_typ = 3'h7;
  assign io_imem_req_bits_fcn = 1'h0;
  assign io_imem_req_valid = 1'h1;
endmodule

module CSRFile(input clk, input reset,
    input  io_host_reset,
    output io_host_debug_stats_pcr,
    input  io_host_id,
    output io_host_pcr_req_ready,
    input  io_host_pcr_req_valid,
    input  io_host_pcr_req_bits_rw,
    input [11:0] io_host_pcr_req_bits_addr,
    input [63:0] io_host_pcr_req_bits_data,
    input  io_host_pcr_rep_ready,
    output io_host_pcr_rep_valid,
    output[63:0] io_host_pcr_rep_bits,
    input  io_host_ipi_req_ready,
    output io_host_ipi_req_valid,
    output io_host_ipi_req_bits,
    output io_host_ipi_rep_ready,
    input  io_host_ipi_rep_valid,
    input  io_host_ipi_rep_bits,
    //output io_host_mem_req_ready
    input  io_host_mem_req_valid,
    input  io_host_mem_req_bits_rw,
    input [63:0] io_host_mem_req_bits_addr,
    input [63:0] io_host_mem_req_bits_data,
    //output io_host_mem_rep_valid
    //output[63:0] io_host_mem_rep_bits
    input [11:0] io_rw_addr,
    input [1:0] io_rw_cmd,
    output[31:0] io_rw_rdata,
    input [31:0] io_rw_wdata,
    output[7:0] io_status_ip,
    output[7:0] io_status_im,
    output[6:0] io_status_zero,
    output io_status_er,
    output io_status_vm,
    output io_status_s64,
    output io_status_u64,
    output io_status_ef,
    output io_status_pei,
    output io_status_ei,
    output io_status_ps,
    output io_status_s,
    output[31:0] io_ptbr,
    output[32:0] io_evec,
    input  io_exception,
    input  io_retire,
    input [31:0] io_cause,
    input  io_badvaddr_wen,
    input [32:0] io_pc,
    input  io_sret,
    output io_fatc,
    output io_replay,
    output[31:0] io_time
);

  wire[31:0] T0;
  reg [4:0] R1;
  wire[4:0] T2;
  wire[4:0] T3;
  wire[4:0] T4;
  wire[5:0] T5;
  wire[5:0] T6;
  wire[4:0] T7;
  wire[63:0] T8;
  wire[63:0] wdata;
  reg [63:0] host_pcr_bits_data;
  wire[63:0] T9;
  wire[63:0] T10;
  wire T11;
  wire[63:0] T12;
  wire host_pcr_req_fire;
  wire T13;
  wire T14;
  reg  host_pcr_req_valid;
  wire T15;
  wire T16;
  wire[63:0] T17;
  wire T18;
  wire T19;
  wire[25:0] T20;
  wire[24:0] T21;
  wire[23:0] T22;
  wire[22:0] T23;
  wire[21:0] T24;
  wire[20:0] T25;
  wire[19:0] T26;
  wire[18:0] T27;
  wire[17:0] T28;
  wire[16:0] T29;
  wire[15:0] T30;
  wire[14:0] T31;
  wire[13:0] T32;
  wire[12:0] T33;
  wire[11:0] T34;
  wire[10:0] T35;
  wire[9:0] T36;
  wire[8:0] T37;
  wire[7:0] T38;
  wire[6:0] T39;
  wire[5:0] T40;
  wire[4:0] T41;
  wire[3:0] T42;
  wire[2:0] T43;
  wire[1:0] T44;
  wire T45;
  wire T46;
  wire[11:0] T47;
  wire[11:0] addr;
  wire[11:0] T48;
  reg [11:0] host_pcr_bits_addr;
  wire[11:0] T49;
  wire T50;
  wire T51;
  wire[11:0] T52;
  wire T53;
  wire T54;
  wire[11:0] T55;
  wire T56;
  wire T57;
  wire[11:0] T58;
  wire T59;
  wire T60;
  wire[11:0] T61;
  wire T62;
  wire T63;
  wire[11:0] T64;
  wire T65;
  wire T66;
  wire[11:0] T67;
  wire T68;
  wire T69;
  wire[11:0] T70;
  wire T71;
  wire T72;
  wire[11:0] T73;
  wire T74;
  wire T75;
  wire[11:0] T76;
  wire T77;
  wire T78;
  wire[11:0] T79;
  wire T80;
  wire T81;
  wire[11:0] T82;
  wire T83;
  wire T84;
  wire[11:0] T85;
  wire T86;
  wire T87;
  wire[11:0] T88;
  wire T89;
  wire T90;
  wire[11:0] T91;
  wire T92;
  wire T93;
  wire[11:0] T94;
  wire T95;
  wire T96;
  wire[11:0] T97;
  wire T98;
  wire T99;
  wire[11:0] T100;
  wire T101;
  wire T102;
  wire[11:0] T103;
  wire T104;
  wire T105;
  wire[11:0] T106;
  wire T107;
  wire T108;
  wire[11:0] T109;
  wire T110;
  wire T111;
  wire[11:0] T112;
  wire T113;
  wire T114;
  wire[11:0] T115;
  wire T116;
  wire T117;
  wire[11:0] T118;
  wire T119;
  wire T120;
  wire[11:0] T121;
  wire T122;
  wire T123;
  wire[11:0] T124;
  wire wen;
  wire T125;
  reg  host_pcr_bits_rw;
  wire T126;
  reg [26:0] R127;
  wire[26:0] T128;
  wire[26:0] T129;
  wire[26:0] T130;
  wire[26:0] T131;
  wire T132;
  wire[26:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  wire[32:0] T138;
  wire[32:0] T139;
  reg [32:0] reg_epc;
  wire[32:0] T140;
  wire[32:0] T141;
  wire[32:0] T142;
  wire[32:0] T143;
  wire[32:0] T144;
  wire T145;
  wire T146;
  wire[32:0] T147;
  wire[31:0] T148;
  reg [31:0] reg_evec;
  wire[31:0] T149;
  wire[31:0] T150;
  wire[31:0] T151;
  wire T152;
  wire T153;
  wire T154;
  reg [31:0] reg_ptbr;
  wire[31:0] T155;
  wire[31:0] T156;
  wire[31:0] T157;
  wire[19:0] T158;
  wire T159;
  wire T160;
  reg  reg_status_s;
  wire T161;
  wire T162;
  wire T163;
  wire T164;
  reg  reg_status_ps;
  wire T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  reg  reg_status_ei;
  wire T172;
  wire T173;
  wire T174;
  wire T175;
  reg  reg_status_pei;
  wire T176;
  wire T177;
  wire T178;
  wire T179;
  wire T180;
  reg  reg_status_ef;
  wire T181;
  wire T182;
  wire T183;
  wire T184;
  reg  reg_status_u64;
  wire T185;
  wire T186;
  wire T187;
  wire T188;
  reg  reg_status_s64;
  wire T189;
  wire T190;
  wire T191;
  wire T192;
  reg  reg_status_vm;
  wire T193;
  wire T194;
  wire T195;
  wire T196;
  reg  reg_status_er;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  reg [6:0] reg_status_zero;
  wire[6:0] T201;
  wire[6:0] T202;
  wire[6:0] T203;
  wire[6:0] T204;
  reg [7:0] reg_status_im;
  wire[7:0] T205;
  wire[7:0] T206;
  wire[7:0] T207;
  wire[7:0] T208;
  wire[3:0] T209;
  wire[1:0] T210;
  reg  r_irq_ipi;
  wire T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire[1:0] T217;
  wire T218;
  reg [31:0] reg_fromhost;
  wire[31:0] T219;
  wire[63:0] T220;
  wire[63:0] T221;
  wire[63:0] T222;
  wire T223;
  wire T224;
  wire T225;
  wire T226;
  wire T227;
  wire T228;
  reg  r_irq_timer;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  reg [31:0] reg_compare;
  wire[31:0] T233;
  wire[31:0] T234;
  wire[31:0] T235;
  wire T236;
  wire T237;
  wire[31:0] T238;
  wire[31:0] T239;
  wire[32:0] T240;
  wire[32:0] T241;
  wire[31:0] T242;
  wire[31:0] T243;
  wire[31:0] T244;
  wire[5:0] T245;
  wire[2:0] T246;
  wire[1:0] T247;
  wire[2:0] T248;
  wire[1:0] T249;
  wire[25:0] T250;
  wire[2:0] T251;
  wire[1:0] T252;
  wire[22:0] T253;
  wire[14:0] T254;
  wire[32:0] T255;
  wire[32:0] T256;
  wire T257;
  wire T258;
  wire[32:0] T259;
  wire[32:0] T260;
  wire[1:0] T261;
  wire T262;
  wire[32:0] T263;
  wire[32:0] T264;
  wire[32:0] T265;
  wire[31:0] T266;
  wire[31:0] T267;
  wire[31:0] T268;
  wire[31:0] T269;
  wire[31:0] T270;
  wire[31:0] T271;
  wire T272;
  reg  reg_stats;
  wire T273;
  wire T274;
  wire T275;
  wire T276;
  wire T277;
  wire[31:0] T278;
  wire[31:0] T279;
  reg [31:0] reg_sup0;
  wire[31:0] T280;
  wire[63:0] T281;
  wire[63:0] T282;
  wire T283;
  wire T284;
  wire[31:0] T285;
  wire[31:0] T286;
  wire[31:0] T287;
  reg [4:0] R288;
  wire[4:0] T289;
  wire[4:0] T290;
  wire[4:0] T291;
  wire[5:0] T292;
  wire[5:0] T293;
  reg [26:0] R294;
  wire[26:0] T295;
  wire[26:0] T296;
  wire[26:0] T297;
  wire T298;
  wire T299;
  wire T300;
  wire[31:0] T301;
  wire[31:0] T302;
  reg [31:0] reg_sup1;
  wire[31:0] T303;
  wire[63:0] T304;
  wire[63:0] T305;
  wire T306;
  wire T307;
  wire[31:0] T308;
  wire[31:0] T309;
  wire[1:0] T310;
  wire[31:0] T311;
  wire[31:0] T312;
  wire[31:0] T313;
  wire[31:0] T314;
  wire T315;
  wire[31:0] T316;
  wire[31:0] T317;
  wire[1:0] T318;
  wire[31:0] T319;
  wire[31:0] T320;
  reg [31:0] reg_cause;
  wire[31:0] T321;
  wire T322;
  wire[31:0] T323;
  wire[31:0] T324;
  wire[31:0] read_ptbr;
  wire[19:0] T325;
  wire[31:0] T326;
  wire[31:0] T327;
  reg [31:0] reg_tohost;
  wire[31:0] T328;
  wire[63:0] T329;
  wire[63:0] T330;
  wire[63:0] T331;
  wire[31:0] T332;
  wire T333;
  wire T334;
  wire T335;
  wire T336;
  wire T337;
  wire T338;
  wire T339;
  wire T340;
  wire[31:0] T341;
  wire[31:0] T342;
  wire[31:0] T343;
  wire[31:0] T344;
  wire[31:0] T345;
  wire[31:0] T346;
  wire[31:0] T347;
  wire[31:0] T348;
  wire[1:0] T349;
  wire T350;
  wire[31:0] T351;
  wire[31:0] T352;
  reg [31:0] reg_badvaddr;
  wire[31:0] T353;
  wire[31:0] T354;
  wire[31:0] T355;
  wire[30:0] T356;
  wire T357;
  wire T358;
  wire T359;
  wire T360;
  wire T361;
  wire[30:0] T362;
  wire T363;
  wire[31:0] T364;
  wire T365;
  wire T366;
  wire T367;
  reg  host_pcr_rep_valid;
  wire T368;
  wire T369;
  wire T370;
  wire T371;
  wire T372;
  wire T373;

`ifndef SYNTHESIS
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    host_pcr_bits_data = {2{$random}};
    host_pcr_req_valid = {1{$random}};
    host_pcr_bits_addr = {1{$random}};
    host_pcr_bits_rw = {1{$random}};
    R127 = {1{$random}};
    reg_epc = {2{$random}};
    reg_evec = {1{$random}};
    reg_ptbr = {1{$random}};
    reg_status_s = {1{$random}};
    reg_status_ps = {1{$random}};
    reg_status_ei = {1{$random}};
    reg_status_pei = {1{$random}};
    reg_status_ef = {1{$random}};
    reg_status_u64 = {1{$random}};
    reg_status_s64 = {1{$random}};
    reg_status_vm = {1{$random}};
    reg_status_er = {1{$random}};
    reg_status_zero = {1{$random}};
    reg_status_im = {1{$random}};
    r_irq_ipi = {1{$random}};
    reg_fromhost = {1{$random}};
    r_irq_timer = {1{$random}};
    reg_compare = {1{$random}};
    reg_stats = {1{$random}};
    reg_sup0 = {1{$random}};
    R288 = {1{$random}};
    R294 = {1{$random}};
    reg_sup1 = {1{$random}};
    reg_cause = {1{$random}};
    reg_tohost = {1{$random}};
    reg_badvaddr = {1{$random}};
    host_pcr_rep_valid = {1{$random}};
  end
`endif

  assign io_time = T0;
  assign T0 = {R127, R1};
  assign T2 = reset ? 5'h0 : T3;
  assign T3 = T18 ? T7 : T4;
  assign T4 = T5[3'h4:1'h0];
  assign T5 = T6 + 6'h1;
  assign T6 = {1'h0, R1};
  assign T7 = T8[3'h4:1'h0];
  assign T8 = wdata;
  assign wdata = T14 ? T17 : host_pcr_bits_data;
  assign T9 = host_pcr_req_fire ? T12 : T10;
  assign T10 = T11 ? io_host_pcr_req_bits_data : host_pcr_bits_data;
  assign T11 = io_host_pcr_req_ready & io_host_pcr_req_valid;
  assign T12 = {32'h0, io_rw_rdata};
  assign host_pcr_req_fire = host_pcr_req_valid & T13;
  assign T13 = T14 ^ 1'h1;
  assign T14 = io_rw_cmd != 2'h0;
  assign T15 = host_pcr_req_fire ? 1'h0 : T16;
  assign T16 = T11 ? 1'h1 : host_pcr_req_valid;
  assign T17 = {32'h0, io_rw_wdata};
  assign T18 = wen & T19;
  assign T19 = T20[4'h9:4'h9];
  assign T20 = {T122, T21};
  assign T21 = {T119, T22};
  assign T22 = {T116, T23};
  assign T23 = {T113, T24};
  assign T24 = {T110, T25};
  assign T25 = {T107, T26};
  assign T26 = {T104, T27};
  assign T27 = {T101, T28};
  assign T28 = {T98, T29};
  assign T29 = {T95, T30};
  assign T30 = {T92, T31};
  assign T31 = {T89, T32};
  assign T32 = {T86, T33};
  assign T33 = {T83, T34};
  assign T34 = {T80, T35};
  assign T35 = {T77, T36};
  assign T36 = {T74, T37};
  assign T37 = {T71, T38};
  assign T38 = {T68, T39};
  assign T39 = {T65, T40};
  assign T40 = {T62, T41};
  assign T41 = {T59, T42};
  assign T42 = {T56, T43};
  assign T43 = {T53, T44};
  assign T44 = {T50, T45};
  assign T45 = T46;
  assign T46 = T47 == 12'h0;
  assign T47 = addr & 12'h402;
  assign addr = T14 ? io_rw_addr : T48;
  assign T48 = host_pcr_bits_addr | 12'h500;
  assign T49 = T11 ? io_host_pcr_req_bits_addr : host_pcr_bits_addr;
  assign T50 = T51;
  assign T51 = T52 == 12'h0;
  assign T52 = addr & 12'h401;
  assign T53 = T54;
  assign T54 = T55 == 12'h3;
  assign T55 = addr & 12'h403;
  assign T56 = T57;
  assign T57 = T58 == 12'h0;
  assign T58 = addr & 12'h80f;
  assign T59 = T60;
  assign T60 = T61 == 12'h401;
  assign T61 = addr & 12'hc0f;
  assign T62 = T63;
  assign T63 = T64 == 12'h402;
  assign T64 = addr & 12'hc0f;
  assign T65 = T66;
  assign T66 = T67 == 12'h403;
  assign T67 = addr & 12'h40f;
  assign T68 = T69;
  assign T69 = T70 == 12'h4;
  assign T70 = addr & 12'hf;
  assign T71 = T72;
  assign T72 = T73 == 12'h5;
  assign T73 = addr & 12'hf;
  assign T74 = T75;
  assign T75 = T76 == 12'h6;
  assign T76 = addr & 12'hf;
  assign T77 = T78;
  assign T78 = T79 == 12'h7;
  assign T79 = addr & 12'hf;
  assign T80 = T81;
  assign T81 = T82 == 12'h8;
  assign T82 = addr & 12'hf;
  assign T83 = T84;
  assign T84 = T85 == 12'h9;
  assign T85 = addr & 12'hf;
  assign T86 = T87;
  assign T87 = T88 == 12'ha;
  assign T88 = addr & 12'hf;
  assign T89 = T90;
  assign T90 = T91 == 12'hb;
  assign T91 = addr & 12'hf;
  assign T92 = T93;
  assign T93 = T94 == 12'hc;
  assign T94 = addr & 12'h1f;
  assign T95 = T96;
  assign T96 = T97 == 12'hd;
  assign T97 = addr & 12'h1f;
  assign T98 = T99;
  assign T99 = T100 == 12'he;
  assign T100 = addr & 12'h1f;
  assign T101 = T102;
  assign T102 = T103 == 12'hf;
  assign T103 = addr & 12'h1f;
  assign T104 = T105;
  assign T105 = T106 == 12'h10;
  assign T106 = addr & 12'h13;
  assign T107 = T108;
  assign T108 = T109 == 12'h11;
  assign T109 = addr & 12'h13;
  assign T110 = T111;
  assign T111 = T112 == 12'h12;
  assign T112 = addr & 12'h13;
  assign T113 = T114;
  assign T114 = T115 == 12'h13;
  assign T115 = addr & 12'h13;
  assign T116 = T117;
  assign T117 = T118 == 12'h0;
  assign T118 = addr & 12'h103;
  assign T119 = T120;
  assign T120 = T121 == 12'h801;
  assign T121 = addr & 12'h801;
  assign T122 = T123;
  assign T123 = T124 == 12'h802;
  assign T124 = addr & 12'h802;
  assign wen = T14 | T125;
  assign T125 = host_pcr_req_fire & host_pcr_bits_rw;
  assign T126 = T11 ? io_host_pcr_req_bits_rw : host_pcr_bits_rw;
  assign T128 = reset ? 27'h0 : T129;
  assign T129 = T18 ? T133 : T130;
  assign T130 = T132 ? T131 : R127;
  assign T131 = R127 + 27'h1;
  assign T132 = T5[3'h5:3'h5];
  assign T133 = T8[5'h1f:3'h5];
  assign io_replay = T134;
  assign T134 = io_host_ipi_req_valid & T135;
  assign T135 = io_host_ipi_req_ready ^ 1'h1;
  assign io_fatc = T136;
  assign T136 = wen & T137;
  assign T137 = T20[5'h10:5'h10];
  assign io_evec = T138;
  assign T138 = T139;
  assign T139 = io_exception ? T147 : reg_epc;
  assign T140 = T145 ? T143 : T141;
  assign T141 = io_exception ? T142 : reg_epc;
  assign T142 = io_pc;
  assign T143 = T144;
  assign T144 = wdata[6'h20:1'h0];
  assign T145 = wen & T146;
  assign T146 = T20[3'h5:3'h5];
  assign T147 = {T154, T148};
  assign T148 = reg_evec;
  assign T149 = T152 ? T150 : reg_evec;
  assign T150 = T151;
  assign T151 = wdata[5'h1f:1'h0];
  assign T152 = wen & T153;
  assign T153 = T20[4'hb:4'hb];
  assign T154 = T148[5'h1f:5'h1f];
  assign io_ptbr = reg_ptbr;
  assign T155 = T159 ? T156 : reg_ptbr;
  assign T156 = T157;
  assign T157 = {T158, 12'h0};
  assign T158 = wdata[5'h1f:4'hc];
  assign T159 = wen & T160;
  assign T160 = T20[3'h7:3'h7];
  assign io_status_s = reg_status_s;
  assign T161 = reset ? 1'h1 : T162;
  assign T162 = T169 ? T171 : T163;
  assign T163 = io_sret ? reg_status_ps : T164;
  assign T164 = io_exception ? 1'h1 : reg_status_s;
  assign T165 = reset ? 1'h0 : T166;
  assign T166 = T169 ? T168 : T167;
  assign T167 = io_exception ? reg_status_s : reg_status_ps;
  assign T168 = wdata[1'h1:1'h1];
  assign T169 = wen & T170;
  assign T170 = T20[4'hd:4'hd];
  assign T171 = wdata[1'h0:1'h0];
  assign io_status_ps = reg_status_ps;
  assign io_status_ei = reg_status_ei;
  assign T172 = reset ? 1'h0 : T173;
  assign T173 = T169 ? T180 : T174;
  assign T174 = io_sret ? reg_status_pei : T175;
  assign T175 = io_exception ? 1'h0 : reg_status_ei;
  assign T176 = reset ? 1'h0 : T177;
  assign T177 = T169 ? T179 : T178;
  assign T178 = io_exception ? reg_status_ei : reg_status_pei;
  assign T179 = wdata[2'h3:2'h3];
  assign T180 = wdata[2'h2:2'h2];
  assign io_status_pei = reg_status_pei;
  assign io_status_ef = reg_status_ef;
  assign T181 = reset ? 1'h0 : T182;
  assign T182 = T169 ? 1'h0 : T183;
  assign T183 = T169 ? T184 : reg_status_ef;
  assign T184 = wdata[3'h4:3'h4];
  assign io_status_u64 = reg_status_u64;
  assign T185 = reset ? 1'h1 : T186;
  assign T186 = T169 ? 1'h1 : T187;
  assign T187 = T169 ? T188 : reg_status_u64;
  assign T188 = wdata[3'h5:3'h5];
  assign io_status_s64 = reg_status_s64;
  assign T189 = reset ? 1'h1 : T190;
  assign T190 = T169 ? 1'h1 : T191;
  assign T191 = T169 ? T192 : reg_status_s64;
  assign T192 = wdata[3'h6:3'h6];
  assign io_status_vm = reg_status_vm;
  assign T193 = reset ? 1'h0 : T194;
  assign T194 = T169 ? 1'h0 : T195;
  assign T195 = T169 ? T196 : reg_status_vm;
  assign T196 = wdata[3'h7:3'h7];
  assign io_status_er = reg_status_er;
  assign T197 = reset ? 1'h0 : T198;
  assign T198 = T169 ? 1'h0 : T199;
  assign T199 = T169 ? T200 : reg_status_er;
  assign T200 = wdata[4'h8:4'h8];
  assign io_status_zero = reg_status_zero;
  assign T201 = reset ? 7'h0 : T202;
  assign T202 = T169 ? 7'h0 : T203;
  assign T203 = T169 ? T204 : reg_status_zero;
  assign T204 = wdata[4'hf:4'h9];
  assign io_status_im = reg_status_im;
  assign T205 = reset ? 8'h0 : T206;
  assign T206 = T169 ? T207 : reg_status_im;
  assign T207 = wdata[5'h17:5'h10];
  assign io_status_ip = T208;
  assign T208 = {T209, 4'h0};
  assign T209 = {T217, T210};
  assign T210 = {r_irq_ipi, 1'h0};
  assign T211 = reset ? 1'h1 : T212;
  assign T212 = io_host_ipi_rep_valid ? 1'h1 : T213;
  assign T213 = T215 ? T214 : r_irq_ipi;
  assign T214 = wdata[1'h0:1'h0];
  assign T215 = wen & T216;
  assign T216 = T20[5'h12:5'h12];
  assign T217 = {r_irq_timer, T218};
  assign T218 = reg_fromhost != 32'h0;
  assign T219 = T220[5'h1f:1'h0];
  assign T220 = reset ? 64'h0 : T221;
  assign T221 = T223 ? wdata : T222;
  assign T222 = {32'h0, reg_fromhost};
  assign T223 = T227 & T224;
  assign T224 = T226 | T225;
  assign T225 = host_pcr_req_fire ^ 1'h1;
  assign T226 = reg_fromhost == 32'h0;
  assign T227 = wen & T228;
  assign T228 = T20[5'h16:5'h16];
  assign T229 = reset ? 1'h0 : T230;
  assign T230 = T236 ? 1'h0 : T231;
  assign T231 = T232 ? 1'h1 : r_irq_timer;
  assign T232 = T238 == reg_compare;
  assign T233 = T236 ? T234 : reg_compare;
  assign T234 = T235;
  assign T235 = wdata[5'h1f:1'h0];
  assign T236 = wen & T237;
  assign T237 = T20[4'ha:4'ha];
  assign T238 = T0[5'h1f:1'h0];
  assign io_rw_rdata = T239;
  assign T239 = T240[5'h1f:1'h0];
  assign T240 = T255 | T241;
  assign T241 = {1'h0, T242};
  assign T242 = T170 ? T243 : 32'h0;
  assign T243 = T244;
  assign T244 = {T250, T245};
  assign T245 = {T248, T246};
  assign T246 = {io_status_ei, T247};
  assign T247 = {io_status_ps, io_status_s};
  assign T248 = {io_status_u64, T249};
  assign T249 = {io_status_ef, io_status_pei};
  assign T250 = {T253, T251};
  assign T251 = {io_status_er, T252};
  assign T252 = {io_status_vm, io_status_s64};
  assign T253 = {io_status_ip, T254};
  assign T254 = {io_status_im, io_status_zero};
  assign T255 = T259 | T256;
  assign T256 = {32'h0, T257};
  assign T257 = T258 ? io_host_id : 1'h0;
  assign T258 = T20[4'he:4'he];
  assign T259 = T263 | T260;
  assign T260 = {31'h0, T261};
  assign T261 = T262 ? 2'h2 : 2'h0;
  assign T262 = T20[4'hf:4'hf];
  assign T263 = T265 | T264;
  assign T264 = T146 ? reg_epc : 33'h0;
  assign T265 = {1'h0, T266};
  assign T266 = T268 | T267;
  assign T267 = T19 ? T0 : 32'h0;
  assign T268 = T270 | T269;
  assign T269 = T237 ? reg_compare : 32'h0;
  assign T270 = T278 | T271;
  assign T271 = {31'h0, T272};
  assign T272 = T277 ? reg_stats : 1'h0;
  assign T273 = reset ? 1'h0 : T274;
  assign T274 = T276 ? T275 : reg_stats;
  assign T275 = wdata[1'h0:1'h0];
  assign T276 = wen & T277;
  assign T277 = T20[5'h13:5'h13];
  assign T278 = T285 | T279;
  assign T279 = T284 ? reg_sup0 : 32'h0;
  assign T280 = T281[5'h1f:1'h0];
  assign T281 = T283 ? wdata : T282;
  assign T282 = {32'h0, reg_sup0};
  assign T283 = wen & T284;
  assign T284 = T20[2'h3:2'h3];
  assign T285 = T301 | T286;
  assign T286 = T300 ? T287 : 32'h0;
  assign T287 = {R294, R288};
  assign T289 = reset ? 5'h0 : T290;
  assign T290 = io_retire ? T291 : R288;
  assign T291 = T292[3'h4:1'h0];
  assign T292 = T293 + 6'h1;
  assign T293 = {1'h0, R288};
  assign T295 = reset ? 27'h0 : T296;
  assign T296 = T298 ? T297 : R294;
  assign T297 = R294 + 27'h1;
  assign T298 = io_retire & T299;
  assign T299 = T292[3'h5:3'h5];
  assign T300 = T20[5'h19:5'h19];
  assign T301 = T308 | T302;
  assign T302 = T307 ? reg_sup1 : 32'h0;
  assign T303 = T304[5'h1f:1'h0];
  assign T304 = T306 ? wdata : T305;
  assign T305 = {32'h0, reg_sup1};
  assign T306 = wen & T307;
  assign T307 = T20[3'h4:3'h4];
  assign T308 = T311 | T309;
  assign T309 = {30'h0, T310};
  assign T310 = T137 ? 2'h2 : 2'h0;
  assign T311 = T312 | 32'h0;
  assign T312 = T313 | 32'h0;
  assign T313 = T316 | T314;
  assign T314 = T315 ? T0 : 32'h0;
  assign T315 = T20[5'h17:5'h17];
  assign T316 = T319 | T317;
  assign T317 = {30'h0, T318};
  assign T318 = T216 ? 2'h2 : 2'h0;
  assign T319 = T323 | T320;
  assign T320 = T322 ? reg_cause : 32'h0;
  assign T321 = io_exception ? io_cause : reg_cause;
  assign T322 = T20[4'hc:4'hc];
  assign T323 = T326 | T324;
  assign T324 = T160 ? read_ptbr : 32'h0;
  assign read_ptbr = T325 << 4'hc;
  assign T325 = reg_ptbr[5'h1f:4'hc];
  assign T326 = T341 | T327;
  assign T327 = T334 ? reg_tohost : 32'h0;
  assign T328 = T329[5'h1f:1'h0];
  assign T329 = reset ? 64'h0 : T330;
  assign T330 = T337 ? wdata : T331;
  assign T331 = {32'h0, T332};
  assign T332 = T333 ? 32'h0 : reg_tohost;
  assign T333 = T335 & T334;
  assign T334 = T20[5'h15:5'h15];
  assign T335 = host_pcr_req_fire & T336;
  assign T336 = host_pcr_bits_rw ^ 1'h1;
  assign T337 = T340 & T338;
  assign T338 = T339 | host_pcr_req_fire;
  assign T339 = reg_tohost == 32'h0;
  assign T340 = wen & T334;
  assign T341 = T343 | T342;
  assign T342 = T228 ? reg_fromhost : 32'h0;
  assign T343 = T344 | 32'h0;
  assign T344 = T345 | 32'h0;
  assign T345 = T347 | T346;
  assign T346 = T153 ? reg_evec : 32'h0;
  assign T347 = T351 | T348;
  assign T348 = {30'h0, T349};
  assign T349 = T350 ? 2'h2 : 2'h0;
  assign T350 = T20[5'h11:5'h11];
  assign T351 = T364 | T352;
  assign T352 = T363 ? reg_badvaddr : 32'h0;
  assign T353 = io_badvaddr_wen ? T354 : reg_badvaddr;
  assign T354 = T355;
  assign T355 = {T357, T356};
  assign T356 = io_rw_wdata[5'h1e:1'h0];
  assign T357 = T361 ? T360 : T358;
  assign T358 = T359 != 1'h0;
  assign T359 = io_rw_wdata[5'h1f:5'h1f];
  assign T360 = T359 == 1'h1;
  assign T361 = $signed(T362) < $signed(1'h0);
  assign T362 = T356;
  assign T363 = T20[3'h6:3'h6];
  assign T364 = T365 ? T0 : 32'h0;
  assign T365 = T20[5'h18:5'h18];
  assign io_host_ipi_rep_ready = 1'h1;
  assign io_host_ipi_req_bits = T366;
  assign T366 = io_rw_wdata[1'h0:1'h0];
  assign io_host_ipi_req_valid = T367;
  assign T367 = T14 & T350;
  assign io_host_pcr_rep_bits = host_pcr_bits_data;
  assign io_host_pcr_rep_valid = host_pcr_rep_valid;
  assign T368 = T370 ? 1'h0 : T369;
  assign T369 = host_pcr_req_fire ? 1'h1 : host_pcr_rep_valid;
  assign T370 = io_host_pcr_rep_ready & io_host_pcr_rep_valid;
  assign io_host_pcr_req_ready = T371;
  assign T371 = T373 & T372;
  assign T372 = host_pcr_rep_valid ^ 1'h1;
  assign T373 = host_pcr_req_valid ^ 1'h1;
  assign io_host_debug_stats_pcr = reg_stats;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 5'h0;
    end else if(T18) begin
      R1 <= T7;
    end else begin
      R1 <= T4;
    end
    if(host_pcr_req_fire) begin
      host_pcr_bits_data <= T12;
    end else if(T11) begin
      host_pcr_bits_data <= io_host_pcr_req_bits_data;
    end
    if(host_pcr_req_fire) begin
      host_pcr_req_valid <= 1'h0;
    end else if(T11) begin
      host_pcr_req_valid <= 1'h1;
    end
    if(T11) begin
      host_pcr_bits_addr <= io_host_pcr_req_bits_addr;
    end
    if(T11) begin
      host_pcr_bits_rw <= io_host_pcr_req_bits_rw;
    end
    if(reset) begin
      R127 <= 27'h0;
    end else if(T18) begin
      R127 <= T133;
    end else if(T132) begin
      R127 <= T131;
    end
    if(T145) begin
      reg_epc <= T143;
    end else if(io_exception) begin
      reg_epc <= T142;
    end
    if(T152) begin
      reg_evec <= T150;
    end
    if(T159) begin
      reg_ptbr <= T156;
    end
    if(reset) begin
      reg_status_s <= 1'h1;
    end else if(T169) begin
      reg_status_s <= T171;
    end else if(io_sret) begin
      reg_status_s <= reg_status_ps;
    end else if(io_exception) begin
      reg_status_s <= 1'h1;
    end
    if(reset) begin
      reg_status_ps <= 1'h0;
    end else if(T169) begin
      reg_status_ps <= T168;
    end else if(io_exception) begin
      reg_status_ps <= reg_status_s;
    end
    if(reset) begin
      reg_status_ei <= 1'h0;
    end else if(T169) begin
      reg_status_ei <= T180;
    end else if(io_sret) begin
      reg_status_ei <= reg_status_pei;
    end else if(io_exception) begin
      reg_status_ei <= 1'h0;
    end
    if(reset) begin
      reg_status_pei <= 1'h0;
    end else if(T169) begin
      reg_status_pei <= T179;
    end else if(io_exception) begin
      reg_status_pei <= reg_status_ei;
    end
    if(reset) begin
      reg_status_ef <= 1'h0;
    end else if(T169) begin
      reg_status_ef <= 1'h0;
    end else if(T169) begin
      reg_status_ef <= T184;
    end
    if(reset) begin
      reg_status_u64 <= 1'h1;
    end else if(T169) begin
      reg_status_u64 <= 1'h1;
    end else if(T169) begin
      reg_status_u64 <= T188;
    end
    if(reset) begin
      reg_status_s64 <= 1'h1;
    end else if(T169) begin
      reg_status_s64 <= 1'h1;
    end else if(T169) begin
      reg_status_s64 <= T192;
    end
    if(reset) begin
      reg_status_vm <= 1'h0;
    end else if(T169) begin
      reg_status_vm <= 1'h0;
    end else if(T169) begin
      reg_status_vm <= T196;
    end
    if(reset) begin
      reg_status_er <= 1'h0;
    end else if(T169) begin
      reg_status_er <= 1'h0;
    end else if(T169) begin
      reg_status_er <= T200;
    end
    if(reset) begin
      reg_status_zero <= 7'h0;
    end else if(T169) begin
      reg_status_zero <= 7'h0;
    end else if(T169) begin
      reg_status_zero <= T204;
    end
    if(reset) begin
      reg_status_im <= 8'h0;
    end else if(T169) begin
      reg_status_im <= T207;
    end
    if(reset) begin
      r_irq_ipi <= 1'h1;
    end else if(io_host_ipi_rep_valid) begin
      r_irq_ipi <= 1'h1;
    end else if(T215) begin
      r_irq_ipi <= T214;
    end
    reg_fromhost <= T219;
    if(reset) begin
      r_irq_timer <= 1'h0;
    end else if(T236) begin
      r_irq_timer <= 1'h0;
    end else if(T232) begin
      r_irq_timer <= 1'h1;
    end
    if(T236) begin
      reg_compare <= T234;
    end
    if(reset) begin
      reg_stats <= 1'h0;
    end else if(T276) begin
      reg_stats <= T275;
    end
    reg_sup0 <= T280;
    if(reset) begin
      R288 <= 5'h0;
    end else if(io_retire) begin
      R288 <= T291;
    end
    if(reset) begin
      R294 <= 27'h0;
    end else if(T298) begin
      R294 <= T297;
    end
    reg_sup1 <= T303;
    if(io_exception) begin
      reg_cause <= io_cause;
    end
    reg_tohost <= T328;
    if(io_badvaddr_wen) begin
      reg_badvaddr <= T354;
    end
    if(T370) begin
      host_pcr_rep_valid <= 1'h0;
    end else if(host_pcr_req_fire) begin
      host_pcr_rep_valid <= 1'h1;
    end
  end
endmodule

module DatPath(input clk, input reset,
    input  io_host_reset,
    output io_host_debug_stats_pcr,
    input  io_host_id,
    output io_host_pcr_req_ready,
    input  io_host_pcr_req_valid,
    input  io_host_pcr_req_bits_rw,
    input [11:0] io_host_pcr_req_bits_addr,
    input [63:0] io_host_pcr_req_bits_data,
    input  io_host_pcr_rep_ready,
    output io_host_pcr_rep_valid,
    output[63:0] io_host_pcr_rep_bits,
    input  io_host_ipi_req_ready,
    output io_host_ipi_req_valid,
    output io_host_ipi_req_bits,
    output io_host_ipi_rep_ready,
    input  io_host_ipi_rep_valid,
    input  io_host_ipi_rep_bits,
    //output io_host_mem_req_ready
    input  io_host_mem_req_valid,
    input  io_host_mem_req_bits_rw,
    input [63:0] io_host_mem_req_bits_addr,
    input [63:0] io_host_mem_req_bits_data,
    //output io_host_mem_rep_valid
    //output[63:0] io_host_mem_rep_bits
    input  io_imem_req_ready,
    //output io_imem_req_valid
    output[31:0] io_imem_req_bits_addr,
    //output[31:0] io_imem_req_bits_data
    //output io_imem_req_bits_fcn
    //output[2:0] io_imem_req_bits_typ
    input  io_imem_resp_valid,
    input [31:0] io_imem_resp_bits_data,
    input  io_dmem_req_ready,
    //output io_dmem_req_valid
    output[31:0] io_dmem_req_bits_addr,
    output[31:0] io_dmem_req_bits_data,
    //output io_dmem_req_bits_fcn
    //output[2:0] io_dmem_req_bits_typ
    input  io_dmem_resp_valid,
    input [31:0] io_dmem_resp_bits_data,
    input  io_ctl_stall,
    input [2:0] io_ctl_pc_sel,
    input [1:0] io_ctl_op1_sel,
    input [2:0] io_ctl_op2_sel,
    input [3:0] io_ctl_alu_fun,
    input [2:0] io_ctl_wb_sel,
    input  io_ctl_wa_sel,
    input  io_ctl_rf_wen,
    input [1:0] io_ctl_csr_cmd,
    input  io_ctl_exception,
    input [5:0] io_ctl_exc_cause,
    input  io_ctl_sret,
    input  io_ctl_debug_dmem_val,
    input [2:0] io_ctl_debug_dmem_typ,
    output[31:0] io_dat_inst,
    output io_dat_br_eq,
    output io_dat_br_lt,
    output io_dat_br_ltu,
    output[7:0] io_dat_status_ip,
    output[7:0] io_dat_status_im,
    output[6:0] io_dat_status_zero,
    output io_dat_status_er,
    output io_dat_status_vm,
    output io_dat_status_s64,
    output io_dat_status_u64,
    output io_dat_status_ef,
    output io_dat_status_pei,
    output io_dat_status_ei,
    output io_dat_status_ps,
    output io_dat_status_s
);

  wire T0;
  wire[31:0] T1;
  wire[2:0] T2;
  wire[7:0] T3;
  wire[7:0] T4;
  wire[23:0] T5;
  wire[23:0] T6;
  wire[31:0] T7;
  wire[31:0] wb_data;
  wire[31:0] T8;
  wire[31:0] T9;
  wire[31:0] T10;
  wire[31:0] T11;
  wire[31:0] T12;
  wire[31:0] alu_out;
  wire[31:0] T13;
  wire[31:0] T14;
  wire[31:0] T15;
  wire[31:0] T16;
  wire[31:0] T17;
  wire[31:0] T18;
  wire[31:0] T19;
  wire[31:0] T20;
  wire[31:0] T21;
  wire[31:0] T22;
  wire[31:0] T23;
  wire[31:0] alu_op2;
  wire[31:0] T24;
  wire[31:0] T25;
  wire[31:0] T26;
  wire[31:0] T27;
  wire[31:0] T28;
  wire[31:0] T29;
  wire[31:0] imm_j_sext;
  wire[20:0] T30;
  wire[19:0] imm_j;
  wire[10:0] T31;
  wire[9:0] T32;
  wire[31:0] inst;
  wire T33;
  wire[8:0] T34;
  wire[7:0] T35;
  wire T36;
  wire[10:0] T37;
  wire T38;
  wire T39;
  wire[31:0] imm_u_sext;
  wire[19:0] T40;
  wire T41;
  wire[31:0] imm_s_sext;
  wire[11:0] imm_s;
  wire[4:0] T42;
  wire[6:0] T43;
  wire[19:0] T44;
  wire T45;
  wire T46;
  wire[31:0] imm_b_sext;
  wire[12:0] T47;
  wire[11:0] imm_b;
  wire[9:0] T48;
  wire[3:0] T49;
  wire[5:0] T50;
  wire[1:0] T51;
  wire T52;
  wire T53;
  wire[18:0] T54;
  wire T55;
  wire T56;
  wire[31:0] imm_i_sext;
  wire[11:0] T57;
  wire[19:0] T58;
  wire T59;
  wire T60;
  wire[31:0] rs2_data;
  wire[31:0] T61;
  reg [31:0] regfile [31:0];
  wire[31:0] T62;
  wire T63;
  wire T64;
  wire[4:0] wb_addr;
  wire[4:0] T65;
  wire[4:0] rs2_addr;
  wire[4:0] T66;
  wire T67;
  wire T68;
  wire T69;
  wire[31:0] T70;
  wire[31:0] T71;
  wire[4:0] alu_shamt;
  wire[4:0] T72;
  wire[31:0] alu_op1;
  wire[31:0] T73;
  wire[31:0] T74;
  wire[31:0] T75;
  wire[31:0] T76;
  reg [31:0] pc_reg;
  wire[31:0] T77;
  wire[32:0] T78;
  wire[32:0] T79;
  wire[32:0] T80;
  wire[32:0] pc_next;
  wire[32:0] T81;
  wire[32:0] T82;
  wire[32:0] T83;
  wire[32:0] T84;
  wire[32:0] T85;
  wire[32:0] T86;
  wire[31:0] pc_plus4;
  wire[31:0] T87;
  wire[32:0] exception_target;
  wire[32:0] csr_io_evec;
  wire T88;
  wire[32:0] T89;
  wire[31:0] jump_reg_target;
  wire[31:0] T90;
  wire[31:0] T91;
  wire[31:0] T92;
  wire[31:0] rs1_data;
  wire[31:0] T93;
  wire[4:0] rs1_addr;
  wire[4:0] T94;
  wire T95;
  wire T96;
  wire[32:0] T97;
  wire[31:0] brjmp_target;
  wire[31:0] T98;
  wire[31:0] brjmp_offset;
  wire T99;
  wire[32:0] T100;
  wire T101;
  wire[32:0] T102;
  wire T103;
  wire T104;
  wire T105;
  wire[31:0] pcu;
  wire[19:0] T106;
  wire T107;
  wire[31:0] zimm;
  wire[4:0] T108;
  wire T109;
  wire T110;
  wire T111;
  wire[31:0] T112;
  wire[31:0] T113;
  wire[31:0] T114;
  wire T115;
  wire[31:0] T116;
  wire[31:0] T117;
  wire[62:0] T118;
  wire T119;
  wire[31:0] T120;
  wire T121;
  wire T122;
  wire T123;
  wire[31:0] T124;
  wire T125;
  wire T126;
  wire[31:0] T127;
  wire[31:0] T128;
  wire T129;
  wire[31:0] T130;
  wire[31:0] T131;
  wire T132;
  wire[31:0] T133;
  wire[31:0] T134;
  wire T135;
  wire[31:0] T136;
  wire[31:0] T137;
  wire T138;
  wire[31:0] T139;
  wire[31:0] T140;
  wire T141;
  wire[31:0] T142;
  wire[31:0] T143;
  wire T144;
  wire[31:0] csr_io_rw_rdata;
  wire T145;
  wire T146;
  wire T147;
  wire T148;
  wire[4:0] T149;
  wire[7:0] T150;
  wire[7:0] T151;
  wire[31:0] T152;
  wire[31:0] T153;
  wire[15:0] T154;
  wire[15:0] T155;
  wire[15:0] T156;
  wire[15:0] T157;
  wire[15:0] T158;
  wire[15:0] T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire T164;
  wire[39:0] T165;
  wire[39:0] T166;
  wire[207:0] T167;
  reg [207:0] T168;
  wire[119:0] T169;
  wire[119:0] T170;
  wire[119:0] T171;
  wire[119:0] T172;
  wire[119:0] T173;
  wire[119:0] T174;
  wire[119:0] T175;
  wire[23:0] T176;
  reg [23:0] T177;
  wire[4:0] T179;
  wire[119:0] T180;
  wire[55:0] T181;
  wire[55:0] T182;
  wire[31:0] T183;
  reg [23:0] T184;
  wire[4:0] T185;
  wire T186;
  wire[4:0] T187;
  wire[4:0] T188;
  wire[4:0] T189;
  wire[4:0] T190;
  wire[4:0] T191;
  wire[4:0] T192;
  wire[4:0] T193;
  wire[4:0] T194;
  wire[4:0] T195;
  wire[4:0] T196;
  wire[4:0] T197;
  wire[4:0] T198;
  wire[4:0] T199;
  wire[4:0] T200;
  wire[4:0] T201;
  wire[4:0] T202;
  wire[4:0] T203;
  wire[4:0] T204;
  wire[4:0] T205;
  wire[4:0] T206;
  wire[4:0] T207;
  wire[4:0] T208;
  wire[4:0] T209;
  wire[4:0] T210;
  wire[4:0] T211;
  wire[4:0] T212;
  wire[4:0] T213;
  wire[4:0] T214;
  wire[4:0] T215;
  wire[4:0] T216;
  wire[4:0] T217;
  wire[4:0] T218;
  wire[4:0] T219;
  wire[4:0] T220;
  wire[4:0] T221;
  wire[4:0] T222;
  wire[4:0] T223;
  wire[4:0] T224;
  wire[4:0] T225;
  wire[4:0] T226;
  wire[4:0] T227;
  wire[4:0] T228;
  wire[4:0] T229;
  wire[4:0] T230;
  wire[4:0] T231;
  wire[4:0] T232;
  wire[4:0] T233;
  wire[4:0] T234;
  wire[4:0] T235;
  wire[4:0] T236;
  wire[4:0] T237;
  wire[4:0] T238;
  wire[4:0] T239;
  wire[4:0] T240;
  wire[4:0] T241;
  wire[4:0] T242;
  wire[4:0] T243;
  wire[4:0] T244;
  wire[4:0] T245;
  wire[4:0] T246;
  wire[4:0] T247;
  wire[4:0] T248;
  wire[4:0] T249;
  wire[4:0] T250;
  wire[4:0] T251;
  wire[4:0] T252;
  wire[4:0] T253;
  wire[4:0] T254;
  wire[4:0] T255;
  wire[4:0] T256;
  wire[4:0] T257;
  wire[4:0] T258;
  wire[4:0] T259;
  wire[4:0] T260;
  wire[4:0] T261;
  wire[4:0] T262;
  wire[4:0] T263;
  wire[4:0] T264;
  wire[4:0] T265;
  wire[4:0] T266;
  wire[4:0] T267;
  wire[4:0] T268;
  wire[4:0] T269;
  wire[4:0] T270;
  wire[4:0] T271;
  wire[4:0] T272;
  wire[4:0] T273;
  wire[4:0] T274;
  wire[4:0] T275;
  wire[4:0] T276;
  wire T277;
  wire[31:0] T278;
  wire T279;
  wire[31:0] T280;
  wire T281;
  wire[31:0] T282;
  wire T283;
  wire T284;
  wire[31:0] T285;
  wire T286;
  wire[31:0] T287;
  wire T288;
  wire[31:0] T289;
  wire T290;
  wire[31:0] T291;
  wire T292;
  wire[31:0] T293;
  wire T294;
  wire[31:0] T295;
  wire T296;
  wire[31:0] T297;
  wire T298;
  wire[31:0] T299;
  wire T300;
  wire[31:0] T301;
  wire T302;
  wire[31:0] T303;
  wire T304;
  wire[31:0] T305;
  wire T306;
  wire[31:0] T307;
  wire T308;
  wire[31:0] T309;
  wire T310;
  wire[31:0] T311;
  wire T312;
  wire[31:0] T313;
  wire T314;
  wire[31:0] T315;
  wire T316;
  wire[31:0] T317;
  wire T318;
  wire[31:0] T319;
  wire T320;
  wire[31:0] T321;
  wire T322;
  wire[31:0] T323;
  wire T324;
  wire[31:0] T325;
  wire T326;
  wire[31:0] T327;
  wire T328;
  wire[31:0] T329;
  wire T330;
  wire[31:0] T331;
  wire T332;
  wire[31:0] T333;
  wire T334;
  wire[31:0] T335;
  wire T336;
  wire[31:0] T337;
  wire T338;
  wire[31:0] T339;
  wire T340;
  wire[31:0] T341;
  wire T342;
  wire[31:0] T343;
  wire T344;
  wire[31:0] T345;
  wire T346;
  wire[31:0] T347;
  wire T348;
  wire[31:0] T349;
  wire T350;
  wire[31:0] T351;
  wire T352;
  wire[31:0] T353;
  wire T354;
  wire[31:0] T355;
  wire T356;
  wire[31:0] T357;
  wire T358;
  wire[31:0] T359;
  wire T360;
  wire[31:0] T361;
  wire T362;
  wire[31:0] T363;
  wire T364;
  wire[31:0] T365;
  wire T366;
  wire[31:0] T367;
  wire T368;
  wire[31:0] T369;
  wire T370;
  wire[31:0] T371;
  wire T372;
  wire[31:0] T373;
  wire T374;
  wire[31:0] T375;
  wire T376;
  wire[31:0] T377;
  wire T378;
  wire[31:0] T379;
  wire T380;
  wire[31:0] T381;
  wire T382;
  wire[31:0] T383;
  wire T384;
  wire[31:0] T385;
  wire T386;
  wire[31:0] T387;
  wire T388;
  wire[31:0] T389;
  wire T390;
  wire[31:0] T391;
  wire T392;
  wire[31:0] T393;
  wire T394;
  wire[31:0] T395;
  wire T396;
  wire[31:0] T397;
  wire T398;
  wire[31:0] T399;
  wire T400;
  wire[31:0] T401;
  wire T402;
  wire[31:0] T403;
  wire T404;
  wire[31:0] T405;
  wire T406;
  wire[31:0] T407;
  wire T408;
  wire[31:0] T409;
  wire T410;
  wire[31:0] T411;
  wire T412;
  wire[31:0] T413;
  wire T414;
  wire[31:0] T415;
  wire T416;
  wire[31:0] T417;
  wire T418;
  wire[31:0] T419;
  wire T420;
  wire[31:0] T421;
  wire T422;
  wire[31:0] T423;
  wire T424;
  wire[31:0] T425;
  wire T426;
  wire[31:0] T427;
  wire T428;
  wire[31:0] T429;
  wire T430;
  wire[31:0] T431;
  wire T432;
  wire[31:0] T433;
  wire T434;
  wire[31:0] T435;
  wire T436;
  wire[31:0] T437;
  wire T438;
  wire[31:0] T439;
  wire T440;
  wire[31:0] T441;
  wire T442;
  wire[31:0] T443;
  wire T444;
  wire[31:0] T445;
  wire T446;
  wire[31:0] T447;
  wire T448;
  wire T449;
  wire[119:0] T450;
  wire[119:0] T451;
  wire[87:0] T452;
  wire[87:0] T453;
  wire[31:0] T454;
  reg [23:0] T455;
  wire[4:0] T456;
  wire[119:0] T457;
  wire[71:0] T458;
  wire[71:0] T459;
  wire[39:0] T460;
  reg [31:0] T461;
  reg [31:0] T463;
  wire T464;
  wire T465;
  wire[119:0] T466;
  wire[119:0] T467;
  wire[119:0] T468;
  wire[111:0] T469;
  wire[111:0] T470;
  wire[39:0] T471;
  reg [31:0] T472;
  wire[119:0] T473;
  wire T474;
  wire T475;
  wire[119:0] T476;
  wire[119:0] T477;
  wire[63:0] T478;
  wire[63:0] T479;
  wire[31:0] T480;
  reg [23:0] T481;
  reg [31:0] T482;
  wire[119:0] T483;
  wire[63:0] T484;
  wire[63:0] T485;
  wire[39:0] T486;
  reg [31:0] T487;
  reg [23:0] T488;
  wire T489;
  wire T490;
  wire T491;
  wire[119:0] T492;
  wire[119:0] T493;
  wire[119:0] T494;
  wire[119:0] T495;
  wire[103:0] T496;
  wire[103:0] T497;
  wire[39:0] T498;
  reg [31:0] T499;
  wire[119:0] T500;
  wire[7:0] T501;
  wire T502;
  wire[119:0] T503;
  wire[119:0] T504;
  wire[111:0] T505;
  wire[111:0] T506;
  wire[55:0] T507;
  wire[47:0] T508;
  wire[23:0] T509;
  wire[15:0] T510;
  reg [7:0] T511;
  wire[3:0] T513;
  wire[4:0] T514;
  wire[11:0] T515;
  wire[11:0] T516;
  wire[11:0] T517;
  wire[11:0] T518;
  wire[11:0] T519;
  wire[11:0] T520;
  wire T521;
  reg [7:0] T522;
  wire[3:0] T523;
  wire[4:0] T524;
  wire[11:0] T525;
  reg [7:0] T526;
  wire[3:0] T527;
  wire[4:0] T528;
  wire[11:0] T529;
  wire[23:0] T530;
  wire T531;
  wire[119:0] T532;
  wire[119:0] T533;
  wire[119:0] T534;
  wire[87:0] T535;
  wire[63:0] T536;
  wire[55:0] T537;
  wire[31:0] T538;
  wire[23:0] T539;
  wire[15:0] T540;
  reg [7:0] T541;
  wire[3:0] T543;
  wire[4:0] T544;
  wire[12:0] T545;
  wire[12:0] T546;
  wire[12:0] T547;
  wire[11:0] T548;
  wire[11:0] T549;
  wire[9:0] T550;
  wire[3:0] T551;
  wire[5:0] T552;
  wire[1:0] T553;
  wire T554;
  wire T555;
  wire[12:0] T556;
  wire[12:0] T557;
  wire T558;
  reg [7:0] T559;
  wire[3:0] T560;
  wire[4:0] T561;
  wire[12:0] T562;
  reg [7:0] T563;
  wire[3:0] T564;
  wire[4:0] T565;
  wire[12:0] T566;
  reg [7:0] T567;
  wire[3:0] T568;
  wire[4:0] T569;
  wire[12:0] T570;
  wire[23:0] T571;
  wire T572;
  reg [23:0] T573;
  wire[31:0] T574;
  reg [23:0] T575;
  wire T576;
  wire T577;
  wire[119:0] T578;
  wire[119:0] T579;
  wire[119:0] T580;
  wire[119:0] T581;
  wire[119:0] T582;
  wire[95:0] T583;
  wire[87:0] T584;
  wire[79:0] T585;
  wire[71:0] T586;
  wire[63:0] T587;
  wire[55:0] T588;
  wire[47:0] T589;
  wire[39:0] T590;
  wire[31:0] T591;
  wire[23:0] T592;
  wire[15:0] T593;
  reg [7:0] T594;
  wire[3:0] T596;
  wire[4:0] T597;
  wire[44:0] T598;
  wire[44:0] T599;
  wire[44:0] T600;
  wire[43:0] T601;
  wire[43:0] T602;
  wire[10:0] T603;
  wire[9:0] T604;
  wire T605;
  wire[32:0] T606;
  wire[7:0] T607;
  wire[24:0] T608;
  wire[44:0] T609;
  wire[44:0] T610;
  wire T611;
  reg [7:0] T612;
  wire[3:0] T613;
  wire[4:0] T614;
  wire[44:0] T615;
  reg [7:0] T616;
  wire[3:0] T617;
  wire[4:0] T618;
  wire[44:0] T619;
  reg [7:0] T620;
  wire[3:0] T621;
  wire[4:0] T622;
  wire[44:0] T623;
  reg [7:0] T624;
  wire[3:0] T625;
  wire[4:0] T626;
  wire[44:0] T627;
  reg [7:0] T628;
  wire[3:0] T629;
  wire[4:0] T630;
  wire[44:0] T631;
  reg [7:0] T632;
  wire[3:0] T633;
  wire[4:0] T634;
  wire[44:0] T635;
  reg [7:0] T636;
  wire[3:0] T637;
  wire[4:0] T638;
  wire[44:0] T639;
  reg [7:0] T640;
  wire[3:0] T641;
  wire[4:0] T642;
  wire[44:0] T643;
  reg [7:0] T644;
  wire[3:0] T645;
  wire[4:0] T646;
  wire[44:0] T647;
  reg [7:0] T648;
  wire[3:0] T649;
  wire[4:0] T650;
  wire[44:0] T651;
  reg [7:0] T652;
  wire[3:0] T653;
  wire[4:0] T654;
  wire[44:0] T655;
  wire[23:0] T656;
  wire T657;
  wire[119:0] T658;
  wire[87:0] T659;
  wire[87:0] T660;
  wire[63:0] T661;
  wire[55:0] T662;
  wire[39:0] T663;
  wire[31:0] T664;
  wire[23:0] T665;
  wire[15:0] T666;
  reg [7:0] T667;
  wire[3:0] T669;
  wire[4:0] T670;
  wire[19:0] T671;
  wire[19:0] T672;
  reg [7:0] T673;
  wire[3:0] T674;
  wire[4:0] T675;
  wire[19:0] T676;
  reg [7:0] T677;
  wire[3:0] T678;
  wire[4:0] T679;
  wire[19:0] T680;
  reg [7:0] T681;
  wire[3:0] T682;
  wire[4:0] T683;
  wire[19:0] T684;
  reg [7:0] T685;
  wire[3:0] T686;
  wire[4:0] T687;
  wire[19:0] T688;
  reg [23:0] T689;
  wire T690;
  wire[119:0] T691;
  wire[119:0] T692;
  wire[111:0] T693;
  wire[111:0] T694;
  wire[87:0] T695;
  wire[79:0] T696;
  wire[31:0] T697;
  reg [23:0] T698;
  wire[47:0] T699;
  wire[39:0] T700;
  wire[31:0] T701;
  wire[23:0] T702;
  wire[15:0] T703;
  reg [7:0] T704;
  wire[3:0] T706;
  wire[11:0] T707;
  wire[11:0] T708;
  wire[11:0] T709;
  wire T710;
  wire[7:0] T711;
  reg [7:0] T712;
  wire[3:0] T713;
  wire[11:0] T714;
  wire[7:0] T715;
  wire T716;
  wire[7:0] T717;
  reg [7:0] T718;
  wire[3:0] T719;
  wire[11:0] T720;
  wire[7:0] T721;
  wire T722;
  wire T723;
  wire T724;
  wire[7:0] T725;
  reg [7:0] T726;
  wire[3:0] T727;
  wire[11:0] T728;
  wire[7:0] T729;
  wire T730;
  wire T731;
  wire T732;
  wire[7:0] T733;
  wire T734;
  wire T735;
  reg [23:0] T736;
  wire[119:0] T737;
  wire[111:0] T738;
  wire[111:0] T739;
  wire[87:0] T740;
  wire[79:0] T741;
  wire[31:0] T742;
  reg [23:0] T743;
  wire[47:0] T744;
  wire[39:0] T745;
  wire[31:0] T746;
  wire[23:0] T747;
  wire[15:0] T748;
  reg [7:0] T749;
  wire[3:0] T751;
  wire[11:0] T752;
  wire[11:0] T753;
  wire[11:0] T754;
  wire T755;
  wire[7:0] T756;
  reg [7:0] T757;
  wire[3:0] T758;
  wire[11:0] T759;
  wire[7:0] T760;
  wire T761;
  wire[7:0] T762;
  reg [7:0] T763;
  wire[3:0] T764;
  wire[11:0] T765;
  wire[7:0] T766;
  wire T767;
  wire T768;
  wire T769;
  wire[7:0] T770;
  reg [7:0] T771;
  wire[3:0] T772;
  wire[11:0] T773;
  wire[7:0] T774;
  wire T775;
  wire T776;
  wire T777;
  wire[7:0] T778;
  wire T779;
  wire T780;
  reg [23:0] T781;
  wire T782;
  wire T783;
  wire T784;
  wire T785;
  wire[119:0] T786;
  wire[119:0] T787;
  wire[119:0] T788;
  wire[119:0] T789;
  wire[119:0] T790;
  wire[87:0] T791;
  reg [31:0] T792;
  wire[119:0] T793;
  wire[119:0] T794;
  wire[119:0] T795;
  wire[87:0] T796;
  reg [31:0] T797;
  wire T798;
  wire[119:0] T799;
  wire[119:0] T800;
  wire[87:0] T801;
  wire[119:0] T802;
  wire[95:0] T803;
  wire[95:0] T804;
  wire[63:0] T805;
  wire[31:0] T806;
  reg [23:0] T807;
  reg [31:0] T808;
  wire[31:0] T810;
  wire T811;
  wire T812;
  wire T813;
  wire[79:0] T814;
  wire[79:0] T815;
  wire[79:0] T816;
  wire[79:0] T817;
  wire[79:0] T818;
  wire[79:0] T819;
  wire[79:0] T820;
  wire[79:0] T821;
  wire[79:0] T822;
  wire[79:0] T823;
  wire[79:0] T824;
  wire[79:0] T825;
  wire[79:0] T826;
  wire[79:0] T827;
  wire[79:0] T828;
  wire[79:0] T829;
  wire[79:0] T830;
  wire[79:0] T831;
  wire[79:0] T832;
  wire[79:0] T833;
  wire[79:0] T834;
  wire[79:0] T835;
  wire[79:0] T836;
  wire[79:0] T837;
  wire[79:0] T838;
  wire[79:0] T839;
  wire[79:0] T840;
  wire[79:0] T841;
  wire[79:0] T842;
  wire[79:0] T843;
  wire[79:0] T844;
  wire[79:0] T845;
  wire[79:0] T846;
  wire[79:0] T847;
  wire[79:0] T848;
  wire[79:0] T849;
  wire[79:0] T850;
  wire[79:0] T851;
  wire[79:0] T852;
  wire[79:0] T853;
  wire[79:0] T854;
  wire[79:0] T855;
  wire[79:0] T856;
  wire[79:0] T857;
  wire[79:0] T858;
  wire[79:0] T859;
  wire[79:0] T860;
  wire[79:0] T861;
  wire[79:0] T862;
  wire[79:0] T863;
  wire[79:0] T864;
  wire[79:0] T865;
  wire[79:0] T866;
  wire[79:0] T867;
  wire[79:0] T868;
  wire[79:0] T869;
  wire[79:0] T870;
  wire[79:0] T871;
  wire[79:0] T872;
  wire[79:0] T873;
  wire[79:0] T874;
  wire[79:0] T875;
  wire[79:0] T876;
  wire[79:0] T877;
  wire[79:0] T878;
  wire[79:0] T879;
  wire[79:0] T880;
  wire[79:0] T881;
  wire[79:0] T882;
  wire[79:0] T883;
  wire[79:0] T884;
  wire[79:0] T885;
  wire[79:0] T886;
  wire[79:0] T887;
  wire[79:0] T888;
  wire[79:0] T889;
  wire[79:0] T890;
  wire[79:0] T891;
  wire[79:0] T892;
  wire[79:0] T893;
  wire[79:0] T894;
  wire[79:0] T895;
  wire[79:0] T896;
  wire[79:0] T897;
  wire[79:0] T898;
  wire[79:0] T899;
  wire[79:0] T900;
  wire[79:0] T901;
  wire[79:0] T902;
  wire[79:0] T903;
  wire[79:0] T904;
  wire[79:0] T905;
  wire T906;
  wire[31:0] T907;
  wire T908;
  wire[31:0] T909;
  wire T910;
  wire[31:0] T911;
  wire[31:0] T912;
  wire[31:0] T913;
  reg [31:0] tsc_reg;
  wire[31:0] T914;
  wire[31:0] T915;
  wire[1159:0] T916;
  wire[32:0] T917;
  wire[31:0] T918;
  wire[11:0] T919;
  wire csr_io_status_s;
  wire csr_io_status_ps;
  wire csr_io_status_ei;
  wire csr_io_status_pei;
  wire csr_io_status_ef;
  wire csr_io_status_u64;
  wire csr_io_status_s64;
  wire csr_io_status_vm;
  wire csr_io_status_er;
  wire[6:0] csr_io_status_zero;
  wire[7:0] csr_io_status_im;
  wire[7:0] csr_io_status_ip;
  wire T920;
  wire[31:0] T921;
  wire[31:0] T922;
  wire T923;
  wire[31:0] T924;
  wire[31:0] T925;
  wire T926;
  wire[31:0] T927;
  wire csr_io_host_ipi_rep_ready;
  wire csr_io_host_ipi_req_bits;
  wire csr_io_host_ipi_req_valid;
  wire[63:0] csr_io_host_pcr_rep_bits;
  wire csr_io_host_pcr_rep_valid;
  wire csr_io_host_pcr_req_ready;
  wire csr_io_host_debug_stats_pcr;

`ifndef SYNTHESIS
  integer initvar;
  initial begin
    #0.002;
    for (initvar = 0; initvar < 32; initvar = initvar+1)
      regfile[initvar] = {1{$random}};
    pc_reg = {1{$random}};
    tsc_reg = {1{$random}};
  end
`endif

  assign T0 = reset ^ 1'h1;
  assign T1 = io_dmem_resp_bits_data;
  assign T2 = io_ctl_debug_dmem_typ;
  assign T3 = T4;
  assign T4 = io_ctl_debug_dmem_val ? 8'h56 : 8'h5f;
  assign T5 = T6;
  assign T6 = io_ctl_exception ? 24'h455843 : 24'h202020;
  assign T7 = wb_data;
  assign wb_data = T8;
  assign T8 = T9;
  assign T9 = T148 ? alu_out : T10;
  assign T10 = T147 ? io_dmem_resp_bits_data : T11;
  assign T11 = T146 ? pc_plus4 : T12;
  assign T12 = T145 ? csr_io_rw_rdata : alu_out;
  assign alu_out = T13;
  assign T13 = T144 ? T142 : T14;
  assign T14 = T141 ? T139 : T15;
  assign T15 = T138 ? T136 : T16;
  assign T16 = T135 ? T133 : T17;
  assign T17 = T132 ? T130 : T18;
  assign T18 = T129 ? T124 : T19;
  assign T19 = T123 ? T120 : T20;
  assign T20 = T119 ? T116 : T21;
  assign T21 = T115 ? T112 : T22;
  assign T22 = T111 ? T70 : T23;
  assign T23 = T69 ? alu_op2 : 32'h0;
  assign alu_op2 = T24;
  assign T24 = T68 ? rs2_data : T25;
  assign T25 = T60 ? imm_i_sext : T26;
  assign T26 = T56 ? imm_b_sext : T27;
  assign T27 = T46 ? imm_s_sext : T28;
  assign T28 = T41 ? imm_u_sext : T29;
  assign T29 = T39 ? imm_j_sext : 32'h0;
  assign imm_j_sext = {T37, T30};
  assign T30 = {imm_j, 1'h0};
  assign imm_j = {T34, T31};
  assign T31 = {T33, T32};
  assign T32 = inst[5'h1e:5'h15];
  assign inst = io_imem_resp_valid ? io_imem_resp_bits_data : 32'h5033;
  assign T33 = inst[5'h14:5'h14];
  assign T34 = {T36, T35};
  assign T35 = inst[5'h13:4'hc];
  assign T36 = inst[5'h1f:5'h1f];
  assign T37 = T38 ? 11'h7ff : 11'h0;
  assign T38 = imm_j[5'h13:5'h13];
  assign T39 = io_ctl_op2_sel == 3'h5;
  assign imm_u_sext = {T40, 12'h0};
  assign T40 = inst[5'h1f:4'hc];
  assign T41 = io_ctl_op2_sel == 3'h4;
  assign imm_s_sext = {T44, imm_s};
  assign imm_s = {T43, T42};
  assign T42 = inst[4'hb:3'h7];
  assign T43 = inst[5'h1f:5'h19];
  assign T44 = T45 ? 20'hfffff : 20'h0;
  assign T45 = imm_s[4'hb:4'hb];
  assign T46 = io_ctl_op2_sel == 3'h3;
  assign imm_b_sext = {T54, T47};
  assign T47 = {imm_b, 1'h0};
  assign imm_b = {T51, T48};
  assign T48 = {T50, T49};
  assign T49 = inst[4'hb:4'h8];
  assign T50 = inst[5'h1e:5'h19];
  assign T51 = {T53, T52};
  assign T52 = inst[3'h7:3'h7];
  assign T53 = inst[5'h1f:5'h1f];
  assign T54 = T55 ? 19'h7ffff : 19'h0;
  assign T55 = imm_b[4'hb:4'hb];
  assign T56 = io_ctl_op2_sel == 3'h2;
  assign imm_i_sext = {T58, T57};
  assign T57 = inst[5'h1f:5'h14];
  assign T58 = T59 ? 20'hfffff : 20'h0;
  assign T59 = T57[4'hb:4'hb];
  assign T60 = io_ctl_op2_sel == 3'h1;
  assign rs2_data = T67 ? T61 : 32'h0;
  assign T61 = regfile[rs2_addr];
  assign T63 = io_ctl_rf_wen & T64;
  assign T64 = wb_addr != 5'h0;
  assign wb_addr = T65;
  assign T65 = inst[4'hb:3'h7];
  assign rs2_addr = T66;
  assign T66 = inst[5'h18:5'h14];
  assign T67 = rs2_addr != 5'h0;
  assign T68 = io_ctl_op2_sel == 3'h0;
  assign T69 = io_ctl_alu_fun == 4'hb;
  assign T70 = T71;
  assign T71 = alu_op1 >> alu_shamt;
  assign alu_shamt = T72;
  assign T72 = alu_op2[3'h4:1'h0];
  assign alu_op1 = T73;
  assign T73 = T110 ? rs1_data : T74;
  assign T74 = T109 ? zimm : T75;
  assign T75 = T107 ? pcu : T76;
  assign T76 = T105 ? pc_reg : 32'h0;
  assign T77 = T78[5'h1f:1'h0];
  assign T78 = reset ? 33'h2000 : T79;
  assign T79 = T104 ? pc_next : T80;
  assign T80 = {1'h0, pc_reg};
  assign pc_next = T81;
  assign T81 = T103 ? T102 : T82;
  assign T82 = T101 ? T100 : T83;
  assign T83 = T99 ? T97 : T84;
  assign T84 = T96 ? T89 : T85;
  assign T85 = T88 ? exception_target : T86;
  assign T86 = {1'h0, pc_plus4};
  assign pc_plus4 = T87;
  assign T87 = pc_reg + 32'h4;
  assign exception_target = csr_io_evec;
  assign T88 = io_ctl_pc_sel == 3'h4;
  assign T89 = {1'h0, jump_reg_target};
  assign jump_reg_target = T90;
  assign T90 = T92 + T91;
  assign T91 = imm_i_sext;
  assign T92 = rs1_data;
  assign rs1_data = T95 ? T93 : 32'h0;
  assign T93 = regfile[rs1_addr];
  assign rs1_addr = T94;
  assign T94 = inst[5'h13:4'hf];
  assign T95 = rs1_addr != 5'h0;
  assign T96 = io_ctl_pc_sel == 3'h3;
  assign T97 = {1'h0, brjmp_target};
  assign brjmp_target = T98;
  assign T98 = pc_reg + brjmp_offset;
  assign brjmp_offset = alu_op2;
  assign T99 = io_ctl_pc_sel == 3'h2;
  assign T100 = {1'h0, brjmp_target};
  assign T101 = io_ctl_pc_sel == 3'h1;
  assign T102 = {1'h0, pc_plus4};
  assign T103 = io_ctl_pc_sel == 3'h0;
  assign T104 = io_ctl_stall ^ 1'h1;
  assign T105 = io_ctl_op1_sel == 2'h1;
  assign pcu = {T106, 12'h0};
  assign T106 = pc_reg[5'h1f:4'hc];
  assign T107 = io_ctl_op1_sel == 2'h2;
  assign zimm = {27'h0, T108};
  assign T108 = inst[5'h13:4'hf];
  assign T109 = io_ctl_op1_sel == 2'h3;
  assign T110 = io_ctl_op1_sel == 2'h0;
  assign T111 = io_ctl_alu_fun == 4'h4;
  assign T112 = T113;
  assign T113 = $signed(T114) >>> alu_shamt;
  assign T114 = alu_op1;
  assign T115 = io_ctl_alu_fun == 4'h5;
  assign T116 = T117;
  assign T117 = T118[5'h1f:1'h0];
  assign T118 = alu_op1 << alu_shamt;
  assign T119 = io_ctl_alu_fun == 4'h3;
  assign T120 = {31'h0, T121};
  assign T121 = T122;
  assign T122 = alu_op1 < alu_op2;
  assign T123 = io_ctl_alu_fun == 4'ha;
  assign T124 = {31'h0, T125};
  assign T125 = T126;
  assign T126 = $signed(T128) < $signed(T127);
  assign T127 = alu_op2;
  assign T128 = alu_op1;
  assign T129 = io_ctl_alu_fun == 4'h9;
  assign T130 = T131;
  assign T131 = alu_op1 ^ alu_op2;
  assign T132 = io_ctl_alu_fun == 4'h8;
  assign T133 = T134;
  assign T134 = alu_op1 | alu_op2;
  assign T135 = io_ctl_alu_fun == 4'h7;
  assign T136 = T137;
  assign T137 = alu_op1 & alu_op2;
  assign T138 = io_ctl_alu_fun == 4'h6;
  assign T139 = T140;
  assign T140 = alu_op1 - alu_op2;
  assign T141 = io_ctl_alu_fun == 4'h2;
  assign T142 = T143;
  assign T143 = alu_op1 + alu_op2;
  assign T144 = io_ctl_alu_fun == 4'h1;
  assign T145 = io_ctl_wb_sel == 3'h3;
  assign T146 = io_ctl_wb_sel == 3'h2;
  assign T147 = io_ctl_wb_sel == 3'h1;
  assign T148 = io_ctl_wb_sel == 3'h0;
  assign T149 = wb_addr;
  assign T150 = T151;
  assign T151 = io_ctl_rf_wen ? 8'h57 : 8'h5f;
  assign T152 = alu_op2;
  assign T153 = alu_op1;
  assign T154 = T155;
  assign T155 = T164 ? 16'h4252 : T156;
  assign T156 = T163 ? 16'h4a20 : T157;
  assign T157 = T162 ? 16'h4a52 : T158;
  assign T158 = T161 ? 16'h4558 : T159;
  assign T159 = T160 ? 16'h2020 : 16'h3f3f;
  assign T160 = io_ctl_pc_sel == 3'h0;
  assign T161 = io_ctl_pc_sel == 3'h4;
  assign T162 = io_ctl_pc_sel == 3'h3;
  assign T163 = io_ctl_pc_sel == 3'h2;
  assign T164 = io_ctl_pc_sel == 3'h1;
  assign T165 = T166;
  assign T166 = io_ctl_stall ? 40'h7374616c6c : 40'h2020202020;
  assign T167 = T168;
  always @(*) $sformat(T168, "%s %s", T814, T169);
  assign T169 = T170;
  assign T170 = T813 ? T786 : T171;
  assign T171 = T785 ? T492 : T172;
  assign T172 = T491 ? T466 : T173;
  assign T173 = T465 ? T450 : T174;
  assign T174 = T186 ? T180 : T175;
  assign T175 = T176 << 7'h60;
  assign T176 = T177;
  always @(*) case (T179)
    0: T177 = 24'h207830;
    1: T177 = 24'h207261;
    2: T177 = 24'h207330;
    3: T177 = 24'h207331;
    4: T177 = 24'h207332;
    5: T177 = 24'h207333;
    6: T177 = 24'h207334;
    7: T177 = 24'h207335;
    8: T177 = 24'h207336;
    9: T177 = 24'h207337;
    10: T177 = 24'h207338;
    11: T177 = 24'h207339;
    12: T177 = 24'h733130;
    13: T177 = 24'h733131;
    14: T177 = 24'h207370;
    15: T177 = 24'h207470;
    16: T177 = 24'h207630;
    17: T177 = 24'h207631;
    18: T177 = 24'h206130;
    19: T177 = 24'h206131;
    20: T177 = 24'h206132;
    21: T177 = 24'h206133;
    22: T177 = 24'h206134;
    23: T177 = 24'h206135;
    24: T177 = 24'h206136;
    25: T177 = 24'h206137;
    26: T177 = 24'h206138;
    27: T177 = 24'h206139;
    28: T177 = 24'h613130;
    29: T177 = 24'h613131;
    30: T177 = 24'h613132;
    31: T177 = 24'h613133;
`ifndef SYNTHESIS
    default: T177 = {1{$random}};
`else
    default: T177 = 24'bx;
`endif
  endcase
  assign T179 = inst[4'hb:3'h7];
  assign T180 = T181 << 7'h40;
  assign T181 = T182;
  assign T182 = {T177, T183};
  assign T183 = {8'h2c, T184};
  always @(*) case (T185)
    0: T184 = 24'h207830;
    1: T184 = 24'h207261;
    2: T184 = 24'h207330;
    3: T184 = 24'h207331;
    4: T184 = 24'h207332;
    5: T184 = 24'h207333;
    6: T184 = 24'h207334;
    7: T184 = 24'h207335;
    8: T184 = 24'h207336;
    9: T184 = 24'h207337;
    10: T184 = 24'h207338;
    11: T184 = 24'h207339;
    12: T184 = 24'h733130;
    13: T184 = 24'h733131;
    14: T184 = 24'h207370;
    15: T184 = 24'h207470;
    16: T184 = 24'h207630;
    17: T184 = 24'h207631;
    18: T184 = 24'h206130;
    19: T184 = 24'h206131;
    20: T184 = 24'h206132;
    21: T184 = 24'h206133;
    22: T184 = 24'h206134;
    23: T184 = 24'h206135;
    24: T184 = 24'h206136;
    25: T184 = 24'h206137;
    26: T184 = 24'h206138;
    27: T184 = 24'h206139;
    28: T184 = 24'h613130;
    29: T184 = 24'h613131;
    30: T184 = 24'h613132;
    31: T184 = 24'h613133;
`ifndef SYNTHESIS
    default: T184 = {1{$random}};
`else
    default: T184 = 24'bx;
`endif
  endcase
  assign T185 = inst[5'h13:4'hf];
  assign T186 = T187[1'h0:1'h0];
  assign T187 = T188;
  assign T188 = T189;
  assign T189 = T449 ? 5'h9 : T190;
  assign T190 = T448 ? 5'h9 : T191;
  assign T191 = T446 ? 5'hb : T192;
  assign T192 = T444 ? 5'hb : T193;
  assign T193 = T442 ? 5'hb : T194;
  assign T194 = T440 ? 5'hb : T195;
  assign T195 = T438 ? 5'hb : T196;
  assign T196 = T436 ? 5'hb : T197;
  assign T197 = T434 ? 5'hc : T198;
  assign T198 = T432 ? 5'he : T199;
  assign T199 = T430 ? 5'hd : T200;
  assign T200 = T428 ? 5'he : T201;
  assign T201 = T426 ? 5'he : T202;
  assign T202 = T424 ? 5'he : T203;
  assign T203 = T422 ? 5'he : T204;
  assign T204 = T420 ? 5'he : T205;
  assign T205 = T418 ? 5'he : T206;
  assign T206 = T416 ? 5'he : T207;
  assign T207 = T414 ? 5'hf : T208;
  assign T208 = T412 ? 5'hf : T209;
  assign T209 = T410 ? 5'hf : T210;
  assign T210 = T408 ? 5'hf : T211;
  assign T211 = T406 ? 5'h12 : T212;
  assign T212 = T404 ? 5'h12 : T213;
  assign T213 = T402 ? 5'h12 : T214;
  assign T214 = T400 ? 5'h12 : T215;
  assign T215 = T398 ? 5'h12 : T216;
  assign T216 = T396 ? 5'h12 : T217;
  assign T217 = T394 ? 5'h12 : T218;
  assign T218 = T392 ? 5'h12 : T219;
  assign T219 = T390 ? 5'h12 : T220;
  assign T220 = T388 ? 5'h12 : T221;
  assign T221 = T386 ? 5'h12 : T222;
  assign T222 = T384 ? 5'h12 : T223;
  assign T223 = T382 ? 5'h12 : T224;
  assign T224 = T380 ? 5'h12 : T225;
  assign T225 = T378 ? 5'h12 : T226;
  assign T226 = T376 ? 5'h12 : T227;
  assign T227 = T374 ? 5'h12 : T228;
  assign T228 = T372 ? 5'h12 : T229;
  assign T229 = T370 ? 5'h12 : T230;
  assign T230 = T368 ? 5'h12 : T231;
  assign T231 = T366 ? 5'hd : T232;
  assign T232 = T364 ? 5'ha : T233;
  assign T233 = T362 ? 5'ha : T234;
  assign T234 = T360 ? 5'ha : T235;
  assign T235 = T358 ? 5'ha : T236;
  assign T236 = T356 ? 5'ha : T237;
  assign T237 = T354 ? 5'ha : T238;
  assign T238 = T352 ? 5'ha : T239;
  assign T239 = T350 ? 5'ha : T240;
  assign T240 = T348 ? 5'ha : T241;
  assign T241 = T346 ? 5'h2 : T242;
  assign T242 = T344 ? 5'h2 : T243;
  assign T243 = T342 ? 5'h2 : T244;
  assign T244 = T340 ? 5'h2 : T245;
  assign T245 = T338 ? 5'h2 : T246;
  assign T246 = T336 ? 5'h2 : T247;
  assign T247 = T334 ? 5'h2 : T248;
  assign T248 = T332 ? 5'h2 : T249;
  assign T249 = T330 ? 5'h2 : T250;
  assign T250 = T328 ? 5'h2 : T251;
  assign T251 = T326 ? 5'ha : T252;
  assign T252 = T324 ? 5'ha : T253;
  assign T253 = T322 ? 5'ha : T254;
  assign T254 = T320 ? 5'ha : T255;
  assign T255 = T318 ? 5'h2 : T256;
  assign T256 = T316 ? 5'h2 : T257;
  assign T257 = T314 ? 5'h2 : T258;
  assign T258 = T312 ? 5'h2 : T259;
  assign T259 = T310 ? 5'h2 : T260;
  assign T260 = T308 ? 5'h2 : T261;
  assign T261 = T306 ? 5'h2 : T262;
  assign T262 = T304 ? 5'h2 : T263;
  assign T263 = T302 ? 5'h2 : T264;
  assign T264 = T300 ? 5'h2 : T265;
  assign T265 = T298 ? 5'h2 : T266;
  assign T266 = T296 ? 5'h2 : T267;
  assign T267 = T294 ? 5'h2 : T268;
  assign T268 = T292 ? 5'h2 : T269;
  assign T269 = T290 ? 5'h2 : T270;
  assign T270 = T288 ? 5'h2 : T271;
  assign T271 = T286 ? 5'h2 : T272;
  assign T272 = T284 ? 5'h2 : T273;
  assign T273 = T283 ? 5'h9 : T274;
  assign T274 = T281 ? 5'ha : T275;
  assign T275 = T279 ? 5'ha : T276;
  assign T276 = T277 ? 5'ha : 5'h9;
  assign T277 = T278 == 32'h3073;
  assign T278 = inst & 32'h707f;
  assign T279 = T280 == 32'h2073;
  assign T280 = inst & 32'h707f;
  assign T281 = T282 == 32'h1073;
  assign T282 = inst & 32'h707f;
  assign T283 = inst == 32'h73;
  assign T284 = T285 == 32'h200703b;
  assign T285 = inst & 32'hfe00707f;
  assign T286 = T287 == 32'h200603b;
  assign T287 = inst & 32'hfe00707f;
  assign T288 = T289 == 32'h200503b;
  assign T289 = inst & 32'hfe00707f;
  assign T290 = T291 == 32'h200403b;
  assign T291 = inst & 32'hfe00707f;
  assign T292 = T293 == 32'h2007033;
  assign T293 = inst & 32'hfe00707f;
  assign T294 = T295 == 32'h2006033;
  assign T295 = inst & 32'hfe00707f;
  assign T296 = T297 == 32'h2005033;
  assign T297 = inst & 32'hfe00707f;
  assign T298 = T299 == 32'h2004033;
  assign T299 = inst & 32'hfe00707f;
  assign T300 = T301 == 32'h200003b;
  assign T301 = inst & 32'hfe00707f;
  assign T302 = T303 == 32'h2002033;
  assign T303 = inst & 32'hfe00707f;
  assign T304 = T305 == 32'h2003033;
  assign T305 = inst & 32'hfe00707f;
  assign T306 = T307 == 32'h2001033;
  assign T307 = inst & 32'hfe00707f;
  assign T308 = T309 == 32'h2000033;
  assign T309 = inst & 32'hfe00707f;
  assign T310 = T311 == 32'h4000503b;
  assign T311 = inst & 32'hfe00707f;
  assign T312 = T313 == 32'h503b;
  assign T313 = inst & 32'hfe00707f;
  assign T314 = T315 == 32'h103b;
  assign T315 = inst & 32'hfe00707f;
  assign T316 = T317 == 32'h4000003b;
  assign T317 = inst & 32'hfe00707f;
  assign T318 = T319 == 32'h3b;
  assign T319 = inst & 32'hfe00707f;
  assign T320 = T321 == 32'h4000501b;
  assign T321 = inst & 32'hfe00707f;
  assign T322 = T323 == 32'h501b;
  assign T323 = inst & 32'hfe00707f;
  assign T324 = T325 == 32'h101b;
  assign T325 = inst & 32'hfe00707f;
  assign T326 = T327 == 32'h1b;
  assign T327 = inst & 32'h707f;
  assign T328 = T329 == 32'h40005033;
  assign T329 = inst & 32'hfe00707f;
  assign T330 = T331 == 32'h5033;
  assign T331 = inst & 32'hfe00707f;
  assign T332 = T333 == 32'h1033;
  assign T333 = inst & 32'hfe00707f;
  assign T334 = T335 == 32'h4033;
  assign T335 = inst & 32'hfe00707f;
  assign T336 = T337 == 32'h6033;
  assign T337 = inst & 32'hfe00707f;
  assign T338 = T339 == 32'h7033;
  assign T339 = inst & 32'hfe00707f;
  assign T340 = T341 == 32'h3033;
  assign T341 = inst & 32'hfe00707f;
  assign T342 = T343 == 32'h2033;
  assign T343 = inst & 32'hfe00707f;
  assign T344 = T345 == 32'h40000033;
  assign T345 = inst & 32'hfe00707f;
  assign T346 = T347 == 32'h33;
  assign T347 = inst & 32'hfe00707f;
  assign T348 = T349 == 32'h40005013;
  assign T349 = inst & 32'hfc00707f;
  assign T350 = T351 == 32'h5013;
  assign T351 = inst & 32'hfc00707f;
  assign T352 = T353 == 32'h1013;
  assign T353 = inst & 32'hfc00707f;
  assign T354 = T355 == 32'h4013;
  assign T355 = inst & 32'h707f;
  assign T356 = T357 == 32'h6013;
  assign T357 = inst & 32'h707f;
  assign T358 = T359 == 32'h7013;
  assign T359 = inst & 32'h707f;
  assign T360 = T361 == 32'h3013;
  assign T361 = inst & 32'h707f;
  assign T362 = T363 == 32'h2013;
  assign T363 = inst & 32'h707f;
  assign T364 = T365 == 32'h13;
  assign T365 = inst & 32'h707f;
  assign T366 = T367 == 32'h37;
  assign T367 = inst & 32'h7f;
  assign T368 = T369 == 32'h1800302f;
  assign T369 = inst & 32'hf800707f;
  assign T370 = T371 == 32'h1800202f;
  assign T371 = inst & 32'hf800707f;
  assign T372 = T373 == 32'h1000302f;
  assign T373 = inst & 32'hf9f0707f;
  assign T374 = T375 == 32'h1000202f;
  assign T375 = inst & 32'hf9f0707f;
  assign T376 = T377 == 32'he000302f;
  assign T377 = inst & 32'hf800707f;
  assign T378 = T379 == 32'ha000302f;
  assign T379 = inst & 32'hf800707f;
  assign T380 = T381 == 32'hc000302f;
  assign T381 = inst & 32'hf800707f;
  assign T382 = T383 == 32'h8000302f;
  assign T383 = inst & 32'hf800707f;
  assign T384 = T385 == 32'h4000302f;
  assign T385 = inst & 32'hf800707f;
  assign T386 = T387 == 32'h6000302f;
  assign T387 = inst & 32'hf800707f;
  assign T388 = T389 == 32'h800302f;
  assign T389 = inst & 32'hf800707f;
  assign T390 = T391 == 32'h302f;
  assign T391 = inst & 32'hf800707f;
  assign T392 = T393 == 32'he000202f;
  assign T393 = inst & 32'hf800707f;
  assign T394 = T395 == 32'ha000202f;
  assign T395 = inst & 32'hf800707f;
  assign T396 = T397 == 32'hc000202f;
  assign T397 = inst & 32'hf800707f;
  assign T398 = T399 == 32'h8000202f;
  assign T399 = inst & 32'hf800707f;
  assign T400 = T401 == 32'h4000202f;
  assign T401 = inst & 32'hf800707f;
  assign T402 = T403 == 32'h6000202f;
  assign T403 = inst & 32'hf800707f;
  assign T404 = T405 == 32'h800202f;
  assign T405 = inst & 32'hf800707f;
  assign T406 = T407 == 32'h202f;
  assign T407 = inst & 32'hf800707f;
  assign T408 = T409 == 32'h3023;
  assign T409 = inst & 32'h707f;
  assign T410 = T411 == 32'h2023;
  assign T411 = inst & 32'h707f;
  assign T412 = T413 == 32'h1023;
  assign T413 = inst & 32'h707f;
  assign T414 = T415 == 32'h23;
  assign T415 = inst & 32'h707f;
  assign T416 = T417 == 32'h6003;
  assign T417 = inst & 32'h707f;
  assign T418 = T419 == 32'h5003;
  assign T419 = inst & 32'h707f;
  assign T420 = T421 == 32'h4003;
  assign T421 = inst & 32'h707f;
  assign T422 = T423 == 32'h3003;
  assign T423 = inst & 32'h707f;
  assign T424 = T425 == 32'h2003;
  assign T425 = inst & 32'h707f;
  assign T426 = T427 == 32'h1003;
  assign T427 = inst & 32'h707f;
  assign T428 = T429 == 32'h3;
  assign T429 = inst & 32'h707f;
  assign T430 = T431 == 32'h17;
  assign T431 = inst & 32'h7f;
  assign T432 = T433 == 32'h67;
  assign T433 = inst & 32'h707f;
  assign T434 = T435 == 32'h6f;
  assign T435 = inst & 32'h7f;
  assign T436 = T437 == 32'h7063;
  assign T437 = inst & 32'h707f;
  assign T438 = T439 == 32'h5063;
  assign T439 = inst & 32'h707f;
  assign T440 = T441 == 32'h6063;
  assign T441 = inst & 32'h707f;
  assign T442 = T443 == 32'h4063;
  assign T443 = inst & 32'h707f;
  assign T444 = T445 == 32'h63;
  assign T445 = inst & 32'h707f;
  assign T446 = T447 == 32'h1063;
  assign T447 = inst & 32'h707f;
  assign T448 = inst == 32'h233;
  assign T449 = inst == 32'h13;
  assign T450 = T464 ? T457 : T451;
  assign T451 = T452 << 6'h20;
  assign T452 = T453;
  assign T453 = {T182, T454};
  assign T454 = {8'h2c, T455};
  always @(*) case (T456)
    0: T455 = 24'h207830;
    1: T455 = 24'h207261;
    2: T455 = 24'h207330;
    3: T455 = 24'h207331;
    4: T455 = 24'h207332;
    5: T455 = 24'h207333;
    6: T455 = 24'h207334;
    7: T455 = 24'h207335;
    8: T455 = 24'h207336;
    9: T455 = 24'h207337;
    10: T455 = 24'h207338;
    11: T455 = 24'h207339;
    12: T455 = 24'h733130;
    13: T455 = 24'h733131;
    14: T455 = 24'h207370;
    15: T455 = 24'h207470;
    16: T455 = 24'h207630;
    17: T455 = 24'h207631;
    18: T455 = 24'h206130;
    19: T455 = 24'h206131;
    20: T455 = 24'h206132;
    21: T455 = 24'h206133;
    22: T455 = 24'h206134;
    23: T455 = 24'h206135;
    24: T455 = 24'h206136;
    25: T455 = 24'h206137;
    26: T455 = 24'h206138;
    27: T455 = 24'h206139;
    28: T455 = 24'h613130;
    29: T455 = 24'h613131;
    30: T455 = 24'h613132;
    31: T455 = 24'h613133;
`ifndef SYNTHESIS
    default: T455 = {1{$random}};
`else
    default: T455 = 24'bx;
`endif
  endcase
  assign T456 = inst[5'h18:5'h14];
  assign T457 = T458 << 6'h30;
  assign T458 = T459;
  assign T459 = {T463, T460};
  assign T460 = {8'h2c, T461};
  always @(*) case (T185)
    0: T461 = 32'h20667330;
    1: T461 = 32'h20667331;
    2: T461 = 32'h20667332;
    3: T461 = 32'h20667333;
    4: T461 = 32'h20667334;
    5: T461 = 32'h20667335;
    6: T461 = 32'h20667336;
    7: T461 = 32'h20667337;
    8: T461 = 32'h20667338;
    9: T461 = 32'h20667339;
    10: T461 = 32'h66733130;
    11: T461 = 32'h66733131;
    12: T461 = 32'h66733132;
    13: T461 = 32'h66733133;
    14: T461 = 32'h66733134;
    15: T461 = 32'h66733135;
    16: T461 = 32'h20667630;
    17: T461 = 32'h20667631;
    18: T461 = 32'h20666130;
    19: T461 = 32'h20666131;
    20: T461 = 32'h20666132;
    21: T461 = 32'h20666133;
    22: T461 = 32'h20666134;
    23: T461 = 32'h20666135;
    24: T461 = 32'h20666136;
    25: T461 = 32'h20666137;
    26: T461 = 32'h20666138;
    27: T461 = 32'h20666139;
    28: T461 = 32'h66613130;
    29: T461 = 32'h66613131;
    30: T461 = 32'h66613132;
    31: T461 = 32'h66613133;
`ifndef SYNTHESIS
    default: T461 = {1{$random}};
`else
    default: T461 = 32'bx;
`endif
  endcase
  always @(*) case (T179)
    0: T463 = 32'h20667330;
    1: T463 = 32'h20667331;
    2: T463 = 32'h20667332;
    3: T463 = 32'h20667333;
    4: T463 = 32'h20667334;
    5: T463 = 32'h20667335;
    6: T463 = 32'h20667336;
    7: T463 = 32'h20667337;
    8: T463 = 32'h20667338;
    9: T463 = 32'h20667339;
    10: T463 = 32'h66733130;
    11: T463 = 32'h66733131;
    12: T463 = 32'h66733132;
    13: T463 = 32'h66733133;
    14: T463 = 32'h66733134;
    15: T463 = 32'h66733135;
    16: T463 = 32'h20667630;
    17: T463 = 32'h20667631;
    18: T463 = 32'h20666130;
    19: T463 = 32'h20666131;
    20: T463 = 32'h20666132;
    21: T463 = 32'h20666133;
    22: T463 = 32'h20666134;
    23: T463 = 32'h20666135;
    24: T463 = 32'h20666136;
    25: T463 = 32'h20666137;
    26: T463 = 32'h20666138;
    27: T463 = 32'h20666139;
    28: T463 = 32'h66613130;
    29: T463 = 32'h66613131;
    30: T463 = 32'h66613132;
    31: T463 = 32'h66613133;
`ifndef SYNTHESIS
    default: T463 = {1{$random}};
`else
    default: T463 = 32'bx;
`endif
  endcase
  assign T464 = T187[1'h0:1'h0];
  assign T465 = T187[1'h1:1'h1];
  assign T466 = T490 ? T476 : T467;
  assign T467 = T475 ? T473 : T468;
  assign T468 = T469 << 4'h8;
  assign T469 = T470;
  assign T470 = {T459, T471};
  assign T471 = {8'h2c, T472};
  always @(*) case (T456)
    0: T472 = 32'h20667330;
    1: T472 = 32'h20667331;
    2: T472 = 32'h20667332;
    3: T472 = 32'h20667333;
    4: T472 = 32'h20667334;
    5: T472 = 32'h20667335;
    6: T472 = 32'h20667336;
    7: T472 = 32'h20667337;
    8: T472 = 32'h20667338;
    9: T472 = 32'h20667339;
    10: T472 = 32'h66733130;
    11: T472 = 32'h66733131;
    12: T472 = 32'h66733132;
    13: T472 = 32'h66733133;
    14: T472 = 32'h66733134;
    15: T472 = 32'h66733135;
    16: T472 = 32'h20667630;
    17: T472 = 32'h20667631;
    18: T472 = 32'h20666130;
    19: T472 = 32'h20666131;
    20: T472 = 32'h20666132;
    21: T472 = 32'h20666133;
    22: T472 = 32'h20666134;
    23: T472 = 32'h20666135;
    24: T472 = 32'h20666136;
    25: T472 = 32'h20666137;
    26: T472 = 32'h20666138;
    27: T472 = 32'h20666139;
    28: T472 = 32'h66613130;
    29: T472 = 32'h66613131;
    30: T472 = 32'h66613132;
    31: T472 = 32'h66613133;
`ifndef SYNTHESIS
    default: T472 = {1{$random}};
`else
    default: T472 = 32'bx;
`endif
  endcase
  assign T473 = T474 << 7'h77;
  assign T474 = 1'h0;
  assign T475 = T187[1'h0:1'h0];
  assign T476 = T489 ? T483 : T477;
  assign T477 = T478 << 6'h38;
  assign T478 = T479;
  assign T479 = {T482, T480};
  assign T480 = {8'h2c, T481};
  always @(*) case (T185)
    0: T481 = 24'h207830;
    1: T481 = 24'h207261;
    2: T481 = 24'h207330;
    3: T481 = 24'h207331;
    4: T481 = 24'h207332;
    5: T481 = 24'h207333;
    6: T481 = 24'h207334;
    7: T481 = 24'h207335;
    8: T481 = 24'h207336;
    9: T481 = 24'h207337;
    10: T481 = 24'h207338;
    11: T481 = 24'h207339;
    12: T481 = 24'h733130;
    13: T481 = 24'h733131;
    14: T481 = 24'h207370;
    15: T481 = 24'h207470;
    16: T481 = 24'h207630;
    17: T481 = 24'h207631;
    18: T481 = 24'h206130;
    19: T481 = 24'h206131;
    20: T481 = 24'h206132;
    21: T481 = 24'h206133;
    22: T481 = 24'h206134;
    23: T481 = 24'h206135;
    24: T481 = 24'h206136;
    25: T481 = 24'h206137;
    26: T481 = 24'h206138;
    27: T481 = 24'h206139;
    28: T481 = 24'h613130;
    29: T481 = 24'h613131;
    30: T481 = 24'h613132;
    31: T481 = 24'h613133;
`ifndef SYNTHESIS
    default: T481 = {1{$random}};
`else
    default: T481 = 24'bx;
`endif
  endcase
  always @(*) case (T179)
    0: T482 = 32'h20667330;
    1: T482 = 32'h20667331;
    2: T482 = 32'h20667332;
    3: T482 = 32'h20667333;
    4: T482 = 32'h20667334;
    5: T482 = 32'h20667335;
    6: T482 = 32'h20667336;
    7: T482 = 32'h20667337;
    8: T482 = 32'h20667338;
    9: T482 = 32'h20667339;
    10: T482 = 32'h66733130;
    11: T482 = 32'h66733131;
    12: T482 = 32'h66733132;
    13: T482 = 32'h66733133;
    14: T482 = 32'h66733134;
    15: T482 = 32'h66733135;
    16: T482 = 32'h20667630;
    17: T482 = 32'h20667631;
    18: T482 = 32'h20666130;
    19: T482 = 32'h20666131;
    20: T482 = 32'h20666132;
    21: T482 = 32'h20666133;
    22: T482 = 32'h20666134;
    23: T482 = 32'h20666135;
    24: T482 = 32'h20666136;
    25: T482 = 32'h20666137;
    26: T482 = 32'h20666138;
    27: T482 = 32'h20666139;
    28: T482 = 32'h66613130;
    29: T482 = 32'h66613131;
    30: T482 = 32'h66613132;
    31: T482 = 32'h66613133;
`ifndef SYNTHESIS
    default: T482 = {1{$random}};
`else
    default: T482 = 32'bx;
`endif
  endcase
  assign T483 = T484 << 6'h38;
  assign T484 = T485;
  assign T485 = {T488, T486};
  assign T486 = {8'h2c, T487};
  always @(*) case (T185)
    0: T487 = 32'h20667330;
    1: T487 = 32'h20667331;
    2: T487 = 32'h20667332;
    3: T487 = 32'h20667333;
    4: T487 = 32'h20667334;
    5: T487 = 32'h20667335;
    6: T487 = 32'h20667336;
    7: T487 = 32'h20667337;
    8: T487 = 32'h20667338;
    9: T487 = 32'h20667339;
    10: T487 = 32'h66733130;
    11: T487 = 32'h66733131;
    12: T487 = 32'h66733132;
    13: T487 = 32'h66733133;
    14: T487 = 32'h66733134;
    15: T487 = 32'h66733135;
    16: T487 = 32'h20667630;
    17: T487 = 32'h20667631;
    18: T487 = 32'h20666130;
    19: T487 = 32'h20666131;
    20: T487 = 32'h20666132;
    21: T487 = 32'h20666133;
    22: T487 = 32'h20666134;
    23: T487 = 32'h20666135;
    24: T487 = 32'h20666136;
    25: T487 = 32'h20666137;
    26: T487 = 32'h20666138;
    27: T487 = 32'h20666139;
    28: T487 = 32'h66613130;
    29: T487 = 32'h66613131;
    30: T487 = 32'h66613132;
    31: T487 = 32'h66613133;
`ifndef SYNTHESIS
    default: T487 = {1{$random}};
`else
    default: T487 = 32'bx;
`endif
  endcase
  always @(*) case (T179)
    0: T488 = 24'h207830;
    1: T488 = 24'h207261;
    2: T488 = 24'h207330;
    3: T488 = 24'h207331;
    4: T488 = 24'h207332;
    5: T488 = 24'h207333;
    6: T488 = 24'h207334;
    7: T488 = 24'h207335;
    8: T488 = 24'h207336;
    9: T488 = 24'h207337;
    10: T488 = 24'h207338;
    11: T488 = 24'h207339;
    12: T488 = 24'h733130;
    13: T488 = 24'h733131;
    14: T488 = 24'h207370;
    15: T488 = 24'h207470;
    16: T488 = 24'h207630;
    17: T488 = 24'h207631;
    18: T488 = 24'h206130;
    19: T488 = 24'h206131;
    20: T488 = 24'h206132;
    21: T488 = 24'h206133;
    22: T488 = 24'h206134;
    23: T488 = 24'h206135;
    24: T488 = 24'h206136;
    25: T488 = 24'h206137;
    26: T488 = 24'h206138;
    27: T488 = 24'h206139;
    28: T488 = 24'h613130;
    29: T488 = 24'h613131;
    30: T488 = 24'h613132;
    31: T488 = 24'h613133;
`ifndef SYNTHESIS
    default: T488 = {1{$random}};
`else
    default: T488 = 24'bx;
`endif
  endcase
  assign T489 = T187[1'h0:1'h0];
  assign T490 = T187[1'h1:1'h1];
  assign T491 = T187[2'h2:2'h2];
  assign T492 = T784 ? T578 : T493;
  assign T493 = T577 ? T503 : T494;
  assign T494 = T502 ? T500 : T495;
  assign T495 = T496 << 5'h10;
  assign T496 = T497;
  assign T497 = {T485, T498};
  assign T498 = {8'h2c, T499};
  always @(*) case (T456)
    0: T499 = 32'h20667330;
    1: T499 = 32'h20667331;
    2: T499 = 32'h20667332;
    3: T499 = 32'h20667333;
    4: T499 = 32'h20667334;
    5: T499 = 32'h20667335;
    6: T499 = 32'h20667336;
    7: T499 = 32'h20667337;
    8: T499 = 32'h20667338;
    9: T499 = 32'h20667339;
    10: T499 = 32'h66733130;
    11: T499 = 32'h66733131;
    12: T499 = 32'h66733132;
    13: T499 = 32'h66733133;
    14: T499 = 32'h66733134;
    15: T499 = 32'h66733135;
    16: T499 = 32'h20667630;
    17: T499 = 32'h20667631;
    18: T499 = 32'h20666130;
    19: T499 = 32'h20666131;
    20: T499 = 32'h20666132;
    21: T499 = 32'h20666133;
    22: T499 = 32'h20666134;
    23: T499 = 32'h20666135;
    24: T499 = 32'h20666136;
    25: T499 = 32'h20666137;
    26: T499 = 32'h20666138;
    27: T499 = 32'h20666139;
    28: T499 = 32'h66613130;
    29: T499 = 32'h66613131;
    30: T499 = 32'h66613132;
    31: T499 = 32'h66613133;
`ifndef SYNTHESIS
    default: T499 = {1{$random}};
`else
    default: T499 = 32'bx;
`endif
  endcase
  assign T500 = T501 << 7'h70;
  assign T501 = 8'h20;
  assign T502 = T187[1'h0:1'h0];
  assign T503 = T576 ? T532 : T504;
  assign T504 = T505 << 4'h8;
  assign T505 = T506;
  assign T506 = {T182, T507};
  assign T507 = {8'h2c, T508};
  assign T508 = {T530, T509};
  assign T509 = {T526, T510};
  assign T510 = {T522, T511};
  always @(*) case (T513)
    0: T511 = 8'h30;
    1: T511 = 8'h31;
    2: T511 = 8'h32;
    3: T511 = 8'h33;
    4: T511 = 8'h34;
    5: T511 = 8'h35;
    6: T511 = 8'h36;
    7: T511 = 8'h37;
    8: T511 = 8'h38;
    9: T511 = 8'h39;
    10: T511 = 8'h61;
    11: T511 = 8'h62;
    12: T511 = 8'h63;
    13: T511 = 8'h64;
    14: T511 = 8'h65;
    15: T511 = 8'h66;
`ifndef SYNTHESIS
    default: T511 = {1{$random}};
`else
    default: T511 = 8'bx;
`endif
  endcase
  assign T513 = T514[2'h3:1'h0];
  assign T514 = T515 % 5'h10;
  assign T515 = T521 ? T519 : T516;
  assign T516 = T517;
  assign T517 = T518;
  assign T518 = inst[5'h1f:5'h14];
  assign T519 = T520;
  assign T520 = 12'h0 - T517;
  assign T521 = $signed(T517) < $signed(1'h0);
  always @(*) case (T523)
    0: T522 = 8'h30;
    1: T522 = 8'h31;
    2: T522 = 8'h32;
    3: T522 = 8'h33;
    4: T522 = 8'h34;
    5: T522 = 8'h35;
    6: T522 = 8'h36;
    7: T522 = 8'h37;
    8: T522 = 8'h38;
    9: T522 = 8'h39;
    10: T522 = 8'h61;
    11: T522 = 8'h62;
    12: T522 = 8'h63;
    13: T522 = 8'h64;
    14: T522 = 8'h65;
    15: T522 = 8'h66;
`ifndef SYNTHESIS
    default: T522 = {1{$random}};
`else
    default: T522 = 8'bx;
`endif
  endcase
  assign T523 = T524[2'h3:1'h0];
  assign T524 = T525 % 5'h10;
  assign T525 = T515 / 5'h10;
  always @(*) case (T527)
    0: T526 = 8'h30;
    1: T526 = 8'h31;
    2: T526 = 8'h32;
    3: T526 = 8'h33;
    4: T526 = 8'h34;
    5: T526 = 8'h35;
    6: T526 = 8'h36;
    7: T526 = 8'h37;
    8: T526 = 8'h38;
    9: T526 = 8'h39;
    10: T526 = 8'h61;
    11: T526 = 8'h62;
    12: T526 = 8'h63;
    13: T526 = 8'h64;
    14: T526 = 8'h65;
    15: T526 = 8'h66;
`ifndef SYNTHESIS
    default: T526 = {1{$random}};
`else
    default: T526 = 8'bx;
`endif
  endcase
  assign T527 = T528[2'h3:1'h0];
  assign T528 = T529 % 5'h10;
  assign T529 = T525 / 5'h10;
  assign T530 = T531 ? 24'h2d3078 : 24'h203078;
  assign T531 = $signed(T517) < $signed(1'h0);
  assign T532 = T533 << 1'h0;
  assign T533 = T534;
  assign T534 = {T574, T535};
  assign T535 = {T573, T536};
  assign T536 = {8'h2c, T537};
  assign T537 = {T571, T538};
  assign T538 = {T567, T539};
  assign T539 = {T563, T540};
  assign T540 = {T559, T541};
  always @(*) case (T543)
    0: T541 = 8'h30;
    1: T541 = 8'h31;
    2: T541 = 8'h32;
    3: T541 = 8'h33;
    4: T541 = 8'h34;
    5: T541 = 8'h35;
    6: T541 = 8'h36;
    7: T541 = 8'h37;
    8: T541 = 8'h38;
    9: T541 = 8'h39;
    10: T541 = 8'h61;
    11: T541 = 8'h62;
    12: T541 = 8'h63;
    13: T541 = 8'h64;
    14: T541 = 8'h65;
    15: T541 = 8'h66;
`ifndef SYNTHESIS
    default: T541 = {1{$random}};
`else
    default: T541 = 8'bx;
`endif
  endcase
  assign T543 = T544[2'h3:1'h0];
  assign T544 = T545 % 5'h10;
  assign T545 = T558 ? T556 : T546;
  assign T546 = T547;
  assign T547 = T548 << 1'h1;
  assign T548 = T549;
  assign T549 = {T553, T550};
  assign T550 = {T552, T551};
  assign T551 = inst[4'hb:4'h8];
  assign T552 = inst[5'h1e:5'h19];
  assign T553 = {T555, T554};
  assign T554 = inst[3'h7:3'h7];
  assign T555 = inst[5'h1f:5'h1f];
  assign T556 = T557;
  assign T557 = 13'h0 - T547;
  assign T558 = $signed(T547) < $signed(1'h0);
  always @(*) case (T560)
    0: T559 = 8'h30;
    1: T559 = 8'h31;
    2: T559 = 8'h32;
    3: T559 = 8'h33;
    4: T559 = 8'h34;
    5: T559 = 8'h35;
    6: T559 = 8'h36;
    7: T559 = 8'h37;
    8: T559 = 8'h38;
    9: T559 = 8'h39;
    10: T559 = 8'h61;
    11: T559 = 8'h62;
    12: T559 = 8'h63;
    13: T559 = 8'h64;
    14: T559 = 8'h65;
    15: T559 = 8'h66;
`ifndef SYNTHESIS
    default: T559 = {1{$random}};
`else
    default: T559 = 8'bx;
`endif
  endcase
  assign T560 = T561[2'h3:1'h0];
  assign T561 = T562 % 5'h10;
  assign T562 = T545 / 5'h10;
  always @(*) case (T564)
    0: T563 = 8'h30;
    1: T563 = 8'h31;
    2: T563 = 8'h32;
    3: T563 = 8'h33;
    4: T563 = 8'h34;
    5: T563 = 8'h35;
    6: T563 = 8'h36;
    7: T563 = 8'h37;
    8: T563 = 8'h38;
    9: T563 = 8'h39;
    10: T563 = 8'h61;
    11: T563 = 8'h62;
    12: T563 = 8'h63;
    13: T563 = 8'h64;
    14: T563 = 8'h65;
    15: T563 = 8'h66;
`ifndef SYNTHESIS
    default: T563 = {1{$random}};
`else
    default: T563 = 8'bx;
`endif
  endcase
  assign T564 = T565[2'h3:1'h0];
  assign T565 = T566 % 5'h10;
  assign T566 = T562 / 5'h10;
  always @(*) case (T568)
    0: T567 = 8'h30;
    1: T567 = 8'h31;
    2: T567 = 8'h32;
    3: T567 = 8'h33;
    4: T567 = 8'h34;
    5: T567 = 8'h35;
    6: T567 = 8'h36;
    7: T567 = 8'h37;
    8: T567 = 8'h38;
    9: T567 = 8'h39;
    10: T567 = 8'h61;
    11: T567 = 8'h62;
    12: T567 = 8'h63;
    13: T567 = 8'h64;
    14: T567 = 8'h65;
    15: T567 = 8'h66;
`ifndef SYNTHESIS
    default: T567 = {1{$random}};
`else
    default: T567 = 8'bx;
`endif
  endcase
  assign T568 = T569[2'h3:1'h0];
  assign T569 = T570 % 5'h10;
  assign T570 = T566 / 5'h10;
  assign T571 = T572 ? 24'h2d3078 : 24'h203078;
  assign T572 = $signed(T547) < $signed(1'h0);
  always @(*) case (T456)
    0: T573 = 24'h207830;
    1: T573 = 24'h207261;
    2: T573 = 24'h207330;
    3: T573 = 24'h207331;
    4: T573 = 24'h207332;
    5: T573 = 24'h207333;
    6: T573 = 24'h207334;
    7: T573 = 24'h207335;
    8: T573 = 24'h207336;
    9: T573 = 24'h207337;
    10: T573 = 24'h207338;
    11: T573 = 24'h207339;
    12: T573 = 24'h733130;
    13: T573 = 24'h733131;
    14: T573 = 24'h207370;
    15: T573 = 24'h207470;
    16: T573 = 24'h207630;
    17: T573 = 24'h207631;
    18: T573 = 24'h206130;
    19: T573 = 24'h206131;
    20: T573 = 24'h206132;
    21: T573 = 24'h206133;
    22: T573 = 24'h206134;
    23: T573 = 24'h206135;
    24: T573 = 24'h206136;
    25: T573 = 24'h206137;
    26: T573 = 24'h206138;
    27: T573 = 24'h206139;
    28: T573 = 24'h613130;
    29: T573 = 24'h613131;
    30: T573 = 24'h613132;
    31: T573 = 24'h613133;
`ifndef SYNTHESIS
    default: T573 = {1{$random}};
`else
    default: T573 = 24'bx;
`endif
  endcase
  assign T574 = {T575, 8'h2c};
  always @(*) case (T185)
    0: T575 = 24'h207830;
    1: T575 = 24'h207261;
    2: T575 = 24'h207330;
    3: T575 = 24'h207331;
    4: T575 = 24'h207332;
    5: T575 = 24'h207333;
    6: T575 = 24'h207334;
    7: T575 = 24'h207335;
    8: T575 = 24'h207336;
    9: T575 = 24'h207337;
    10: T575 = 24'h207338;
    11: T575 = 24'h207339;
    12: T575 = 24'h733130;
    13: T575 = 24'h733131;
    14: T575 = 24'h207370;
    15: T575 = 24'h207470;
    16: T575 = 24'h207630;
    17: T575 = 24'h207631;
    18: T575 = 24'h206130;
    19: T575 = 24'h206131;
    20: T575 = 24'h206132;
    21: T575 = 24'h206133;
    22: T575 = 24'h206134;
    23: T575 = 24'h206135;
    24: T575 = 24'h206136;
    25: T575 = 24'h206137;
    26: T575 = 24'h206138;
    27: T575 = 24'h206139;
    28: T575 = 24'h613130;
    29: T575 = 24'h613131;
    30: T575 = 24'h613132;
    31: T575 = 24'h613133;
`ifndef SYNTHESIS
    default: T575 = {1{$random}};
`else
    default: T575 = 24'bx;
`endif
  endcase
  assign T576 = T187[1'h0:1'h0];
  assign T577 = T187[1'h1:1'h1];
  assign T578 = T783 ? T691 : T579;
  assign T579 = T690 ? T658 : T580;
  assign T580 = T581 << 1'h0;
  assign T581 = T582;
  assign T582 = {T656, T583};
  assign T583 = {T652, T584};
  assign T584 = {T648, T585};
  assign T585 = {T644, T586};
  assign T586 = {T640, T587};
  assign T587 = {T636, T588};
  assign T588 = {T632, T589};
  assign T589 = {T628, T590};
  assign T590 = {T624, T591};
  assign T591 = {T620, T592};
  assign T592 = {T616, T593};
  assign T593 = {T612, T594};
  always @(*) case (T596)
    0: T594 = 8'h30;
    1: T594 = 8'h31;
    2: T594 = 8'h32;
    3: T594 = 8'h33;
    4: T594 = 8'h34;
    5: T594 = 8'h35;
    6: T594 = 8'h36;
    7: T594 = 8'h37;
    8: T594 = 8'h38;
    9: T594 = 8'h39;
    10: T594 = 8'h61;
    11: T594 = 8'h62;
    12: T594 = 8'h63;
    13: T594 = 8'h64;
    14: T594 = 8'h65;
    15: T594 = 8'h66;
`ifndef SYNTHESIS
    default: T594 = {1{$random}};
`else
    default: T594 = 8'bx;
`endif
  endcase
  assign T596 = T597[2'h3:1'h0];
  assign T597 = T598 % 5'h10;
  assign T598 = T611 ? T609 : T599;
  assign T599 = T600;
  assign T600 = T601 << 1'h1;
  assign T601 = T602;
  assign T602 = {T606, T603};
  assign T603 = {T605, T604};
  assign T604 = inst[5'h1e:5'h15];
  assign T605 = inst[5'h14:5'h14];
  assign T606 = {T608, T607};
  assign T607 = inst[5'h13:4'hc];
  assign T608 = inst[5'h1f:3'h7];
  assign T609 = T610;
  assign T610 = 45'h0 - T600;
  assign T611 = $signed(T600) < $signed(1'h0);
  always @(*) case (T613)
    0: T612 = 8'h30;
    1: T612 = 8'h31;
    2: T612 = 8'h32;
    3: T612 = 8'h33;
    4: T612 = 8'h34;
    5: T612 = 8'h35;
    6: T612 = 8'h36;
    7: T612 = 8'h37;
    8: T612 = 8'h38;
    9: T612 = 8'h39;
    10: T612 = 8'h61;
    11: T612 = 8'h62;
    12: T612 = 8'h63;
    13: T612 = 8'h64;
    14: T612 = 8'h65;
    15: T612 = 8'h66;
`ifndef SYNTHESIS
    default: T612 = {1{$random}};
`else
    default: T612 = 8'bx;
`endif
  endcase
  assign T613 = T614[2'h3:1'h0];
  assign T614 = T615 % 5'h10;
  assign T615 = T598 / 5'h10;
  always @(*) case (T617)
    0: T616 = 8'h30;
    1: T616 = 8'h31;
    2: T616 = 8'h32;
    3: T616 = 8'h33;
    4: T616 = 8'h34;
    5: T616 = 8'h35;
    6: T616 = 8'h36;
    7: T616 = 8'h37;
    8: T616 = 8'h38;
    9: T616 = 8'h39;
    10: T616 = 8'h61;
    11: T616 = 8'h62;
    12: T616 = 8'h63;
    13: T616 = 8'h64;
    14: T616 = 8'h65;
    15: T616 = 8'h66;
`ifndef SYNTHESIS
    default: T616 = {1{$random}};
`else
    default: T616 = 8'bx;
`endif
  endcase
  assign T617 = T618[2'h3:1'h0];
  assign T618 = T619 % 5'h10;
  assign T619 = T615 / 5'h10;
  always @(*) case (T621)
    0: T620 = 8'h30;
    1: T620 = 8'h31;
    2: T620 = 8'h32;
    3: T620 = 8'h33;
    4: T620 = 8'h34;
    5: T620 = 8'h35;
    6: T620 = 8'h36;
    7: T620 = 8'h37;
    8: T620 = 8'h38;
    9: T620 = 8'h39;
    10: T620 = 8'h61;
    11: T620 = 8'h62;
    12: T620 = 8'h63;
    13: T620 = 8'h64;
    14: T620 = 8'h65;
    15: T620 = 8'h66;
`ifndef SYNTHESIS
    default: T620 = {1{$random}};
`else
    default: T620 = 8'bx;
`endif
  endcase
  assign T621 = T622[2'h3:1'h0];
  assign T622 = T623 % 5'h10;
  assign T623 = T619 / 5'h10;
  always @(*) case (T625)
    0: T624 = 8'h30;
    1: T624 = 8'h31;
    2: T624 = 8'h32;
    3: T624 = 8'h33;
    4: T624 = 8'h34;
    5: T624 = 8'h35;
    6: T624 = 8'h36;
    7: T624 = 8'h37;
    8: T624 = 8'h38;
    9: T624 = 8'h39;
    10: T624 = 8'h61;
    11: T624 = 8'h62;
    12: T624 = 8'h63;
    13: T624 = 8'h64;
    14: T624 = 8'h65;
    15: T624 = 8'h66;
`ifndef SYNTHESIS
    default: T624 = {1{$random}};
`else
    default: T624 = 8'bx;
`endif
  endcase
  assign T625 = T626[2'h3:1'h0];
  assign T626 = T627 % 5'h10;
  assign T627 = T623 / 5'h10;
  always @(*) case (T629)
    0: T628 = 8'h30;
    1: T628 = 8'h31;
    2: T628 = 8'h32;
    3: T628 = 8'h33;
    4: T628 = 8'h34;
    5: T628 = 8'h35;
    6: T628 = 8'h36;
    7: T628 = 8'h37;
    8: T628 = 8'h38;
    9: T628 = 8'h39;
    10: T628 = 8'h61;
    11: T628 = 8'h62;
    12: T628 = 8'h63;
    13: T628 = 8'h64;
    14: T628 = 8'h65;
    15: T628 = 8'h66;
`ifndef SYNTHESIS
    default: T628 = {1{$random}};
`else
    default: T628 = 8'bx;
`endif
  endcase
  assign T629 = T630[2'h3:1'h0];
  assign T630 = T631 % 5'h10;
  assign T631 = T627 / 5'h10;
  always @(*) case (T633)
    0: T632 = 8'h30;
    1: T632 = 8'h31;
    2: T632 = 8'h32;
    3: T632 = 8'h33;
    4: T632 = 8'h34;
    5: T632 = 8'h35;
    6: T632 = 8'h36;
    7: T632 = 8'h37;
    8: T632 = 8'h38;
    9: T632 = 8'h39;
    10: T632 = 8'h61;
    11: T632 = 8'h62;
    12: T632 = 8'h63;
    13: T632 = 8'h64;
    14: T632 = 8'h65;
    15: T632 = 8'h66;
`ifndef SYNTHESIS
    default: T632 = {1{$random}};
`else
    default: T632 = 8'bx;
`endif
  endcase
  assign T633 = T634[2'h3:1'h0];
  assign T634 = T635 % 5'h10;
  assign T635 = T631 / 5'h10;
  always @(*) case (T637)
    0: T636 = 8'h30;
    1: T636 = 8'h31;
    2: T636 = 8'h32;
    3: T636 = 8'h33;
    4: T636 = 8'h34;
    5: T636 = 8'h35;
    6: T636 = 8'h36;
    7: T636 = 8'h37;
    8: T636 = 8'h38;
    9: T636 = 8'h39;
    10: T636 = 8'h61;
    11: T636 = 8'h62;
    12: T636 = 8'h63;
    13: T636 = 8'h64;
    14: T636 = 8'h65;
    15: T636 = 8'h66;
`ifndef SYNTHESIS
    default: T636 = {1{$random}};
`else
    default: T636 = 8'bx;
`endif
  endcase
  assign T637 = T638[2'h3:1'h0];
  assign T638 = T639 % 5'h10;
  assign T639 = T635 / 5'h10;
  always @(*) case (T641)
    0: T640 = 8'h30;
    1: T640 = 8'h31;
    2: T640 = 8'h32;
    3: T640 = 8'h33;
    4: T640 = 8'h34;
    5: T640 = 8'h35;
    6: T640 = 8'h36;
    7: T640 = 8'h37;
    8: T640 = 8'h38;
    9: T640 = 8'h39;
    10: T640 = 8'h61;
    11: T640 = 8'h62;
    12: T640 = 8'h63;
    13: T640 = 8'h64;
    14: T640 = 8'h65;
    15: T640 = 8'h66;
`ifndef SYNTHESIS
    default: T640 = {1{$random}};
`else
    default: T640 = 8'bx;
`endif
  endcase
  assign T641 = T642[2'h3:1'h0];
  assign T642 = T643 % 5'h10;
  assign T643 = T639 / 5'h10;
  always @(*) case (T645)
    0: T644 = 8'h30;
    1: T644 = 8'h31;
    2: T644 = 8'h32;
    3: T644 = 8'h33;
    4: T644 = 8'h34;
    5: T644 = 8'h35;
    6: T644 = 8'h36;
    7: T644 = 8'h37;
    8: T644 = 8'h38;
    9: T644 = 8'h39;
    10: T644 = 8'h61;
    11: T644 = 8'h62;
    12: T644 = 8'h63;
    13: T644 = 8'h64;
    14: T644 = 8'h65;
    15: T644 = 8'h66;
`ifndef SYNTHESIS
    default: T644 = {1{$random}};
`else
    default: T644 = 8'bx;
`endif
  endcase
  assign T645 = T646[2'h3:1'h0];
  assign T646 = T647 % 5'h10;
  assign T647 = T643 / 5'h10;
  always @(*) case (T649)
    0: T648 = 8'h30;
    1: T648 = 8'h31;
    2: T648 = 8'h32;
    3: T648 = 8'h33;
    4: T648 = 8'h34;
    5: T648 = 8'h35;
    6: T648 = 8'h36;
    7: T648 = 8'h37;
    8: T648 = 8'h38;
    9: T648 = 8'h39;
    10: T648 = 8'h61;
    11: T648 = 8'h62;
    12: T648 = 8'h63;
    13: T648 = 8'h64;
    14: T648 = 8'h65;
    15: T648 = 8'h66;
`ifndef SYNTHESIS
    default: T648 = {1{$random}};
`else
    default: T648 = 8'bx;
`endif
  endcase
  assign T649 = T650[2'h3:1'h0];
  assign T650 = T651 % 5'h10;
  assign T651 = T647 / 5'h10;
  always @(*) case (T653)
    0: T652 = 8'h30;
    1: T652 = 8'h31;
    2: T652 = 8'h32;
    3: T652 = 8'h33;
    4: T652 = 8'h34;
    5: T652 = 8'h35;
    6: T652 = 8'h36;
    7: T652 = 8'h37;
    8: T652 = 8'h38;
    9: T652 = 8'h39;
    10: T652 = 8'h61;
    11: T652 = 8'h62;
    12: T652 = 8'h63;
    13: T652 = 8'h64;
    14: T652 = 8'h65;
    15: T652 = 8'h66;
`ifndef SYNTHESIS
    default: T652 = {1{$random}};
`else
    default: T652 = 8'bx;
`endif
  endcase
  assign T653 = T654[2'h3:1'h0];
  assign T654 = T655 % 5'h10;
  assign T655 = T651 / 5'h10;
  assign T656 = T657 ? 24'h2d3078 : 24'h203078;
  assign T657 = $signed(T600) < $signed(1'h0);
  assign T658 = T659 << 6'h20;
  assign T659 = T660;
  assign T660 = {T689, T661};
  assign T661 = {8'h2c, T662};
  assign T662 = {16'h3078, T663};
  assign T663 = {T685, T664};
  assign T664 = {T681, T665};
  assign T665 = {T677, T666};
  assign T666 = {T673, T667};
  always @(*) case (T669)
    0: T667 = 8'h30;
    1: T667 = 8'h31;
    2: T667 = 8'h32;
    3: T667 = 8'h33;
    4: T667 = 8'h34;
    5: T667 = 8'h35;
    6: T667 = 8'h36;
    7: T667 = 8'h37;
    8: T667 = 8'h38;
    9: T667 = 8'h39;
    10: T667 = 8'h61;
    11: T667 = 8'h62;
    12: T667 = 8'h63;
    13: T667 = 8'h64;
    14: T667 = 8'h65;
    15: T667 = 8'h66;
`ifndef SYNTHESIS
    default: T667 = {1{$random}};
`else
    default: T667 = 8'bx;
`endif
  endcase
  assign T669 = T670[2'h3:1'h0];
  assign T670 = T671 % 5'h10;
  assign T671 = T672;
  assign T672 = inst[5'h1f:4'hc];
  always @(*) case (T674)
    0: T673 = 8'h30;
    1: T673 = 8'h31;
    2: T673 = 8'h32;
    3: T673 = 8'h33;
    4: T673 = 8'h34;
    5: T673 = 8'h35;
    6: T673 = 8'h36;
    7: T673 = 8'h37;
    8: T673 = 8'h38;
    9: T673 = 8'h39;
    10: T673 = 8'h61;
    11: T673 = 8'h62;
    12: T673 = 8'h63;
    13: T673 = 8'h64;
    14: T673 = 8'h65;
    15: T673 = 8'h66;
`ifndef SYNTHESIS
    default: T673 = {1{$random}};
`else
    default: T673 = 8'bx;
`endif
  endcase
  assign T674 = T675[2'h3:1'h0];
  assign T675 = T676 % 5'h10;
  assign T676 = T671 / 5'h10;
  always @(*) case (T678)
    0: T677 = 8'h30;
    1: T677 = 8'h31;
    2: T677 = 8'h32;
    3: T677 = 8'h33;
    4: T677 = 8'h34;
    5: T677 = 8'h35;
    6: T677 = 8'h36;
    7: T677 = 8'h37;
    8: T677 = 8'h38;
    9: T677 = 8'h39;
    10: T677 = 8'h61;
    11: T677 = 8'h62;
    12: T677 = 8'h63;
    13: T677 = 8'h64;
    14: T677 = 8'h65;
    15: T677 = 8'h66;
`ifndef SYNTHESIS
    default: T677 = {1{$random}};
`else
    default: T677 = 8'bx;
`endif
  endcase
  assign T678 = T679[2'h3:1'h0];
  assign T679 = T680 % 5'h10;
  assign T680 = T676 / 5'h10;
  always @(*) case (T682)
    0: T681 = 8'h30;
    1: T681 = 8'h31;
    2: T681 = 8'h32;
    3: T681 = 8'h33;
    4: T681 = 8'h34;
    5: T681 = 8'h35;
    6: T681 = 8'h36;
    7: T681 = 8'h37;
    8: T681 = 8'h38;
    9: T681 = 8'h39;
    10: T681 = 8'h61;
    11: T681 = 8'h62;
    12: T681 = 8'h63;
    13: T681 = 8'h64;
    14: T681 = 8'h65;
    15: T681 = 8'h66;
`ifndef SYNTHESIS
    default: T681 = {1{$random}};
`else
    default: T681 = 8'bx;
`endif
  endcase
  assign T682 = T683[2'h3:1'h0];
  assign T683 = T684 % 5'h10;
  assign T684 = T680 / 5'h10;
  always @(*) case (T686)
    0: T685 = 8'h30;
    1: T685 = 8'h31;
    2: T685 = 8'h32;
    3: T685 = 8'h33;
    4: T685 = 8'h34;
    5: T685 = 8'h35;
    6: T685 = 8'h36;
    7: T685 = 8'h37;
    8: T685 = 8'h38;
    9: T685 = 8'h39;
    10: T685 = 8'h61;
    11: T685 = 8'h62;
    12: T685 = 8'h63;
    13: T685 = 8'h64;
    14: T685 = 8'h65;
    15: T685 = 8'h66;
`ifndef SYNTHESIS
    default: T685 = {1{$random}};
`else
    default: T685 = 8'bx;
`endif
  endcase
  assign T686 = T687[2'h3:1'h0];
  assign T687 = T688 % 5'h10;
  assign T688 = T684 / 5'h10;
  always @(*) case (T179)
    0: T689 = 24'h207830;
    1: T689 = 24'h207261;
    2: T689 = 24'h207330;
    3: T689 = 24'h207331;
    4: T689 = 24'h207332;
    5: T689 = 24'h207333;
    6: T689 = 24'h207334;
    7: T689 = 24'h207335;
    8: T689 = 24'h207336;
    9: T689 = 24'h207337;
    10: T689 = 24'h207338;
    11: T689 = 24'h207339;
    12: T689 = 24'h733130;
    13: T689 = 24'h733131;
    14: T689 = 24'h207370;
    15: T689 = 24'h207470;
    16: T689 = 24'h207630;
    17: T689 = 24'h207631;
    18: T689 = 24'h206130;
    19: T689 = 24'h206131;
    20: T689 = 24'h206132;
    21: T689 = 24'h206133;
    22: T689 = 24'h206134;
    23: T689 = 24'h206135;
    24: T689 = 24'h206136;
    25: T689 = 24'h206137;
    26: T689 = 24'h206138;
    27: T689 = 24'h206139;
    28: T689 = 24'h613130;
    29: T689 = 24'h613131;
    30: T689 = 24'h613132;
    31: T689 = 24'h613133;
`ifndef SYNTHESIS
    default: T689 = {1{$random}};
`else
    default: T689 = 24'bx;
`endif
  endcase
  assign T690 = T187[1'h0:1'h0];
  assign T691 = T782 ? T737 : T692;
  assign T692 = T693 << 4'h8;
  assign T693 = T694;
  assign T694 = {T736, T695};
  assign T695 = {8'h2c, T696};
  assign T696 = {T699, T697};
  assign T697 = {T698, 8'h29};
  always @(*) case (T185)
    0: T698 = 24'h207830;
    1: T698 = 24'h207261;
    2: T698 = 24'h207330;
    3: T698 = 24'h207331;
    4: T698 = 24'h207332;
    5: T698 = 24'h207333;
    6: T698 = 24'h207334;
    7: T698 = 24'h207335;
    8: T698 = 24'h207336;
    9: T698 = 24'h207337;
    10: T698 = 24'h207338;
    11: T698 = 24'h207339;
    12: T698 = 24'h733130;
    13: T698 = 24'h733131;
    14: T698 = 24'h207370;
    15: T698 = 24'h207470;
    16: T698 = 24'h207630;
    17: T698 = 24'h207631;
    18: T698 = 24'h206130;
    19: T698 = 24'h206131;
    20: T698 = 24'h206132;
    21: T698 = 24'h206133;
    22: T698 = 24'h206134;
    23: T698 = 24'h206135;
    24: T698 = 24'h206136;
    25: T698 = 24'h206137;
    26: T698 = 24'h206138;
    27: T698 = 24'h206139;
    28: T698 = 24'h613130;
    29: T698 = 24'h613131;
    30: T698 = 24'h613132;
    31: T698 = 24'h613133;
`ifndef SYNTHESIS
    default: T698 = {1{$random}};
`else
    default: T698 = 24'bx;
`endif
  endcase
  assign T699 = {T700, 8'h28};
  assign T700 = {T733, T701};
  assign T701 = {T725, T702};
  assign T702 = {T717, T703};
  assign T703 = {T711, T704};
  always @(*) case (T706)
    0: T704 = 8'h30;
    1: T704 = 8'h31;
    2: T704 = 8'h32;
    3: T704 = 8'h33;
    4: T704 = 8'h34;
    5: T704 = 8'h35;
    6: T704 = 8'h36;
    7: T704 = 8'h37;
    8: T704 = 8'h38;
    9: T704 = 8'h39;
`ifndef SYNTHESIS
    default: T704 = {1{$random}};
`else
    default: T704 = 8'bx;
`endif
  endcase
  assign T706 = T707 % 4'ha;
  assign T707 = T708;
  assign T708 = T710 ? T709 : T517;
  assign T709 = 12'h0 - T517;
  assign T710 = $signed(T517) < $signed(1'h0);
  assign T711 = T716 ? T715 : T712;
  always @(*) case (T713)
    0: T712 = 8'h30;
    1: T712 = 8'h31;
    2: T712 = 8'h32;
    3: T712 = 8'h33;
    4: T712 = 8'h34;
    5: T712 = 8'h35;
    6: T712 = 8'h36;
    7: T712 = 8'h37;
    8: T712 = 8'h38;
    9: T712 = 8'h39;
`ifndef SYNTHESIS
    default: T712 = {1{$random}};
`else
    default: T712 = 8'bx;
`endif
  endcase
  assign T713 = T714 % 4'ha;
  assign T714 = T707 / 4'ha;
  assign T715 = T710 ? 8'h2d : 8'h20;
  assign T716 = T714 == 12'h0;
  assign T717 = T724 ? T721 : T718;
  always @(*) case (T719)
    0: T718 = 8'h30;
    1: T718 = 8'h31;
    2: T718 = 8'h32;
    3: T718 = 8'h33;
    4: T718 = 8'h34;
    5: T718 = 8'h35;
    6: T718 = 8'h36;
    7: T718 = 8'h37;
    8: T718 = 8'h38;
    9: T718 = 8'h39;
`ifndef SYNTHESIS
    default: T718 = {1{$random}};
`else
    default: T718 = 8'bx;
`endif
  endcase
  assign T719 = T720 % 4'ha;
  assign T720 = T714 / 4'ha;
  assign T721 = T722 ? 8'h2d : 8'h20;
  assign T722 = T710 & T723;
  assign T723 = T716 ^ 1'h1;
  assign T724 = T720 == 12'h0;
  assign T725 = T732 ? T729 : T726;
  always @(*) case (T727)
    0: T726 = 8'h30;
    1: T726 = 8'h31;
    2: T726 = 8'h32;
    3: T726 = 8'h33;
    4: T726 = 8'h34;
    5: T726 = 8'h35;
    6: T726 = 8'h36;
    7: T726 = 8'h37;
    8: T726 = 8'h38;
    9: T726 = 8'h39;
`ifndef SYNTHESIS
    default: T726 = {1{$random}};
`else
    default: T726 = 8'bx;
`endif
  endcase
  assign T727 = T728 % 4'ha;
  assign T728 = T720 / 4'ha;
  assign T729 = T730 ? 8'h2d : 8'h20;
  assign T730 = T722 & T731;
  assign T731 = T724 ^ 1'h1;
  assign T732 = T728 == 12'h0;
  assign T733 = T734 ? 8'h2d : 8'h20;
  assign T734 = T730 & T735;
  assign T735 = T732 ^ 1'h1;
  always @(*) case (T179)
    0: T736 = 24'h207830;
    1: T736 = 24'h207261;
    2: T736 = 24'h207330;
    3: T736 = 24'h207331;
    4: T736 = 24'h207332;
    5: T736 = 24'h207333;
    6: T736 = 24'h207334;
    7: T736 = 24'h207335;
    8: T736 = 24'h207336;
    9: T736 = 24'h207337;
    10: T736 = 24'h207338;
    11: T736 = 24'h207339;
    12: T736 = 24'h733130;
    13: T736 = 24'h733131;
    14: T736 = 24'h207370;
    15: T736 = 24'h207470;
    16: T736 = 24'h207630;
    17: T736 = 24'h207631;
    18: T736 = 24'h206130;
    19: T736 = 24'h206131;
    20: T736 = 24'h206132;
    21: T736 = 24'h206133;
    22: T736 = 24'h206134;
    23: T736 = 24'h206135;
    24: T736 = 24'h206136;
    25: T736 = 24'h206137;
    26: T736 = 24'h206138;
    27: T736 = 24'h206139;
    28: T736 = 24'h613130;
    29: T736 = 24'h613131;
    30: T736 = 24'h613132;
    31: T736 = 24'h613133;
`ifndef SYNTHESIS
    default: T736 = {1{$random}};
`else
    default: T736 = 24'bx;
`endif
  endcase
  assign T737 = T738 << 4'h8;
  assign T738 = T739;
  assign T739 = {T781, T740};
  assign T740 = {8'h2c, T741};
  assign T741 = {T744, T742};
  assign T742 = {T743, 8'h29};
  always @(*) case (T185)
    0: T743 = 24'h207830;
    1: T743 = 24'h207261;
    2: T743 = 24'h207330;
    3: T743 = 24'h207331;
    4: T743 = 24'h207332;
    5: T743 = 24'h207333;
    6: T743 = 24'h207334;
    7: T743 = 24'h207335;
    8: T743 = 24'h207336;
    9: T743 = 24'h207337;
    10: T743 = 24'h207338;
    11: T743 = 24'h207339;
    12: T743 = 24'h733130;
    13: T743 = 24'h733131;
    14: T743 = 24'h207370;
    15: T743 = 24'h207470;
    16: T743 = 24'h207630;
    17: T743 = 24'h207631;
    18: T743 = 24'h206130;
    19: T743 = 24'h206131;
    20: T743 = 24'h206132;
    21: T743 = 24'h206133;
    22: T743 = 24'h206134;
    23: T743 = 24'h206135;
    24: T743 = 24'h206136;
    25: T743 = 24'h206137;
    26: T743 = 24'h206138;
    27: T743 = 24'h206139;
    28: T743 = 24'h613130;
    29: T743 = 24'h613131;
    30: T743 = 24'h613132;
    31: T743 = 24'h613133;
`ifndef SYNTHESIS
    default: T743 = {1{$random}};
`else
    default: T743 = 24'bx;
`endif
  endcase
  assign T744 = {T745, 8'h28};
  assign T745 = {T778, T746};
  assign T746 = {T770, T747};
  assign T747 = {T762, T748};
  assign T748 = {T756, T749};
  always @(*) case (T751)
    0: T749 = 8'h30;
    1: T749 = 8'h31;
    2: T749 = 8'h32;
    3: T749 = 8'h33;
    4: T749 = 8'h34;
    5: T749 = 8'h35;
    6: T749 = 8'h36;
    7: T749 = 8'h37;
    8: T749 = 8'h38;
    9: T749 = 8'h39;
`ifndef SYNTHESIS
    default: T749 = {1{$random}};
`else
    default: T749 = 8'bx;
`endif
  endcase
  assign T751 = T752 % 4'ha;
  assign T752 = T753;
  assign T753 = T755 ? T754 : T548;
  assign T754 = 12'h0 - T548;
  assign T755 = $signed(T548) < $signed(1'h0);
  assign T756 = T761 ? T760 : T757;
  always @(*) case (T758)
    0: T757 = 8'h30;
    1: T757 = 8'h31;
    2: T757 = 8'h32;
    3: T757 = 8'h33;
    4: T757 = 8'h34;
    5: T757 = 8'h35;
    6: T757 = 8'h36;
    7: T757 = 8'h37;
    8: T757 = 8'h38;
    9: T757 = 8'h39;
`ifndef SYNTHESIS
    default: T757 = {1{$random}};
`else
    default: T757 = 8'bx;
`endif
  endcase
  assign T758 = T759 % 4'ha;
  assign T759 = T752 / 4'ha;
  assign T760 = T755 ? 8'h2d : 8'h20;
  assign T761 = T759 == 12'h0;
  assign T762 = T769 ? T766 : T763;
  always @(*) case (T764)
    0: T763 = 8'h30;
    1: T763 = 8'h31;
    2: T763 = 8'h32;
    3: T763 = 8'h33;
    4: T763 = 8'h34;
    5: T763 = 8'h35;
    6: T763 = 8'h36;
    7: T763 = 8'h37;
    8: T763 = 8'h38;
    9: T763 = 8'h39;
`ifndef SYNTHESIS
    default: T763 = {1{$random}};
`else
    default: T763 = 8'bx;
`endif
  endcase
  assign T764 = T765 % 4'ha;
  assign T765 = T759 / 4'ha;
  assign T766 = T767 ? 8'h2d : 8'h20;
  assign T767 = T755 & T768;
  assign T768 = T761 ^ 1'h1;
  assign T769 = T765 == 12'h0;
  assign T770 = T777 ? T774 : T771;
  always @(*) case (T772)
    0: T771 = 8'h30;
    1: T771 = 8'h31;
    2: T771 = 8'h32;
    3: T771 = 8'h33;
    4: T771 = 8'h34;
    5: T771 = 8'h35;
    6: T771 = 8'h36;
    7: T771 = 8'h37;
    8: T771 = 8'h38;
    9: T771 = 8'h39;
`ifndef SYNTHESIS
    default: T771 = {1{$random}};
`else
    default: T771 = 8'bx;
`endif
  endcase
  assign T772 = T773 % 4'ha;
  assign T773 = T765 / 4'ha;
  assign T774 = T775 ? 8'h2d : 8'h20;
  assign T775 = T767 & T776;
  assign T776 = T769 ^ 1'h1;
  assign T777 = T773 == 12'h0;
  assign T778 = T779 ? 8'h2d : 8'h20;
  assign T779 = T775 & T780;
  assign T780 = T777 ^ 1'h1;
  always @(*) case (T456)
    0: T781 = 24'h207830;
    1: T781 = 24'h207261;
    2: T781 = 24'h207330;
    3: T781 = 24'h207331;
    4: T781 = 24'h207332;
    5: T781 = 24'h207333;
    6: T781 = 24'h207334;
    7: T781 = 24'h207335;
    8: T781 = 24'h207336;
    9: T781 = 24'h207337;
    10: T781 = 24'h207338;
    11: T781 = 24'h207339;
    12: T781 = 24'h733130;
    13: T781 = 24'h733131;
    14: T781 = 24'h207370;
    15: T781 = 24'h207470;
    16: T781 = 24'h207630;
    17: T781 = 24'h207631;
    18: T781 = 24'h206130;
    19: T781 = 24'h206131;
    20: T781 = 24'h206132;
    21: T781 = 24'h206133;
    22: T781 = 24'h206134;
    23: T781 = 24'h206135;
    24: T781 = 24'h206136;
    25: T781 = 24'h206137;
    26: T781 = 24'h206138;
    27: T781 = 24'h206139;
    28: T781 = 24'h613130;
    29: T781 = 24'h613131;
    30: T781 = 24'h613132;
    31: T781 = 24'h613133;
`ifndef SYNTHESIS
    default: T781 = {1{$random}};
`else
    default: T781 = 24'bx;
`endif
  endcase
  assign T782 = T187[1'h0:1'h0];
  assign T783 = T187[1'h1:1'h1];
  assign T784 = T187[2'h2:2'h2];
  assign T785 = T187[2'h3:2'h3];
  assign T786 = T812 ? T799 : T787;
  assign T787 = T798 ? T793 : T788;
  assign T788 = T789 << 1'h0;
  assign T789 = T790;
  assign T790 = {T792, T791};
  assign T791 = {8'h2c, T696};
  always @(*) case (T179)
    0: T792 = 32'h20667330;
    1: T792 = 32'h20667331;
    2: T792 = 32'h20667332;
    3: T792 = 32'h20667333;
    4: T792 = 32'h20667334;
    5: T792 = 32'h20667335;
    6: T792 = 32'h20667336;
    7: T792 = 32'h20667337;
    8: T792 = 32'h20667338;
    9: T792 = 32'h20667339;
    10: T792 = 32'h66733130;
    11: T792 = 32'h66733131;
    12: T792 = 32'h66733132;
    13: T792 = 32'h66733133;
    14: T792 = 32'h66733134;
    15: T792 = 32'h66733135;
    16: T792 = 32'h20667630;
    17: T792 = 32'h20667631;
    18: T792 = 32'h20666130;
    19: T792 = 32'h20666131;
    20: T792 = 32'h20666132;
    21: T792 = 32'h20666133;
    22: T792 = 32'h20666134;
    23: T792 = 32'h20666135;
    24: T792 = 32'h20666136;
    25: T792 = 32'h20666137;
    26: T792 = 32'h20666138;
    27: T792 = 32'h20666139;
    28: T792 = 32'h66613130;
    29: T792 = 32'h66613131;
    30: T792 = 32'h66613132;
    31: T792 = 32'h66613133;
`ifndef SYNTHESIS
    default: T792 = {1{$random}};
`else
    default: T792 = 32'bx;
`endif
  endcase
  assign T793 = T794 << 1'h0;
  assign T794 = T795;
  assign T795 = {T797, T796};
  assign T796 = {8'h2c, T741};
  always @(*) case (T456)
    0: T797 = 32'h20667330;
    1: T797 = 32'h20667331;
    2: T797 = 32'h20667332;
    3: T797 = 32'h20667333;
    4: T797 = 32'h20667334;
    5: T797 = 32'h20667335;
    6: T797 = 32'h20667336;
    7: T797 = 32'h20667337;
    8: T797 = 32'h20667338;
    9: T797 = 32'h20667339;
    10: T797 = 32'h66733130;
    11: T797 = 32'h66733131;
    12: T797 = 32'h66733132;
    13: T797 = 32'h66733133;
    14: T797 = 32'h66733134;
    15: T797 = 32'h66733135;
    16: T797 = 32'h20667630;
    17: T797 = 32'h20667631;
    18: T797 = 32'h20666130;
    19: T797 = 32'h20666131;
    20: T797 = 32'h20666132;
    21: T797 = 32'h20666133;
    22: T797 = 32'h20666134;
    23: T797 = 32'h20666135;
    24: T797 = 32'h20666136;
    25: T797 = 32'h20666137;
    26: T797 = 32'h20666138;
    27: T797 = 32'h20666139;
    28: T797 = 32'h66613130;
    29: T797 = 32'h66613131;
    30: T797 = 32'h66613132;
    31: T797 = 32'h66613133;
`ifndef SYNTHESIS
    default: T797 = {1{$random}};
`else
    default: T797 = 32'bx;
`endif
  endcase
  assign T798 = T187[1'h0:1'h0];
  assign T799 = T811 ? T802 : T800;
  assign T800 = T801 << 6'h20;
  assign T801 = T453;
  assign T802 = T803 << 5'h18;
  assign T803 = T804;
  assign T804 = {T810, T805};
  assign T805 = {T808, T806};
  assign T806 = {8'h2c, T807};
  always @(*) case (T456)
    0: T807 = 24'h207830;
    1: T807 = 24'h207261;
    2: T807 = 24'h207330;
    3: T807 = 24'h207331;
    4: T807 = 24'h207332;
    5: T807 = 24'h207333;
    6: T807 = 24'h207334;
    7: T807 = 24'h207335;
    8: T807 = 24'h207336;
    9: T807 = 24'h207337;
    10: T807 = 24'h207338;
    11: T807 = 24'h207339;
    12: T807 = 24'h733130;
    13: T807 = 24'h733131;
    14: T807 = 24'h207370;
    15: T807 = 24'h207470;
    16: T807 = 24'h207630;
    17: T807 = 24'h207631;
    18: T807 = 24'h206130;
    19: T807 = 24'h206131;
    20: T807 = 24'h206132;
    21: T807 = 24'h206133;
    22: T807 = 24'h206134;
    23: T807 = 24'h206135;
    24: T807 = 24'h206136;
    25: T807 = 24'h206137;
    26: T807 = 24'h206138;
    27: T807 = 24'h206139;
    28: T807 = 24'h613130;
    29: T807 = 24'h613131;
    30: T807 = 24'h613132;
    31: T807 = 24'h613133;
`ifndef SYNTHESIS
    default: T807 = {1{$random}};
`else
    default: T807 = 24'bx;
`endif
  endcase
  always @(*) case (T185)
    0: T808 = 32'h20637230;
    1: T808 = 32'h20637231;
    2: T808 = 32'h20637232;
    3: T808 = 32'h20637233;
    4: T808 = 32'h20637234;
    5: T808 = 32'h20637235;
    6: T808 = 32'h20637236;
    7: T808 = 32'h20637237;
    8: T808 = 32'h20637238;
    9: T808 = 32'h20637239;
    10: T808 = 32'h63723130;
    11: T808 = 32'h63723131;
    12: T808 = 32'h63723132;
    13: T808 = 32'h63723133;
    14: T808 = 32'h63723134;
    15: T808 = 32'h63723135;
    16: T808 = 32'h63723136;
    17: T808 = 32'h63723137;
    18: T808 = 32'h63723138;
    19: T808 = 32'h63723139;
    20: T808 = 32'h63723230;
    21: T808 = 32'h63723231;
    22: T808 = 32'h63723232;
    23: T808 = 32'h63723233;
    24: T808 = 32'h63723234;
    25: T808 = 32'h63723235;
    26: T808 = 32'h63723236;
    27: T808 = 32'h63723237;
    28: T808 = 32'h63723238;
    29: T808 = 32'h63723239;
    30: T808 = 32'h63723330;
    31: T808 = 32'h63723331;
`ifndef SYNTHESIS
    default: T808 = {1{$random}};
`else
    default: T808 = 32'bx;
`endif
  endcase
  assign T810 = {T177, 8'h2c};
  assign T811 = T187[1'h0:1'h0];
  assign T812 = T187[1'h1:1'h1];
  assign T813 = T187[3'h4:3'h4];
  assign T814 = T815;
  assign T815 = T449 ? 80'h6e6f7020202020202020 : T816;
  assign T816 = T448 ? 80'h202d2020202020202020 : T817;
  assign T817 = T446 ? 80'h626e6520202020202020 : T818;
  assign T818 = T444 ? 80'h62657120202020202020 : T819;
  assign T819 = T442 ? 80'h626c7420202020202020 : T820;
  assign T820 = T440 ? 80'h626c7475202020202020 : T821;
  assign T821 = T438 ? 80'h62676520202020202020 : T822;
  assign T822 = T436 ? 80'h62676575202020202020 : T823;
  assign T823 = T434 ? 80'h6a616c20202020202020 : T824;
  assign T824 = T432 ? 80'h6a616c72202020202020 : T825;
  assign T825 = T430 ? 80'h61756970632020202020 : T826;
  assign T826 = T428 ? 80'h6c622020202020202020 : T827;
  assign T827 = T426 ? 80'h6c682020202020202020 : T828;
  assign T828 = T424 ? 80'h6c772020202020202020 : T829;
  assign T829 = T422 ? 80'h6c642020202020202020 : T830;
  assign T830 = T420 ? 80'h6c627520202020202020 : T831;
  assign T831 = T418 ? 80'h6c687520202020202020 : T832;
  assign T832 = T416 ? 80'h6c777520202020202020 : T833;
  assign T833 = T414 ? 80'h73622020202020202020 : T834;
  assign T834 = T412 ? 80'h73682020202020202020 : T835;
  assign T835 = T410 ? 80'h73772020202020202020 : T836;
  assign T836 = T408 ? 80'h73642020202020202020 : T837;
  assign T837 = T406 ? 80'h616d6f6164642e772020 : T838;
  assign T838 = T404 ? 80'h616d6f737761702e7720 : T839;
  assign T839 = T402 ? 80'h616d6f616e642e772020 : T840;
  assign T840 = T400 ? 80'h616d6f6f722e77202020 : T841;
  assign T841 = T398 ? 80'h616d6f6d696e2e772020 : T842;
  assign T842 = T396 ? 80'h616d6f6d696e752e7720 : T843;
  assign T843 = T394 ? 80'h616d6f6d61782e772020 : T844;
  assign T844 = T392 ? 80'h616d6f6d6178752e7720 : T845;
  assign T845 = T390 ? 80'h616d6f6164642e642020 : T846;
  assign T846 = T388 ? 80'h616d6f737761702e6420 : T847;
  assign T847 = T386 ? 80'h616d6f616e642e642020 : T848;
  assign T848 = T384 ? 80'h616d6f6f722e64202020 : T849;
  assign T849 = T382 ? 80'h616d6f6d696e2e642020 : T850;
  assign T850 = T380 ? 80'h616d6f6d696e752e6420 : T851;
  assign T851 = T378 ? 80'h616d6f6d61782e642020 : T852;
  assign T852 = T376 ? 80'h616d6f6d6178752e6420 : T853;
  assign T853 = T374 ? 80'h6c722e77202020202020 : T854;
  assign T854 = T372 ? 80'h6c722e64202020202020 : T855;
  assign T855 = T370 ? 80'h73632e77202020202020 : T856;
  assign T856 = T368 ? 80'h73632e64202020202020 : T857;
  assign T857 = T366 ? 80'h6c756920202020202020 : T858;
  assign T858 = T364 ? 80'h61646469202020202020 : T859;
  assign T859 = T362 ? 80'h736c7469202020202020 : T860;
  assign T860 = T360 ? 80'h736c7469752020202020 : T861;
  assign T861 = T358 ? 80'h616e6469202020202020 : T862;
  assign T862 = T356 ? 80'h6f726920202020202020 : T863;
  assign T863 = T354 ? 80'h786f7269202020202020 : T864;
  assign T864 = T352 ? 80'h736c6c69202020202020 : T865;
  assign T865 = T350 ? 80'h73726c69202020202020 : T866;
  assign T866 = T348 ? 80'h73726169202020202020 : T867;
  assign T867 = T346 ? 80'h61646420202020202020 : T868;
  assign T868 = T344 ? 80'h73756220202020202020 : T869;
  assign T869 = T342 ? 80'h736c7420202020202020 : T870;
  assign T870 = T340 ? 80'h736c7475202020202020 : T871;
  assign T871 = T338 ? 80'h616e6420202020202020 : T872;
  assign T872 = T336 ? 80'h6f722020202020202020 : T873;
  assign T873 = T334 ? 80'h786f7220202020202020 : T874;
  assign T874 = T332 ? 80'h736c6c20202020202020 : T875;
  assign T875 = T330 ? 80'h73726c20202020202020 : T876;
  assign T876 = T328 ? 80'h73726120202020202020 : T877;
  assign T877 = T326 ? 80'h61646469772020202020 : T878;
  assign T878 = T324 ? 80'h736c6c69772020202020 : T879;
  assign T879 = T322 ? 80'h73726c69772020202020 : T880;
  assign T880 = T320 ? 80'h73726169772020202020 : T881;
  assign T881 = T318 ? 80'h61646477202020202020 : T882;
  assign T882 = T316 ? 80'h73756277202020202020 : T883;
  assign T883 = T314 ? 80'h736c6c77202020202020 : T884;
  assign T884 = T312 ? 80'h73726c77202020202020 : T885;
  assign T885 = T310 ? 80'h73726177202020202020 : T886;
  assign T886 = T308 ? 80'h6d756c20202020202020 : T887;
  assign T887 = T306 ? 80'h6d756c68202020202020 : T888;
  assign T888 = T304 ? 80'h6d756c68752020202020 : T889;
  assign T889 = T302 ? 80'h6d756c68737520202020 : T890;
  assign T890 = T300 ? 80'h6d756c77202020202020 : T891;
  assign T891 = T298 ? 80'h64697620202020202020 : T892;
  assign T892 = T296 ? 80'h64697675202020202020 : T893;
  assign T893 = T294 ? 80'h72656d20202020202020 : T894;
  assign T894 = T292 ? 80'h72656d75202020202020 : T895;
  assign T895 = T290 ? 80'h64697677202020202020 : T896;
  assign T896 = T288 ? 80'h64697675772020202020 : T897;
  assign T897 = T286 ? 80'h72656d77202020202020 : T898;
  assign T898 = T284 ? 80'h72656d75772020202020 : T899;
  assign T899 = T283 ? 80'h7363616c6c2020202020 : T900;
  assign T900 = T281 ? 80'h63737272772020202020 : T901;
  assign T901 = T279 ? 80'h63737272772020202020 : T902;
  assign T902 = T277 ? 80'h63737272772020202020 : T903;
  assign T903 = T910 ? 80'h73726574202020202020 : T904;
  assign T904 = T908 ? 80'h66656e63652020202020 : T905;
  assign T905 = T906 ? 80'h66656e63652e69202020 : 80'h756e6b6e6f776e202020;
  assign T906 = T907 == 32'h100f;
  assign T907 = inst & 32'h707f;
  assign T908 = T909 == 32'hf;
  assign T909 = inst & 32'h707f;
  assign T910 = inst == 32'h80000073;
  assign T911 = pc_reg;
  assign T912 = T913;
  assign T913 = tsc_reg[5'h1f:1'h0];
  assign T914 = reset ? 32'h0 : T915;
  assign T915 = tsc_reg + 32'h1;
  assign T917 = {1'h0, pc_reg};
  assign T918 = {26'h0, io_ctl_exc_cause};
  assign T919 = alu_op2[4'hb:1'h0];
  assign io_dat_status_s = csr_io_status_s;
  assign io_dat_status_ps = csr_io_status_ps;
  assign io_dat_status_ei = csr_io_status_ei;
  assign io_dat_status_pei = csr_io_status_pei;
  assign io_dat_status_ef = csr_io_status_ef;
  assign io_dat_status_u64 = csr_io_status_u64;
  assign io_dat_status_s64 = csr_io_status_s64;
  assign io_dat_status_vm = csr_io_status_vm;
  assign io_dat_status_er = csr_io_status_er;
  assign io_dat_status_zero = csr_io_status_zero;
  assign io_dat_status_im = csr_io_status_im;
  assign io_dat_status_ip = csr_io_status_ip;
  assign io_dat_br_ltu = T920;
  assign T920 = T922 < T921;
  assign T921 = rs2_data;
  assign T922 = rs1_data;
  assign io_dat_br_lt = T923;
  assign T923 = $signed(T925) < $signed(T924);
  assign T924 = rs2_data;
  assign T925 = rs1_data;
  assign io_dat_br_eq = T926;
  assign T926 = rs1_data == rs2_data;
  assign io_dat_inst = inst;
  assign io_dmem_req_bits_data = T927;
  assign T927 = rs2_data;
  assign io_dmem_req_bits_addr = alu_out;
  assign io_imem_req_bits_addr = pc_reg;
  assign io_host_ipi_rep_ready = csr_io_host_ipi_rep_ready;
  assign io_host_ipi_req_bits = csr_io_host_ipi_req_bits;
  assign io_host_ipi_req_valid = csr_io_host_ipi_req_valid;
  assign io_host_pcr_rep_bits = csr_io_host_pcr_rep_bits;
  assign io_host_pcr_rep_valid = csr_io_host_pcr_rep_valid;
  assign io_host_pcr_req_ready = csr_io_host_pcr_req_ready;
  assign io_host_debug_stats_pcr = csr_io_host_debug_stats_pcr;
  CSRFile csr(.clk(clk), .reset(reset),
       .io_host_reset( io_host_reset ),
       .io_host_debug_stats_pcr( csr_io_host_debug_stats_pcr ),
       .io_host_id( io_host_id ),
       .io_host_pcr_req_ready( csr_io_host_pcr_req_ready ),
       .io_host_pcr_req_valid( io_host_pcr_req_valid ),
       .io_host_pcr_req_bits_rw( io_host_pcr_req_bits_rw ),
       .io_host_pcr_req_bits_addr( io_host_pcr_req_bits_addr ),
       .io_host_pcr_req_bits_data( io_host_pcr_req_bits_data ),
       .io_host_pcr_rep_ready( io_host_pcr_rep_ready ),
       .io_host_pcr_rep_valid( csr_io_host_pcr_rep_valid ),
       .io_host_pcr_rep_bits( csr_io_host_pcr_rep_bits ),
       .io_host_ipi_req_ready( io_host_ipi_req_ready ),
       .io_host_ipi_req_valid( csr_io_host_ipi_req_valid ),
       .io_host_ipi_req_bits( csr_io_host_ipi_req_bits ),
       .io_host_ipi_rep_ready( csr_io_host_ipi_rep_ready ),
       .io_host_ipi_rep_valid( io_host_ipi_rep_valid ),
       .io_host_ipi_rep_bits( io_host_ipi_rep_bits ),
       //.io_host_mem_req_ready(  )
       .io_host_mem_req_valid( io_host_mem_req_valid ),
       .io_host_mem_req_bits_rw( io_host_mem_req_bits_rw ),
       .io_host_mem_req_bits_addr( io_host_mem_req_bits_addr ),
       .io_host_mem_req_bits_data( io_host_mem_req_bits_data ),
       //.io_host_mem_rep_valid(  )
       //.io_host_mem_rep_bits(  )
       .io_rw_addr( T919 ),
       .io_rw_cmd( io_ctl_csr_cmd ),
       .io_rw_rdata( csr_io_rw_rdata ),
       .io_rw_wdata( alu_op1 ),
       .io_status_ip( csr_io_status_ip ),
       .io_status_im( csr_io_status_im ),
       .io_status_zero( csr_io_status_zero ),
       .io_status_er( csr_io_status_er ),
       .io_status_vm( csr_io_status_vm ),
       .io_status_s64( csr_io_status_s64 ),
       .io_status_u64( csr_io_status_u64 ),
       .io_status_ef( csr_io_status_ef ),
       .io_status_pei( csr_io_status_pei ),
       .io_status_ei( csr_io_status_ei ),
       .io_status_ps( csr_io_status_ps ),
       .io_status_s( csr_io_status_s ),
       //.io_ptbr(  )
       .io_evec( csr_io_evec ),
       .io_exception( io_ctl_exception ),
       //.io_retire(  )
       .io_cause( T918 ),
       //.io_badvaddr_wen(  )
       .io_pc( T917 ),
       .io_sret( io_ctl_sret )
       //.io_fatc(  )
       //.io_replay(  )
       //.io_time(  )
  );
  `ifndef SYNTHESIS
    assign csr.io_retire = {1{$random}};
    assign csr.io_badvaddr_wen = {1{$random}};
  `endif

  always @(posedge clk) begin
    if (T63)
      regfile[wb_addr] <= wb_data;
    pc_reg <= T77;
    if(reset) begin
      tsc_reg <= 32'h0;
    end else begin
      tsc_reg <= T915;
    end
`ifndef SYNTHESIS
`ifdef PRINTF_COND
    if (`PRINTF_COND)
`endif
      if (T0)
        $fwrite(32'h80000002, "Cyc= %d PC= 0x%h %s %s%s Op1=[0x%h] Op2=[0x%h] W[%s,%d= 0x%h] %s Mem[%s %d: 0x%h]\n", T912, T911, T167, T165, T154, T153, T152, T150, T149, T7, T5, T3, T2, T1);
`endif
  end
endmodule

module Core(input clk, input reset,
    input  io_host_reset,
    output io_host_debug_stats_pcr,
    input  io_host_id,
    output io_host_pcr_req_ready,
    input  io_host_pcr_req_valid,
    input  io_host_pcr_req_bits_rw,
    input [11:0] io_host_pcr_req_bits_addr,
    input [63:0] io_host_pcr_req_bits_data,
    input  io_host_pcr_rep_ready,
    output io_host_pcr_rep_valid,
    output[63:0] io_host_pcr_rep_bits,
    input  io_host_ipi_req_ready,
    output io_host_ipi_req_valid,
    output io_host_ipi_req_bits,
    output io_host_ipi_rep_ready,
    input  io_host_ipi_rep_valid,
    input  io_host_ipi_rep_bits,
    //output io_host_mem_req_ready
    input  io_host_mem_req_valid,
    input  io_host_mem_req_bits_rw,
    input [63:0] io_host_mem_req_bits_addr,
    input [63:0] io_host_mem_req_bits_data,
    //output io_host_mem_rep_valid
    //output[63:0] io_host_mem_rep_bits
    input  io_imem_req_ready,
    output io_imem_req_valid,
    output[31:0] io_imem_req_bits_addr,
    //output[31:0] io_imem_req_bits_data
    output io_imem_req_bits_fcn,
    output[2:0] io_imem_req_bits_typ,
    input  io_imem_resp_valid,
    input [31:0] io_imem_resp_bits_data,
    input  io_dmem_req_ready,
    output io_dmem_req_valid,
    output[31:0] io_dmem_req_bits_addr,
    output[31:0] io_dmem_req_bits_data,
    output io_dmem_req_bits_fcn,
    output[2:0] io_dmem_req_bits_typ,
    input  io_dmem_resp_valid,
    input [31:0] io_dmem_resp_bits_data
);

  wire[2:0] c_io_ctl_debug_dmem_typ;
  wire c_io_ctl_debug_dmem_val;
  wire c_io_ctl_sret;
  wire[5:0] c_io_ctl_exc_cause;
  wire c_io_ctl_exception;
  wire[1:0] c_io_ctl_csr_cmd;
  wire c_io_ctl_rf_wen;
  wire c_io_ctl_wa_sel;
  wire[2:0] c_io_ctl_wb_sel;
  wire[3:0] c_io_ctl_alu_fun;
  wire[2:0] c_io_ctl_op2_sel;
  wire[1:0] c_io_ctl_op1_sel;
  wire[2:0] c_io_ctl_pc_sel;
  wire c_io_ctl_stall;
  wire d_io_dat_status_s;
  wire d_io_dat_status_ps;
  wire d_io_dat_status_ei;
  wire d_io_dat_status_pei;
  wire d_io_dat_status_ef;
  wire d_io_dat_status_u64;
  wire d_io_dat_status_s64;
  wire d_io_dat_status_vm;
  wire d_io_dat_status_er;
  wire[6:0] d_io_dat_status_zero;
  wire[7:0] d_io_dat_status_im;
  wire[7:0] d_io_dat_status_ip;
  wire d_io_dat_br_ltu;
  wire d_io_dat_br_lt;
  wire d_io_dat_br_eq;
  wire[31:0] d_io_dat_inst;
  wire[2:0] c_io_dmem_req_bits_typ;
  wire c_io_dmem_req_bits_fcn;
  wire[31:0] d_io_dmem_req_bits_data;
  wire[31:0] d_io_dmem_req_bits_addr;
  wire c_io_dmem_req_valid;
  wire[2:0] c_io_imem_req_bits_typ;
  wire c_io_imem_req_bits_fcn;
  wire[31:0] d_io_imem_req_bits_addr;
  wire c_io_imem_req_valid;
  wire d_io_host_ipi_rep_ready;
  wire d_io_host_ipi_req_bits;
  wire d_io_host_ipi_req_valid;
  wire[63:0] d_io_host_pcr_rep_bits;
  wire d_io_host_pcr_rep_valid;
  wire d_io_host_pcr_req_ready;
  wire d_io_host_debug_stats_pcr;


  assign io_dmem_req_bits_typ = c_io_dmem_req_bits_typ;
  assign io_dmem_req_bits_fcn = c_io_dmem_req_bits_fcn;
  assign io_dmem_req_bits_data = d_io_dmem_req_bits_data;
  assign io_dmem_req_bits_addr = d_io_dmem_req_bits_addr;
  assign io_dmem_req_valid = c_io_dmem_req_valid;
  assign io_imem_req_bits_typ = c_io_imem_req_bits_typ;
  assign io_imem_req_bits_fcn = c_io_imem_req_bits_fcn;
  assign io_imem_req_bits_addr = d_io_imem_req_bits_addr;
  assign io_imem_req_valid = c_io_imem_req_valid;
  assign io_host_ipi_rep_ready = d_io_host_ipi_rep_ready;
  assign io_host_ipi_req_bits = d_io_host_ipi_req_bits;
  assign io_host_ipi_req_valid = d_io_host_ipi_req_valid;
  assign io_host_pcr_rep_bits = d_io_host_pcr_rep_bits;
  assign io_host_pcr_rep_valid = d_io_host_pcr_rep_valid;
  assign io_host_pcr_req_ready = d_io_host_pcr_req_ready;
  assign io_host_debug_stats_pcr = d_io_host_debug_stats_pcr;
  CtlPath c(
       .io_imem_req_ready( io_imem_req_ready ),
       .io_imem_req_valid( c_io_imem_req_valid ),
       //.io_imem_req_bits_addr(  )
       //.io_imem_req_bits_data(  )
       .io_imem_req_bits_fcn( c_io_imem_req_bits_fcn ),
       .io_imem_req_bits_typ( c_io_imem_req_bits_typ ),
       .io_imem_resp_valid( io_imem_resp_valid ),
       .io_imem_resp_bits_data( io_imem_resp_bits_data ),
       .io_dmem_req_ready( io_dmem_req_ready ),
       .io_dmem_req_valid( c_io_dmem_req_valid ),
       //.io_dmem_req_bits_addr(  )
       //.io_dmem_req_bits_data(  )
       .io_dmem_req_bits_fcn( c_io_dmem_req_bits_fcn ),
       .io_dmem_req_bits_typ( c_io_dmem_req_bits_typ ),
       .io_dmem_resp_valid( io_dmem_resp_valid ),
       .io_dmem_resp_bits_data( io_dmem_resp_bits_data ),
       .io_dat_inst( d_io_dat_inst ),
       .io_dat_br_eq( d_io_dat_br_eq ),
       .io_dat_br_lt( d_io_dat_br_lt ),
       .io_dat_br_ltu( d_io_dat_br_ltu ),
       .io_dat_status_ip( d_io_dat_status_ip ),
       .io_dat_status_im( d_io_dat_status_im ),
       .io_dat_status_zero( d_io_dat_status_zero ),
       .io_dat_status_er( d_io_dat_status_er ),
       .io_dat_status_vm( d_io_dat_status_vm ),
       .io_dat_status_s64( d_io_dat_status_s64 ),
       .io_dat_status_u64( d_io_dat_status_u64 ),
       .io_dat_status_ef( d_io_dat_status_ef ),
       .io_dat_status_pei( d_io_dat_status_pei ),
       .io_dat_status_ei( d_io_dat_status_ei ),
       .io_dat_status_ps( d_io_dat_status_ps ),
       .io_dat_status_s( d_io_dat_status_s ),
       .io_ctl_stall( c_io_ctl_stall ),
       .io_ctl_pc_sel( c_io_ctl_pc_sel ),
       .io_ctl_op1_sel( c_io_ctl_op1_sel ),
       .io_ctl_op2_sel( c_io_ctl_op2_sel ),
       .io_ctl_alu_fun( c_io_ctl_alu_fun ),
       .io_ctl_wb_sel( c_io_ctl_wb_sel ),
       .io_ctl_wa_sel( c_io_ctl_wa_sel ),
       .io_ctl_rf_wen( c_io_ctl_rf_wen ),
       .io_ctl_csr_cmd( c_io_ctl_csr_cmd ),
       .io_ctl_exception( c_io_ctl_exception ),
       .io_ctl_exc_cause( c_io_ctl_exc_cause ),
       .io_ctl_sret( c_io_ctl_sret ),
       .io_ctl_debug_dmem_val( c_io_ctl_debug_dmem_val ),
       .io_ctl_debug_dmem_typ( c_io_ctl_debug_dmem_typ ),
       .io_resetSignal( io_host_reset )
  );
  DatPath d(.clk(clk), .reset(reset),
       .io_host_reset( io_host_reset ),
       .io_host_debug_stats_pcr( d_io_host_debug_stats_pcr ),
       .io_host_id( io_host_id ),
       .io_host_pcr_req_ready( d_io_host_pcr_req_ready ),
       .io_host_pcr_req_valid( io_host_pcr_req_valid ),
       .io_host_pcr_req_bits_rw( io_host_pcr_req_bits_rw ),
       .io_host_pcr_req_bits_addr( io_host_pcr_req_bits_addr ),
       .io_host_pcr_req_bits_data( io_host_pcr_req_bits_data ),
       .io_host_pcr_rep_ready( io_host_pcr_rep_ready ),
       .io_host_pcr_rep_valid( d_io_host_pcr_rep_valid ),
       .io_host_pcr_rep_bits( d_io_host_pcr_rep_bits ),
       .io_host_ipi_req_ready( io_host_ipi_req_ready ),
       .io_host_ipi_req_valid( d_io_host_ipi_req_valid ),
       .io_host_ipi_req_bits( d_io_host_ipi_req_bits ),
       .io_host_ipi_rep_ready( d_io_host_ipi_rep_ready ),
       .io_host_ipi_rep_valid( io_host_ipi_rep_valid ),
       .io_host_ipi_rep_bits( io_host_ipi_rep_bits ),
       //.io_host_mem_req_ready(  )
       .io_host_mem_req_valid( io_host_mem_req_valid ),
       .io_host_mem_req_bits_rw( io_host_mem_req_bits_rw ),
       .io_host_mem_req_bits_addr( io_host_mem_req_bits_addr ),
       .io_host_mem_req_bits_data( io_host_mem_req_bits_data ),
       //.io_host_mem_rep_valid(  )
       //.io_host_mem_rep_bits(  )
       .io_imem_req_ready( io_imem_req_ready ),
       //.io_imem_req_valid(  )
       .io_imem_req_bits_addr( d_io_imem_req_bits_addr ),
       //.io_imem_req_bits_data(  )
       //.io_imem_req_bits_fcn(  )
       //.io_imem_req_bits_typ(  )
       .io_imem_resp_valid( io_imem_resp_valid ),
       .io_imem_resp_bits_data( io_imem_resp_bits_data ),
       .io_dmem_req_ready( io_dmem_req_ready ),
       //.io_dmem_req_valid(  )
       .io_dmem_req_bits_addr( d_io_dmem_req_bits_addr ),
       .io_dmem_req_bits_data( d_io_dmem_req_bits_data ),
       //.io_dmem_req_bits_fcn(  )
       //.io_dmem_req_bits_typ(  )
       .io_dmem_resp_valid( io_dmem_resp_valid ),
       .io_dmem_resp_bits_data( io_dmem_resp_bits_data ),
       .io_ctl_stall( c_io_ctl_stall ),
       .io_ctl_pc_sel( c_io_ctl_pc_sel ),
       .io_ctl_op1_sel( c_io_ctl_op1_sel ),
       .io_ctl_op2_sel( c_io_ctl_op2_sel ),
       .io_ctl_alu_fun( c_io_ctl_alu_fun ),
       .io_ctl_wb_sel( c_io_ctl_wb_sel ),
       .io_ctl_wa_sel( c_io_ctl_wa_sel ),
       .io_ctl_rf_wen( c_io_ctl_rf_wen ),
       .io_ctl_csr_cmd( c_io_ctl_csr_cmd ),
       .io_ctl_exception( c_io_ctl_exception ),
       .io_ctl_exc_cause( c_io_ctl_exc_cause ),
       .io_ctl_sret( c_io_ctl_sret ),
       .io_ctl_debug_dmem_val( c_io_ctl_debug_dmem_val ),
       .io_ctl_debug_dmem_typ( c_io_ctl_debug_dmem_typ ),
       .io_dat_inst( d_io_dat_inst ),
       .io_dat_br_eq( d_io_dat_br_eq ),
       .io_dat_br_lt( d_io_dat_br_lt ),
       .io_dat_br_ltu( d_io_dat_br_ltu ),
       .io_dat_status_ip( d_io_dat_status_ip ),
       .io_dat_status_im( d_io_dat_status_im ),
       .io_dat_status_zero( d_io_dat_status_zero ),
       .io_dat_status_er( d_io_dat_status_er ),
       .io_dat_status_vm( d_io_dat_status_vm ),
       .io_dat_status_s64( d_io_dat_status_s64 ),
       .io_dat_status_u64( d_io_dat_status_u64 ),
       .io_dat_status_ef( d_io_dat_status_ef ),
       .io_dat_status_pei( d_io_dat_status_pei ),
       .io_dat_status_ei( d_io_dat_status_ei ),
       .io_dat_status_ps( d_io_dat_status_ps ),
       .io_dat_status_s( d_io_dat_status_s )
  );
endmodule

module ScratchPadMemory(input clk,
    output io_core_ports_1_req_ready,
    input  io_core_ports_1_req_valid,
    input [31:0] io_core_ports_1_req_bits_addr,
    input [31:0] io_core_ports_1_req_bits_data,
    input  io_core_ports_1_req_bits_fcn,
    input [2:0] io_core_ports_1_req_bits_typ,
    output io_core_ports_1_resp_valid,
    output[31:0] io_core_ports_1_resp_bits_data,
    output io_core_ports_0_req_ready,
    input  io_core_ports_0_req_valid,
    input [31:0] io_core_ports_0_req_bits_addr,
    input [31:0] io_core_ports_0_req_bits_data,
    input  io_core_ports_0_req_bits_fcn,
    input [2:0] io_core_ports_0_req_bits_typ,
    output io_core_ports_0_resp_valid,
    output[31:0] io_core_ports_0_resp_bits_data,
    output io_htif_port_req_ready,
    input  io_htif_port_req_valid,
    input [31:0] io_htif_port_req_bits_addr,
    input [63:0] io_htif_port_req_bits_data,
    input  io_htif_port_req_bits_fcn,
    //input [2:0] io_htif_port_req_bits_typ
    output io_htif_port_resp_valid,
    output[63:0] io_htif_port_resp_bits_data
);

  reg [63:0] R0;
  wire[63:0] htif_read_data_out;
  wire[31:0] T1;
  reg [31:0] data_bank0 [262143:0];
  wire[31:0] T2;
  wire[31:0] T3;
  wire T4;
  wire T5;
  wire[17:0] T6;
  wire[28:0] htif_idx;
  wire[31:0] T7;
  wire[31:0] T8;
  wire[31:0] T9;
  wire[31:0] T10;
  wire[31:0] T11;
  wire[62:0] T12;
  wire[4:0] T13;
  wire[1:0] T14;
  wire[31:0] T15;
  wire[31:0] T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire[31:0] T23;
  wire[17:0] T24;
  wire[28:0] T25;
  wire[31:0] T26;
  wire[31:0] T27;
  wire[31:0] T28;
  wire[31:0] T29;
  wire[15:0] T30;
  wire T31;
  wire T32;
  wire T33;
  wire[31:0] T34;
  wire[15:0] T35;
  wire[7:0] T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire[17:0] T45;
  wire[31:0] T46;
  wire[31:0] T47;
  wire[31:0] T48;
  wire[31:0] T49;
  wire[31:0] T50;
  wire[62:0] T51;
  wire[4:0] T52;
  wire[1:0] T53;
  wire[31:0] T54;
  wire[31:0] T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire[31:0] T62;
  wire[17:0] T63;
  wire[28:0] T64;
  wire[31:0] T65;
  wire[31:0] T66;
  wire[31:0] T67;
  wire[31:0] T68;
  wire[15:0] T69;
  wire T70;
  wire T71;
  wire T72;
  wire[31:0] T73;
  wire[15:0] T74;
  wire[7:0] T75;
  wire T76;
  wire T77;
  wire T78;
  wire T79;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire[17:0] T84;
  wire[17:0] T85;
  wire[31:0] T86;
  reg [31:0] data_bank1 [262143:0];
  wire[31:0] T87;
  wire[31:0] T88;
  wire[17:0] T89;
  wire[31:0] T90;
  wire[31:0] T91;
  wire[31:0] T92;
  wire[31:0] T93;
  wire[31:0] T94;
  wire[17:0] T95;
  wire[31:0] T96;
  wire T97;
  wire[17:0] T98;
  wire[31:0] T99;
  wire[31:0] T100;
  wire[31:0] T101;
  wire[31:0] T102;
  wire[31:0] T103;
  wire[17:0] T104;
  wire[31:0] T105;
  wire T106;
  wire[17:0] T107;
  wire[17:0] T108;
  reg  R109;
  wire T110;
  wire T111;
  wire[31:0] T112;
  wire[31:0] T113;
  wire[31:0] T114;
  wire[31:0] T115;
  wire[31:0] T116;
  wire[31:0] T117;
  wire[31:0] T118;
  wire[31:0] T119;
  wire[7:0] T120;
  wire T121;
  wire[31:0] T122;
  wire[7:0] T123;
  wire[23:0] T124;
  wire[23:0] T125;
  wire T126;
  wire T127;
  wire[31:0] T128;
  wire[15:0] T129;
  wire T130;
  wire[31:0] T131;
  wire[15:0] T132;
  wire[15:0] T133;
  wire[15:0] T134;
  wire T135;
  wire T136;
  wire[31:0] T137;
  wire[31:0] T138;
  wire[31:0] T139;
  wire[31:0] T140;
  wire[31:0] T141;
  wire[31:0] T142;
  wire[31:0] T143;
  wire[31:0] T144;
  wire[7:0] T145;
  wire T146;
  wire[31:0] T147;
  wire[7:0] T148;
  wire[23:0] T149;
  wire[23:0] T150;
  wire T151;
  wire T152;
  wire[31:0] T153;
  wire[15:0] T154;
  wire T155;
  wire[31:0] T156;
  wire[15:0] T157;
  wire[15:0] T158;
  wire[15:0] T159;
  wire T160;
  wire T161;

`ifndef SYNTHESIS
  integer initvar;
  initial begin
    #0.002;
    R0 = {2{$random}};
    for (initvar = 0; initvar < 262144; initvar = initvar+1)
      data_bank0[initvar] = {1{$random}};
    for (initvar = 0; initvar < 262144; initvar = initvar+1)
      data_bank1[initvar] = {1{$random}};
    R109 = {1{$random}};
  end
`endif

  assign io_htif_port_resp_bits_data = R0;
  assign htif_read_data_out = {T86, T1};
  assign T1 = data_bank0[T85];
  assign T3 = io_htif_port_req_bits_data[5'h1f:1'h0];
  assign T4 = io_htif_port_req_valid & T5;
  assign T5 = io_htif_port_req_bits_fcn == 1'h1;
  assign T6 = htif_idx[5'h11:1'h0];
  assign htif_idx = io_htif_port_req_bits_addr >> 2'h3;
  assign T8 = T26 | T9;
  assign T9 = T23 & T10;
  assign T10 = ~ T11;
  assign T11 = T12[5'h1f:1'h0];
  assign T12 = T15 << T13;
  assign T13 = {T14, 3'h0};
  assign T14 = io_core_ports_1_req_bits_addr[1'h1:1'h0];
  assign T15 = T20 ? 32'hffff : T16;
  assign T16 = T17 ? 32'hff : 32'hffffffff;
  assign T17 = T19 | T18;
  assign T18 = io_core_ports_1_req_bits_typ == 3'h5;
  assign T19 = io_core_ports_1_req_bits_typ == 3'h1;
  assign T20 = T22 | T21;
  assign T21 = io_core_ports_1_req_bits_typ == 3'h6;
  assign T22 = io_core_ports_1_req_bits_typ == 3'h2;
  assign T23 = data_bank0[T24];
  assign T24 = T25[5'h11:1'h0];
  assign T25 = io_core_ports_1_req_bits_addr >> 2'h3;
  assign T26 = T27 & T11;
  assign T27 = T37 ? T34 : T28;
  assign T28 = T31 ? T29 : io_core_ports_1_req_bits_data;
  assign T29 = {T30, T30};
  assign T30 = io_core_ports_1_req_bits_data[4'hf:1'h0];
  assign T31 = T33 | T32;
  assign T32 = io_core_ports_1_req_bits_typ == 3'h6;
  assign T33 = io_core_ports_1_req_bits_typ == 3'h2;
  assign T34 = {T35, T35};
  assign T35 = {T36, T36};
  assign T36 = io_core_ports_1_req_bits_data[3'h7:1'h0];
  assign T37 = T39 | T38;
  assign T38 = io_core_ports_1_req_bits_typ == 3'h5;
  assign T39 = io_core_ports_1_req_bits_typ == 3'h1;
  assign T40 = T43 & T41;
  assign T41 = T42 ^ 1'h1;
  assign T42 = io_core_ports_1_req_bits_addr[2'h2:2'h2];
  assign T43 = io_core_ports_1_req_valid & T44;
  assign T44 = io_core_ports_1_req_bits_fcn == 1'h1;
  assign T45 = T25[5'h11:1'h0];
  assign T47 = T65 | T48;
  assign T48 = T62 & T49;
  assign T49 = ~ T50;
  assign T50 = T51[5'h1f:1'h0];
  assign T51 = T54 << T52;
  assign T52 = {T53, 3'h0};
  assign T53 = io_core_ports_0_req_bits_addr[1'h1:1'h0];
  assign T54 = T59 ? 32'hffff : T55;
  assign T55 = T56 ? 32'hff : 32'hffffffff;
  assign T56 = T58 | T57;
  assign T57 = io_core_ports_0_req_bits_typ == 3'h5;
  assign T58 = io_core_ports_0_req_bits_typ == 3'h1;
  assign T59 = T61 | T60;
  assign T60 = io_core_ports_0_req_bits_typ == 3'h6;
  assign T61 = io_core_ports_0_req_bits_typ == 3'h2;
  assign T62 = data_bank0[T63];
  assign T63 = T64[5'h11:1'h0];
  assign T64 = io_core_ports_0_req_bits_addr >> 2'h3;
  assign T65 = T66 & T50;
  assign T66 = T76 ? T73 : T67;
  assign T67 = T70 ? T68 : io_core_ports_0_req_bits_data;
  assign T68 = {T69, T69};
  assign T69 = io_core_ports_0_req_bits_data[4'hf:1'h0];
  assign T70 = T72 | T71;
  assign T71 = io_core_ports_0_req_bits_typ == 3'h6;
  assign T72 = io_core_ports_0_req_bits_typ == 3'h2;
  assign T73 = {T74, T74};
  assign T74 = {T75, T75};
  assign T75 = io_core_ports_0_req_bits_data[3'h7:1'h0];
  assign T76 = T78 | T77;
  assign T77 = io_core_ports_0_req_bits_typ == 3'h5;
  assign T78 = io_core_ports_0_req_bits_typ == 3'h1;
  assign T79 = T82 & T80;
  assign T80 = T81 ^ 1'h1;
  assign T81 = io_core_ports_0_req_bits_addr[2'h2:2'h2];
  assign T82 = io_core_ports_0_req_valid & T83;
  assign T83 = io_core_ports_0_req_bits_fcn == 1'h1;
  assign T84 = T64[5'h11:1'h0];
  assign T85 = htif_idx[5'h11:1'h0];
  assign T86 = data_bank1[T108];
  assign T88 = io_htif_port_req_bits_data[6'h3f:6'h20];
  assign T89 = htif_idx[5'h11:1'h0];
  assign T91 = T96 | T92;
  assign T92 = T94 & T93;
  assign T93 = ~ T11;
  assign T94 = data_bank1[T95];
  assign T95 = T25[5'h11:1'h0];
  assign T96 = T27 & T11;
  assign T97 = T43 & T42;
  assign T98 = T25[5'h11:1'h0];
  assign T100 = T105 | T101;
  assign T101 = T103 & T102;
  assign T102 = ~ T50;
  assign T103 = data_bank1[T104];
  assign T104 = T64[5'h11:1'h0];
  assign T105 = T66 & T50;
  assign T106 = T82 & T81;
  assign T107 = T64[5'h11:1'h0];
  assign T108 = htif_idx[5'h11:1'h0];
  assign io_htif_port_resp_valid = R109;
  assign T110 = io_htif_port_req_valid & T111;
  assign T111 = io_htif_port_req_bits_fcn == 1'h0;
  assign io_htif_port_req_ready = 1'h1;
  assign io_core_ports_0_resp_bits_data = T112;
  assign T112 = T136 ? T131 : T113;
  assign T113 = T130 ? T128 : T114;
  assign T114 = T127 ? T122 : T115;
  assign T115 = T121 ? T119 : T116;
  assign T116 = T117[5'h1f:1'h0];
  assign T117 = T118 >> T52;
  assign T118 = T81 ? T103 : T62;
  assign T119 = {24'h0, T120};
  assign T120 = T117[3'h7:1'h0];
  assign T121 = io_core_ports_0_req_bits_typ == 3'h5;
  assign T122 = {T124, T123};
  assign T123 = T117[3'h7:1'h0];
  assign T124 = 24'h0 - T125;
  assign T125 = {23'h0, T126};
  assign T126 = T117[3'h7:3'h7];
  assign T127 = io_core_ports_0_req_bits_typ == 3'h1;
  assign T128 = {16'h0, T129};
  assign T129 = T117[4'hf:1'h0];
  assign T130 = io_core_ports_0_req_bits_typ == 3'h6;
  assign T131 = {T133, T132};
  assign T132 = T117[4'hf:1'h0];
  assign T133 = 16'h0 - T134;
  assign T134 = {15'h0, T135};
  assign T135 = T117[4'hf:4'hf];
  assign T136 = io_core_ports_0_req_bits_typ == 3'h2;
  assign io_core_ports_0_resp_valid = io_core_ports_0_req_valid;
  assign io_core_ports_0_req_ready = 1'h1;
  assign io_core_ports_1_resp_bits_data = T137;
  assign T137 = T161 ? T156 : T138;
  assign T138 = T155 ? T153 : T139;
  assign T139 = T152 ? T147 : T140;
  assign T140 = T146 ? T144 : T141;
  assign T141 = T142[5'h1f:1'h0];
  assign T142 = T143 >> T13;
  assign T143 = T42 ? T94 : T23;
  assign T144 = {24'h0, T145};
  assign T145 = T142[3'h7:1'h0];
  assign T146 = io_core_ports_1_req_bits_typ == 3'h5;
  assign T147 = {T149, T148};
  assign T148 = T142[3'h7:1'h0];
  assign T149 = 24'h0 - T150;
  assign T150 = {23'h0, T151};
  assign T151 = T142[3'h7:3'h7];
  assign T152 = io_core_ports_1_req_bits_typ == 3'h1;
  assign T153 = {16'h0, T154};
  assign T154 = T142[4'hf:1'h0];
  assign T155 = io_core_ports_1_req_bits_typ == 3'h6;
  assign T156 = {T158, T157};
  assign T157 = T142[4'hf:1'h0];
  assign T158 = 16'h0 - T159;
  assign T159 = {15'h0, T160};
  assign T160 = T142[4'hf:4'hf];
  assign T161 = io_core_ports_1_req_bits_typ == 3'h2;
  assign io_core_ports_1_resp_valid = io_core_ports_1_req_valid;
  assign io_core_ports_1_req_ready = 1'h1;

  always @(posedge clk) begin
    R0 <= htif_read_data_out;
    if (T4)
      data_bank0[T6] <= T3;
    if (T40)
      data_bank0[T45] <= T8;
    if (T79)
      data_bank0[T84] <= T47;
    if (T4)
      data_bank1[T89] <= T88;
    if (T97)
      data_bank1[T98] <= T91;
    if (T106)
      data_bank1[T107] <= T100;
    R109 <= T110;
  end
endmodule

module SodorTile(input clk,
    input  io_host_reset,
    output io_host_debug_stats_pcr,
    input  io_host_id,
    output io_host_pcr_req_ready,
    input  io_host_pcr_req_valid,
    input  io_host_pcr_req_bits_rw,
    input [11:0] io_host_pcr_req_bits_addr,
    input [63:0] io_host_pcr_req_bits_data,
    input  io_host_pcr_rep_ready,
    output io_host_pcr_rep_valid,
    output[63:0] io_host_pcr_rep_bits,
    input  io_host_ipi_req_ready,
    output io_host_ipi_req_valid,
    output io_host_ipi_req_bits,
    output io_host_ipi_rep_ready,
    input  io_host_ipi_rep_valid,
    input  io_host_ipi_rep_bits,
    output io_host_mem_req_ready,
    input  io_host_mem_req_valid,
    input  io_host_mem_req_bits_rw,
    input [63:0] io_host_mem_req_bits_addr,
    input [63:0] io_host_mem_req_bits_data,
    output io_host_mem_rep_valid,
    output[63:0] io_host_mem_rep_bits
);

  wire[31:0] T0;
  wire[63:0] T1;
  wire[2:0] core_io_imem_req_bits_typ;
  wire core_io_imem_req_bits_fcn;
  wire[31:0] core_io_imem_req_bits_addr;
  wire core_io_imem_req_valid;
  wire[2:0] core_io_dmem_req_bits_typ;
  wire core_io_dmem_req_bits_fcn;
  wire[31:0] core_io_dmem_req_bits_data;
  wire[31:0] core_io_dmem_req_bits_addr;
  wire core_io_dmem_req_valid;
  wire[31:0] memory_io_core_ports_1_resp_bits_data;
  wire memory_io_core_ports_1_resp_valid;
  wire memory_io_core_ports_1_req_ready;
  wire[31:0] memory_io_core_ports_0_resp_bits_data;
  wire memory_io_core_ports_0_resp_valid;
  wire memory_io_core_ports_0_req_ready;
  wire[63:0] memory_io_htif_port_resp_bits_data;
  wire memory_io_htif_port_resp_valid;
  wire memory_io_htif_port_req_ready;
  wire core_io_host_ipi_rep_ready;
  wire core_io_host_ipi_req_bits;
  wire core_io_host_ipi_req_valid;
  wire[63:0] core_io_host_pcr_rep_bits;
  wire core_io_host_pcr_rep_valid;
  wire core_io_host_pcr_req_ready;
  wire core_io_host_debug_stats_pcr;


  assign T0 = T1[5'h1f:1'h0];
  assign T1 = io_host_mem_req_bits_addr;
  assign io_host_mem_rep_bits = memory_io_htif_port_resp_bits_data;
  assign io_host_mem_rep_valid = memory_io_htif_port_resp_valid;
  assign io_host_mem_req_ready = memory_io_htif_port_req_ready;
  assign io_host_ipi_rep_ready = core_io_host_ipi_rep_ready;
  assign io_host_ipi_req_bits = core_io_host_ipi_req_bits;
  assign io_host_ipi_req_valid = core_io_host_ipi_req_valid;
  assign io_host_pcr_rep_bits = core_io_host_pcr_rep_bits;
  assign io_host_pcr_rep_valid = core_io_host_pcr_rep_valid;
  assign io_host_pcr_req_ready = core_io_host_pcr_req_ready;
  assign io_host_debug_stats_pcr = core_io_host_debug_stats_pcr;
  Core core(.clk(clk), .reset(io_host_reset),
       .io_host_reset( io_host_reset ),
       .io_host_debug_stats_pcr( core_io_host_debug_stats_pcr ),
       .io_host_id( io_host_id ),
       .io_host_pcr_req_ready( core_io_host_pcr_req_ready ),
       .io_host_pcr_req_valid( io_host_pcr_req_valid ),
       .io_host_pcr_req_bits_rw( io_host_pcr_req_bits_rw ),
       .io_host_pcr_req_bits_addr( io_host_pcr_req_bits_addr ),
       .io_host_pcr_req_bits_data( io_host_pcr_req_bits_data ),
       .io_host_pcr_rep_ready( io_host_pcr_rep_ready ),
       .io_host_pcr_rep_valid( core_io_host_pcr_rep_valid ),
       .io_host_pcr_rep_bits( core_io_host_pcr_rep_bits ),
       .io_host_ipi_req_ready( io_host_ipi_req_ready ),
       .io_host_ipi_req_valid( core_io_host_ipi_req_valid ),
       .io_host_ipi_req_bits( core_io_host_ipi_req_bits ),
       .io_host_ipi_rep_ready( core_io_host_ipi_rep_ready ),
       .io_host_ipi_rep_valid( io_host_ipi_rep_valid ),
       .io_host_ipi_rep_bits( io_host_ipi_rep_bits ),
       //.io_host_mem_req_ready(  )
       .io_host_mem_req_valid( io_host_mem_req_valid ),
       .io_host_mem_req_bits_rw( io_host_mem_req_bits_rw ),
       .io_host_mem_req_bits_addr( io_host_mem_req_bits_addr ),
       .io_host_mem_req_bits_data( io_host_mem_req_bits_data ),
       //.io_host_mem_rep_valid(  )
       //.io_host_mem_rep_bits(  )
       .io_imem_req_ready( memory_io_core_ports_0_req_ready ),
       .io_imem_req_valid( core_io_imem_req_valid ),
       .io_imem_req_bits_addr( core_io_imem_req_bits_addr ),
       //.io_imem_req_bits_data(  )
       .io_imem_req_bits_fcn( core_io_imem_req_bits_fcn ),
       .io_imem_req_bits_typ( core_io_imem_req_bits_typ ),
       .io_imem_resp_valid( memory_io_core_ports_0_resp_valid ),
       .io_imem_resp_bits_data( memory_io_core_ports_0_resp_bits_data ),
       .io_dmem_req_ready( memory_io_core_ports_1_req_ready ),
       .io_dmem_req_valid( core_io_dmem_req_valid ),
       .io_dmem_req_bits_addr( core_io_dmem_req_bits_addr ),
       .io_dmem_req_bits_data( core_io_dmem_req_bits_data ),
       .io_dmem_req_bits_fcn( core_io_dmem_req_bits_fcn ),
       .io_dmem_req_bits_typ( core_io_dmem_req_bits_typ ),
       .io_dmem_resp_valid( memory_io_core_ports_1_resp_valid ),
       .io_dmem_resp_bits_data( memory_io_core_ports_1_resp_bits_data )
  );
  ScratchPadMemory memory(.clk(clk),
       .io_core_ports_1_req_ready( memory_io_core_ports_1_req_ready ),
       .io_core_ports_1_req_valid( core_io_dmem_req_valid ),
       .io_core_ports_1_req_bits_addr( core_io_dmem_req_bits_addr ),
       .io_core_ports_1_req_bits_data( core_io_dmem_req_bits_data ),
       .io_core_ports_1_req_bits_fcn( core_io_dmem_req_bits_fcn ),
       .io_core_ports_1_req_bits_typ( core_io_dmem_req_bits_typ ),
       .io_core_ports_1_resp_valid( memory_io_core_ports_1_resp_valid ),
       .io_core_ports_1_resp_bits_data( memory_io_core_ports_1_resp_bits_data ),
       .io_core_ports_0_req_ready( memory_io_core_ports_0_req_ready ),
       .io_core_ports_0_req_valid( core_io_imem_req_valid ),
       .io_core_ports_0_req_bits_addr( core_io_imem_req_bits_addr ),
       //.io_core_ports_0_req_bits_data(  )
       .io_core_ports_0_req_bits_fcn( core_io_imem_req_bits_fcn ),
       .io_core_ports_0_req_bits_typ( core_io_imem_req_bits_typ ),
       .io_core_ports_0_resp_valid( memory_io_core_ports_0_resp_valid ),
       .io_core_ports_0_resp_bits_data( memory_io_core_ports_0_resp_bits_data ),
       .io_htif_port_req_ready( memory_io_htif_port_req_ready ),
       .io_htif_port_req_valid( io_host_mem_req_valid ),
       .io_htif_port_req_bits_addr( T0 ),
       .io_htif_port_req_bits_data( io_host_mem_req_bits_data ),
       .io_htif_port_req_bits_fcn( io_host_mem_req_bits_rw ),
       //.io_htif_port_req_bits_typ(  )
       .io_htif_port_resp_valid( memory_io_htif_port_resp_valid ),
       .io_htif_port_resp_bits_data( memory_io_htif_port_resp_bits_data )
  );
  `ifndef SYNTHESIS
    assign memory.io_core_ports_0_req_bits_data = {1{$random}};
  `endif
endmodule

module Queue_0(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits_rw,
    input [11:0] io_enq_bits_addr,
    input [63:0] io_enq_bits_data,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits_rw,
    output[11:0] io_deq_bits_addr,
    output[63:0] io_deq_bits_data
);

  wire[63:0] T0;
  wire[76:0] T1;
  wire[75:0] T2;
  wire[63:0] T3;
  wire[76:0] T4;
  reg [76:0] ram [1:0];
  wire[76:0] T5;
  wire[76:0] T6;
  wire[76:0] T7;
  wire[75:0] T8;
  wire do_enq;
  reg  R9;
  wire T10;
  wire T11;
  wire T12;
  reg  R13;
  wire T14;
  wire T15;
  wire T16;
  wire do_deq;
  wire[11:0] T17;
  wire T18;
  wire[11:0] T19;
  wire T20;
  wire T21;
  wire empty;
  wire T22;
  reg  maybe_full;
  wire T23;
  wire T24;
  wire T25;
  wire ptr_match;
  wire T26;
  wire full;

`ifndef SYNTHESIS
  integer initvar;
  initial begin
    #0.002;
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {3{$random}};
    R9 = {1{$random}};
    R13 = {1{$random}};
    maybe_full = {1{$random}};
  end
`endif

  assign io_deq_bits_data = T0;
  assign T0 = T1[6'h3f:1'h0];
  assign T1 = {T18, T2};
  assign T2 = {T17, T3};
  assign T3 = T4[6'h3f:1'h0];
  assign T4 = ram[R13];
  assign T6 = T7;
  assign T7 = {io_enq_bits_rw, T8};
  assign T8 = {io_enq_bits_addr, io_enq_bits_data};
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T10 = reset ? 1'h0 : T11;
  assign T11 = do_enq ? T12 : R9;
  assign T12 = R9 + 1'h1;
  assign T14 = reset ? 1'h0 : T15;
  assign T15 = do_deq ? T16 : R13;
  assign T16 = R13 + 1'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T17 = T4[7'h4b:7'h40];
  assign T18 = T4[7'h4c:7'h4c];
  assign io_deq_bits_addr = T19;
  assign T19 = T1[7'h4b:7'h40];
  assign io_deq_bits_rw = T20;
  assign T20 = T1[7'h4c:7'h4c];
  assign io_deq_valid = T21;
  assign T21 = empty ^ 1'h1;
  assign empty = ptr_match & T22;
  assign T22 = maybe_full ^ 1'h1;
  assign T23 = reset ? 1'h0 : T24;
  assign T24 = T25 ? do_enq : maybe_full;
  assign T25 = do_enq != do_deq;
  assign ptr_match = R9 == R13;
  assign io_enq_ready = T26;
  assign T26 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if (do_enq)
      ram[R9] <= T6;
    if(reset) begin
      R9 <= 1'h0;
    end else if(do_enq) begin
      R9 <= T12;
    end
    if(reset) begin
      R13 <= 1'h0;
    end else if(do_deq) begin
      R13 <= T16;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T25) begin
      maybe_full <= do_enq;
    end
  end
endmodule

module Queue_1(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits
);

  wire[63:0] T0;
  reg [63:0] ram [1:0];
  wire[63:0] T1;
  wire do_enq;
  reg  R2;
  wire T3;
  wire T4;
  wire T5;
  reg  R6;
  wire T7;
  wire T8;
  wire T9;
  wire do_deq;
  wire T10;
  wire empty;
  wire T11;
  reg  maybe_full;
  wire T12;
  wire T13;
  wire T14;
  wire ptr_match;
  wire T15;
  wire full;

`ifndef SYNTHESIS
  integer initvar;
  initial begin
    #0.002;
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {2{$random}};
    R2 = {1{$random}};
    R6 = {1{$random}};
    maybe_full = {1{$random}};
  end
`endif

  assign io_deq_bits = T0;
  assign T0 = ram[R6];
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T3 = reset ? 1'h0 : T4;
  assign T4 = do_enq ? T5 : R2;
  assign T5 = R2 + 1'h1;
  assign T7 = reset ? 1'h0 : T8;
  assign T8 = do_deq ? T9 : R6;
  assign T9 = R6 + 1'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign io_deq_valid = T10;
  assign T10 = empty ^ 1'h1;
  assign empty = ptr_match & T11;
  assign T11 = maybe_full ^ 1'h1;
  assign T12 = reset ? 1'h0 : T13;
  assign T13 = T14 ? do_enq : maybe_full;
  assign T14 = do_enq != do_deq;
  assign ptr_match = R2 == R6;
  assign io_enq_ready = T15;
  assign T15 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if (do_enq)
      ram[R2] <= io_enq_bits;
    if(reset) begin
      R2 <= 1'h0;
    end else if(do_enq) begin
      R2 <= T5;
    end
    if(reset) begin
      R6 <= 1'h0;
    end else if(do_deq) begin
      R6 <= T9;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T14) begin
      maybe_full <= do_enq;
    end
  end
endmodule

module Queue_2(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits_rw,
    input [63:0] io_enq_bits_addr,
    input [63:0] io_enq_bits_data,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits_rw,
    output[63:0] io_deq_bits_addr,
    output[63:0] io_deq_bits_data
);

  wire[63:0] T0;
  wire[128:0] T1;
  wire[127:0] T2;
  wire[63:0] T3;
  wire[128:0] T4;
  reg [128:0] ram [1:0];
  wire[128:0] T5;
  wire[128:0] T6;
  wire[128:0] T7;
  wire[127:0] T8;
  wire do_enq;
  reg  R9;
  wire T10;
  wire T11;
  wire T12;
  reg  R13;
  wire T14;
  wire T15;
  wire T16;
  wire do_deq;
  wire[63:0] T17;
  wire T18;
  wire[63:0] T19;
  wire T20;
  wire T21;
  wire empty;
  wire T22;
  reg  maybe_full;
  wire T23;
  wire T24;
  wire T25;
  wire ptr_match;
  wire T26;
  wire full;

`ifndef SYNTHESIS
  integer initvar;
  initial begin
    #0.002;
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {5{$random}};
    R9 = {1{$random}};
    R13 = {1{$random}};
    maybe_full = {1{$random}};
  end
`endif

  assign io_deq_bits_data = T0;
  assign T0 = T1[6'h3f:1'h0];
  assign T1 = {T18, T2};
  assign T2 = {T17, T3};
  assign T3 = T4[6'h3f:1'h0];
  assign T4 = ram[R13];
  assign T6 = T7;
  assign T7 = {io_enq_bits_rw, T8};
  assign T8 = {io_enq_bits_addr, io_enq_bits_data};
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T10 = reset ? 1'h0 : T11;
  assign T11 = do_enq ? T12 : R9;
  assign T12 = R9 + 1'h1;
  assign T14 = reset ? 1'h0 : T15;
  assign T15 = do_deq ? T16 : R13;
  assign T16 = R13 + 1'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T17 = T4[7'h7f:7'h40];
  assign T18 = T4[8'h80:8'h80];
  assign io_deq_bits_addr = T19;
  assign T19 = T1[7'h7f:7'h40];
  assign io_deq_bits_rw = T20;
  assign T20 = T1[8'h80:8'h80];
  assign io_deq_valid = T21;
  assign T21 = empty ^ 1'h1;
  assign empty = ptr_match & T22;
  assign T22 = maybe_full ^ 1'h1;
  assign T23 = reset ? 1'h0 : T24;
  assign T24 = T25 ? do_enq : maybe_full;
  assign T25 = do_enq != do_deq;
  assign ptr_match = R9 == R13;
  assign io_enq_ready = T26;
  assign T26 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if (do_enq)
      ram[R9] <= T6;
    if(reset) begin
      R9 <= 1'h0;
    end else if(do_enq) begin
      R9 <= T12;
    end
    if(reset) begin
      R13 <= 1'h0;
    end else if(do_deq) begin
      R13 <= T16;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T25) begin
      maybe_full <= do_enq;
    end
  end
endmodule

module Top(input clk, input reset,
    output io_debug_stats_pcr,
    input  io_htif_reset,
    output io_htif_debug_stats_pcr,
    input  io_htif_id,
    output io_htif_pcr_req_ready,
    input  io_htif_pcr_req_valid,
    input  io_htif_pcr_req_bits_rw,
    input [11:0] io_htif_pcr_req_bits_addr,
    input [63:0] io_htif_pcr_req_bits_data,
    input  io_htif_pcr_rep_ready,
    output io_htif_pcr_rep_valid,
    output[63:0] io_htif_pcr_rep_bits,
    input  io_htif_ipi_req_ready,
    output io_htif_ipi_req_valid,
    output io_htif_ipi_req_bits,
    output io_htif_ipi_rep_ready,
    input  io_htif_ipi_rep_valid,
    input  io_htif_ipi_rep_bits,
    output io_htif_mem_req_ready,
    input  io_htif_mem_req_valid,
    input  io_htif_mem_req_bits_rw,
    input [63:0] io_htif_mem_req_bits_addr,
    input [63:0] io_htif_mem_req_bits_data,
    output io_htif_mem_rep_valid,
    output[63:0] io_htif_mem_rep_bits
);

  wire tile_io_host_mem_req_ready;
  wire[63:0] tile_io_host_pcr_rep_bits;
  wire tile_io_host_pcr_rep_valid;
  wire tile_io_host_pcr_req_ready;
  wire[63:0] Queue_2_io_deq_bits_data;
  wire[63:0] Queue_2_io_deq_bits_addr;
  wire Queue_2_io_deq_bits_rw;
  wire Queue_2_io_deq_valid;
  wire Queue_1_io_enq_ready;
  wire[63:0] Queue_0_io_deq_bits_data;
  wire[11:0] Queue_0_io_deq_bits_addr;
  wire Queue_0_io_deq_bits_rw;
  wire Queue_0_io_deq_valid;
  reg  reset_signal;
  reg  R0;
  wire[63:0] tile_io_host_mem_rep_bits;
  wire tile_io_host_mem_rep_valid;
  wire Queue_2_io_enq_ready;
  wire[63:0] Queue_1_io_deq_bits;
  wire Queue_1_io_deq_valid;
  wire Queue_0_io_enq_ready;
  reg  R1;
  wire tile_io_host_debug_stats_pcr;

`ifndef SYNTHESIS
  integer initvar;
  initial begin
    #0.002;
    reset_signal = {1{$random}};
    R0 = {1{$random}};
    R1 = {1{$random}};
  end
`endif

  assign io_htif_mem_rep_bits = tile_io_host_mem_rep_bits;
  assign io_htif_mem_rep_valid = tile_io_host_mem_rep_valid;
  assign io_htif_mem_req_ready = Queue_2_io_enq_ready;
  assign io_htif_pcr_rep_bits = Queue_1_io_deq_bits;
  assign io_htif_pcr_rep_valid = Queue_1_io_deq_valid;
  assign io_htif_pcr_req_ready = Queue_0_io_enq_ready;
  assign io_debug_stats_pcr = R1;
  SodorTile tile(.clk(clk),
       .io_host_reset( reset_signal ),
       .io_host_debug_stats_pcr( tile_io_host_debug_stats_pcr ),
       .io_host_id( 1'h0 ),
       .io_host_pcr_req_ready( tile_io_host_pcr_req_ready ),
       .io_host_pcr_req_valid( Queue_0_io_deq_valid ),
       .io_host_pcr_req_bits_rw( Queue_0_io_deq_bits_rw ),
       .io_host_pcr_req_bits_addr( Queue_0_io_deq_bits_addr ),
       .io_host_pcr_req_bits_data( Queue_0_io_deq_bits_data ),
       .io_host_pcr_rep_ready( Queue_1_io_enq_ready ),
       .io_host_pcr_rep_valid( tile_io_host_pcr_rep_valid ),
       .io_host_pcr_rep_bits( tile_io_host_pcr_rep_bits ),
       //.io_host_ipi_req_ready(  )
       //.io_host_ipi_req_valid(  )
       //.io_host_ipi_req_bits(  )
       //.io_host_ipi_rep_ready(  )
       //.io_host_ipi_rep_valid(  )
       //.io_host_ipi_rep_bits(  )
       .io_host_mem_req_ready( tile_io_host_mem_req_ready ),
       .io_host_mem_req_valid( Queue_2_io_deq_valid ),
       .io_host_mem_req_bits_rw( Queue_2_io_deq_bits_rw ),
       .io_host_mem_req_bits_addr( Queue_2_io_deq_bits_addr ),
       .io_host_mem_req_bits_data( Queue_2_io_deq_bits_data ),
       .io_host_mem_rep_valid( tile_io_host_mem_rep_valid ),
       .io_host_mem_rep_bits( tile_io_host_mem_rep_bits )
  );
  `ifndef SYNTHESIS
    assign tile.io_host_ipi_req_ready = {1{$random}};
    assign tile.io_host_ipi_rep_valid = {1{$random}};
    assign tile.io_host_ipi_rep_bits = {1{$random}};
  `endif
  Queue_0 Queue_0(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_0_io_enq_ready ),
       .io_enq_valid( io_htif_pcr_req_valid ),
       .io_enq_bits_rw( io_htif_pcr_req_bits_rw ),
       .io_enq_bits_addr( io_htif_pcr_req_bits_addr ),
       .io_enq_bits_data( io_htif_pcr_req_bits_data ),
       .io_deq_ready( tile_io_host_pcr_req_ready ),
       .io_deq_valid( Queue_0_io_deq_valid ),
       .io_deq_bits_rw( Queue_0_io_deq_bits_rw ),
       .io_deq_bits_addr( Queue_0_io_deq_bits_addr ),
       .io_deq_bits_data( Queue_0_io_deq_bits_data )
  );
  Queue_1 Queue_1(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_1_io_enq_ready ),
       .io_enq_valid( tile_io_host_pcr_rep_valid ),
       .io_enq_bits( tile_io_host_pcr_rep_bits ),
       .io_deq_ready( io_htif_pcr_rep_ready ),
       .io_deq_valid( Queue_1_io_deq_valid ),
       .io_deq_bits( Queue_1_io_deq_bits )
  );
  Queue_2 Queue_2(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_2_io_enq_ready ),
       .io_enq_valid( io_htif_mem_req_valid ),
       .io_enq_bits_rw( io_htif_mem_req_bits_rw ),
       .io_enq_bits_addr( io_htif_mem_req_bits_addr ),
       .io_enq_bits_data( io_htif_mem_req_bits_data ),
       .io_deq_ready( tile_io_host_mem_req_ready ),
       .io_deq_valid( Queue_2_io_deq_valid ),
       .io_deq_bits_rw( Queue_2_io_deq_bits_rw ),
       .io_deq_bits_addr( Queue_2_io_deq_bits_addr ),
       .io_deq_bits_data( Queue_2_io_deq_bits_data )
  );

  always @(posedge clk) begin
    reset_signal <= R0;
    R0 <= io_htif_reset;
    R1 <= tile_io_host_debug_stats_pcr;
  end
endmodule

