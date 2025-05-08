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



      local function treinamentoValor(tr)

      if tr == "D" then
      return 0
      elseif tr == "T" then
      return 2
      elseif tr == "E" then
      return 4
      elseif tr == "M" then
      return 6
      elseif tr == "L" then
      return 8
      end

      end

      local function coresTreinamento()

      local raridade = {"Destreinado", "Treinado", "Especialista", "Mestre", "Lenda"}

      for i = 1, 14 do

      if sheet["pericia" .. i .. "Tr"] ~= nil then

      if sheet["pericia" .. i .. "Tr"] == "T" then
      self["pericia" .. i].color = "#217a52"
      elseif sheet["pericia" .. i .. "Tr"] == "E" then
      self["pericia" .. i].color = "#236fa1"
      elseif sheet["pericia" .. i .. "Tr"] == "M" then
      self["pericia" .. i].color = "#6e3b84"
      elseif sheet["pericia" .. i .. "Tr"] == "L" then
      self["pericia" .. i].color = "#b58f00"
      else self["pericia" .. i].color = "#555555"
      end
      end

      end

      for i = 1, 8 do

      if sheet["armas" .. i .. "Tr"] ~= nil then

      if sheet["armas" .. i .. "Tr"] == "T" then
      self["armas" .. i].color = "#217a52"
      elseif sheet["armas" .. i .. "Tr"] == "E" then
      self["armas" .. i].color = "#236fa1"
      elseif sheet["armas" .. i .. "Tr"] == "M" then
      self["armas" .. i].color = "#6e3b84"
      elseif sheet["armas" .. i .. "Tr"] == "L" then
      self["armas" .. i].color = "#b58f00"
      else self["armas" .. i].color = "#555555"
      end
      end

      end

      end

      local function calcularTalentos()

      sheet.FOR = 0
      sheet.DES = 0
      sheet.CON = 0
      sheet.INT = 0
      sheet.SAB = 0
      sheet.CAR = 0

      for i = 1, 6 do

      if sheet["level1Attr" .. i] ~= nil then

      if sheet["level1Attr" .. i] == "Força" then
      sheet.FOR = sheet.FOR + 1
      elseif sheet["level1Attr" .. i] == "Destreza" then
      sheet.DES = sheet.DES + 1
      elseif sheet["level1Attr" .. i] == "Constituição" then
      sheet.CON = sheet.CON + 1
      elseif sheet["level1Attr" .. i] == "Inteligência" then
      sheet.INT = sheet.INT + 1
      elseif sheet["level1Attr" .. i] == "Sabedoria" then
      sheet.SAB = sheet.SAB + 1
      elseif sheet["level1Attr" .. i] == "Carisma" then
      sheet.CAR = sheet.CAR + 1
      end

      end

      end

      for i = 1, 20 do

      if sheet.nodes[i] ~= nil then

      if sheet.nodes[i].tipo == "Classe" then

      if sheet.nodes[i].plus ~= ". . ." and sheet.nodes[i].plus ~= nil then

      if sheet.nodes[i].plus == "Força" then
      sheet.FOR = sheet.FOR + 1
      elseif sheet.nodes[i].plus == "Destreza" then
      sheet.DES = sheet.DES + 1
      elseif sheet.nodes[i].plus == "Constituição" then
      sheet.CON = sheet.CON + 1
      elseif sheet.nodes[i].plus == "Inteligência" then
      sheet.INT = sheet.INT + 1
      elseif sheet.nodes[i].plus == "Sabedoria" then
      sheet.SAB = sheet.SAB + 1
      elseif sheet.nodes[i].plus == "Carisma" then
      sheet.CAR = sheet.CAR + 1
      end

      end

      end

      end

      end

      sheet.per_iniciativa = "+" .. (sheet.DES + (treinamentoValor(sheet.pericia1Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia1Tr))

      sheet.per_percepcao = "+" .. (sheet.SAB + (treinamentoValor(sheet.pericia2Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia2Tr))

      sheet.per_fortitude = "+" .. (sheet.CON + (treinamentoValor(sheet.pericia3Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia3Tr))

      sheet.per_reflexo = "+" .. (sheet.DES + (treinamentoValor(sheet.pericia4Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia4Tr))

      sheet.per_vontade = "+" .. (sheet.SAB + (treinamentoValor(sheet.pericia5Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia6Tr))

      sheet.per_acrobacia = "+" .. (sheet.DES + (treinamentoValor(sheet.pericia6Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia6Tr))

      sheet.per_atletismo = "+" .. (sheet.FOR + (treinamentoValor(sheet.pericia7Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia7Tr))

      sheet.per_conhecimento = "+" .. (sheet.INT + (treinamentoValor(sheet.pericia8Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia8Tr))

      sheet.per_diplomacia = "+" .. (sheet.CAR + (treinamentoValor(sheet.pericia9Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia9Tr))

      sheet.per_enganacao = "+" .. (sheet.CAR + (treinamentoValor(sheet.pericia10Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia10Tr))

      sheet.per_furtividade = "+" .. (sheet.DES + (treinamentoValor(sheet.pericia11Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia11Tr))

      sheet.per_guerra = "+" .. (sheet.INT + (treinamentoValor(sheet.pericia12Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia12Tr))

      sheet.per_intimidacao = "+" .. (sheet.CAR + (treinamentoValor(sheet.pericia13Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.pericia13Tr))

      sheet.per_sobrevivencia = "+" .. (sheet.SAB + (treinamentoValor(sheet.pericia14Tr) == 0 and 0
      or
      sheet.level) +
      treinamentoValor(sheet.pericia14Tr))

      -- Treinamentos

      for i = 1, 8, 1 do
         sheet["armas" .. i .. "Tr"] = sheet["armas" .. i .. "Tr"] or "D"
      end

      -- desarmado, armasBrancas, pistolas, espingardas, metralhadoras, rifles, explosivos

      sheet.per_CA = "+" .. (sheet.DES + (treinamentoValor(sheet.armas1Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.armas1Tr))

      sheet.per_desarmado = "+" .. (sheet.FOR + (treinamentoValor(sheet.armas2Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.armas2Tr))

      sheet.per_armasBrancas = "+" .. (sheet.FOR + (treinamentoValor(sheet.armas3Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.armas3Tr))

      sheet.per_pistolas = "+" .. (sheet.DES + (treinamentoValor(sheet.armas4Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.armas4Tr))

      sheet.per_espingardas = "+" .. (sheet.DES + (treinamentoValor(sheet.armas5Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.armas5Tr))

      sheet.per_metralhadoras = "+" .. (sheet.DES + (treinamentoValor(sheet.armas6Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.armas6Tr))

      sheet.per_rifles = "+" .. (sheet.DES + (treinamentoValor(sheet.armas7Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.armas7Tr))

      sheet.per_explosivos = "+" .. (sheet.INT + (treinamentoValor(sheet.armas8Tr) == 0 and 0 or
      sheet.level) + treinamentoValor(sheet.armas8Tr))

      coresTreinamento()

      end

   


    obj.form1 = GUI.fromHandle(_obj_newObject("form"));
    obj.form1:setParent(obj);
    obj.form1:setName("form1");

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

    obj.modalLevel1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.modalLevel1:setParent(obj);
    obj.modalLevel1:setName("modalLevel1");
    obj.modalLevel1:setVisible(true);
    obj.modalLevel1:setWidth(200);
    obj.modalLevel1:setHeight(325);
    obj.modalLevel1:setBackOpacity(0.3);

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.modalLevel1);
    obj.rectangle10:setAlign("top");
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setPadding({top=5,bottom=5});
    obj.rectangle10:setName("rectangle10");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle10);
    obj.label9:setAlign("client");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("Gun Gale Online - RPG");
    obj.label9:setName("label9");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.modalLevel1);
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setColor("#2E2E2E");
    obj.rectangle11:setHeight(40);
    obj.rectangle11:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle11:setMargins({bottom=5});
    obj.rectangle11:setName("rectangle11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle11);
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setHeight(30);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle12:setName("rectangle12");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle12);
    obj.label10:setAlign("client");
    obj.label10:setText("Atributos Level 1");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.modalLevel1);
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setHeight(30);
    obj.rectangle13:setColor("#3A3A3A");
    obj.rectangle13:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle13:setMargins({top=5,bottom=5});
    obj.rectangle13:setName("rectangle13");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle13);
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox1:setValues({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox1:setField("level1Attr1");
    obj.comboBox1:setName("comboBox1");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.modalLevel1);
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setHeight(30);
    obj.rectangle14:setColor("#3A3A3A");
    obj.rectangle14:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle14:setMargins({top=5,bottom=5});
    obj.rectangle14:setName("rectangle14");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle14);
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox2:setValues({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox2:setField("level1Attr2");
    obj.comboBox2:setName("comboBox2");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.modalLevel1);
    obj.rectangle15:setAlign("top");
    obj.rectangle15:setHeight(30);
    obj.rectangle15:setColor("#3A3A3A");
    obj.rectangle15:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle15:setMargins({top=5,bottom=5});
    obj.rectangle15:setName("rectangle15");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle15);
    obj.comboBox3:setAlign("client");
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox3:setValues({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox3:setField("level1Attr3");
    obj.comboBox3:setName("comboBox3");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.modalLevel1);
    obj.rectangle16:setAlign("top");
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setColor("#3A3A3A");
    obj.rectangle16:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle16:setMargins({top=5,bottom=5});
    obj.rectangle16:setName("rectangle16");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle16);
    obj.comboBox4:setAlign("client");
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox4:setValues({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox4:setField("level1Attr4");
    obj.comboBox4:setName("comboBox4");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.modalLevel1);
    obj.rectangle17:setAlign("top");
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setColor("#3A3A3A");
    obj.rectangle17:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle17:setMargins({top=5,bottom=5});
    obj.rectangle17:setName("rectangle17");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.rectangle17);
    obj.comboBox5:setAlign("client");
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox5:setValues({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox5:setField("level1Attr5");
    obj.comboBox5:setName("comboBox5");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.modalLevel1);
    obj.rectangle18:setAlign("top");
    obj.rectangle18:setHeight(30);
    obj.rectangle18:setColor("#3A3A3A");
    obj.rectangle18:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle18:setMargins({top=5,bottom=5});
    obj.rectangle18:setName("rectangle18");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.rectangle18);
    obj.comboBox6:setAlign("client");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox6:setValues({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox6:setField("level1Attr6");
    obj.comboBox6:setName("comboBox6");

    obj.modalLevel1Pericias = GUI.fromHandle(_obj_newObject("popup"));
    obj.modalLevel1Pericias:setParent(obj);
    obj.modalLevel1Pericias:setName("modalLevel1Pericias");
    obj.modalLevel1Pericias:setVisible(true);
    obj.modalLevel1Pericias:setWidth(250);
    obj.modalLevel1Pericias:setHeight(325);
    obj.modalLevel1Pericias:setBackOpacity(0.3);

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.modalLevel1Pericias);
    obj.rectangle19:setAlign("top");
    obj.rectangle19:setHeight(30);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setPadding({top=5,bottom=5});
    obj.rectangle19:setName("rectangle19");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle19);
    obj.label11:setAlign("client");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setText("Gun Gale Online - RPG");
    obj.label11:setName("label11");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.modalLevel1Pericias);
    obj.rectangle20:setAlign("top");
    obj.rectangle20:setColor("#2E2E2E");
    obj.rectangle20:setHeight(40);
    obj.rectangle20:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle20:setMargins({bottom=5});
    obj.rectangle20:setName("rectangle20");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle20);
    obj.rectangle21:setAlign("top");
    obj.rectangle21:setHeight(30);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle21:setName("rectangle21");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.rectangle21);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setOrientation("horizontal");
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowLayout1);
    obj.label12:setText("Escolha");
    obj.label12:setWidth(45);
    obj.label12:setHeight(20);
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowLayout1);
    obj.label13:setField("modalPericiasTotal");
    obj.label13:setWidth(15);
    obj.label13:setHeight(20);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowLayout1);
    obj.label14:setText(" Pericias");
    obj.label14:setWidth(48);
    obj.label14:setHeight(20);
    obj.label14.grid["dyn-width-txt"] = true;
    obj.label14:setName("label14");

    obj.modalPericiasBar = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.modalPericiasBar:setParent(obj.modalLevel1Pericias);
    obj.modalPericiasBar:setAlign("top");
    obj.modalPericiasBar:setName("modalPericiasBar");
    obj.modalPericiasBar:setHeight(240);
    obj.modalPericiasBar:setPadding({left=5,right=5,top=5,bottom=5});
    obj.modalPericiasBar:setMargins({bottom=5});

    obj.modalTreinamentoLevel1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.modalTreinamentoLevel1:setParent(obj);
    obj.modalTreinamentoLevel1:setName("modalTreinamentoLevel1");
    obj.modalTreinamentoLevel1:setVisible(true);
    obj.modalTreinamentoLevel1:setWidth(250);
    obj.modalTreinamentoLevel1:setHeight(325);
    obj.modalTreinamentoLevel1:setBackOpacity(0.3);

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.modalTreinamentoLevel1);
    obj.rectangle22:setAlign("top");
    obj.rectangle22:setHeight(30);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setPadding({top=5,bottom=5});
    obj.rectangle22:setName("rectangle22");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle22);
    obj.label15:setAlign("client");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("Gun Gale Online - RPG");
    obj.label15:setName("label15");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.modalTreinamentoLevel1);
    obj.rectangle23:setAlign("top");
    obj.rectangle23:setColor("#2E2E2E");
    obj.rectangle23:setHeight(40);
    obj.rectangle23:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle23:setMargins({bottom=5});
    obj.rectangle23:setName("rectangle23");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle23);
    obj.rectangle24:setAlign("top");
    obj.rectangle24:setHeight(30);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle24:setName("rectangle24");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.rectangle24);
    obj.flowLayout2:setAlign("client");
    obj.flowLayout2:setOrientation("horizontal");
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowLayout2);
    obj.label16:setText("Escolha");
    obj.label16:setWidth(45);
    obj.label16:setHeight(20);
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowLayout2);
    obj.label17:setField("modalTreinamentoBarTotal");
    obj.label17:setWidth(15);
    obj.label17:setHeight(20);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowLayout2);
    obj.label18:setText(" Treinamentos");
    obj.label18:setWidth(90);
    obj.label18:setHeight(20);
    obj.label18.grid["dyn-width-txt"] = true;
    obj.label18:setName("label18");

    obj.modalTreinamentoBar = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.modalTreinamentoBar:setParent(obj.modalTreinamentoLevel1);
    obj.modalTreinamentoBar:setAlign("top");
    obj.modalTreinamentoBar:setName("modalTreinamentoBar");
    obj.modalTreinamentoBar:setHeight(240);
    obj.modalTreinamentoBar:setPadding({left=5,right=5,top=5,bottom=5});
    obj.modalTreinamentoBar:setMargins({bottom=5});

    obj.modalArmas = GUI.fromHandle(_obj_newObject("popup"));
    obj.modalArmas:setParent(obj);
    obj.modalArmas:setName("modalArmas");
    obj.modalArmas:setBackOpacity(0.3);
    obj.modalArmas:setWidth(705);
    obj.modalArmas:setHeight(400);

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.modalArmas);
    obj.rectangle25:setAlign("top");
    obj.rectangle25:setHeight(30);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setPadding({top=5,bottom=5});
    obj.rectangle25:setName("rectangle25");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle25);
    obj.label19:setAlign("left");
    obj.label19:setWidth(250);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("Gun Gale Online - RPG");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle25);
    obj.label20:setAlign("left");
    obj.label20:setWidth(60);
    obj.label20:setText("Pesquisar");
    obj.label20:setName("label20");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle25);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(100);
    obj.edit2:setName("edit2");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle25);
    obj.button9:setAlign("left");
    obj.button9:setText(">");
    obj.button9:setName("button9");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.modalArmas);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(300);
    obj.rectangle26:setColor("#3A3A3A");
    obj.rectangle26:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle26:setName("rectangle26");

    obj.modalArmasBar = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.modalArmasBar:setParent(obj.rectangle26);
    obj.modalArmasBar:setAlign("client");
    obj.modalArmasBar:setName("modalArmasBar");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.modalArmas);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setColor("#2E2E2E");
    obj.rectangle27:setWidth(400);
    obj.rectangle27:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle27:setName("rectangle27");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle27);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.scrollBox1);
    obj.rectangle28:setAlign("top");
    obj.rectangle28:setHeight(30);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle28:setName("rectangle28");

    obj.tracosArmasBar = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tracosArmasBar:setParent(obj.rectangle28);
    obj.tracosArmasBar:setAutoHeight(true);
    obj.tracosArmasBar:setAlign("client");
    obj.tracosArmasBar:setName("tracosArmasBar");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.scrollBox1);
    obj.rectangle29:setAlign("top");
    obj.rectangle29:setHeight(5);
    obj.rectangle29:setColor("#3A3A3A");
    obj.rectangle29:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle29:setName("rectangle29");

    obj.caracteristicasRecArmaModal = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caracteristicasRecArmaModal:setParent(obj.scrollBox1);
    obj.caracteristicasRecArmaModal:setAlign("top");
    obj.caracteristicasRecArmaModal:setHeight(55);
    obj.caracteristicasRecArmaModal:setColor("black");
    obj.caracteristicasRecArmaModal:setName("caracteristicasRecArmaModal");
    obj.caracteristicasRecArmaModal:setPadding({left=5,right=5,top=5,bottom=5});

    obj.caracteristicasArmasBar = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.caracteristicasArmasBar:setParent(obj.caracteristicasRecArmaModal);
    obj.caracteristicasArmasBar:setAlign("client");
    obj.caracteristicasArmasBar:setAutoHeight(true);
    obj.caracteristicasArmasBar:setLineSpacing(5);
    obj.caracteristicasArmasBar:setName("caracteristicasArmasBar");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.scrollBox1);
    obj.rectangle30:setAlign("top");
    obj.rectangle30:setHeight(5);
    obj.rectangle30:setColor("#3A3A3A");
    obj.rectangle30:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle30:setName("rectangle30");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setSRC("imgs/armas/ak47.png");
    obj.image1:setField("imgArmaModal");
    obj.image1:setAlign("top");
    obj.image1:setHeight(150);
    obj.image1:setPadding({left=5,top=5,right=5,bottom=5});
    obj.image1:setName("image1");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.scrollBox1);
    obj.rectangle31:setAlign("top");
    obj.rectangle31:setHeight(30);
    obj.rectangle31:setColor("#3A3A3A");
    obj.rectangle31:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle31:setName("rectangle31");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle31);
    obj.label21:setAlign("client");
    obj.label21:setField("precoArmaModal");
    obj.label21:setName("label21");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.scrollBox1);
    obj.rectangle32:setAlign("top");
    obj.rectangle32:setHeight(30);
    obj.rectangle32:setColor("#3A3A3A");
    obj.rectangle32:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle32:setMargins({top=10});
    obj.rectangle32:setName("rectangle32");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle32);
    obj.label22:setAlign("client");
    obj.label22:setText("Descrição:");
    lfm_setPropAsString(obj.label22, "fontStyle", "bold");
    obj.label22:setName("label22");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.scrollBox1);
    obj.rectangle33:setAlign("top");
    obj.rectangle33:setHeight(30);
    obj.rectangle33:setColor("#3A3A3A");
    obj.rectangle33:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle33:setName("rectangle33");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle33);
    obj.label23:setAlign("client");
    obj.label23:setField("descricaoTalento");
    obj.label23:setName("label23");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.modalArmas);
    obj.rectangle34:setAlign("bottom");
    obj.rectangle34:setHeight(30);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setPadding({top=5,bottom=5});
    obj.rectangle34:setName("rectangle34");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle34);
    obj.button10:setAlign("left");
    obj.button10:setWidth(100);
    obj.button10:setText("Aceitar");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle34);
    obj.button11:setAlign("left");
    obj.button11:setWidth(100);
    obj.button11:setText("Cancelar");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle34);
    obj.button12:setAlign("left");
    obj.button12:setWidth(100);
    obj.button12:setText("Limpar");
    obj.button12:setName("button12");

    obj.modalAcoes = GUI.fromHandle(_obj_newObject("popup"));
    obj.modalAcoes:setParent(obj);
    obj.modalAcoes:setName("modalAcoes");
    obj.modalAcoes:setBackOpacity(0.3);
    obj.modalAcoes:setWidth(705);
    obj.modalAcoes:setHeight(400);

    obj.tipoAcoesBar = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tipoAcoesBar:setParent(obj.modalAcoes);
    obj.tipoAcoesBar:setName("tipoAcoesBar");
    obj.tipoAcoesBar:setAlign("top");
    obj.tipoAcoesBar:setAutoHeight(true);
    obj.tipoAcoesBar:setOrientation("horizontal");
    obj.tipoAcoesBar:setLineSpacing(5);
    obj.tipoAcoesBar:setHorzAlign("center");
    obj.tipoAcoesBar:setMargins({top=80});

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.tipoAcoesBar);
    obj.rectangle35:setHeight(150);
    obj.rectangle35:setColor("blue");
    obj.rectangle35:setWidth(150);
    obj.rectangle35:setPadding({top=5,bottom=5});
    obj.rectangle35:setMargins({right=50});
    obj.rectangle35:setStrokeJoin("round");
    obj.rectangle35:setStrokeColor("darkBlue");
    obj.rectangle35:setStrokeSize(10);
    obj.rectangle35:setName("rectangle35");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle35);
    obj.label24:setAlign("client");
    obj.label24:setText("Bonus");
    obj.label24:setFontSize(21);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.tipoAcoesBar);
    obj.rectangle36:setHeight(250);
    obj.rectangle36:setWidth(250);
    obj.rectangle36:setColor("red");
    obj.rectangle36:setPadding({top=5,bottom=5});
    obj.rectangle36:setStrokeJoin("round");
    obj.rectangle36:setStrokeColor("darkRed");
    obj.rectangle36:setStrokeSize(10);
    obj.rectangle36:setName("rectangle36");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle36);
    obj.label25:setAlign("client");
    obj.label25:setText("Ação");
    obj.label25:setFontSize(30);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.acoesEscolhidasBar = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.acoesEscolhidasBar:setParent(obj.modalAcoes);
    obj.acoesEscolhidasBar:setName("acoesEscolhidasBar");
    obj.acoesEscolhidasBar:setAlign("top");
    obj.acoesEscolhidasBar:setAutoHeight(true);
    obj.acoesEscolhidasBar:setOrientation("horizontal");
    obj.acoesEscolhidasBar:setLineSpacing(5);
    obj.acoesEscolhidasBar:setHorzAlign("center");
    obj.acoesEscolhidasBar:setMargins({top=5});

    obj.modalAcoesAtributos = GUI.fromHandle(_obj_newObject("popup"));
    obj.modalAcoesAtributos:setParent(obj);
    obj.modalAcoesAtributos:setName("modalAcoesAtributos");
    obj.modalAcoesAtributos:setVisible(true);
    obj.modalAcoesAtributos:setWidth(300);
    obj.modalAcoesAtributos:setHeight(600);
    obj.modalAcoesAtributos:setBackOpacity(0.3);

    obj.acoesAtributosBar = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.acoesAtributosBar:setParent(obj.modalAcoesAtributos);
    obj.acoesAtributosBar:setName("acoesAtributosBar");
    obj.acoesAtributosBar:setAlign("client");

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

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj);
    obj.rectangle37:setAlign("left");
    obj.rectangle37:setWidth(1200);
    obj.rectangle37:setColor("#2E2E2E");
    obj.rectangle37:setPadding({left=7,top=7,right=7,bottom=7});
    obj.rectangle37:setName("rectangle37");

    obj.talentosBar = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.talentosBar:setParent(obj.rectangle37);
    obj.talentosBar:setAlign("left");
    obj.talentosBar:setWidth(300);
    obj.talentosBar:setColor("#1C1C1C");
    obj.talentosBar:setName("talentosBar");
    obj.talentosBar:setMargins({right=5});
    obj.talentosBar:setPadding({left=5,top=5,right=5,bottom=5});

    obj.level1layout = GUI.fromHandle(_obj_newObject("layout"));
    obj.level1layout:setParent(obj.talentosBar);
    obj.level1layout:setAlign("top");
    obj.level1layout:setName("level1layout");
    obj.level1layout:setHeight(80);
    obj.level1layout:setMargins({bottom=10});

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.level1layout);
    obj.label26:setAlign("top");
    obj.label26:setHeight(20);
    obj.label26:setText("Atributos ");
    obj.label26:setName("label26");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.level1layout);
    obj.rectangle38:setAlign("top");
    obj.rectangle38:setHeight(60);
    obj.rectangle38:setColor("#2E2E2E");
    obj.rectangle38:setPadding({left=7,top=3,right=3,bottom=3});
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setStrokeColor("#00CFFF");
    obj.rectangle38:setName("rectangle38");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle38);
    obj.label27:setAlign("client");
    obj.label27:setFontSize(15);
    obj.label27:setField("level1Titulo");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.ficha1layout = GUI.fromHandle(_obj_newObject("layout"));
    obj.ficha1layout:setParent(obj.talentosBar);
    obj.ficha1layout:setAlign("top");
    obj.ficha1layout:setName("ficha1layout");
    obj.ficha1layout:setHeight(80);
    obj.ficha1layout:setMargins({bottom=5});

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.ficha1layout);
    obj.label28:setAlign("top");
    obj.label28:setHeight(20);
    obj.label28:setText("Level 1");
    obj.label28:setName("label28");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.ficha1layout);
    obj.rectangle39:setAlign("top");
    obj.rectangle39:setHeight(60);
    obj.rectangle39:setColor("#2E2E2E");
    obj.rectangle39:setPadding({left=7,top=3,right=3,bottom=3});
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setStrokeColor("#00CFFF");
    obj.rectangle39:setName("rectangle39");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.rectangle39);
    obj.rectangle40:setAlign("left");
    obj.rectangle40:setWidth(50);
    obj.rectangle40:setColor("#3A3A3A");
    obj.rectangle40:setMargins({left=5,top=5,right=5,bottom=5});
    obj.rectangle40:setName("rectangle40");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle39);
    obj.layout1:setAlign("left");
    obj.layout1:setMargins({left=5});
    obj.layout1:setWidth(300);
    obj.layout1:setName("layout1");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout1);
    obj.label29:setAlign("top");
    obj.label29:setHeight(20);
    obj.label29:setField("ficha1tipo");
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout1);
    obj.label30:setAlign("top");
    obj.label30:setHeight(35);
    obj.label30:setFontSize(26);
    obj.label30:setField("ficha1nome");
    obj.label30:setName("label30");

    obj.ficha1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ficha1:setParent(obj.ficha1layout);
    obj.ficha1:setAlign("bottom");
    obj.ficha1:setHeight(30);
    obj.ficha1:setColor("#2E2E2E");
    obj.ficha1:setPadding({left=7,top=3,right=7,bottom=3});
    obj.ficha1:setMargins({top=5});
    obj.ficha1:setStrokeSize(1);
    obj.ficha1:setStrokeColor("#00CFFF");
    obj.ficha1:setName("ficha1");
    obj.ficha1:setVisible(false);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.ficha1);
    obj.layout2:setAlign("client");
    obj.layout2:setMargins({left=5});
    obj.layout2:setPadding({left=10,right=10});
    obj.layout2:setName("layout2");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout2);
    obj.label31:setAlign("client");
    obj.label31:setField("ficha1plus");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.ficha2layout = GUI.fromHandle(_obj_newObject("layout"));
    obj.ficha2layout:setParent(obj.talentosBar);
    obj.ficha2layout:setAlign("top");
    obj.ficha2layout:setName("ficha2layout");
    obj.ficha2layout:setHeight(80);
    obj.ficha2layout:setMargins({bottom=5});

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.ficha2layout);
    obj.label32:setAlign("top");
    obj.label32:setHeight(20);
    obj.label32:setText("Level 2");
    obj.label32:setName("label32");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.ficha2layout);
    obj.rectangle41:setAlign("top");
    obj.rectangle41:setHeight(60);
    obj.rectangle41:setColor("#2E2E2E");
    obj.rectangle41:setPadding({left=7,top=3,right=3,bottom=3});
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setStrokeColor("#00CFFF");
    obj.rectangle41:setName("rectangle41");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.rectangle41);
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setWidth(50);
    obj.rectangle42:setColor("#3A3A3A");
    obj.rectangle42:setMargins({left=5,top=5,right=5,bottom=5});
    obj.rectangle42:setName("rectangle42");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle41);
    obj.layout3:setAlign("left");
    obj.layout3:setMargins({left=5});
    obj.layout3:setWidth(300);
    obj.layout3:setName("layout3");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout3);
    obj.label33:setAlign("top");
    obj.label33:setHeight(20);
    obj.label33:setField("ficha2tipo");
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout3);
    obj.label34:setAlign("top");
    obj.label34:setHeight(35);
    obj.label34:setFontSize(26);
    obj.label34:setField("ficha2nome");
    obj.label34:setName("label34");

    obj.ficha2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ficha2:setParent(obj.ficha2layout);
    obj.ficha2:setAlign("bottom");
    obj.ficha2:setHeight(30);
    obj.ficha2:setColor("#2E2E2E");
    obj.ficha2:setPadding({left=7,top=3,right=7,bottom=3});
    obj.ficha2:setMargins({top=5});
    obj.ficha2:setStrokeSize(1);
    obj.ficha2:setStrokeColor("#00CFFF");
    obj.ficha2:setName("ficha2");
    obj.ficha2:setVisible(false);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.ficha2);
    obj.layout4:setAlign("client");
    obj.layout4:setMargins({left=5});
    obj.layout4:setPadding({left=10,right=10});
    obj.layout4:setName("layout4");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout4);
    obj.label35:setAlign("client");
    obj.label35:setField("ficha2plus");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.ficha3layout = GUI.fromHandle(_obj_newObject("layout"));
    obj.ficha3layout:setParent(obj.talentosBar);
    obj.ficha3layout:setAlign("top");
    obj.ficha3layout:setName("ficha3layout");
    obj.ficha3layout:setHeight(80);
    obj.ficha3layout:setMargins({bottom=5});

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.ficha3layout);
    obj.label36:setAlign("top");
    obj.label36:setHeight(20);
    obj.label36:setText("Level 3");
    obj.label36:setName("label36");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.ficha3layout);
    obj.rectangle43:setAlign("top");
    obj.rectangle43:setHeight(60);
    obj.rectangle43:setColor("#2E2E2E");
    obj.rectangle43:setPadding({left=7,top=3,right=3,bottom=3});
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setStrokeColor("#00CFFF");
    obj.rectangle43:setName("rectangle43");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.rectangle43);
    obj.rectangle44:setAlign("left");
    obj.rectangle44:setWidth(50);
    obj.rectangle44:setColor("#3A3A3A");
    obj.rectangle44:setMargins({left=5,top=5,right=5,bottom=5});
    obj.rectangle44:setName("rectangle44");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle43);
    obj.layout5:setAlign("left");
    obj.layout5:setMargins({left=5});
    obj.layout5:setWidth(300);
    obj.layout5:setName("layout5");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setAlign("top");
    obj.label37:setHeight(20);
    obj.label37:setField("ficha3tipo");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout5);
    obj.label38:setAlign("top");
    obj.label38:setHeight(35);
    obj.label38:setFontSize(26);
    obj.label38:setField("ficha3nome");
    obj.label38:setName("label38");

    obj.ficha3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ficha3:setParent(obj.ficha3layout);
    obj.ficha3:setAlign("bottom");
    obj.ficha3:setHeight(30);
    obj.ficha3:setColor("#2E2E2E");
    obj.ficha3:setPadding({left=7,top=3,right=7,bottom=3});
    obj.ficha3:setMargins({top=5});
    obj.ficha3:setStrokeSize(1);
    obj.ficha3:setStrokeColor("#00CFFF");
    obj.ficha3:setName("ficha3");
    obj.ficha3:setVisible(false);

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.ficha3);
    obj.layout6:setAlign("client");
    obj.layout6:setMargins({left=5});
    obj.layout6:setPadding({left=10,right=10});
    obj.layout6:setName("layout6");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout6);
    obj.label39:setAlign("client");
    obj.label39:setField("ficha3plus");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.rectangle37);
    obj.rectangle45:setAlign("left");
    obj.rectangle45:setWidth(450);
    obj.rectangle45:setColor("#1C1C1C");
    obj.rectangle45:setMargins({right=5});
    obj.rectangle45:setPadding({left=5,top=5,right=5,bottom=5});
    obj.rectangle45:setName("rectangle45");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle45);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(50);
    obj.layout7:setName("layout7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(260);
    obj.layout8:setName("layout8");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout8);
    obj.rectangle46:setAlign("top");
    obj.rectangle46:setHeight(45);
    obj.rectangle46:setColor("#2E2E2E");
    obj.rectangle46:setPadding({left=7,right=3});
    obj.rectangle46:setName("rectangle46");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle46);
    obj.layout9:setAlign("left");
    obj.layout9:setMargins({left=5});
    obj.layout9:setWidth(235);
    obj.layout9:setName("layout9");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout9);
    obj.label40:setAlign("top");
    obj.label40:setHeight(15);
    obj.label40:setFontSize(10);
    obj.label40:setText("Nome");
    obj.label40:setName("label40");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout9);
    obj.rectangle47:setAlign("top");
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("#3A3A3A");
    obj.rectangle47:setStrokeColor("orange");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle47);
    obj.edit3:setAlign("client");
    obj.edit3:setFontSize(14);
    obj.edit3:setTransparent(true);
    obj.edit3:setText("Especialista");
    obj.edit3:setName("edit3");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout7);
    obj.layout10:setAlign("left");
    obj.layout10:setMargins({left=5});
    obj.layout10:setWidth(50);
    obj.layout10:setName("layout10");

    obj.teste = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.teste:setParent(obj.layout10);
    obj.teste:setAlign("top");
    obj.teste:setHeight(45);
    obj.teste:setColor("#2E2E2E");
    obj.teste:setName("teste");
    obj.teste:setPadding({left=1,right=1});

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.teste);
    obj.layout11:setAlign("left");
    obj.layout11:setMargins({left=5});
    obj.layout11:setWidth(40);
    obj.layout11:setName("layout11");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout11);
    obj.label41:setAlign("top");
    obj.label41:setHeight(15);
    obj.label41:setFontSize(10);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setText("LV");
    obj.label41:setName("label41");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout11);
    obj.rectangle48:setAlign("top");
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("#3A3A3A");
    obj.rectangle48:setStrokeColor("orange");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.rectangle48);
    obj.comboBox7:setAlign("client");
    obj.comboBox7:setFontSize(14);
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setTransparent(true);
    obj.comboBox7:setField("level");
    obj.comboBox7:setItems({'1', '2', '3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'});
    obj.comboBox7:setValues({'1', '2', '3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'});
    obj.comboBox7:setName("comboBox7");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout7);
    obj.layout12:setAlign("left");
    obj.layout12:setMargins({left=5});
    obj.layout12:setWidth(50);
    obj.layout12:setName("layout12");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout12);
    obj.rectangle49:setAlign("top");
    obj.rectangle49:setHeight(45);
    obj.rectangle49:setColor("#2E2E2E");
    obj.rectangle49:setPadding({left=1,right=1});
    obj.rectangle49:setName("rectangle49");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle49);
    obj.layout13:setAlign("left");
    obj.layout13:setMargins({left=5});
    obj.layout13:setWidth(40);
    obj.layout13:setName("layout13");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout13);
    obj.label42:setAlign("top");
    obj.label42:setHeight(15);
    obj.label42:setFontSize(10);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setText("XP");
    obj.label42:setName("label42");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout13);
    obj.rectangle50:setAlign("top");
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("#3A3A3A");
    obj.rectangle50:setStrokeColor("orange");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle50);
    obj.edit4:setAlign("client");
    obj.edit4:setReadOnly(true);
    obj.edit4:setFontSize(14);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setTransparent(true);
    obj.edit4:setText("2");
    obj.edit4:setName("edit4");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle45);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(50);
    obj.layout14:setName("layout14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(80);
    obj.layout15:setName("layout15");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout15);
    obj.rectangle51:setAlign("top");
    obj.rectangle51:setHeight(45);
    obj.rectangle51:setColor("#2E2E2E");
    obj.rectangle51:setPadding({left=1,right=1});
    obj.rectangle51:setName("rectangle51");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle51);
    obj.layout16:setAlign("left");
    obj.layout16:setMargins({left=5});
    obj.layout16:setWidth(70);
    obj.layout16:setName("layout16");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout16);
    obj.label43:setAlign("top");
    obj.label43:setHeight(15);
    obj.label43:setFontSize(10);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setText("Deslocamento");
    obj.label43:setName("label43");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout16);
    obj.rectangle52:setAlign("top");
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setColor("#3A3A3A");
    obj.rectangle52:setStrokeColor("orange");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle52);
    obj.edit5:setAlign("client");
    obj.edit5:setFontSize(14);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setTransparent(true);
    obj.edit5:setText("7.5 m");
    obj.edit5:setName("edit5");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout14);
    obj.layout17:setAlign("left");
    obj.layout17:setMargins({left=5});
    obj.layout17:setWidth(50);
    obj.layout17:setName("layout17");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout17);
    obj.rectangle53:setAlign("top");
    obj.rectangle53:setHeight(45);
    obj.rectangle53:setColor("#2E2E2E");
    obj.rectangle53:setPadding({left=1,right=1});
    obj.rectangle53:setName("rectangle53");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle53);
    obj.layout18:setAlign("left");
    obj.layout18:setMargins({left=5});
    obj.layout18:setWidth(40);
    obj.layout18:setName("layout18");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout18);
    obj.label44:setAlign("top");
    obj.label44:setHeight(15);
    obj.label44:setFontSize(10);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setText("FOR");
    obj.label44:setName("label44");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout18);
    obj.rectangle54:setAlign("top");
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("#3A3A3A");
    obj.rectangle54:setStrokeColor("orange");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle54);
    obj.edit6:setAlign("client");
    obj.edit6:setFontSize(14);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setTransparent(true);
    obj.edit6:setField("FOR");
    obj.edit6:setName("edit6");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout14);
    obj.layout19:setAlign("left");
    obj.layout19:setMargins({left=5});
    obj.layout19:setWidth(50);
    obj.layout19:setName("layout19");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout19);
    obj.rectangle55:setAlign("top");
    obj.rectangle55:setHeight(45);
    obj.rectangle55:setColor("#2E2E2E");
    obj.rectangle55:setPadding({left=1,right=1});
    obj.rectangle55:setName("rectangle55");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle55);
    obj.layout20:setAlign("left");
    obj.layout20:setMargins({left=5});
    obj.layout20:setWidth(40);
    obj.layout20:setName("layout20");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout20);
    obj.label45:setAlign("top");
    obj.label45:setHeight(15);
    obj.label45:setFontSize(10);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setText("DES");
    obj.label45:setName("label45");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout20);
    obj.rectangle56:setAlign("top");
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setColor("#3A3A3A");
    obj.rectangle56:setStrokeColor("orange");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle56);
    obj.edit7:setAlign("client");
    obj.edit7:setFontSize(14);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setTransparent(true);
    obj.edit7:setField("DES");
    obj.edit7:setName("edit7");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout14);
    obj.layout21:setAlign("left");
    obj.layout21:setMargins({left=5});
    obj.layout21:setWidth(50);
    obj.layout21:setName("layout21");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout21);
    obj.rectangle57:setAlign("top");
    obj.rectangle57:setHeight(45);
    obj.rectangle57:setColor("#2E2E2E");
    obj.rectangle57:setPadding({left=1,right=1});
    obj.rectangle57:setName("rectangle57");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle57);
    obj.layout22:setAlign("left");
    obj.layout22:setMargins({left=5});
    obj.layout22:setWidth(40);
    obj.layout22:setName("layout22");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout22);
    obj.label46:setAlign("top");
    obj.label46:setHeight(15);
    obj.label46:setFontSize(10);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setText("CON");
    obj.label46:setName("label46");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout22);
    obj.rectangle58:setAlign("top");
    obj.rectangle58:setHeight(25);
    obj.rectangle58:setColor("#3A3A3A");
    obj.rectangle58:setStrokeColor("orange");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle58);
    obj.edit8:setAlign("client");
    obj.edit8:setFontSize(14);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setTransparent(true);
    obj.edit8:setField("CON");
    obj.edit8:setName("edit8");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout14);
    obj.layout23:setAlign("left");
    obj.layout23:setMargins({left=5});
    obj.layout23:setWidth(50);
    obj.layout23:setName("layout23");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout23);
    obj.rectangle59:setAlign("top");
    obj.rectangle59:setHeight(45);
    obj.rectangle59:setColor("#2E2E2E");
    obj.rectangle59:setPadding({left=1,right=1});
    obj.rectangle59:setName("rectangle59");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle59);
    obj.layout24:setAlign("left");
    obj.layout24:setMargins({left=5});
    obj.layout24:setWidth(40);
    obj.layout24:setName("layout24");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout24);
    obj.label47:setAlign("top");
    obj.label47:setHeight(15);
    obj.label47:setFontSize(10);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setText("INT");
    obj.label47:setName("label47");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout24);
    obj.rectangle60:setAlign("top");
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("#3A3A3A");
    obj.rectangle60:setStrokeColor("orange");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle60);
    obj.edit9:setAlign("client");
    obj.edit9:setFontSize(14);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setTransparent(true);
    obj.edit9:setField("INT");
    obj.edit9:setName("edit9");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout14);
    obj.layout25:setAlign("left");
    obj.layout25:setMargins({left=5});
    obj.layout25:setWidth(50);
    obj.layout25:setName("layout25");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout25);
    obj.rectangle61:setAlign("top");
    obj.rectangle61:setHeight(45);
    obj.rectangle61:setColor("#2E2E2E");
    obj.rectangle61:setPadding({left=1,right=1});
    obj.rectangle61:setName("rectangle61");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle61);
    obj.layout26:setAlign("left");
    obj.layout26:setMargins({left=5});
    obj.layout26:setWidth(40);
    obj.layout26:setName("layout26");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout26);
    obj.label48:setAlign("top");
    obj.label48:setHeight(15);
    obj.label48:setFontSize(10);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setText("SAB");
    obj.label48:setName("label48");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout26);
    obj.rectangle62:setAlign("top");
    obj.rectangle62:setHeight(25);
    obj.rectangle62:setColor("#3A3A3A");
    obj.rectangle62:setStrokeColor("orange");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle62);
    obj.edit10:setAlign("client");
    obj.edit10:setFontSize(14);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setTransparent(true);
    obj.edit10:setField("SAB");
    obj.edit10:setName("edit10");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout14);
    obj.layout27:setAlign("left");
    obj.layout27:setMargins({left=5});
    obj.layout27:setWidth(50);
    obj.layout27:setName("layout27");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout27);
    obj.rectangle63:setAlign("top");
    obj.rectangle63:setHeight(45);
    obj.rectangle63:setColor("#2E2E2E");
    obj.rectangle63:setPadding({left=1,right=1});
    obj.rectangle63:setName("rectangle63");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle63);
    obj.layout28:setAlign("left");
    obj.layout28:setMargins({left=5});
    obj.layout28:setWidth(40);
    obj.layout28:setName("layout28");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout28);
    obj.label49:setAlign("top");
    obj.label49:setHeight(15);
    obj.label49:setFontSize(10);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setText("CAR");
    obj.label49:setName("label49");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout28);
    obj.rectangle64:setAlign("top");
    obj.rectangle64:setHeight(25);
    obj.rectangle64:setColor("#3A3A3A");
    obj.rectangle64:setStrokeColor("orange");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle64);
    obj.edit11:setAlign("client");
    obj.edit11:setFontSize(14);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setTransparent(true);
    obj.edit11:setField("CAR");
    obj.edit11:setName("edit11");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle45);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(55);
    obj.layout29:setName("layout29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout29);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(80);
    obj.layout30:setName("layout30");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout30);
    obj.rectangle65:setAlign("top");
    obj.rectangle65:setHeight(50);
    obj.rectangle65:setColor("#2E2E2E");
    obj.rectangle65:setPadding({left=1,right=1});
    obj.rectangle65:setName("rectangle65");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle65);
    obj.layout31:setAlign("left");
    obj.layout31:setMargins({left=5});
    obj.layout31:setWidth(70);
    obj.layout31:setName("layout31");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout31);
    obj.label50:setAlign("top");
    obj.label50:setHeight(20);
    obj.label50:setFontSize(12);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("CA");
    obj.label50:setName("label50");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout31);
    obj.rectangle66:setAlign("top");
    obj.rectangle66:setHeight(30);
    obj.rectangle66:setColor("#3A3A3A");
    obj.rectangle66:setStrokeColor("orange");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setName("rectangle66");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle66);
    obj.edit12:setAlign("client");
    obj.edit12:setFontSize(14);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setTransparent(true);
    obj.edit12:setText("18");
    obj.edit12:setName("edit12");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout29);
    obj.layout32:setAlign("left");
    obj.layout32:setMargins({left=5});
    obj.layout32:setWidth(150);
    obj.layout32:setName("layout32");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout32);
    obj.rectangle67:setAlign("top");
    obj.rectangle67:setHeight(50);
    obj.rectangle67:setColor("#2E2E2E");
    obj.rectangle67:setPadding({left=1,right=1});
    obj.rectangle67:setName("rectangle67");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.rectangle67);
    obj.progressBar1:setAlign("top");
    obj.progressBar1:setHeight(15);
    obj.progressBar1:setColor("red");
    obj.progressBar1:setMargins({top=5,bottom=5});
    obj.progressBar1:setPosition(50);
    obj.progressBar1:setMax(100);
    obj.progressBar1:setName("progressBar1");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.rectangle67);
    obj.progressBar2:setAlign("top");
    obj.progressBar2:setHeight(15);
    obj.progressBar2:setColor("darkGray");
    obj.progressBar2:setMargins({top=5,bottom=5});
    obj.progressBar2:setPosition(50);
    obj.progressBar2:setMax(100);
    obj.progressBar2:setName("progressBar2");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout29);
    obj.layout33:setAlign("left");
    obj.layout33:setMargins({left=5});
    obj.layout33:setWidth(50);
    obj.layout33:setName("layout33");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout33);
    obj.rectangle68:setAlign("top");
    obj.rectangle68:setHeight(50);
    obj.rectangle68:setColor("#2E2E2E");
    obj.rectangle68:setPadding({left=1,right=1});
    obj.rectangle68:setName("rectangle68");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle68);
    obj.layout34:setAlign("left");
    obj.layout34:setMargins({left=5});
    obj.layout34:setWidth(40);
    obj.layout34:setName("layout34");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout34);
    obj.label51:setAlign("top");
    obj.label51:setHeight(15);
    obj.label51:setFontSize(10);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setText("FORT");
    obj.label51:setName("label51");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout34);
    obj.rectangle69:setAlign("top");
    obj.rectangle69:setHeight(30);
    obj.rectangle69:setColor("#3A3A3A");
    obj.rectangle69:setStrokeColor("orange");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle69);
    obj.edit13:setAlign("client");
    obj.edit13:setFontSize(14);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setTransparent(true);
    obj.edit13:setField("FORT");
    obj.edit13:setName("edit13");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout29);
    obj.layout35:setAlign("left");
    obj.layout35:setMargins({left=5});
    obj.layout35:setWidth(50);
    obj.layout35:setName("layout35");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout35);
    obj.rectangle70:setAlign("top");
    obj.rectangle70:setHeight(50);
    obj.rectangle70:setColor("#2E2E2E");
    obj.rectangle70:setPadding({left=1,right=1});
    obj.rectangle70:setName("rectangle70");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle70);
    obj.layout36:setAlign("left");
    obj.layout36:setMargins({left=5});
    obj.layout36:setWidth(40);
    obj.layout36:setName("layout36");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout36);
    obj.label52:setAlign("top");
    obj.label52:setHeight(15);
    obj.label52:setFontSize(10);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setText("REF");
    obj.label52:setName("label52");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout36);
    obj.rectangle71:setAlign("top");
    obj.rectangle71:setHeight(30);
    obj.rectangle71:setColor("#3A3A3A");
    obj.rectangle71:setStrokeColor("orange");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle71);
    obj.edit14:setAlign("client");
    obj.edit14:setFontSize(14);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setTransparent(true);
    obj.edit14:setField("REF");
    obj.edit14:setName("edit14");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout29);
    obj.layout37:setAlign("left");
    obj.layout37:setMargins({left=5});
    obj.layout37:setWidth(50);
    obj.layout37:setName("layout37");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout37);
    obj.rectangle72:setAlign("top");
    obj.rectangle72:setHeight(50);
    obj.rectangle72:setColor("#2E2E2E");
    obj.rectangle72:setPadding({left=1,right=1});
    obj.rectangle72:setName("rectangle72");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle72);
    obj.layout38:setAlign("left");
    obj.layout38:setMargins({left=5});
    obj.layout38:setWidth(40);
    obj.layout38:setName("layout38");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout38);
    obj.label53:setAlign("top");
    obj.label53:setHeight(15);
    obj.label53:setFontSize(10);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setText("VON");
    obj.label53:setName("label53");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout38);
    obj.rectangle73:setAlign("top");
    obj.rectangle73:setHeight(30);
    obj.rectangle73:setColor("#3A3A3A");
    obj.rectangle73:setStrokeColor("orange");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle73);
    obj.edit15:setAlign("client");
    obj.edit15:setFontSize(14);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setTransparent(true);
    obj.edit15:setField("VON");
    obj.edit15:setName("edit15");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.rectangle45);
    obj.rectangle74:setAlign("left");
    obj.rectangle74:setWidth(450);
    obj.rectangle74:setPadding({left=3});
    obj.rectangle74:setColor("#2E2E2E");
    obj.rectangle74:setName("rectangle74");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.rectangle74);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Armas");
    obj.tab1:setHeight(400);
    obj.tab1:setName("tab1");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab1);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox2);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(30);
    obj.layout39:setPadding({left=5,top=5,right=5,bottom=5});
    obj.layout39:setName("layout39");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout39);
    obj.button13:setAlign("top");
    obj.button13:setText("Adicionar Arma");
    obj.button13:setName("button13");

    obj.inventarioRcl = GUI.fromHandle(_obj_newObject("recordList"));
    obj.inventarioRcl:setParent(obj.scrollBox2);
    obj.inventarioRcl:setName("inventarioRcl");
    obj.inventarioRcl:setField("inventario");
    obj.inventarioRcl:setTemplateForm("inventario");
    obj.inventarioRcl:setAlign("top");
    obj.inventarioRcl:setHeight(410);
    obj.inventarioRcl:setAutoHeight(true);

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle37);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(165);
    obj.layout40:setName("layout40");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout40);
    obj.rectangle75:setAlign("top");
    obj.rectangle75:setHeight(30);
    obj.rectangle75:setColor("#2E2E2E");
    obj.rectangle75:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle75:setMargins({bottom=10});
    obj.rectangle75:setName("rectangle75");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle75);
    obj.label54:setAlign("client");
    obj.label54:setText("Pericias Gerais");
    obj.label54:setMargins({left=5});
    obj.label54:setName("label54");

    obj.pericia1Rectangle = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pericia1Rectangle:setParent(obj.layout40);
    obj.pericia1Rectangle:setAlign("top");
    obj.pericia1Rectangle:setHeight(30);
    obj.pericia1Rectangle:setColor("#2E2E2E");
    obj.pericia1Rectangle:setPadding({left=5,right=5,bottom=5,top=5});
    obj.pericia1Rectangle:setName("pericia1Rectangle");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.pericia1Rectangle);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(18);
    obj.layout41:setName("layout41");

    obj.pericia1 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia1:setParent(obj.layout41);
    obj.pericia1:setAlign("client");
    obj.pericia1:setMode("fit");
    obj.pericia1:setName("pericia1");
    obj.pericia1:setColor("darkRed");
    obj.pericia1:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia1Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia1Tr:setParent(obj.layout41);
    obj.pericia1Tr:setAlign("client");
    obj.pericia1Tr:setName("pericia1Tr");
    obj.pericia1Tr:setField("pericia1Tr");
    obj.pericia1Tr:setFontSize(10);
    obj.pericia1Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia1Tr, "fontStyle", "bold");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.pericia1Rectangle);
    obj.label55:setAlign("left");
    obj.label55:setField("per_iniciativa");
    obj.label55:setWidth(25);
    obj.label55:setMargins({left=5});
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.pericia1Rectangle);
    obj.label56:setAlign("left");
    obj.label56:setText("Iniciativa");
    obj.label56:setWidth(130);
    obj.label56:setMargins({left=5});
    obj.label56:setName("label56");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout40);
    obj.rectangle76:setAlign("top");
    obj.rectangle76:setHeight(30);
    obj.rectangle76:setColor("#2E2E2E");
    obj.rectangle76:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle76:setMargins({bottom=10});
    obj.rectangle76:setName("rectangle76");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle76);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(18);
    obj.layout42:setName("layout42");

    obj.pericia2 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia2:setParent(obj.layout42);
    obj.pericia2:setAlign("client");
    obj.pericia2:setMode("fit");
    obj.pericia2:setName("pericia2");
    obj.pericia2:setColor("darkRed");
    obj.pericia2:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia2Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia2Tr:setParent(obj.layout42);
    obj.pericia2Tr:setAlign("client");
    obj.pericia2Tr:setName("pericia2Tr");
    obj.pericia2Tr:setField("pericia2Tr");
    obj.pericia2Tr:setFontSize(10);
    obj.pericia2Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia2Tr, "fontStyle", "bold");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle76);
    obj.label57:setAlign("left");
    obj.label57:setField("per_percepcao");
    obj.label57:setWidth(25);
    obj.label57:setMargins({left=5});
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle76);
    obj.label58:setAlign("left");
    obj.label58:setText("Percepção");
    obj.label58:setWidth(130);
    obj.label58:setMargins({left=5});
    obj.label58:setName("label58");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout40);
    obj.rectangle77:setAlign("top");
    obj.rectangle77:setHeight(30);
    obj.rectangle77:setColor("#2E2E2E");
    obj.rectangle77:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle77:setName("rectangle77");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle77);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(18);
    obj.layout43:setName("layout43");

    obj.pericia6 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia6:setParent(obj.layout43);
    obj.pericia6:setAlign("client");
    obj.pericia6:setMode("fit");
    obj.pericia6:setName("pericia6");
    obj.pericia6:setColor("darkRed");
    obj.pericia6:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia6Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia6Tr:setParent(obj.layout43);
    obj.pericia6Tr:setAlign("client");
    obj.pericia6Tr:setName("pericia6Tr");
    obj.pericia6Tr:setField("pericia6Tr");
    obj.pericia6Tr:setFontSize(10);
    obj.pericia6Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia6Tr, "fontStyle", "bold");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle77);
    obj.label59:setAlign("left");
    obj.label59:setField("per_acrobacia");
    obj.label59:setWidth(25);
    obj.label59:setMargins({left=5});
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle77);
    obj.label60:setAlign("left");
    obj.label60:setText("Acrobacia");
    obj.label60:setWidth(130);
    obj.label60:setMargins({left=5});
    obj.label60:setName("label60");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout40);
    obj.rectangle78:setAlign("top");
    obj.rectangle78:setHeight(30);
    obj.rectangle78:setColor("#2E2E2E");
    obj.rectangle78:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle78:setName("rectangle78");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle78);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(18);
    obj.layout44:setName("layout44");

    obj.pericia7 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia7:setParent(obj.layout44);
    obj.pericia7:setAlign("client");
    obj.pericia7:setMode("fit");
    obj.pericia7:setName("pericia7");
    obj.pericia7:setColor("darkRed");
    obj.pericia7:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia7Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia7Tr:setParent(obj.layout44);
    obj.pericia7Tr:setAlign("client");
    obj.pericia7Tr:setName("pericia7Tr");
    obj.pericia7Tr:setField("pericia7Tr");
    obj.pericia7Tr:setFontSize(10);
    obj.pericia7Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia7Tr, "fontStyle", "bold");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle78);
    obj.label61:setAlign("left");
    obj.label61:setField("per_atletismo");
    obj.label61:setWidth(25);
    obj.label61:setMargins({left=5});
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle78);
    obj.label62:setAlign("left");
    obj.label62:setText("Atletismo");
    obj.label62:setWidth(130);
    obj.label62:setMargins({left=5});
    obj.label62:setName("label62");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout40);
    obj.rectangle79:setAlign("top");
    obj.rectangle79:setHeight(30);
    obj.rectangle79:setColor("#2E2E2E");
    obj.rectangle79:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle79:setName("rectangle79");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle79);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(18);
    obj.layout45:setName("layout45");

    obj.pericia8 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia8:setParent(obj.layout45);
    obj.pericia8:setAlign("client");
    obj.pericia8:setMode("fit");
    obj.pericia8:setName("pericia8");
    obj.pericia8:setColor("darkRed");
    obj.pericia8:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia8Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia8Tr:setParent(obj.layout45);
    obj.pericia8Tr:setAlign("client");
    obj.pericia8Tr:setName("pericia8Tr");
    obj.pericia8Tr:setField("pericia8Tr");
    obj.pericia8Tr:setFontSize(10);
    obj.pericia8Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia8Tr, "fontStyle", "bold");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle79);
    obj.label63:setAlign("left");
    obj.label63:setField("per_conhecimento");
    obj.label63:setWidth(25);
    obj.label63:setMargins({left=5});
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle79);
    obj.label64:setAlign("left");
    obj.label64:setText("Conhecimento");
    obj.label64:setWidth(130);
    obj.label64:setMargins({left=5});
    obj.label64:setName("label64");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout40);
    obj.rectangle80:setAlign("top");
    obj.rectangle80:setHeight(30);
    obj.rectangle80:setColor("#2E2E2E");
    obj.rectangle80:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle80:setName("rectangle80");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle80);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(18);
    obj.layout46:setName("layout46");

    obj.pericia9 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia9:setParent(obj.layout46);
    obj.pericia9:setAlign("client");
    obj.pericia9:setMode("fit");
    obj.pericia9:setName("pericia9");
    obj.pericia9:setColor("darkRed");
    obj.pericia9:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia9Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia9Tr:setParent(obj.layout46);
    obj.pericia9Tr:setAlign("client");
    obj.pericia9Tr:setName("pericia9Tr");
    obj.pericia9Tr:setField("pericia9Tr");
    obj.pericia9Tr:setFontSize(10);
    obj.pericia9Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia9Tr, "fontStyle", "bold");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle80);
    obj.label65:setAlign("left");
    obj.label65:setField("per_diplomacia");
    obj.label65:setWidth(25);
    obj.label65:setMargins({left=5});
    obj.label65:setName("label65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle80);
    obj.label66:setAlign("left");
    obj.label66:setText("Diplomacia");
    obj.label66:setWidth(130);
    obj.label66:setMargins({left=5});
    obj.label66:setName("label66");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout40);
    obj.rectangle81:setAlign("top");
    obj.rectangle81:setHeight(30);
    obj.rectangle81:setColor("#2E2E2E");
    obj.rectangle81:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle81:setName("rectangle81");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle81);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(18);
    obj.layout47:setName("layout47");

    obj.pericia10 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia10:setParent(obj.layout47);
    obj.pericia10:setAlign("client");
    obj.pericia10:setMode("fit");
    obj.pericia10:setName("pericia10");
    obj.pericia10:setColor("darkRed");
    obj.pericia10:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia10Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia10Tr:setParent(obj.layout47);
    obj.pericia10Tr:setAlign("client");
    obj.pericia10Tr:setName("pericia10Tr");
    obj.pericia10Tr:setField("pericia10Tr");
    obj.pericia10Tr:setFontSize(10);
    obj.pericia10Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia10Tr, "fontStyle", "bold");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle81);
    obj.label67:setAlign("left");
    obj.label67:setField("per_enganacao");
    obj.label67:setWidth(25);
    obj.label67:setMargins({left=5});
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle81);
    obj.label68:setAlign("left");
    obj.label68:setText("Enganação");
    obj.label68:setWidth(130);
    obj.label68:setMargins({left=5});
    obj.label68:setName("label68");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout40);
    obj.rectangle82:setAlign("top");
    obj.rectangle82:setHeight(30);
    obj.rectangle82:setColor("#2E2E2E");
    obj.rectangle82:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle82:setName("rectangle82");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle82);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(18);
    obj.layout48:setName("layout48");

    obj.pericia11 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia11:setParent(obj.layout48);
    obj.pericia11:setAlign("client");
    obj.pericia11:setMode("fit");
    obj.pericia11:setName("pericia11");
    obj.pericia11:setColor("darkRed");
    obj.pericia11:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia11Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia11Tr:setParent(obj.layout48);
    obj.pericia11Tr:setAlign("client");
    obj.pericia11Tr:setName("pericia11Tr");
    obj.pericia11Tr:setField("pericia11Tr");
    obj.pericia11Tr:setFontSize(10);
    obj.pericia11Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia11Tr, "fontStyle", "bold");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle82);
    obj.label69:setAlign("left");
    obj.label69:setField("per_furtividade");
    obj.label69:setWidth(25);
    obj.label69:setMargins({left=5});
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle82);
    obj.label70:setAlign("left");
    obj.label70:setText("Furtividade");
    obj.label70:setWidth(130);
    obj.label70:setMargins({left=5});
    obj.label70:setName("label70");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout40);
    obj.rectangle83:setAlign("top");
    obj.rectangle83:setHeight(30);
    obj.rectangle83:setColor("#2E2E2E");
    obj.rectangle83:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle83:setName("rectangle83");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle83);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(18);
    obj.layout49:setName("layout49");

    obj.pericia12 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia12:setParent(obj.layout49);
    obj.pericia12:setAlign("client");
    obj.pericia12:setMode("fit");
    obj.pericia12:setName("pericia12");
    obj.pericia12:setColor("darkRed");
    obj.pericia12:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia12Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia12Tr:setParent(obj.layout49);
    obj.pericia12Tr:setAlign("client");
    obj.pericia12Tr:setName("pericia12Tr");
    obj.pericia12Tr:setField("pericia12Tr");
    obj.pericia12Tr:setFontSize(10);
    obj.pericia12Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia12Tr, "fontStyle", "bold");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle83);
    obj.label71:setAlign("left");
    obj.label71:setField("per_guerra");
    obj.label71:setWidth(25);
    obj.label71:setMargins({left=5});
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle83);
    obj.label72:setAlign("left");
    obj.label72:setText("Guerra");
    obj.label72:setWidth(130);
    obj.label72:setMargins({left=5});
    obj.label72:setName("label72");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout40);
    obj.rectangle84:setAlign("top");
    obj.rectangle84:setHeight(30);
    obj.rectangle84:setColor("#2E2E2E");
    obj.rectangle84:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle84:setName("rectangle84");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle84);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(18);
    obj.layout50:setName("layout50");

    obj.pericia13 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia13:setParent(obj.layout50);
    obj.pericia13:setAlign("client");
    obj.pericia13:setMode("fit");
    obj.pericia13:setName("pericia13");
    obj.pericia13:setColor("darkRed");
    obj.pericia13:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia13Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia13Tr:setParent(obj.layout50);
    obj.pericia13Tr:setAlign("client");
    obj.pericia13Tr:setName("pericia13Tr");
    obj.pericia13Tr:setField("pericia13Tr");
    obj.pericia13Tr:setFontSize(10);
    obj.pericia13Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia13Tr, "fontStyle", "bold");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle84);
    obj.label73:setAlign("left");
    obj.label73:setField("per_intimidacao");
    obj.label73:setWidth(25);
    obj.label73:setMargins({left=5});
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle84);
    obj.label74:setAlign("left");
    obj.label74:setText("Intimidação");
    obj.label74:setWidth(130);
    obj.label74:setMargins({left=5});
    obj.label74:setName("label74");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout40);
    obj.rectangle85:setAlign("top");
    obj.rectangle85:setHeight(30);
    obj.rectangle85:setColor("#2E2E2E");
    obj.rectangle85:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle85:setName("rectangle85");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle85);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(18);
    obj.layout51:setName("layout51");

    obj.pericia14 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia14:setParent(obj.layout51);
    obj.pericia14:setAlign("client");
    obj.pericia14:setMode("fit");
    obj.pericia14:setName("pericia14");
    obj.pericia14:setColor("darkRed");
    obj.pericia14:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia14Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia14Tr:setParent(obj.layout51);
    obj.pericia14Tr:setAlign("client");
    obj.pericia14Tr:setName("pericia14Tr");
    obj.pericia14Tr:setField("pericia14Tr");
    obj.pericia14Tr:setFontSize(10);
    obj.pericia14Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia14Tr, "fontStyle", "bold");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle85);
    obj.label75:setAlign("left");
    obj.label75:setField("per_sobrevivencia");
    obj.label75:setWidth(25);
    obj.label75:setMargins({left=5});
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle85);
    obj.label76:setAlign("left");
    obj.label76:setText("Sobrevivencia");
    obj.label76:setWidth(130);
    obj.label76:setMargins({left=5});
    obj.label76:setName("label76");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle37);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(165);
    obj.layout52:setName("layout52");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout52);
    obj.rectangle86:setAlign("top");
    obj.rectangle86:setHeight(30);
    obj.rectangle86:setColor("#2E2E2E");
    obj.rectangle86:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle86:setMargins({bottom=10});
    obj.rectangle86:setName("rectangle86");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle86);
    obj.label77:setAlign("client");
    obj.label77:setText("Pericias Combate");
    obj.label77:setMargins({left=5});
    obj.label77:setName("label77");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout52);
    obj.rectangle87:setAlign("top");
    obj.rectangle87:setHeight(30);
    obj.rectangle87:setColor("#2E2E2E");
    obj.rectangle87:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle87:setName("rectangle87");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle87);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(18);
    obj.layout53:setName("layout53");

    obj.pericia3 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia3:setParent(obj.layout53);
    obj.pericia3:setAlign("client");
    obj.pericia3:setMode("fit");
    obj.pericia3:setName("pericia3");
    obj.pericia3:setColor("darkRed");
    obj.pericia3:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia3Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia3Tr:setParent(obj.layout53);
    obj.pericia3Tr:setAlign("client");
    obj.pericia3Tr:setName("pericia3Tr");
    obj.pericia3Tr:setField("pericia3Tr");
    obj.pericia3Tr:setFontSize(10);
    obj.pericia3Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia3Tr, "fontStyle", "bold");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle87);
    obj.label78:setAlign("left");
    obj.label78:setField("per_fortitude");
    obj.label78:setWidth(25);
    obj.label78:setMargins({left=5});
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle87);
    obj.label79:setAlign("left");
    obj.label79:setText("Fortitude");
    obj.label79:setWidth(130);
    obj.label79:setMargins({left=5});
    obj.label79:setName("label79");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout52);
    obj.rectangle88:setAlign("top");
    obj.rectangle88:setHeight(30);
    obj.rectangle88:setColor("#2E2E2E");
    obj.rectangle88:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle88:setName("rectangle88");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle88);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(18);
    obj.layout54:setName("layout54");

    obj.pericia4 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia4:setParent(obj.layout54);
    obj.pericia4:setAlign("client");
    obj.pericia4:setMode("fit");
    obj.pericia4:setName("pericia4");
    obj.pericia4:setColor("darkRed");
    obj.pericia4:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia4Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia4Tr:setParent(obj.layout54);
    obj.pericia4Tr:setAlign("client");
    obj.pericia4Tr:setName("pericia4Tr");
    obj.pericia4Tr:setField("pericia4Tr");
    obj.pericia4Tr:setFontSize(10);
    obj.pericia4Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia4Tr, "fontStyle", "bold");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle88);
    obj.label80:setAlign("left");
    obj.label80:setField("per_reflexo");
    obj.label80:setWidth(25);
    obj.label80:setMargins({left=5});
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.rectangle88);
    obj.label81:setAlign("left");
    obj.label81:setText("Reflexo");
    obj.label81:setWidth(130);
    obj.label81:setMargins({left=5});
    obj.label81:setName("label81");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout52);
    obj.rectangle89:setAlign("top");
    obj.rectangle89:setHeight(30);
    obj.rectangle89:setColor("#2E2E2E");
    obj.rectangle89:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle89:setMargins({bottom=10});
    obj.rectangle89:setName("rectangle89");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle89);
    obj.layout55:setAlign("left");
    obj.layout55:setWidth(18);
    obj.layout55:setName("layout55");

    obj.pericia5 = GUI.fromHandle(_obj_newObject("path"));
    obj.pericia5:setParent(obj.layout55);
    obj.pericia5:setAlign("client");
    obj.pericia5:setMode("fit");
    obj.pericia5:setName("pericia5");
    obj.pericia5:setColor("darkRed");
    obj.pericia5:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.pericia5Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.pericia5Tr:setParent(obj.layout55);
    obj.pericia5Tr:setAlign("client");
    obj.pericia5Tr:setName("pericia5Tr");
    obj.pericia5Tr:setField("pericia5Tr");
    obj.pericia5Tr:setFontSize(10);
    obj.pericia5Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.pericia5Tr, "fontStyle", "bold");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.rectangle89);
    obj.label82:setAlign("left");
    obj.label82:setField("per_vontade");
    obj.label82:setWidth(25);
    obj.label82:setMargins({left=5});
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle89);
    obj.label83:setAlign("left");
    obj.label83:setText("Vontade");
    obj.label83:setWidth(130);
    obj.label83:setMargins({left=5});
    obj.label83:setName("label83");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout52);
    obj.rectangle90:setAlign("top");
    obj.rectangle90:setHeight(30);
    obj.rectangle90:setColor("#2E2E2E");
    obj.rectangle90:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle90:setName("rectangle90");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle90);
    obj.layout56:setAlign("left");
    obj.layout56:setWidth(18);
    obj.layout56:setName("layout56");

    obj.armas1 = GUI.fromHandle(_obj_newObject("path"));
    obj.armas1:setParent(obj.layout56);
    obj.armas1:setAlign("client");
    obj.armas1:setMode("fit");
    obj.armas1:setName("armas1");
    obj.armas1:setColor("darkRed");
    obj.armas1:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.armas1Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.armas1Tr:setParent(obj.layout56);
    obj.armas1Tr:setAlign("client");
    obj.armas1Tr:setName("armas1Tr");
    obj.armas1Tr:setField("armas1Tr");
    obj.armas1Tr:setFontSize(10);
    obj.armas1Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.armas1Tr, "fontStyle", "bold");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.rectangle90);
    obj.label84:setAlign("left");
    obj.label84:setField("per_CA");
    obj.label84:setWidth(25);
    obj.label84:setMargins({left=5});
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle90);
    obj.label85:setAlign("left");
    obj.label85:setText("Esquiva");
    obj.label85:setWidth(130);
    obj.label85:setMargins({left=5});
    obj.label85:setName("label85");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout52);
    obj.rectangle91:setAlign("top");
    obj.rectangle91:setHeight(30);
    obj.rectangle91:setColor("#2E2E2E");
    obj.rectangle91:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle91:setName("rectangle91");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle91);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(18);
    obj.layout57:setName("layout57");

    obj.armas2 = GUI.fromHandle(_obj_newObject("path"));
    obj.armas2:setParent(obj.layout57);
    obj.armas2:setAlign("client");
    obj.armas2:setMode("fit");
    obj.armas2:setName("armas2");
    obj.armas2:setColor("darkRed");
    obj.armas2:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.armas2Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.armas2Tr:setParent(obj.layout57);
    obj.armas2Tr:setAlign("client");
    obj.armas2Tr:setName("armas2Tr");
    obj.armas2Tr:setField("armas2Tr");
    obj.armas2Tr:setFontSize(10);
    obj.armas2Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.armas2Tr, "fontStyle", "bold");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle91);
    obj.label86:setAlign("left");
    obj.label86:setField("per_desarmado");
    obj.label86:setWidth(25);
    obj.label86:setMargins({left=5});
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle91);
    obj.label87:setAlign("left");
    obj.label87:setText("Desarmado");
    obj.label87:setWidth(130);
    obj.label87:setMargins({left=5});
    obj.label87:setName("label87");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout52);
    obj.rectangle92:setAlign("top");
    obj.rectangle92:setHeight(30);
    obj.rectangle92:setColor("#2E2E2E");
    obj.rectangle92:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle92:setName("rectangle92");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle92);
    obj.layout58:setAlign("left");
    obj.layout58:setWidth(18);
    obj.layout58:setName("layout58");

    obj.armas3 = GUI.fromHandle(_obj_newObject("path"));
    obj.armas3:setParent(obj.layout58);
    obj.armas3:setAlign("client");
    obj.armas3:setMode("fit");
    obj.armas3:setName("armas3");
    obj.armas3:setColor("darkRed");
    obj.armas3:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.armas3Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.armas3Tr:setParent(obj.layout58);
    obj.armas3Tr:setAlign("client");
    obj.armas3Tr:setName("armas3Tr");
    obj.armas3Tr:setField("armas3Tr");
    obj.armas3Tr:setFontSize(10);
    obj.armas3Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.armas3Tr, "fontStyle", "bold");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.rectangle92);
    obj.label88:setAlign("left");
    obj.label88:setField("per_armasBrancas");
    obj.label88:setWidth(25);
    obj.label88:setMargins({left=5});
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.rectangle92);
    obj.label89:setAlign("left");
    obj.label89:setText("Armas Brancas");
    obj.label89:setWidth(130);
    obj.label89:setMargins({left=5});
    obj.label89:setName("label89");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout52);
    obj.rectangle93:setAlign("top");
    obj.rectangle93:setHeight(30);
    obj.rectangle93:setColor("#2E2E2E");
    obj.rectangle93:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle93:setName("rectangle93");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle93);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(18);
    obj.layout59:setName("layout59");

    obj.armas4 = GUI.fromHandle(_obj_newObject("path"));
    obj.armas4:setParent(obj.layout59);
    obj.armas4:setAlign("client");
    obj.armas4:setMode("fit");
    obj.armas4:setName("armas4");
    obj.armas4:setColor("darkRed");
    obj.armas4:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.armas4Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.armas4Tr:setParent(obj.layout59);
    obj.armas4Tr:setAlign("client");
    obj.armas4Tr:setName("armas4Tr");
    obj.armas4Tr:setField("armas4Tr");
    obj.armas4Tr:setFontSize(10);
    obj.armas4Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.armas4Tr, "fontStyle", "bold");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.rectangle93);
    obj.label90:setAlign("left");
    obj.label90:setField("per_pistolas");
    obj.label90:setWidth(25);
    obj.label90:setMargins({left=5});
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.rectangle93);
    obj.label91:setAlign("left");
    obj.label91:setText("Pistolas");
    obj.label91:setWidth(130);
    obj.label91:setMargins({left=5});
    obj.label91:setName("label91");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout52);
    obj.rectangle94:setAlign("top");
    obj.rectangle94:setHeight(30);
    obj.rectangle94:setColor("#2E2E2E");
    obj.rectangle94:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle94:setName("rectangle94");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle94);
    obj.layout60:setAlign("left");
    obj.layout60:setWidth(18);
    obj.layout60:setName("layout60");

    obj.armas5 = GUI.fromHandle(_obj_newObject("path"));
    obj.armas5:setParent(obj.layout60);
    obj.armas5:setAlign("client");
    obj.armas5:setMode("fit");
    obj.armas5:setName("armas5");
    obj.armas5:setColor("darkRed");
    obj.armas5:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.armas5Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.armas5Tr:setParent(obj.layout60);
    obj.armas5Tr:setAlign("client");
    obj.armas5Tr:setName("armas5Tr");
    obj.armas5Tr:setField("armas5Tr");
    obj.armas5Tr:setFontSize(10);
    obj.armas5Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.armas5Tr, "fontStyle", "bold");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle94);
    obj.label92:setAlign("left");
    obj.label92:setField("per_Espingardas");
    obj.label92:setWidth(25);
    obj.label92:setMargins({left=5});
    obj.label92:setName("label92");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.rectangle94);
    obj.label93:setAlign("left");
    obj.label93:setText("Espingardas");
    obj.label93:setWidth(130);
    obj.label93:setMargins({left=5});
    obj.label93:setName("label93");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout52);
    obj.rectangle95:setAlign("top");
    obj.rectangle95:setHeight(30);
    obj.rectangle95:setColor("#2E2E2E");
    obj.rectangle95:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle95:setName("rectangle95");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle95);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(18);
    obj.layout61:setName("layout61");

    obj.armas6 = GUI.fromHandle(_obj_newObject("path"));
    obj.armas6:setParent(obj.layout61);
    obj.armas6:setAlign("client");
    obj.armas6:setMode("fit");
    obj.armas6:setName("armas6");
    obj.armas6:setColor("darkRed");
    obj.armas6:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.armas6Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.armas6Tr:setParent(obj.layout61);
    obj.armas6Tr:setAlign("client");
    obj.armas6Tr:setName("armas6Tr");
    obj.armas6Tr:setField("armas6Tr");
    obj.armas6Tr:setFontSize(10);
    obj.armas6Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.armas6Tr, "fontStyle", "bold");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.rectangle95);
    obj.label94:setAlign("left");
    obj.label94:setField("per_Metralhadoras");
    obj.label94:setWidth(25);
    obj.label94:setMargins({left=5});
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle95);
    obj.label95:setAlign("left");
    obj.label95:setText("Metralhadoras");
    obj.label95:setWidth(130);
    obj.label95:setMargins({left=5});
    obj.label95:setName("label95");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout52);
    obj.rectangle96:setAlign("top");
    obj.rectangle96:setHeight(30);
    obj.rectangle96:setColor("#2E2E2E");
    obj.rectangle96:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle96:setName("rectangle96");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle96);
    obj.layout62:setAlign("left");
    obj.layout62:setWidth(18);
    obj.layout62:setName("layout62");

    obj.armas7 = GUI.fromHandle(_obj_newObject("path"));
    obj.armas7:setParent(obj.layout62);
    obj.armas7:setAlign("client");
    obj.armas7:setMode("fit");
    obj.armas7:setName("armas7");
    obj.armas7:setColor("darkRed");
    obj.armas7:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.armas7Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.armas7Tr:setParent(obj.layout62);
    obj.armas7Tr:setAlign("client");
    obj.armas7Tr:setName("armas7Tr");
    obj.armas7Tr:setField("armas7Tr");
    obj.armas7Tr:setFontSize(10);
    obj.armas7Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.armas7Tr, "fontStyle", "bold");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.rectangle96);
    obj.label96:setAlign("left");
    obj.label96:setField("per_rifles");
    obj.label96:setWidth(25);
    obj.label96:setMargins({left=5});
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle96);
    obj.label97:setAlign("left");
    obj.label97:setText("Rifles");
    obj.label97:setWidth(130);
    obj.label97:setMargins({left=5});
    obj.label97:setName("label97");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout52);
    obj.rectangle97:setAlign("top");
    obj.rectangle97:setHeight(30);
    obj.rectangle97:setColor("#2E2E2E");
    obj.rectangle97:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle97:setName("rectangle97");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle97);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(18);
    obj.layout63:setName("layout63");

    obj.armas8 = GUI.fromHandle(_obj_newObject("path"));
    obj.armas8:setParent(obj.layout63);
    obj.armas8:setAlign("client");
    obj.armas8:setMode("fit");
    obj.armas8:setName("armas8");
    obj.armas8:setColor("darkRed");
    obj.armas8:setPathData("M100 10 L200 10 L240 60 L240 140 L200 190 L100 190 L60 140 L60 60 Z");

    obj.armas8Tr = GUI.fromHandle(_obj_newObject("label"));
    obj.armas8Tr:setParent(obj.layout63);
    obj.armas8Tr:setAlign("client");
    obj.armas8Tr:setName("armas8Tr");
    obj.armas8Tr:setField("armas8Tr");
    obj.armas8Tr:setFontSize(10);
    obj.armas8Tr:setHorzTextAlign("center");
    lfm_setPropAsString(obj.armas8Tr, "fontStyle", "bold");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle97);
    obj.label98:setAlign("left");
    obj.label98:setField("per_explosivos");
    obj.label98:setWidth(25);
    obj.label98:setMargins({left=5});
    obj.label98:setName("label98");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle97);
    obj.label99:setAlign("left");
    obj.label99:setText("Explosivos");
    obj.label99:setWidth(130);
    obj.label99:setMargins({left=5});
    obj.label99:setName("label99");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            sheet.nodes = sheet.nodes or {}
            
                  for i = 1, 20 do
            
                  if sheet["ficha" .. i .. "tipo"] == "Classe" then
                  self['ficha' .. i .. 'layout'].height = 115
                  self['ficha' .. i].visible = true
                  end
            
                  end
            
                  calcularTalentos()
            
                  self.modalAcoes:show()
        end);

    obj._e_event1 = obj.button6:addEventListener("onClick",
        function (event)
            sheet["ficha" .. sheet.numeroTalento .. "nome"] = sheet.nomeTalento
                            sheet["ficha" .. sheet.numeroTalento .. "tipo"] = sheet.tipoTalento
                            
                            sheet.nodes[sheet.numeroTalento] = {
                            nome = sheet.nomeTalento,
                            tipo = sheet.tipoTalento,
                            tracos = sheet.tracosTalento,
                            requisito = sheet.requisitoTalento,
                            descricao = sheet.descricaoTalento,
                            plus = ". . ."
                            }
                            
                            if sheet.tipoTalento == "Classe" then
                            self['ficha' .. sheet.numeroTalento .. 'layout'].height = 115
                            self['ficha' .. sheet.numeroTalento].visible = true
                            end
                            
                            calcularTalentos()
                            
                            self.modal:close()
        end);

    obj._e_event2 = obj.modalLevel1:addEventListener("onClose",
        function (canceled)
            local att = {
                          forca = 0,
                          destreza = 0,
                          constituicao = 0,
                          inteligencia = 0,
                          sabedoria = 0,
                          carisma = 0
                          }
            
                          for idx = 1, 6 do
            
                          if sheet['level1Attr' .. idx] ~= nil then
            
                          if sheet['level1Attr' .. idx] == 'Força' then
                          att.forca = att.forca + 1
                          elseif sheet['level1Attr' .. idx] == 'Destreza' then
                          att.destreza = att.destreza + 1
                          elseif sheet['level1Attr' .. idx] == 'Constituição' then
                          att.constituicao = att.constituicao + 1
                          elseif sheet['level1Attr' .. idx] == 'Inteligência' then
                          att.inteligencia = att.inteligencia + 1
                          elseif sheet['level1Attr' .. idx] == 'Sabedoria' then
                          att.sabedoria = att.sabedoria + 1
                          elseif sheet['level1Attr' .. idx] == 'Carisma' then
                          att.carisma = att.carisma + 1
            
                          end
            
                          end
            
                          end
            
                          local function criarLabelLv1()
            
                          local msg = ""
            
                          if att.forca > 0 then
                          msg = msg .. " For " .. att.forca
                          end
            
                          if att.destreza > 0 then
                          msg = msg .. " Des " .. att.destreza
                          end
            
                          if att.constituicao > 0 then
                          msg = msg .. " Con " .. att.constituicao
                          end
            
                          if att.inteligencia > 0 then
                          msg = msg .. " Int " .. att.inteligencia
                          end
            
                          if att.sabedoria > 0 then
                          msg = msg .. " Sab " .. att.sabedoria
                          end
            
                          if att.carisma > 0 then
                          msg = msg .. " Car " .. att.carisma
                          end
            
                          return msg
            
                          end
            
            
                          sheet.level1Titulo = criarLabelLv1()
            
                          calcularTalentos()
            
                          self.modalLevel1Pericias:show()
        end);

    obj._e_event3 = obj.modalLevel1Pericias:addEventListener("onResize",
        function ()
            local pericias = {
                          "Iniciativa", "Percepção", "Fortitude", "Reflexos", "Vontade",
                          "Acrobacia", "Atletismo", "Conhecimento", "Diplomacia", "Enganação",
                          "Furtividade", "Guerra", "Intimidação", "Sobrevivencia"
                          }
            
                          -- Remove os retângulos antigos
                          for _, child in ipairs(self.modalPericiasBar:getChildren()) do
                          child:destroy()
                          end
            
                          -- Inicializa tabela de controle
                          self.rectanglesPericias = {}
                          sheet.modalPericias = sheet.modalPericias or {}
            
                          for i = 1, #pericias, 1 do
                          local tag = sheet["pericia" .. i .. "Tr"]
                          if tag == "D" or tag == "T" then
                          local rectangle = GUI.newRectangle()
                          rectangle.align = "top"
                          rectangle.height = 30
                          rectangle.color = "#3A3A3A"
                          rectangle.name = "rectangle" .. i
                          rectangle.padding = {left=5, right=5, top=5, bottom=5}
                          rectangle.margins = {top=5, bottom=5}
                          rectangle.parent = self.modalPericiasBar
            
                          self.rectanglesPericias[i] = rectangle -- salva para acesso depois
            
                          local idx = i -- escopo correto
                          rectangle.onClick = function()
                          if sheet.modalPericias[idx] == false or sheet.modalPericias[idx] == nil then
                          if sheet.modalPericiasTotal > 0 then
                          sheet.modalPericiasTotal = sheet.modalPericiasTotal - 1
                          sheet.modalPericias[idx] = true
                          rectangle.color = "green"
                          if sheet["pericia" .. idx .. "Tr"] == "D" then
                          sheet["pericia" .. idx .. "Tr"] = "T"
                          end
            
                          end
                          else
                          sheet.modalPericiasTotal = sheet.modalPericiasTotal + 1
                          sheet.modalPericias[idx] = false
                          rectangle.color = "#3A3A3A"
                          if sheet["pericia" .. i .. "Tr"] == "T" then
                          sheet["pericia" .. i .. "Tr"] = "D"
                          end
                          end
                          calcularTalentos()
                          end
            
                          local label = GUI.newLabel()
                          label.text = pericias[i]
                          label.align = "client"
                          label.horzTextAlign = "center"
                          label.parent = rectangle
                          end
                          end
            
                          -- Atualiza cores e total
                          local periciasComputadas = {}
                          for i = 1, #pericias do
                          if sheet.modalPericias[i] then
                          local rect = self.rectanglesPericias[i]
                          if rect then
                          rect.color = "green"
                          end
                          table.insert(periciasComputadas, pericias[i])
                          end
                          end
            
                          sheet.modalPericiasTotal = 6 - #periciasComputadas
        end);

    obj._e_event4 = obj.modalLevel1Pericias:addEventListener("onClose",
        function (canceled)
            calcularTalentos()
            
                          self.modalTreinamentoLevel1:show()
        end);

    obj._e_event5 = obj.modalTreinamentoLevel1:addEventListener("onResize",
        function ()
            -- desarmado, armasBrancas, pistolas, espingardas, metralhadoras, rifles, explosivos
                          local armas = {
                          "Esquiva","Desarmado", "Armas Brancas", "Pistolas", "Espingardas", "Metralhadoras", "Rifles",
                          "Explosivos"
                          }
            
                          -- Remove os retângulos antigos
                          for _, child in ipairs(self.modalTreinamentoBar:getChildren()) do
                          child:destroy()
                          end
            
                          -- Inicializa tabela de controle
                          self.rectanglesTreinamentos = {}
                          sheet.modalTreinamentoBar = sheet.modalTreinamentoBar or {}
            
                          for i = #armas, 1, - 1 do
                          local tag = sheet["armas" .. i .. "Tr"]
                          if tag == "D" or tag == "T" then
                          local rectangle = GUI.newRectangle()
                          rectangle.align = "top"
                          rectangle.height = 30
                          rectangle.color = "#3A3A3A"
                          rectangle.name = "rectangle" .. i
                          rectangle.padding = {left=5, right=5, top=5, bottom=5}
                          rectangle.margins = {top=5, bottom=5}
                          rectangle.parent = self.modalTreinamentoBar
            
                          self.rectanglesTreinamentos[i] = rectangle -- salva para acesso depois
            
                          local idx = i -- escopo correto
                          rectangle.onClick = function()
                          if sheet.modalTreinamentoBar[idx] == false or sheet.modalTreinamentoBar[idx] == nil
                          then
                          if sheet.modalTreinamentoBarTotal > 0 then
                          sheet.modalTreinamentoBarTotal = sheet.modalTreinamentoBarTotal - 1
                          sheet.modalTreinamentoBar[idx] = true
                          rectangle.color = "green"
                          if sheet["armas" .. idx .. "Tr"] == "D" then
                          sheet["armas" .. idx .. "Tr"] = "T"
                          end
            
                          end
                          else
                          sheet.modalTreinamentoBarTotal = sheet.modalTreinamentoBarTotal + 1
                          sheet.modalTreinamentoBar[idx] = false
                          rectangle.color = "#3A3A3A"
                          if sheet["armas" .. i .. "Tr"] == "T" then
                          sheet["armas" .. i .. "Tr"] = "D"
                          end
                          end
                          calcularTalentos()
                          end
            
                          local label = GUI.newLabel()
                          label.text = armas[i]
                          label.align = "client"
                          label.horzTextAlign = "center"
                          label.parent = rectangle
                          end
                          end
            
                          -- Atualiza cores e total
                          local periciasComputadas = {}
                          for i = 1, #armas do
                          if sheet.modalTreinamentoBar[i] then
                          local rect = self.rectanglesTreinamentos[i]
                          if rect then
                          rect.color = "green"
                          end
                          table.insert(periciasComputadas, armas[i])
                          end
                          end
            
                          sheet.modalTreinamentoBarTotal = 2 - #periciasComputadas
        end);

    obj._e_event6 = obj.modalArmas:addEventListener("onResize",
        function ()
            require("utils.lua");
                          require("gui.lua");
                          local mesa = Firecast.getRoomOf(sheet);
                          local chat = mesa.chat;
                          local xml = NDB.load("armasLista.xml");
                          local arrayArmas = NDB.getChildNodes(xml);
                          local primeiraArma
            
                          local function atualizarLayout(modal)
            
                          local modal = modal or self.caracteristicasArmasBar:getChildren()
                          for j = 1, #modal, 1 do
            
                          if modal[j] ~= nil then
                          local text = modal[j]:getChildren()[1].text:gsub("([^%s]+)", "%1 ")
                          local textWidth = math.max(text:len() * 7.4, 65) -- 60 é o mínimo, ajuste como
                          modal[j].width = textWidth
                          end
            
                          end
            
                          end
            
                          armas = {} -- new array
                          nomesArmas = {} -- new array
            
                          for i = 1, #arrayArmas, 1 do
                          armas[i] = xml["f" .. i]
                          nomesArmas[i] = xml["f" .. i].nome
                          end
            
                          table.sort(nomesArmas)
            
                          local armasAntigas = self.modalArmasBar:getChildren()
            
                          -- Remove os talentos antigos da interface
                          for k = 1, #armasAntigas, 1 do
                          armasAntigas[k]:destroy()
                          end
            
                          table.sort(armas, function(a, b) return a.apelido > b.apelido end)
            
                          -- Loop para criar os novos talentos
            
                          for k = 1, #armas, 1 do
            
                          -- Passando o valor de k diretamente para a função onClick
                          local container = GUI.newRectangle()
                          container.align = "top"
                          container.height = 30
                          container.color = "black"
                          container.padding = {left=5, right=5, top=5, bottom=5}
                          container.parent = self.modalArmasBar -- substitua pelo pai
            
                          container.onClick = function()
                          local armasRectangles = self.modalArmasBar:getChildren()
            
                          -- Desmarcar talentos antigos
                          for x = 1, #armasRectangles, 1 do
                          armasRectangles[x].strokeSize = 0
                          end
            
                          -- Marcar o talento selecionado
                          container.strokeSize = 1
                          container.strokeColor = "#00CFFF"
                          sheet.imgArmaModal = "imgs/armas/" .. armas[k].nome .. ".png"
                          sheet.nomeArmaModal = armas[k].nome
                          sheet.apelidoArmaModal = armas[k].apelido
                          sheet.danoArmaModal = armas[k].dano
                          sheet.modoArmaModal = armas[k].modos
                          sheet.municaoArmaModal = armas[k].municao
                          sheet.miraArmaModal = armas[k].mira
                          sheet.durabilidadeArmaModal = armas[k].durabilidade
                          sheet.requisitoArmaModal = 5
                          sheet.carregadorArmaModal = armas[k].carregador
                          sheet.descricaoArmaModal = armas[k].descricao or "Nenhum"
                          sheet.requisitoArmaModal = armas[k].requisito or "Nenhum"
                          sheet.tipoArmaModal = armas[k].tipo or "Nenhum"
                          sheet.tipoDanoArmaModal = armas[k].danoTipo or "Nenhum"
                          sheet.tracoArmaModal = armas[k].tracos
                          sheet.precoArmaModal = "Preço: " .. armas[k].preco
            
                          -- Remove os traços antigos
                          local tracosArmasBar = self.tracosArmasBar:getChildren()
                          for v = 1, #tracosArmasBar, 1 do
                          tracosArmasBar[v]:destroy()
                          end
            
                          -- Remove os caracteristicas antigos
                          local caracteristicasArmasBar = self.caracteristicasArmasBar:getChildren()
                          for v = 1, #caracteristicasArmasBar, 1 do
                          caracteristicasArmasBar[v]:destroy()
                          end
            
            
                          -- Loop para adicionar os traços do talento
                          local tracosArmas = {armas[k].tipo, armas[k].apelido, armas[k].danoTipo}
                          for j = 1, #tracosArmas, 1 do
            
                          local text = armas[k].apelido:gsub("([^%s]+)", "%1 ")
                          local textWidth = math.max(text:len() * 7, 80) -- 60 é o mínimo, ajuste como
                          local containerTraco = GUI.newRectangle()
                          containerTraco.align = "left"
                          containerTraco.color = "darkRed"
                          containerTraco.width = textWidth
                          containerTraco.height = 20
                          containerTraco.padding = {left=5, top=5, right=5, bottom=5}
                          containerTraco.margins = {left=5}
                          containerTraco.parent = self.tracosArmasBar
            
                          local label = GUI.newLabel()
                          label.align = "client"
                          label.text = tracosArmas[j]
                          label.horzTextAlign = "center"
                          label.parent = containerTraco
            
                          containerTraco["g-dyn-width-txt"] = true
                          end
            
                          -- Loop para adicionar os caracteristicas do talento
                          local caracteristicasArmas = {armas[k].alcance, armas[k].dano,
                          armas[k].municao, armas[k].mira, armas[k].modos, armas[k].carregador,
                          armas[k].capacidade}
            
                          for j = 1, #caracteristicasArmas, 1 do
            
                          local text = armas[k].apelido:gsub("([^%s]+)", "%1 ")
                          local textWidth = math.max(text:len() * 7, 80) -- 60 é o mínimo, ajuste como
                          local containerTraco = GUI.newRectangle()
                          containerTraco.align = "left"
                          containerTraco.color = "#00008B"
                          containerTraco.width = textWidth
                          containerTraco.height = 20
                          containerTraco.padding = {left=5, top=5, right=5, bottom=5}
                          containerTraco.margins = {left=5}
                          containerTraco.parent = self.caracteristicasArmasBar
            
                          local label = GUI.newLabel()
                          label.align = "client"
                          label.text = caracteristicasArmas[j]
                          label.horzTextAlign = "center"
                          label.parent = containerTraco
            
                          containerTraco["g-dyn-width-txt"] = true
                          end
            
                          atualizarLayout()
                          atualizarLayout(self.tracosArmasBar:getChildren())
            
                          end
            
                          -- Margens
                          if k <= #armas then
                          container.margins = {bottom=5}
                          end
            
                          -- Criar Item Modal
                          local label = GUI.newLabel()
                          label.align = "left"
                          label.width = 200
                          label.text = armas[k].apelido
                          label.parent = container
            
                          local levelBox = GUI.newRectangle()
                          levelBox.align = "right"
                          levelBox.width = 90
                          levelBox.color = "darkRed"
                          levelBox.padding = {left=5, right=5, top=5, bottom=5}
                          levelBox.parent = container
            
                          local levelLabel = GUI.newLabel()
                          levelLabel.align = "client"
                          levelLabel.g = "col"
                          levelLabel["g-dyn-width-txt"] = true
                          levelLabel.horzTextAlign = "center"
                          levelLabel.text = armas[k].tipo
                          levelLabel.parent = levelBox
            
                          end
            
                          sheet.imgArmaModal = "imgs/armas/" .. "ak47" .. ".png"
                          sheet.apelidoArmaModal = armas[1].apelido
                          sheet.nomeArmaModal = armas[1].nome
                          sheet.requisitoArmaModal = 5
                          sheet.descricaoArmaModal = armas[1].descricao or "Nenhum"
                          sheet.requisitoArmaModal = armas[1].requisito or "Nenhum"
                          sheet.tipoArmaModal = armas[1].tipo or "Nenhum"
                          sheet.modosArmaModal = armas[1].modos
                          sheet.tipoDanoArmaModal = armas[1].danoTipo or "Nenhum"
                          sheet.tracoArmaModal = armas[1].tracos
                          sheet.alcanceArmaModal = armas[1].alcance
                          sheet.caracteristicasArmaModal = armas[1].caracteristicas
                          sheet.precoArmaModal = "Preço: " .. armas[1].preco
        end);

    obj._e_event7 = obj.caracteristicasArmasBar:addEventListener("onAfterLayoutCalc",
        function ()
        end);

    obj._e_event8 = obj.button10:addEventListener("onClick",
        function (event)
            calcularTalentos()
                                        self.inventarioRcl:append()
                                        self.modalArmas:close()
        end);

    obj._e_event9 = obj.rectangle35:addEventListener("onClick",
        function (event)
            self.modalAcoes:close()
                                        self.modalAcoesLivres:show()
        end);

    obj._e_event10 = obj.rectangle36:addEventListener("onClick",
        function (event)
            self.modalAcoes:close()
                                        self.modalAcoesAtributos:show()
        end);

    obj._e_event11 = obj.modalAcoesAtributos:addEventListener("onCalculateSize",
        function (dueToResize, width, height)
            local atributos = {
                          "Força", "Destreza", "Constituição", "Inteligência", "Sabedoria", "Carisma"
                          }
            
                          local cores = {
                          "red", "green", "Sienna", "blue", "purple", "GoldenRod"
                          }
            
                          local cores2 = {
                                 "#8B0000",       -- vermelho escuro
                                 "#006400",     -- verde escuro
                                 "#80411F",      -- cinza escuro
                                 "#00008B",      -- azul escuro
                                 "#4B004B",    -- roxo escuro
                                 "#8B8000"     -- amarelo escuro
                               }
                               
            
                          -- Remove os retângulos antigos
                          for _, child in ipairs(self.acoesAtributosBar:getChildren()) do
                          child:destroy()
                          end
            
                          -- Inicializa tabela de controle
                          self.rectanglesPericias = {}
                          sheet.modalPericias = sheet.modalPericias or {}
            
                          local xml = NDB.load("modalAcoesLista.xml");
                          local arrayAcoes = NDB.getChildNodes(xml);
            
                          acoes = {} -- new array
                          nomesAcoes = {} -- new array
            
                          for i = 1, #arrayAcoes, 1 do
                          acoes[i] = xml["a" .. i]
                          nomesAcoes[i] = xml["a" .. i].nome
                          end
            
                          table.sort(nomesAcoes)
            
                          for j = 1, #atributos, 1 do
            
                          local rectangleLayout = GUI.newRectangle()
                          rectangleLayout.align = "top"
                          rectangleLayout.height = 30
                          rectangleLayout.color = cores[j]
                          rectangleLayout.padding = {left=10, right=10, top=5, bottom=5}
                          rectangleLayout.margins = {top=10}
                          rectangleLayout.parent = self.acoesAtributosBar
            
                          local labelNome = GUI.newLabel()
                          labelNome.text = atributos[j]
                          labelNome.align = "client"
                          labelNome.width = 220
                          labelNome.parent = rectangleLayout
            
                          for i = 1, #acoes, 1 do
            
                          if acoes[i].atr == atributos[j] then
                         
                          local rectangle = GUI.newRectangle()
                          rectangle.align = "top"
                          rectangle.height = 30
                          rectangle.name = "rectangle" .. i
                          rectangle.color = cores2[j]
                          rectangle.padding = {left=10, right=10, top=5, bottom=5}
                          rectangle.margins = {top=5}
                          rectangle.parent = self.acoesAtributosBar
                          rectangle.onClick = function()
            
                          end
            
                          local label = GUI.newLabel()
                          label.text = acoes[i].nome
                          label.align = "left"
                          label.width = 220
                          label.parent = rectangle
            
                          local label2 = GUI.newLabel()
                          label2.text = acoes[i].acoes and (acoes[i].acoes == "1" and "1 ação" or acoes[i].acoes .. " ações") or "Variável"
                          label2.width = 80
                          label2.align = "right"
                          label2.horzTextAlign = "center"
                          label2.parent = rectangle
            
                          end
                          end
            
                   end
        end);

    obj._e_event12 = obj.GGO_Base:addEventListener("onNodeReady",
        function ()
        end);

    obj._e_event13 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
        end);

    obj._e_event14 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
        end);

    obj._e_event15 = obj.rectangle38:addEventListener("onClick",
        function (event)
            self.modalLevel1:show()
        end);

    obj._e_event16 = obj.rectangle39:addEventListener("onClick",
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
                                sheet.tipoTalento = talentos[k].tipo or "Nenhum"
                                sheet.numeroTalento = 1
                                sheet.tracoTalento = talentos[k].tracos
                                
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

    obj._e_event17 = obj.ficha1:addEventListener("onClick",
        function (event)
            Dialogs.chooseMultiple("Selecione o Aumento de Atributo", {"Força", "Destreza", "Constituição", "Inteligência", "Sabedoria", "Carisma"},
                                
                                function(selected, selectedIndexes, selectedTexts)
                                
                                if selected then
                                
                                sheet["ficha" .. 1 .. "plus"] = selectedTexts[1]
                                sheet.nodes[1]["plus"] = selectedTexts[1]
                                
                                else
                                
                                sheet["ficha" .. 1 .. "plus"] = ". . ."
                                sheet.nodes[1]["plus"] = ". . ."
                                
                                end;
                                calcularTalentos()
                                end)
        end);

    obj._e_event18 = obj.rectangle41:addEventListener("onClick",
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
                                sheet.tipoTalento = talentos[k].tipo or "Nenhum"
                                sheet.numeroTalento = 2
                                sheet.tracoTalento = talentos[k].tracos
                                
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

    obj._e_event19 = obj.ficha2:addEventListener("onClick",
        function (event)
            Dialogs.chooseMultiple("Selecione o Aumento de Atributo", {"Força", "Destreza", "Constituição", "Inteligência", "Sabedoria", "Carisma"},
                                
                                function(selected, selectedIndexes, selectedTexts)
                                
                                if selected then
                                
                                sheet["ficha" .. 2 .. "plus"] = selectedTexts[1]
                                sheet.nodes[2]["plus"] = selectedTexts[1]
                                
                                else
                                
                                sheet["ficha" .. 2 .. "plus"] = ". . ."
                                sheet.nodes[2]["plus"] = ". . ."
                                
                                end;
                                calcularTalentos()
                                end)
        end);

    obj._e_event20 = obj.rectangle43:addEventListener("onClick",
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
                                sheet.tipoTalento = talentos[k].tipo or "Nenhum"
                                sheet.numeroTalento = 3
                                sheet.tracoTalento = talentos[k].tracos
                                
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

    obj._e_event21 = obj.ficha3:addEventListener("onClick",
        function (event)
            Dialogs.chooseMultiple("Selecione o Aumento de Atributo", {"Força", "Destreza", "Constituição", "Inteligência", "Sabedoria", "Carisma"},
                                
                                function(selected, selectedIndexes, selectedTexts)
                                
                                if selected then
                                
                                sheet["ficha" .. 3 .. "plus"] = selectedTexts[1]
                                sheet.nodes[3]["plus"] = selectedTexts[1]
                                
                                else
                                
                                sheet["ficha" .. 3 .. "plus"] = ". . ."
                                sheet.nodes[3]["plus"] = ". . ."
                                
                                end;
                                calcularTalentos()
                                end)
        end);

    obj._e_event22 = obj.button13:addEventListener("onClick",
        function (event)
            self.modalArmas:show()
        end);

    obj._e_event23 = obj.inventarioRcl:addEventListener("onItemAdded",
        function (node, form)
            node.caracteristicasArma = {sheet.alcanceArmaModal, sheet.miraArmaModal,
                            sheet.danoArmaModal, sheet.modosArmaModal, sheet.durabilidadeArmaModal, sheet.aprimoramentosArmaModal,
                            sheet.precoArmaModal}
                            
                            node.miraArma = "Mira: " .. sheet.miraArmaModal
                            node.danoArma = "Dano: " .. sheet.danoArmaModal
                            node.modoArma = "Modo: " .. sheet.modosArmaModal
                            node.apelidoArma = sheet.apelidoArmaModal
                            node.nomeArma = sheet.nomeArmaModal
                            node.tipoArma = sheet.tipoArmaModal
                            node.carregadorArma = "Carregador: " .. sheet.carregadorArmaModal .. " mun"
                            node.tipoDanoArma = sheet.tipoDanoArmaModal
                            node.imgArma = "imgs/armas/" .. node.nomeArma .. ".png"
                            node.alcanceArma = "Alcance: " .. sheet.alcanceArmaModal .. "m"
            
                            node.miraArma2 = sheet.miraArmaModal
                            node.danoArma2 = sheet.danoArmaModal
                            node.modoArma2 = sheet.modosArmaModal
                            node.apelidoArma2 = sheet.apelidoArmaModal
                            node.nomeArma2 = sheet.nomeArmaModal
                            node.tipoArma2 = sheet.tipoArmaModal
                            node.carregadorArma2 = sheet.carregadorArmaModal 
                            node.tipoDanoArma2 = sheet.tipoDanoArmaModal
                            node.imgArma2 = node.nomeArmaModal
                            node.alcanceArma2 = sheet.alcanceArmaModal
        end);

    obj._e_event24 = obj.pericia1Rectangle:addEventListener("onMouseEnter",
        function ()
            self.pericia1Rectangle.color = "#3A3A3A";
        end);

    obj._e_event25 = obj.pericia1Rectangle:addEventListener("onMouseLeave",
        function ()
            self.pericia1Rectangle.color = "#2E2E2E";
        end);

    obj._e_event26 = obj.pericia1Rectangle:addEventListener("onDblClick",
        function (event)
            local mesa = Firecast.getRoomOf(sheet);
                        local chat = mesa.chat;
            
                        local function treinamento(pericia)
            
                        if pericia == "D" then
                        return "Destreinado"
                        elseif pericia == "T" then
                        return "Treinado"
                        elseif pericia == "E" then
                        return "Especialista"
                        elseif pericia == "M" then
                        return "Mestre"
                        elseif pericia == "L" then
                        return "Lenda"
                        end
                        end
            
                        chat:rolarDados("1d20" .. sheet.per_iniciativa, "Iniciativa - " .. treinamento(sheet.pericia1Tr));
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
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

        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.GGO_Base ~= nil then self.GGO_Base:destroy(); self.GGO_Base = nil; end;
        if self.level1layout ~= nil then self.level1layout:destroy(); self.level1layout = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.inventarioRcl ~= nil then self.inventarioRcl:destroy(); self.inventarioRcl = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.armas1 ~= nil then self.armas1:destroy(); self.armas1 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.modalArmasBar ~= nil then self.modalArmasBar:destroy(); self.modalArmasBar = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.caracteristicasArmasBar ~= nil then self.caracteristicasArmasBar:destroy(); self.caracteristicasArmasBar = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.pericia1 ~= nil then self.pericia1:destroy(); self.pericia1 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.armas4 ~= nil then self.armas4:destroy(); self.armas4 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.tracosArmasBar ~= nil then self.tracosArmasBar:destroy(); self.tracosArmasBar = nil; end;
        if self.ficha3layout ~= nil then self.ficha3layout:destroy(); self.ficha3layout = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.ficha2 ~= nil then self.ficha2:destroy(); self.ficha2 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.pericia6 ~= nil then self.pericia6:destroy(); self.pericia6 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.modalAcoesAtributos ~= nil then self.modalAcoesAtributos:destroy(); self.modalAcoesAtributos = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.modalAcoes ~= nil then self.modalAcoes:destroy(); self.modalAcoes = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.pericia12Tr ~= nil then self.pericia12Tr:destroy(); self.pericia12Tr = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.pericia8 ~= nil then self.pericia8:destroy(); self.pericia8 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.pericia5Tr ~= nil then self.pericia5Tr:destroy(); self.pericia5Tr = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.pericia2 ~= nil then self.pericia2:destroy(); self.pericia2 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.armas7 ~= nil then self.armas7:destroy(); self.armas7 = nil; end;
        if self.pericia11 ~= nil then self.pericia11:destroy(); self.pericia11 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.ficha3 ~= nil then self.ficha3:destroy(); self.ficha3 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.pericia7 ~= nil then self.pericia7:destroy(); self.pericia7 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.pericia14 ~= nil then self.pericia14:destroy(); self.pericia14 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.armas8Tr ~= nil then self.armas8Tr:destroy(); self.armas8Tr = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.pericia8Tr ~= nil then self.pericia8Tr:destroy(); self.pericia8Tr = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
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
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.modalLevel1Pericias ~= nil then self.modalLevel1Pericias:destroy(); self.modalLevel1Pericias = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.pericia9 ~= nil then self.pericia9:destroy(); self.pericia9 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.armas7Tr ~= nil then self.armas7Tr:destroy(); self.armas7Tr = nil; end;
        if self.acoesEscolhidasBar ~= nil then self.acoesEscolhidasBar:destroy(); self.acoesEscolhidasBar = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.pericia1Rectangle ~= nil then self.pericia1Rectangle:destroy(); self.pericia1Rectangle = nil; end;
        if self.armas3 ~= nil then self.armas3:destroy(); self.armas3 = nil; end;
        if self.armas5Tr ~= nil then self.armas5Tr:destroy(); self.armas5Tr = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.pericia3 ~= nil then self.pericia3:destroy(); self.pericia3 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.armas6 ~= nil then self.armas6:destroy(); self.armas6 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.pericia10 ~= nil then self.pericia10:destroy(); self.pericia10 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.armas3Tr ~= nil then self.armas3Tr:destroy(); self.armas3Tr = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.acoesAtributosBar ~= nil then self.acoesAtributosBar:destroy(); self.acoesAtributosBar = nil; end;
        if self.pericia11Tr ~= nil then self.pericia11Tr:destroy(); self.pericia11Tr = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.modalArmas ~= nil then self.modalArmas:destroy(); self.modalArmas = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.modalBar ~= nil then self.modalBar:destroy(); self.modalBar = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.form1 ~= nil then self.form1:destroy(); self.form1 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.tracosBar ~= nil then self.tracosBar:destroy(); self.tracosBar = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.pericia7Tr ~= nil then self.pericia7Tr:destroy(); self.pericia7Tr = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.pericia6Tr ~= nil then self.pericia6Tr:destroy(); self.pericia6Tr = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.pericia14Tr ~= nil then self.pericia14Tr:destroy(); self.pericia14Tr = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.armas8 ~= nil then self.armas8:destroy(); self.armas8 = nil; end;
        if self.teste ~= nil then self.teste:destroy(); self.teste = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.modalPericiasBar ~= nil then self.modalPericiasBar:destroy(); self.modalPericiasBar = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.armas6Tr ~= nil then self.armas6Tr:destroy(); self.armas6Tr = nil; end;
        if self.armas2 ~= nil then self.armas2:destroy(); self.armas2 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.pericia3Tr ~= nil then self.pericia3Tr:destroy(); self.pericia3Tr = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.pericia10Tr ~= nil then self.pericia10Tr:destroy(); self.pericia10Tr = nil; end;
        if self.pericia4 ~= nil then self.pericia4:destroy(); self.pericia4 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.pericia13 ~= nil then self.pericia13:destroy(); self.pericia13 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.tipoAcoesBar ~= nil then self.tipoAcoesBar:destroy(); self.tipoAcoesBar = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.pericia13Tr ~= nil then self.pericia13Tr:destroy(); self.pericia13Tr = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.caracteristicasRecArmaModal ~= nil then self.caracteristicasRecArmaModal:destroy(); self.caracteristicasRecArmaModal = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.modal ~= nil then self.modal:destroy(); self.modal = nil; end;
        if self.pericia9Tr ~= nil then self.pericia9Tr:destroy(); self.pericia9Tr = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.armas1Tr ~= nil then self.armas1Tr:destroy(); self.armas1Tr = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.ficha1layout ~= nil then self.ficha1layout:destroy(); self.ficha1layout = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.armas4Tr ~= nil then self.armas4Tr:destroy(); self.armas4Tr = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.pericia1Tr ~= nil then self.pericia1Tr:destroy(); self.pericia1Tr = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.ficha2layout ~= nil then self.ficha2layout:destroy(); self.ficha2layout = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.armas5 ~= nil then self.armas5:destroy(); self.armas5 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.modalTreinamentoBar ~= nil then self.modalTreinamentoBar:destroy(); self.modalTreinamentoBar = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.ficha1 ~= nil then self.ficha1:destroy(); self.ficha1 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.pericia5 ~= nil then self.pericia5:destroy(); self.pericia5 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.pericia12 ~= nil then self.pericia12:destroy(); self.pericia12 = nil; end;
        if self.pericia4Tr ~= nil then self.pericia4Tr:destroy(); self.pericia4Tr = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.modalLevel1 ~= nil then self.modalLevel1:destroy(); self.modalLevel1 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.pericia2Tr ~= nil then self.pericia2Tr:destroy(); self.pericia2Tr = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.modalTreinamentoLevel1 ~= nil then self.modalTreinamentoLevel1:destroy(); self.modalTreinamentoLevel1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.talentosBar ~= nil then self.talentosBar:destroy(); self.talentosBar = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.armas2Tr ~= nil then self.armas2Tr:destroy(); self.armas2Tr = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
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
