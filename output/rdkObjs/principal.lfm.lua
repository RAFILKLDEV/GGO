require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_GGO_Ficha()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("GGO_Ficha");
    obj:setTitle("GGO_Ficha");
    obj:setDataType("GGO_Ficha");
    obj:setFormType("sheetTemplate");

    obj.modal = GUI.fromHandle(_obj_newObject("popup"));
    obj.modal:setParent(obj);
    obj.modal:setName("modal");
    obj.modal:setAlign("client");
    obj.modal:setBackOpacity(0.3);
    obj.modal:setMargins({left=70,right=70,top=70,bottom=70});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.modal);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(30);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setPadding({top=5,bottom=5});
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(100);
    obj.button1:setText("Todos");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setAlign("left");
    obj.button2:setWidth(100);
    obj.button2:setText("Classe");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setAlign("left");
    obj.button3:setWidth(100);
    obj.button3:setText("Geral");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setAlign("left");
    obj.button4:setWidth(100);
    obj.button4:setText("Ação");
    obj.button4:setName("button4");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(250);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Gun Gale Online - RPG");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setAlign("left");
    obj.label2:setWidth(60);
    obj.label2:setText("Pesquisar");
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(100);
    obj.edit1:setName("edit1");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setAlign("left");
    obj.button5:setText(">");
    obj.button5:setName("button5");

    obj.modalBar = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.modalBar:setParent(obj.modal);
    obj.modalBar:setAlign("left");
    obj.modalBar:setWidth(300);
    obj.modalBar:setColor("#3A3A3A");
    obj.modalBar:setName("modalBar");
    obj.modalBar:setPadding({left=5,right=5,top=5,bottom=5});

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.modal);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setColor("#2E2E2E");
    obj.rectangle2:setWidth(800);
    obj.rectangle2:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle2:setName("rectangle2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setHeight(30);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle3);
    obj.label3:setAlign("left");
    obj.label3:setWidth(100);
    obj.label3:setField("nomeTalento");
    obj.label3:setName("label3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setAlign("right");
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setColor("orange");
    obj.rectangle4:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle4:setName("rectangle4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle4);
    obj.label4:setAlign("client");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("levelTalento");
    obj.label4:setName("label4");

    obj.tracosBar = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.tracosBar:setParent(obj.rectangle2);
    obj.tracosBar:setAlign("top");
    obj.tracosBar:setHeight(30);
    obj.tracosBar:setColor("#3A3A3A");
    obj.tracosBar:setName("tracosBar");
    obj.tracosBar:setPadding({left=5,right=5,top=5,bottom=5});

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle2);
    obj.rectangle5:setAlign("top");
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setColor("#3A3A3A");
    obj.rectangle5:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle5:setMargins({top=10});
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle5);
    obj.label5:setAlign("client");
    obj.label5:setText("Pré-requisito:");
    lfm_setPropAsString(obj.label5, "fontStyle", "bold");
    obj.label5:setName("label5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle2);
    obj.rectangle6:setAlign("top");
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setColor("#3A3A3A");
    obj.rectangle6:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle6);
    obj.label6:setAlign("client");
    obj.label6:setField("requisitoTalento");
    obj.label6:setName("label6");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle2);
    obj.rectangle7:setAlign("top");
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setColor("#3A3A3A");
    obj.rectangle7:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle7:setMargins({top=10});
    obj.rectangle7:setName("rectangle7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle7);
    obj.label7:setAlign("client");
    obj.label7:setText("Descrição:");
    lfm_setPropAsString(obj.label7, "fontStyle", "bold");
    obj.label7:setName("label7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle2);
    obj.rectangle8:setAlign("top");
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setColor("#3A3A3A");
    obj.rectangle8:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle8:setName("rectangle8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle8);
    obj.label8:setAlign("client");
    obj.label8:setField("descricaoTalento");
    obj.label8:setName("label8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.modal);
    obj.rectangle9:setAlign("bottom");
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setPadding({top=5,bottom=5});
    obj.rectangle9:setName("rectangle9");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle9);
    obj.button6:setAlign("left");
    obj.button6:setWidth(100);
    obj.button6:setText("Aceitar");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle9);
    obj.button7:setAlign("left");
    obj.button7:setWidth(100);
    obj.button7:setText("Cancelar");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle9);
    obj.button8:setAlign("left");
    obj.button8:setWidth(100);
    obj.button8:setText("Limpar");
    obj.button8:setName("button8");

    obj.GGO_Base = GUI.fromHandle(_obj_newObject("form"));
    obj.GGO_Base:setParent(obj);
    obj.GGO_Base:setName("GGO_Base");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.GGO_Base);
    obj.dataLink1:setField("seletorModal");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.GGO_Base);
    obj.dataLink2:setField("level");
    obj.dataLink2:setName("dataLink2");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(1200);
    obj.rectangle10:setColor("blue");
    obj.rectangle10:setPadding({left=7,top=7,right=7,bottom=7});
    obj.rectangle10:setName("rectangle10");

    obj.talentosBar = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.talentosBar:setParent(obj.rectangle10);
    obj.talentosBar:setAlign("left");
    obj.talentosBar:setWidth(300);
    obj.talentosBar:setColor("#1C1C1C");
    obj.talentosBar:setName("talentosBar");
    obj.talentosBar:setMargins({right=5});
    obj.talentosBar:setPadding({left=5,top=5,right=5,bottom=5});

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.talentosBar);
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setHeight(60);
    obj.rectangle11:setColor("#2E2E2E");
    obj.rectangle11:setPadding({left=7,top=3,right=3,bottom=3});
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setStrokeColor("#00CFFF");
    obj.rectangle11:setName("rectangle11");

            
            local function click()
            sheet.nomeTalento = talentos[k].apelido
            sheet.levelTalento = 5
            sheet.descricaoTalento = talentos[k].descricao
            end
        


    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle11);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setColor("#3A3A3A");
    obj.rectangle12:setMargins({left=5,top=5,right=5,bottom=5});
    obj.rectangle12:setName("rectangle12");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle11);
    obj.layout1:setAlign("left");
    obj.layout1:setMargins({left=5});
    obj.layout1:setWidth(300);
    obj.layout1:setName("layout1");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setAlign("top");
    obj.label9:setHeight(20);
    obj.label9:setText("Classe");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setAlign("top");
    obj.label10:setHeight(35);
    obj.label10:setFontSize(26);
    obj.label10:setText("Especialista");
    obj.label10:setName("label10");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.rectangle10);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(450);
    obj.rectangle13:setMargins({right=5});
    obj.rectangle13:setPadding({left=5,top=5,right=5,bottom=5});
    obj.rectangle13:setName("rectangle13");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle13);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(50);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(260);
    obj.layout3:setName("layout3");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout3);
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setHeight(45);
    obj.rectangle14:setColor("green");
    obj.rectangle14:setPadding({left=7,right=3});
    obj.rectangle14:setName("rectangle14");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle14);
    obj.layout4:setAlign("left");
    obj.layout4:setMargins({left=5});
    obj.layout4:setWidth(235);
    obj.layout4:setName("layout4");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout4);
    obj.label11:setAlign("top");
    obj.label11:setHeight(15);
    obj.label11:setFontSize(10);
    obj.label11:setText("Classe");
    obj.label11:setName("label11");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout4);
    obj.rectangle15:setAlign("top");
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("#0000001A");
    obj.rectangle15:setName("rectangle15");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle15);
    obj.edit2:setAlign("client");
    obj.edit2:setFontSize(14);
    obj.edit2:setTransparent(true);
    obj.edit2:setText("Especialista");
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("left");
    obj.layout5:setMargins({left=5});
    obj.layout5:setWidth(50);
    obj.layout5:setName("layout5");

    obj.teste = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.teste:setParent(obj.layout5);
    obj.teste:setAlign("top");
    obj.teste:setHeight(45);
    obj.teste:setColor("green");
    obj.teste:setName("teste");
    obj.teste:setPadding({left=1,right=1});

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.teste);
    obj.layout6:setAlign("left");
    obj.layout6:setMargins({left=5});
    obj.layout6:setWidth(40);
    obj.layout6:setName("layout6");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout6);
    obj.label12:setAlign("top");
    obj.label12:setHeight(15);
    obj.label12:setFontSize(10);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setField("level");
    obj.label12:setName("label12");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout6);
    obj.rectangle16:setAlign("top");
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("#0000001A");
    obj.rectangle16:setName("rectangle16");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle16);
    obj.edit3:setAlign("client");
    obj.edit3:setFontSize(14);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setTransparent(true);
    obj.edit3:setText("2");
    obj.edit3:setName("edit3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("left");
    obj.layout7:setMargins({left=5});
    obj.layout7:setWidth(50);
    obj.layout7:setName("layout7");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout7);
    obj.rectangle17:setAlign("top");
    obj.rectangle17:setHeight(45);
    obj.rectangle17:setColor("green");
    obj.rectangle17:setPadding({left=1,right=1});
    obj.rectangle17:setName("rectangle17");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle17);
    obj.layout8:setAlign("left");
    obj.layout8:setMargins({left=5});
    obj.layout8:setWidth(40);
    obj.layout8:setName("layout8");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout8);
    obj.label13:setAlign("top");
    obj.label13:setHeight(15);
    obj.label13:setFontSize(10);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("XP");
    obj.label13:setName("label13");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout8);
    obj.rectangle18:setAlign("top");
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("#0000001A");
    obj.rectangle18:setName("rectangle18");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle18);
    obj.edit4:setAlign("client");
    obj.edit4:setFontSize(14);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setTransparent(true);
    obj.edit4:setText("2");
    obj.edit4:setName("edit4");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle13);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(50);
    obj.layout9:setName("layout9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(80);
    obj.layout10:setName("layout10");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout10);
    obj.rectangle19:setAlign("top");
    obj.rectangle19:setHeight(45);
    obj.rectangle19:setColor("green");
    obj.rectangle19:setPadding({left=1,right=1});
    obj.rectangle19:setName("rectangle19");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle19);
    obj.layout11:setAlign("left");
    obj.layout11:setMargins({left=5});
    obj.layout11:setWidth(70);
    obj.layout11:setName("layout11");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setAlign("top");
    obj.label14:setHeight(15);
    obj.label14:setFontSize(10);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("Deslocamento");
    obj.label14:setName("label14");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout11);
    obj.rectangle20:setAlign("top");
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("#0000001A");
    obj.rectangle20:setName("rectangle20");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle20);
    obj.edit5:setAlign("client");
    obj.edit5:setFontSize(14);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setTransparent(true);
    obj.edit5:setText("7.5 m");
    obj.edit5:setName("edit5");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout9);
    obj.layout12:setAlign("left");
    obj.layout12:setMargins({left=5});
    obj.layout12:setWidth(50);
    obj.layout12:setName("layout12");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout12);
    obj.rectangle21:setAlign("top");
    obj.rectangle21:setHeight(45);
    obj.rectangle21:setColor("darkRed");
    obj.rectangle21:setPadding({left=1,right=1});
    obj.rectangle21:setName("rectangle21");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle21);
    obj.layout13:setAlign("left");
    obj.layout13:setMargins({left=5});
    obj.layout13:setWidth(40);
    obj.layout13:setName("layout13");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setAlign("top");
    obj.label15:setHeight(15);
    obj.label15:setFontSize(10);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("FOR");
    obj.label15:setName("label15");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout13);
    obj.rectangle22:setAlign("top");
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("#0000001A");
    obj.rectangle22:setName("rectangle22");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle22);
    obj.edit6:setAlign("client");
    obj.edit6:setFontSize(14);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setTransparent(true);
    obj.edit6:setText("2");
    obj.edit6:setName("edit6");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout9);
    obj.layout14:setAlign("left");
    obj.layout14:setMargins({left=5});
    obj.layout14:setWidth(50);
    obj.layout14:setName("layout14");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout14);
    obj.rectangle23:setAlign("top");
    obj.rectangle23:setHeight(45);
    obj.rectangle23:setColor("darkRed");
    obj.rectangle23:setPadding({left=1,right=1});
    obj.rectangle23:setName("rectangle23");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle23);
    obj.layout15:setAlign("left");
    obj.layout15:setMargins({left=5});
    obj.layout15:setWidth(40);
    obj.layout15:setName("layout15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout15);
    obj.label16:setAlign("top");
    obj.label16:setHeight(15);
    obj.label16:setFontSize(10);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("DES");
    obj.label16:setName("label16");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout15);
    obj.rectangle24:setAlign("top");
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("#0000001A");
    obj.rectangle24:setName("rectangle24");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle24);
    obj.edit7:setAlign("client");
    obj.edit7:setFontSize(14);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setTransparent(true);
    obj.edit7:setText("2");
    obj.edit7:setName("edit7");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout9);
    obj.layout16:setAlign("left");
    obj.layout16:setMargins({left=5});
    obj.layout16:setWidth(50);
    obj.layout16:setName("layout16");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout16);
    obj.rectangle25:setAlign("top");
    obj.rectangle25:setHeight(45);
    obj.rectangle25:setColor("darkRed");
    obj.rectangle25:setPadding({left=1,right=1});
    obj.rectangle25:setName("rectangle25");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle25);
    obj.layout17:setAlign("left");
    obj.layout17:setMargins({left=5});
    obj.layout17:setWidth(40);
    obj.layout17:setName("layout17");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout17);
    obj.label17:setAlign("top");
    obj.label17:setHeight(15);
    obj.label17:setFontSize(10);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setText("CON");
    obj.label17:setName("label17");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout17);
    obj.rectangle26:setAlign("top");
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("#0000001A");
    obj.rectangle26:setName("rectangle26");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle26);
    obj.edit8:setAlign("client");
    obj.edit8:setFontSize(14);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setTransparent(true);
    obj.edit8:setText("2");
    obj.edit8:setName("edit8");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout9);
    obj.layout18:setAlign("left");
    obj.layout18:setMargins({left=5});
    obj.layout18:setWidth(50);
    obj.layout18:setName("layout18");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout18);
    obj.rectangle27:setAlign("top");
    obj.rectangle27:setHeight(45);
    obj.rectangle27:setColor("darkRed");
    obj.rectangle27:setPadding({left=1,right=1});
    obj.rectangle27:setName("rectangle27");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle27);
    obj.layout19:setAlign("left");
    obj.layout19:setMargins({left=5});
    obj.layout19:setWidth(40);
    obj.layout19:setName("layout19");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout19);
    obj.label18:setAlign("top");
    obj.label18:setHeight(15);
    obj.label18:setFontSize(10);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setText("INT");
    obj.label18:setName("label18");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout19);
    obj.rectangle28:setAlign("top");
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("#0000001A");
    obj.rectangle28:setName("rectangle28");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle28);
    obj.edit9:setAlign("client");
    obj.edit9:setFontSize(14);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setTransparent(true);
    obj.edit9:setText("2");
    obj.edit9:setName("edit9");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout9);
    obj.layout20:setAlign("left");
    obj.layout20:setMargins({left=5});
    obj.layout20:setWidth(50);
    obj.layout20:setName("layout20");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout20);
    obj.rectangle29:setAlign("top");
    obj.rectangle29:setHeight(45);
    obj.rectangle29:setColor("darkRed");
    obj.rectangle29:setPadding({left=1,right=1});
    obj.rectangle29:setName("rectangle29");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle29);
    obj.layout21:setAlign("left");
    obj.layout21:setMargins({left=5});
    obj.layout21:setWidth(40);
    obj.layout21:setName("layout21");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout21);
    obj.label19:setAlign("top");
    obj.label19:setHeight(15);
    obj.label19:setFontSize(10);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("SAB");
    obj.label19:setName("label19");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout21);
    obj.rectangle30:setAlign("top");
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("#0000001A");
    obj.rectangle30:setName("rectangle30");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle30);
    obj.edit10:setAlign("client");
    obj.edit10:setFontSize(14);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setTransparent(true);
    obj.edit10:setText("2");
    obj.edit10:setName("edit10");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout9);
    obj.layout22:setAlign("left");
    obj.layout22:setMargins({left=5});
    obj.layout22:setWidth(50);
    obj.layout22:setName("layout22");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout22);
    obj.rectangle31:setAlign("top");
    obj.rectangle31:setHeight(45);
    obj.rectangle31:setColor("darkRed");
    obj.rectangle31:setPadding({left=1,right=1});
    obj.rectangle31:setName("rectangle31");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle31);
    obj.layout23:setAlign("left");
    obj.layout23:setMargins({left=5});
    obj.layout23:setWidth(40);
    obj.layout23:setName("layout23");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout23);
    obj.label20:setAlign("top");
    obj.label20:setHeight(15);
    obj.label20:setFontSize(10);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setText("CAR");
    obj.label20:setName("label20");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout23);
    obj.rectangle32:setAlign("top");
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("#0000001A");
    obj.rectangle32:setName("rectangle32");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle32);
    obj.edit11:setAlign("client");
    obj.edit11:setFontSize(14);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setTransparent(true);
    obj.edit11:setText("2");
    obj.edit11:setName("edit11");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle13);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(55);
    obj.layout24:setName("layout24");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout24);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(80);
    obj.layout25:setName("layout25");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout25);
    obj.rectangle33:setAlign("top");
    obj.rectangle33:setHeight(50);
    obj.rectangle33:setColor("green");
    obj.rectangle33:setPadding({left=1,right=1});
    obj.rectangle33:setName("rectangle33");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle33);
    obj.layout26:setAlign("left");
    obj.layout26:setMargins({left=5});
    obj.layout26:setWidth(70);
    obj.layout26:setName("layout26");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout26);
    obj.label21:setAlign("top");
    obj.label21:setHeight(20);
    obj.label21:setFontSize(12);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setText("CA");
    obj.label21:setName("label21");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout26);
    obj.rectangle34:setAlign("top");
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("#0000001A");
    obj.rectangle34:setName("rectangle34");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle34);
    obj.edit12:setAlign("client");
    obj.edit12:setFontSize(14);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setTransparent(true);
    obj.edit12:setText("18");
    obj.edit12:setName("edit12");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout24);
    obj.layout27:setAlign("left");
    obj.layout27:setMargins({left=5});
    obj.layout27:setWidth(150);
    obj.layout27:setName("layout27");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout27);
    obj.rectangle35:setAlign("top");
    obj.rectangle35:setHeight(50);
    obj.rectangle35:setColor("gray");
    obj.rectangle35:setPadding({left=1,right=1});
    obj.rectangle35:setName("rectangle35");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.rectangle35);
    obj.progressBar1:setAlign("top");
    obj.progressBar1:setHeight(15);
    obj.progressBar1:setColor("red");
    obj.progressBar1:setMargins({top=5,bottom=5});
    obj.progressBar1:setPosition(50);
    obj.progressBar1:setMax(100);
    obj.progressBar1:setName("progressBar1");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.rectangle35);
    obj.progressBar2:setAlign("top");
    obj.progressBar2:setHeight(15);
    obj.progressBar2:setColor("green");
    obj.progressBar2:setMargins({top=5,bottom=5});
    obj.progressBar2:setPosition(50);
    obj.progressBar2:setMax(100);
    obj.progressBar2:setName("progressBar2");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle13);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(150);
    obj.layout28:setName("layout28");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout28);
    obj.rectangle36:setAlign("top");
    obj.rectangle36:setHeight(30);
    obj.rectangle36:setColor("gray");
    obj.rectangle36:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle36:setName("rectangle36");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle36);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(18);
    obj.layout29:setName("layout29");

    obj.path1 = GUI.fromHandle(_obj_newObject("path"));
    obj.path1:setParent(obj.layout29);
    obj.path1:setAlign("client");
    obj.path1:setMode("fit");
    obj.path1:setColor("darkRed");
    obj.path1:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path1:setName("path1");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout29);
    obj.label22:setAlign("client");
    obj.label22:setText("M");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontSize(10);
    lfm_setPropAsString(obj.label22, "fontStyle", "bold");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle36);
    obj.label23:setAlign("left");
    obj.label23:setText("+11");
    obj.label23:setWidth(25);
    obj.label23:setMargins({left=5});
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle36);
    obj.label24:setAlign("left");
    obj.label24:setText("Percepção");
    obj.label24:setWidth(70);
    obj.label24:setMargins({left=5});
    obj.label24:setName("label24");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout28);
    obj.rectangle37:setAlign("top");
    obj.rectangle37:setHeight(30);
    obj.rectangle37:setColor("gray");
    obj.rectangle37:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle37:setMargins({bottom=10});
    obj.rectangle37:setName("rectangle37");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle37);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(18);
    obj.layout30:setName("layout30");

    obj.path2 = GUI.fromHandle(_obj_newObject("path"));
    obj.path2:setParent(obj.layout30);
    obj.path2:setAlign("client");
    obj.path2:setMode("fit");
    obj.path2:setColor("darkRed");
    obj.path2:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path2:setName("path2");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout30);
    obj.label25:setAlign("client");
    obj.label25:setText("M");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontSize(10);
    lfm_setPropAsString(obj.label25, "fontStyle", "bold");
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle37);
    obj.label26:setAlign("left");
    obj.label26:setText("+0");
    obj.label26:setWidth(25);
    obj.label26:setMargins({left=5});
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle37);
    obj.label27:setAlign("left");
    obj.label27:setText("Iniciativa");
    obj.label27:setWidth(70);
    obj.label27:setMargins({left=5});
    obj.label27:setName("label27");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout28);
    obj.rectangle38:setAlign("top");
    obj.rectangle38:setHeight(30);
    obj.rectangle38:setColor("gray");
    obj.rectangle38:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle38:setName("rectangle38");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle38);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(18);
    obj.layout31:setName("layout31");

    obj.path3 = GUI.fromHandle(_obj_newObject("path"));
    obj.path3:setParent(obj.layout31);
    obj.path3:setAlign("client");
    obj.path3:setMode("fit");
    obj.path3:setColor("darkRed");
    obj.path3:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path3:setName("path3");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout31);
    obj.label28:setAlign("client");
    obj.label28:setText("M");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setFontSize(10);
    lfm_setPropAsString(obj.label28, "fontStyle", "bold");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle38);
    obj.label29:setAlign("left");
    obj.label29:setText("+11");
    obj.label29:setWidth(25);
    obj.label29:setMargins({left=5});
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle38);
    obj.label30:setAlign("left");
    obj.label30:setText("Fortitude");
    obj.label30:setWidth(70);
    obj.label30:setMargins({left=5});
    obj.label30:setName("label30");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout28);
    obj.rectangle39:setAlign("top");
    obj.rectangle39:setHeight(30);
    obj.rectangle39:setColor("gray");
    obj.rectangle39:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle39:setName("rectangle39");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle39);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(18);
    obj.layout32:setName("layout32");

    obj.path4 = GUI.fromHandle(_obj_newObject("path"));
    obj.path4:setParent(obj.layout32);
    obj.path4:setAlign("client");
    obj.path4:setMode("fit");
    obj.path4:setColor("darkRed");
    obj.path4:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path4:setName("path4");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout32);
    obj.label31:setAlign("client");
    obj.label31:setText("M");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setFontSize(10);
    lfm_setPropAsString(obj.label31, "fontStyle", "bold");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle39);
    obj.label32:setAlign("left");
    obj.label32:setText("+11");
    obj.label32:setWidth(25);
    obj.label32:setMargins({left=5});
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle39);
    obj.label33:setAlign("left");
    obj.label33:setText("Reflexo");
    obj.label33:setWidth(70);
    obj.label33:setMargins({left=5});
    obj.label33:setName("label33");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout28);
    obj.rectangle40:setAlign("top");
    obj.rectangle40:setHeight(30);
    obj.rectangle40:setColor("gray");
    obj.rectangle40:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle40:setMargins({bottom=10});
    obj.rectangle40:setName("rectangle40");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle40);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(18);
    obj.layout33:setName("layout33");

    obj.path5 = GUI.fromHandle(_obj_newObject("path"));
    obj.path5:setParent(obj.layout33);
    obj.path5:setAlign("client");
    obj.path5:setMode("fit");
    obj.path5:setColor("darkRed");
    obj.path5:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path5:setName("path5");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout33);
    obj.label34:setAlign("client");
    obj.label34:setText("M");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setFontSize(10);
    lfm_setPropAsString(obj.label34, "fontStyle", "bold");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle40);
    obj.label35:setAlign("left");
    obj.label35:setText("+0");
    obj.label35:setWidth(25);
    obj.label35:setMargins({left=5});
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle40);
    obj.label36:setAlign("left");
    obj.label36:setText("Vontade");
    obj.label36:setWidth(70);
    obj.label36:setMargins({left=5});
    obj.label36:setName("label36");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout28);
    obj.rectangle41:setAlign("top");
    obj.rectangle41:setHeight(30);
    obj.rectangle41:setColor("gray");
    obj.rectangle41:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle41:setName("rectangle41");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle41);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(18);
    obj.layout34:setName("layout34");

    obj.path6 = GUI.fromHandle(_obj_newObject("path"));
    obj.path6:setParent(obj.layout34);
    obj.path6:setAlign("client");
    obj.path6:setMode("fit");
    obj.path6:setColor("darkRed");
    obj.path6:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path6:setName("path6");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout34);
    obj.label37:setAlign("client");
    obj.label37:setText("M");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setFontSize(10);
    lfm_setPropAsString(obj.label37, "fontStyle", "bold");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle41);
    obj.label38:setAlign("left");
    obj.label38:setText("+14");
    obj.label38:setWidth(25);
    obj.label38:setMargins({left=5});
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle41);
    obj.label39:setAlign("left");
    obj.label39:setText("Acrobatics");
    obj.label39:setWidth(70);
    obj.label39:setMargins({left=5});
    obj.label39:setName("label39");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout28);
    obj.rectangle42:setAlign("top");
    obj.rectangle42:setHeight(30);
    obj.rectangle42:setColor("gray");
    obj.rectangle42:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle42:setName("rectangle42");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle42);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(18);
    obj.layout35:setName("layout35");

    obj.path7 = GUI.fromHandle(_obj_newObject("path"));
    obj.path7:setParent(obj.layout35);
    obj.path7:setAlign("client");
    obj.path7:setMode("fit");
    obj.path7:setColor("darkRed");
    obj.path7:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path7:setName("path7");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout35);
    obj.label40:setAlign("client");
    obj.label40:setText("M");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setFontSize(10);
    lfm_setPropAsString(obj.label40, "fontStyle", "bold");
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle42);
    obj.label41:setAlign("left");
    obj.label41:setText("+11");
    obj.label41:setWidth(25);
    obj.label41:setMargins({left=5});
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle42);
    obj.label42:setAlign("left");
    obj.label42:setText("Athletics");
    obj.label42:setWidth(70);
    obj.label42:setMargins({left=5});
    obj.label42:setName("label42");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout28);
    obj.rectangle43:setAlign("top");
    obj.rectangle43:setHeight(30);
    obj.rectangle43:setColor("gray");
    obj.rectangle43:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle43:setName("rectangle43");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle43);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(18);
    obj.layout36:setName("layout36");

    obj.path8 = GUI.fromHandle(_obj_newObject("path"));
    obj.path8:setParent(obj.layout36);
    obj.path8:setAlign("client");
    obj.path8:setMode("fit");
    obj.path8:setColor("darkRed");
    obj.path8:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path8:setName("path8");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout36);
    obj.label43:setAlign("client");
    obj.label43:setText("M");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setFontSize(10);
    lfm_setPropAsString(obj.label43, "fontStyle", "bold");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle43);
    obj.label44:setAlign("left");
    obj.label44:setText("+14");
    obj.label44:setWidth(25);
    obj.label44:setMargins({left=5});
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle43);
    obj.label45:setAlign("left");
    obj.label45:setText("Deception");
    obj.label45:setWidth(70);
    obj.label45:setMargins({left=5});
    obj.label45:setName("label45");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout28);
    obj.rectangle44:setAlign("top");
    obj.rectangle44:setHeight(30);
    obj.rectangle44:setColor("gray");
    obj.rectangle44:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle44:setName("rectangle44");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle44);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(18);
    obj.layout37:setName("layout37");

    obj.path9 = GUI.fromHandle(_obj_newObject("path"));
    obj.path9:setParent(obj.layout37);
    obj.path9:setAlign("client");
    obj.path9:setMode("fit");
    obj.path9:setColor("darkRed");
    obj.path9:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path9:setName("path9");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout37);
    obj.label46:setAlign("client");
    obj.label46:setText("M");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setFontSize(10);
    lfm_setPropAsString(obj.label46, "fontStyle", "bold");
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle44);
    obj.label47:setAlign("left");
    obj.label47:setText("+12");
    obj.label47:setWidth(25);
    obj.label47:setMargins({left=5});
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle44);
    obj.label48:setAlign("left");
    obj.label48:setText("Diplomacy");
    obj.label48:setWidth(70);
    obj.label48:setMargins({left=5});
    obj.label48:setName("label48");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout28);
    obj.rectangle45:setAlign("top");
    obj.rectangle45:setHeight(30);
    obj.rectangle45:setColor("gray");
    obj.rectangle45:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle45:setName("rectangle45");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle45);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(18);
    obj.layout38:setName("layout38");

    obj.path10 = GUI.fromHandle(_obj_newObject("path"));
    obj.path10:setParent(obj.layout38);
    obj.path10:setAlign("client");
    obj.path10:setMode("fit");
    obj.path10:setColor("darkRed");
    obj.path10:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path10:setName("path10");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout38);
    obj.label49:setAlign("client");
    obj.label49:setText("M");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setFontSize(10);
    lfm_setPropAsString(obj.label49, "fontStyle", "bold");
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle45);
    obj.label50:setAlign("left");
    obj.label50:setText("+12");
    obj.label50:setWidth(25);
    obj.label50:setMargins({left=5});
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle45);
    obj.label51:setAlign("left");
    obj.label51:setText("Intimidation");
    obj.label51:setWidth(70);
    obj.label51:setMargins({left=5});
    obj.label51:setName("label51");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout28);
    obj.rectangle46:setAlign("top");
    obj.rectangle46:setHeight(30);
    obj.rectangle46:setColor("gray");
    obj.rectangle46:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle46:setName("rectangle46");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle46);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(18);
    obj.layout39:setName("layout39");

    obj.path11 = GUI.fromHandle(_obj_newObject("path"));
    obj.path11:setParent(obj.layout39);
    obj.path11:setAlign("client");
    obj.path11:setMode("fit");
    obj.path11:setColor("darkRed");
    obj.path11:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path11:setName("path11");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout39);
    obj.label52:setAlign("client");
    obj.label52:setText("M");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setFontSize(10);
    lfm_setPropAsString(obj.label52, "fontStyle", "bold");
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle46);
    obj.label53:setAlign("left");
    obj.label53:setText("+12");
    obj.label53:setWidth(25);
    obj.label53:setMargins({left=5});
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle46);
    obj.label54:setAlign("left");
    obj.label54:setText("Furtividade");
    obj.label54:setWidth(70);
    obj.label54:setMargins({left=5});
    obj.label54:setName("label54");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout28);
    obj.rectangle47:setAlign("top");
    obj.rectangle47:setHeight(30);
    obj.rectangle47:setColor("gray");
    obj.rectangle47:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle47:setName("rectangle47");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle47);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(18);
    obj.layout40:setName("layout40");

    obj.path12 = GUI.fromHandle(_obj_newObject("path"));
    obj.path12:setParent(obj.layout40);
    obj.path12:setAlign("client");
    obj.path12:setMode("fit");
    obj.path12:setColor("darkRed");
    obj.path12:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path12:setName("path12");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout40);
    obj.label55:setAlign("client");
    obj.label55:setText("M");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setFontSize(10);
    lfm_setPropAsString(obj.label55, "fontStyle", "bold");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle47);
    obj.label56:setAlign("left");
    obj.label56:setText("+12");
    obj.label56:setWidth(25);
    obj.label56:setMargins({left=5});
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle47);
    obj.label57:setAlign("left");
    obj.label57:setText("Sobrevivencia");
    obj.label57:setWidth(70);
    obj.label57:setMargins({left=5});
    obj.label57:setName("label57");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout28);
    obj.rectangle48:setAlign("top");
    obj.rectangle48:setHeight(30);
    obj.rectangle48:setColor("gray");
    obj.rectangle48:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle48:setName("rectangle48");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle48);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(18);
    obj.layout41:setName("layout41");

    obj.path13 = GUI.fromHandle(_obj_newObject("path"));
    obj.path13:setParent(obj.layout41);
    obj.path13:setAlign("client");
    obj.path13:setMode("fit");
    obj.path13:setColor("darkRed");
    obj.path13:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path13:setName("path13");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout41);
    obj.label58:setAlign("client");
    obj.label58:setText("M");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setFontSize(10);
    lfm_setPropAsString(obj.label58, "fontStyle", "bold");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle48);
    obj.label59:setAlign("left");
    obj.label59:setText("+12");
    obj.label59:setWidth(25);
    obj.label59:setMargins({left=5});
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle48);
    obj.label60:setAlign("left");
    obj.label60:setText("Conhecimento");
    obj.label60:setWidth(70);
    obj.label60:setMargins({left=5});
    obj.label60:setName("label60");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout28);
    obj.rectangle49:setAlign("top");
    obj.rectangle49:setHeight(30);
    obj.rectangle49:setColor("gray");
    obj.rectangle49:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle49:setName("rectangle49");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle49);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(18);
    obj.layout42:setName("layout42");

    obj.path14 = GUI.fromHandle(_obj_newObject("path"));
    obj.path14:setParent(obj.layout42);
    obj.path14:setAlign("client");
    obj.path14:setMode("fit");
    obj.path14:setColor("darkRed");
    obj.path14:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path14:setName("path14");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout42);
    obj.label61:setAlign("client");
    obj.label61:setText("M");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setFontSize(10);
    lfm_setPropAsString(obj.label61, "fontStyle", "bold");
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle49);
    obj.label62:setAlign("left");
    obj.label62:setText("+12");
    obj.label62:setWidth(25);
    obj.label62:setMargins({left=5});
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle49);
    obj.label63:setAlign("left");
    obj.label63:setText("Guerra");
    obj.label63:setWidth(70);
    obj.label63:setMargins({left=5});
    obj.label63:setName("label63");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.rectangle13);
    obj.rectangle50:setAlign("left");
    obj.rectangle50:setWidth(500);
    obj.rectangle50:setPadding({top=-2,left=3});
    obj.rectangle50:setName("rectangle50");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.rectangle50);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Armas");
    obj.tab1:setHeight(600);
    obj.tab1:setName("tab1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.tab1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setPadding({left=5,top=5});
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setOrientation("horizontal");
    obj.flowLayout1:setName("flowLayout1");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.flowLayout1);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(100);
    obj.layout43:setMargins({left=5});
    obj.layout43:setName("layout43");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout43);
    obj.rectangle51:setAlign("top");
    obj.rectangle51:setHeight(30);
    obj.rectangle51:setColor("gray");
    obj.rectangle51:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle51:setName("rectangle51");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle51);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(18);
    obj.layout44:setName("layout44");

    obj.path15 = GUI.fromHandle(_obj_newObject("path"));
    obj.path15:setParent(obj.layout44);
    obj.path15:setAlign("client");
    obj.path15:setMode("fit");
    obj.path15:setColor("darkRed");
    obj.path15:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path15:setName("path15");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout44);
    obj.label64:setAlign("client");
    obj.label64:setText("M");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setFontSize(10);
    lfm_setPropAsString(obj.label64, "fontStyle", "bold");
    obj.label64:setName("label64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle51);
    obj.label65:setAlign("left");
    obj.label65:setText("Desarmado");
    obj.label65:setWidth(70);
    obj.label65:setMargins({left=5});
    obj.label65:setName("label65");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.flowLayout1);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(95);
    obj.layout45:setMargins({left=5});
    obj.layout45:setName("layout45");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout45);
    obj.rectangle52:setAlign("top");
    obj.rectangle52:setHeight(30);
    obj.rectangle52:setColor("gray");
    obj.rectangle52:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle52:setName("rectangle52");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle52);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(18);
    obj.layout46:setName("layout46");

    obj.path16 = GUI.fromHandle(_obj_newObject("path"));
    obj.path16:setParent(obj.layout46);
    obj.path16:setAlign("client");
    obj.path16:setMode("fit");
    obj.path16:setColor("darkRed");
    obj.path16:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path16:setName("path16");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout46);
    obj.label66:setAlign("client");
    obj.label66:setText("M");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setFontSize(10);
    lfm_setPropAsString(obj.label66, "fontStyle", "bold");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle52);
    obj.label67:setAlign("left");
    obj.label67:setText("Pistolas");
    obj.label67:setWidth(70);
    obj.label67:setMargins({left=5});
    obj.label67:setName("label67");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.flowLayout1);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(105);
    obj.layout47:setMargins({left=5});
    obj.layout47:setName("layout47");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout47);
    obj.rectangle53:setAlign("top");
    obj.rectangle53:setHeight(30);
    obj.rectangle53:setColor("gray");
    obj.rectangle53:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle53:setName("rectangle53");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle53);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(18);
    obj.layout48:setName("layout48");

    obj.path17 = GUI.fromHandle(_obj_newObject("path"));
    obj.path17:setParent(obj.layout48);
    obj.path17:setAlign("client");
    obj.path17:setMode("fit");
    obj.path17:setColor("darkRed");
    obj.path17:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path17:setName("path17");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout48);
    obj.label68:setAlign("client");
    obj.label68:setText("M");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setFontSize(10);
    lfm_setPropAsString(obj.label68, "fontStyle", "bold");
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle53);
    obj.label69:setAlign("left");
    obj.label69:setText("Espingardas");
    obj.label69:setWidth(70);
    obj.label69:setMargins({left=5});
    obj.label69:setName("label69");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.flowLayout1);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(120);
    obj.layout49:setMargins({left=5});
    obj.layout49:setName("layout49");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout49);
    obj.rectangle54:setAlign("top");
    obj.rectangle54:setHeight(30);
    obj.rectangle54:setColor("gray");
    obj.rectangle54:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle54:setName("rectangle54");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle54);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(18);
    obj.layout50:setName("layout50");

    obj.path18 = GUI.fromHandle(_obj_newObject("path"));
    obj.path18:setParent(obj.layout50);
    obj.path18:setAlign("client");
    obj.path18:setMode("fit");
    obj.path18:setColor("darkRed");
    obj.path18:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path18:setName("path18");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout50);
    obj.label70:setAlign("client");
    obj.label70:setText("M");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setFontSize(10);
    lfm_setPropAsString(obj.label70, "fontStyle", "bold");
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle54);
    obj.label71:setAlign("left");
    obj.label71:setText("Metralhadoras");
    obj.label71:setWidth(90);
    obj.label71:setMargins({left=5});
    obj.label71:setName("label71");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.flowLayout1);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(75);
    obj.layout51:setMargins({left=5});
    obj.layout51:setName("layout51");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout51);
    obj.rectangle55:setAlign("top");
    obj.rectangle55:setHeight(30);
    obj.rectangle55:setColor("gray");
    obj.rectangle55:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle55:setName("rectangle55");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle55);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(18);
    obj.layout52:setName("layout52");

    obj.path19 = GUI.fromHandle(_obj_newObject("path"));
    obj.path19:setParent(obj.layout52);
    obj.path19:setAlign("client");
    obj.path19:setMode("fit");
    obj.path19:setColor("darkRed");
    obj.path19:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path19:setName("path19");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout52);
    obj.label72:setAlign("client");
    obj.label72:setText("M");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setFontSize(10);
    lfm_setPropAsString(obj.label72, "fontStyle", "bold");
    obj.label72:setName("label72");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle55);
    obj.label73:setAlign("left");
    obj.label73:setText("Rifles");
    obj.label73:setWidth(70);
    obj.label73:setMargins({left=5});
    obj.label73:setName("label73");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.flowLayout1);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(95);
    obj.layout53:setMargins({left=5});
    obj.layout53:setName("layout53");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout53);
    obj.rectangle56:setAlign("top");
    obj.rectangle56:setHeight(30);
    obj.rectangle56:setColor("gray");
    obj.rectangle56:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle56:setName("rectangle56");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle56);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(18);
    obj.layout54:setName("layout54");

    obj.path20 = GUI.fromHandle(_obj_newObject("path"));
    obj.path20:setParent(obj.layout54);
    obj.path20:setAlign("client");
    obj.path20:setMode("fit");
    obj.path20:setColor("darkRed");
    obj.path20:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");
    obj.path20:setName("path20");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout54);
    obj.label74:setAlign("client");
    obj.label74:setText("M");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setFontSize(10);
    lfm_setPropAsString(obj.label74, "fontStyle", "bold");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle56);
    obj.label75:setAlign("left");
    obj.label75:setText("Explosivos");
    obj.label75:setWidth(70);
    obj.label75:setMargins({left=5});
    obj.label75:setName("label75");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.tab1);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(30);
    obj.layout55:setPadding({left=5,top=5,right=5,bottom=5});
    obj.layout55:setName("layout55");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout55);
    obj.button9:setAlign("top");
    obj.button9:setText("Adicionar Arma");
    obj.button9:setName("button9");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.tab1);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(400);
    obj.layout56:setPadding({left=5,top=5,right=5,bottom=5});
    obj.layout56:setName("layout56");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout56);
    obj.label76:setAlign("top");
    obj.label76:setHeight(20);
    obj.label76:setText("Nome da Arma");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout56);
    obj.image1:setAlign("top");
    obj.image1:setHeight(100);
    obj.image1:setName("image1");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(30);
    obj.layout57:setName("layout57");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout57);
    obj.rectangle57:setAlign("left");
    obj.rectangle57:setWidth(60);
    obj.rectangle57:setColor("darkRed");
    obj.rectangle57:setPadding({left=5,top=5,right=5,bottom=5});
    obj.rectangle57:setName("rectangle57");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle57);
    obj.label77:setAlign("client");
    obj.label77:setText("Rifle");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout57);
    obj.rectangle58:setAlign("left");
    obj.rectangle58:setWidth(60);
    obj.rectangle58:setColor("darkRed");
    obj.rectangle58:setPadding({left=5,top=5,right=5,bottom=5});
    obj.rectangle58:setMargins({left=5});
    obj.rectangle58:setName("rectangle58");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle58);
    obj.label78:setAlign("client");
    obj.label78:setText("Rifle");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj._e_event0 = obj.GGO_Base:addEventListener("onNodeReady",
        function ()
            sheet.seletorModal = ""
                    sheet.modalNode = {}
        end);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
        end);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
        end);

    obj._e_event3 = obj.rectangle11:addEventListener("onClick",
        function (event)
            require("utils.lua");
                        require("gui.lua");
                        local minhaMesa = Firecast.getRoomOf(sheet);
                        local chat = minhaMesa.chat;
                        local xml = NDB.load("classesLista.xml");
                        local arrayTalentos = NDB.getChildNodes(xml);
                        
                        talentos = {} -- new array
                        nomesTalentos = {} -- new array
                        
                        for i = 1, #arrayTalentos, 1 do
                        talentos[i] = xml["f" .. i]
                        nomesTalentos[i] = xml["f" .. i].nome
                        end
                        
                        table.sort(nomesTalentos)
                        
                        local talentosAntigos = self.modalBar:getChildren()
                        
                        -- Remove os talentos antigos da interface
                        for k = 1, #talentosAntigos, 1 do
                        talentosAntigos[k]:destroy()
                        end
                        
                        table.sort(talentos, function(a, b) return a.apelido > b.apelido end)
                        
                        -- Loop para criar os novos talentos
                        
                        for k = 1, #talentos, 1 do
                        -- Passando o valor de k diretamente para a função onClick
                        local container = GUI.newRectangle()
                        container.align = "top"
                        container.height = 30
                        container.color = "black"
                        container.padding = {left=5, right=5, top=5, bottom=5}
                        container.parent = self.modalBar -- substitua pelo pai
                        
                        container.onClick = function()
                        local talentosAntigos = self.modalBar:getChildren()
                        
                        -- Desmarcar talentos antigos
                        for x = 1, #talentosAntigos, 1 do
                        talentosAntigos[x].strokeSize = 0
                        end
                        
                        -- Marcar o talento selecionado
                        container.strokeSize = 1
                        container.strokeColor = "#00CFFF"
                        sheet.nomeTalento = talentos[k].apelido
                        sheet.levelTalento = 5
                        sheet.descricaoTalento = talentos[k].descricao or "Nenhum"
                        sheet.requisitoTalento = talentos[k].requisito or "Nenhum"
                        
                        local tracosBar = self.tracosBar:getChildren()
                        
                        -- Remove os traços antigos
                        for v = 1, #tracosBar, 1 do
                        tracosBar[v]:destroy()
                        end
                        
                        local tracosTalento = totable(talentos[k].tracos)
                        
                        -- Loop para adicionar os traços do talento
                        for j = 1, #tracosTalento, 1 do
                        
                        local text = talentos[k].apelido:gsub("([^%s]+)", "%1 ")
                        local textWidth = math.max(text:len() * 6.8, 60)  -- 60 é o mínimo, ajuste como quiser
                        
                        
                        local containerTraco = GUI.newRectangle()
                        containerTraco.align = "left"
                        containerTraco.color = "darkRed"
                        containerTraco.width = textWidth
                        containerTraco.padding = {left=5, top=5, right=5, bottom=5}
                        containerTraco.margins = {left=5}
                        containerTraco.parent = self.tracosBar
                        
                        local label = GUI.newLabel()
                        label.align = "client"
                        label.text = tracosTalento[j]
                        label.horzTextAlign = "center"
                        label.parent = containerTraco
                        
                        containerTraco["g-dyn-width-txt"] = true
                        end
                        end
                        
                        -- Margens
                        if k <= #talentos then
                        container.margins = {bottom=5}
                        end
                        
                        -- Criar Item Modal
                        local label = GUI.newLabel()
                        label.align = "left"
                        label.width = 100
                        label.text = talentos[k].apelido
                        label.parent = container
                        
                        local levelBox = GUI.newRectangle()
                        levelBox.align = "right"
                        levelBox.width = 30
                        levelBox.color = "orange"
                        levelBox.padding = {left=5, right=5, top=5, bottom=5}
                        levelBox.parent = container
                        
                        local levelLabel = GUI.newLabel()
                        levelLabel.align = "client"
                        levelLabel.g = "col"
                        levelLabel["g-dyn-width-txt"] = true
                        levelLabel.horzTextAlign = "center"
                        levelLabel.text = 1 -- ou algum valor dinâmico
                        levelLabel.parent = levelBox
                        
                        
                        end
                        
                        sheet.seletorModal = "Level1"
                        self.modal:show()
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.GGO_Base ~= nil then self.GGO_Base:destroy(); self.GGO_Base = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.path19 ~= nil then self.path19:destroy(); self.path19 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.path13 ~= nil then self.path13:destroy(); self.path13 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.path16 ~= nil then self.path16:destroy(); self.path16 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.path1 ~= nil then self.path1:destroy(); self.path1 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.path6 ~= nil then self.path6:destroy(); self.path6 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.path18 ~= nil then self.path18:destroy(); self.path18 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.path12 ~= nil then self.path12:destroy(); self.path12 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.path2 ~= nil then self.path2:destroy(); self.path2 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.path7 ~= nil then self.path7:destroy(); self.path7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.path15 ~= nil then self.path15:destroy(); self.path15 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.path3 ~= nil then self.path3:destroy(); self.path3 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.modalBar ~= nil then self.modalBar:destroy(); self.modalBar = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.tracosBar ~= nil then self.tracosBar:destroy(); self.tracosBar = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.path8 ~= nil then self.path8:destroy(); self.path8 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.teste ~= nil then self.teste:destroy(); self.teste = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.path11 ~= nil then self.path11:destroy(); self.path11 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.path14 ~= nil then self.path14:destroy(); self.path14 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.path4 ~= nil then self.path4:destroy(); self.path4 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.modal ~= nil then self.modal:destroy(); self.modal = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.path9 ~= nil then self.path9:destroy(); self.path9 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.path10 ~= nil then self.path10:destroy(); self.path10 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.path17 ~= nil then self.path17:destroy(); self.path17 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.path5 ~= nil then self.path5:destroy(); self.path5 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.path20 ~= nil then self.path20:destroy(); self.path20 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.talentosBar ~= nil then self.talentosBar:destroy(); self.talentosBar = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newGGO_Ficha()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_GGO_Ficha();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _GGO_Ficha = {
    newEditor = newGGO_Ficha, 
    new = newGGO_Ficha, 
    name = "GGO_Ficha", 
    dataType = "GGO_Ficha", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "GGO_Ficha", 
    description=""};

GGO_Ficha = _GGO_Ficha;
Firecast.registrarForm(_GGO_Ficha);
Firecast.registrarDataType(_GGO_Ficha);

return _GGO_Ficha;
