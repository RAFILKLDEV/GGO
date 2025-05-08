require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_inventario()
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
    obj:setName("inventario");
    obj:setHeight(330);
    obj:setPadding({left=5,top=5,right=5,bottom=5});
    obj:setMargins({top=2,bottom=2});

    obj.tracosBarInventario = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tracosBarInventario:setParent(obj);
    obj.tracosBarInventario:setName("tracosBarInventario");
    obj.tracosBarInventario:setAlign("top");
    obj.tracosBarInventario:setAutoHeight(true);
    obj.tracosBarInventario:setOrientation("horizontal");
    obj.tracosBarInventario:setLineSpacing(5);
    obj.tracosBarInventario:setHorzAlign("center");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setSRC("imgs/armas/ak47.png");
    obj.image1:setField("imgArma");
    obj.image1:setAlign("top");
    obj.image1:setHeight(150);
    obj.image1:setPadding({left=5,top=5,right=5,bottom=5});
    obj.image1:setName("image1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(40);
    obj.rectangle1:setColor("#2E2E2E");
    obj.rectangle1:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle1:setMargins({bottom=5});
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setHeight(30);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setMargins({bottom=20});
    obj.rectangle2:setName("rectangle2");

    obj.arma1Recarga = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.arma1Recarga:setParent(obj.rectangle2);
    obj.arma1Recarga:setAlign("client");
    obj.arma1Recarga:setName("arma1Recarga");
    obj.arma1Recarga:setOrientation("horizontal");
    obj.arma1Recarga:setLineSpacing(5);
    obj.arma1Recarga:setHorzAlign("center");

    obj.caracteristicasArmasBar = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.caracteristicasArmasBar:setParent(obj);
    obj.caracteristicasArmasBar:setName("caracteristicasArmasBar");
    obj.caracteristicasArmasBar:setAlign("top");
    obj.caracteristicasArmasBar:setAutoHeight(true);
    obj.caracteristicasArmasBar:setOrientation("horizontal");
    obj.caracteristicasArmasBar:setLineSpacing(5);
    obj.caracteristicasArmasBar:setHorzAlign("center");
    obj.caracteristicasArmasBar:setMargins({top=5});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("top");
    obj.button1:setMargins({top=15});
    obj.button1:setText("Apagar");
    obj.button1:setWidth(80);
    obj.button1:setName("button1");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            local tracosArmas = {
                    sheet.tipoArma, 
                    sheet.apelidoArma,
                    sheet.tipoDanoArma,
                    }
            
                    for j = 1, #tracosArmas, 1 do
            
                    if tracosArmas[j] ~= nil then
            
                        local containerTraco = GUI.newRectangle()
                        containerTraco.align = "left"
                        containerTraco.color = "darkRed"
                        containerTraco.height = 20
                        containerTraco.padding = {left=5, top=5, right=5, bottom=5}
                        containerTraco.margins = {left=5}
                        containerTraco.parent = self.tracosBarInventario
                        
                        local label = GUI.newLabel()
                        label.align = "client"
                        label.text = tracosArmas[j]
                        label.horzTextAlign = "center"
                        label.parent = containerTraco
                        
                        containerTraco["g-dyn-width-txt"] = true
            
                    end
            
                    end
            
                    local tracosArmasBar = self.tracosBarInventario:getChildren()
            
                    for j = 1, #tracosArmasBar, 1 do
            
                    if tracosArmasBar[j] ~= nil then
                        local text = tracosArmasBar[j]:getChildren()[1].text:gsub("([^%s]+)", "%1 ")
                        local textWidth = math.max(text:len() * 7.4, 70) 
                        tracosArmasBar[j].width = textWidth
                    end
            
                    end
            
                    local caracteristicasArmas = {
                    sheet.alcanceArma, 
                    sheet.danoArma,
                    sheet.municaoArma,
                    sheet.miraArma, 
                    sheet.modoArma, 
                    sheet.carregadorArma,
                    }
            
                    for j = 1, #caracteristicasArmas, 1 do
            
                    if caracteristicasArmas[j] ~= nil then
            
                        local containerTraco = GUI.newRectangle()
                        containerTraco.align = "left"
                        containerTraco.color = "#00008B"
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
            
                    end
            
                    local caracteristicasArmasBar = self.caracteristicasArmasBar:getChildren()
            
                    for j = 1, #caracteristicasArmasBar, 1 do
            
                    if caracteristicasArmasBar[j] ~= nil then
                        local text = caracteristicasArmasBar[j]:getChildren()[1].text:gsub("([^%s]+)", "%1 ")
                        local textWidth = math.max(text:len() * 7.4, 70) 
                        caracteristicasArmasBar[j].width = textWidth
                    end
            
                    end
            
                    local total = 50 -- Total de balas disponíveis
                    sheet.atualCarregadorArma =  sheet.carregadorArma2
            
                    -- Calculando a porcentagem de balas restantes em relação ao total de balas (50)
                    local porcentagem = (sheet.atualCarregadorArma / sheet.carregadorArma2) * 100
            
                    -- Agora, você pode usar essa porcentagem para calcular um valor proporcional de 50
                    local resultado = (porcentagem / 100) * total
            
                    for i = 1, resultado do
                    local image = GUI.newImage()
                    image.src = "imgs/bala.png"
                    image.width = 7
                    image.height = 30
                    image.style = "stretch"
                    image.parent = self.arma1Recarga
                    end
            
                    local label = GUI.newLabel()
                    label.field = "carregadorArmaLabel"
                    label.width = 50
                    label.margins = {left=5}
                    label.parent = self.arma1Recarga
            
                    sheet.carregadorArmaLabel = (sheet.atualCarregadorArma or sheet.carregadorArma2) .. "/" .. sheet.carregadorArma2
            
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
            
                    atualizarLayout(self.tracosBarInventario:getChildren())
        end);

    obj._e_event1 = obj.rectangle2:addEventListener("onClick",
        function (event)
            if tonumber(sheet.atualCarregadorArma) > 0 then 
                        sheet.atualCarregadorArma = sheet.atualCarregadorArma - 1
                        sheet.carregadorArmaLabel = sheet.atualCarregadorArma .. "/" .. sheet.carregadorArma2
            
                        else
            
                        GUI.toast("Arma sem municão")
            
                        end
        end);

    obj._e_event2 = obj.rectangle2:addEventListener("onMouseUp",
        function (event)
            if event.button == "right" then 
                        sheet.atualCarregadorArma = sheet.carregadorArma2
                        sheet.carregadorArmaLabel = sheet.atualCarregadorArma .. "/" .. sheet.carregadorArma2
                        GUI.toast("Arma recarregada")
            
                        end
        end);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (event)
            ndb.deleteNode(sheet);
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

        if self.tracosBarInventario ~= nil then self.tracosBarInventario:destroy(); self.tracosBarInventario = nil; end;
        if self.caracteristicasArmasBar ~= nil then self.caracteristicasArmasBar:destroy(); self.caracteristicasArmasBar = nil; end;
        if self.arma1Recarga ~= nil then self.arma1Recarga:destroy(); self.arma1Recarga = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newinventario()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_inventario();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _inventario = {
    newEditor = newinventario, 
    new = newinventario, 
    name = "inventario", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

inventario = _inventario;
Firecast.registrarForm(_inventario);

return _inventario;
