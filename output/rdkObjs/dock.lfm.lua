require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_GGO_Dock()
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
    obj:setName("GGO_Dock");
    obj:setFormType("tablesDock");
    obj:setDataType("RRPG.DataTypeUnico.DaMinhaJanelaAcoplavel");
    obj:setTitle("Minha Janela Acoplável");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setText("Olá Mundo");
    obj.edit1:setField("input");
    obj.edit1:setName("edit1");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            require("ndb.lua");
                    local mesa = Firecast.getRoomOf(sheet);
                    
                    if mesa ~= nil then
                    
                    local chat = mesa.chat;
                    local jogador = mesa.me
                    local login = jogador.login
                    
                    NDB.setPermission(sheet, "user", "MendigoCraazy", "write", "allow");
                    NDB.setPermission(sheet, "user", "MendigoCraazy", "read", "allow");
                    -- local observer = ndb.newObserver(sheet);
                    --  observer.node = sheet.input
                    -- observer.enabled = true
                    
                    -- observer.onChanged =
                    -- function(node, attribute, oldValue)
                    -- showMessage("disparei")
                    -- if login == "RAFILKL" then
                    
                    -- chat:enviarMensagem("/>>")
                    
                    -- end
                    --  end;
                    
                    local room = Firecast.getRoomOf(sheet)
                    local myCode = room.codigoInterno
                    
                    local promise = room:asyncOpenRoomNDB("RRPG.TB.COMBAT.TRACKER.v1")
                    local node = await(promise)
            
                    -- showMessage(tableToStr(node))
            
                    node.rodada = 100
                    
                    
                    end
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newGGO_Dock()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_GGO_Dock();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _GGO_Dock = {
    newEditor = newGGO_Dock, 
    new = newGGO_Dock, 
    name = "GGO_Dock", 
    dataType = "RRPG.DataTypeUnico.DaMinhaJanelaAcoplavel", 
    formType = "tablesDock", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Minha Janela Acoplável", 
    description=""};

GGO_Dock = _GGO_Dock;
Firecast.registrarForm(_GGO_Dock);
Firecast.registrarDataType(_GGO_Dock);
Firecast.registrarSpecialForm(_GGO_Dock);

return _GGO_Dock;
