script_version("1.0")
require "lib.moonloader"
local encoding = require "encoding"
local dlstatus = require("moonloader").download_status
encoding.default = 'CP1251'
u8 = encoding.UTF8
if doesDirectoryExist("moonloader\\AS Instructor") and
   doesFileExist("moonloader\\AS Instructor\\AS Instructor.ini") and
   doesFileExist("moonloader\\AS Instructor\\fa-solid-900.ttf") and
   doesDirectoryExist("moonloader\\lib\\samp") and
   doesDirectoryExist("moonloader\\lib\\samp\\events") and
   doesFileExist("moonloader\\lib\\samp\\events\\bitstream_io.lua") and
   doesFileExist("moonloader\\lib\\samp\\events\\core.lua") and
   doesFileExist("moonloader\\lib\\samp\\events\\extra_types.lua") and
   doesFileExist("moonloader\\lib\\samp\\events\\handlers.lua") and
   doesFileExist("moonloader\\lib\\samp\\events\\utils.lua") and
   doesFileExist("moonloader\\lib\\samp\\events.lua") and
   doesFileExist("moonloader\\lib\\samp\\raknet.lua") and
   doesFileExist("moonloader\\lib\\samp\\synchronization.lua") and
   doesFileExist("moonloader\\lib\\imgui.lua") and
   doesFileExist("moonloader\\lib\\MoonImGui.dll") and
   doesFileExist("moonloader\\lib\\imgui_addons.lua") and
   doesFileExist("moonloader\\lib\\fAwesome5.lua")
 then
  local key = require "vkeys"
  local inicfg = require "inicfg"
  local directIni = "moonloader\\AS Instructor\\AS Instructor.ini"
  local mainIni = inicfg.load(nil, directIni)
  local imgui = require "imgui"
  local sampev = require "lib.samp.events"
  local fa = require 'fAwesome5'
  imgui.ToggleButton = require('imgui_addons').ToggleButton
  function apply_custom_style()
   imgui.SwitchContext()
   local style = imgui.GetStyle()
   local colors = style.Colors
   local clr = imgui.Col
   local ImVec4 = imgui.ImVec4
   style.WindowRounding = 2.0
   style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
   style.ChildWindowRounding = 2.0
   style.FrameRounding = 2.0
   style.ItemSpacing = imgui.ImVec2(5, 4)
   style.ScrollbarSize = 13.0
   style.ScrollbarRounding = 0
   style.GrabMinSize = 8.0
   style.GrabRounding = 1.0
   colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
   colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
   colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
   colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
   colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
   colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
   colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
   colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
   colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
   colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
   colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
   colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
   colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
   colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
   colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
   colors[clr.Separator]              = colors[clr.Border]
   colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
   colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
   colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
   colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
   colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
   colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
   colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
   colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
   colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
   colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
   colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
   colors[clr.ComboBg]                = colors[clr.PopupBg]
   colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
   colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
   colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
   colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
   colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
   colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
   colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
   colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
   colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
   colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
   colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
   colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
   colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
   colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
   colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
  end
  apply_custom_style()
  imgui.Process = true
  local w, h = getScreenResolution()
  local x = imgui.ImInt(mainIni.setting.x)
  local y = imgui.ImInt(mainIni.setting.y)
  local imgui_active = imgui.ImBool(false)
  local imgui_number = 0
  local imgui_size = imgui.ImVec2(0, 0)
  local imgui_flag = imgui.WindowFlags.NoResize
  local apdate_imgui_pos = false
  local imgui_name = {{fa.ICON_FA_BARS .. u8" ����", fa.ICON_FA_ID_CARD .. u8" �������������", fa.ICON_FA_FILE_ALT .. u8" ��������", fa.ICON_FA_HEADSET .. u8" ������",
                       fa.ICON_FA_CODE .. u8" �������", fa.ICON_FA_COGS .. u8" ���������", fa.ICON_FA_SLIDERS_H .. u8" ���. �������", fa.ICON_FA_INFO .. u8" ����������",
                       fa.ICON_FA_BARS .. u8" ���� �������� �������"
                      },
                      {
                       "����", "�������������", "��������", "������", "������", "��������", "���. �������", "����������"
                      }}
  local imgui_menubar = {0, 0}
  local slot = {0, 0, 0, 0, 0, 0}
  local setting = {{
                    imgui.ImInt(-1)
                   },
                   {
                    imgui.ImInt(-1)
                   },
                   {
                    imgui.ImBuffer(4),
                    imgui.ImBuffer(1024)
                   }, 
                   {
                    imgui.ImBuffer(16)
                   },
                   {
                    imgui.ImBuffer(16),
                    imgui.ImBuffer(32),
                    imgui.ImInt(mainIni.setting.type_name),
                    imgui.ImBuffer(32),
                    imgui.ImBool(mainIni.setting.auto_invite),
                    imgui.ImBool(mainIni.setting.find),
                    imgui.ImBool(mainIni.setting.marker),
                    imgui.ImInt(0),
                    imgui.ImBuffer(8),
                    imgui.ImBool(mainIni.setting.move)
                   },
                   {
                    imgui.ImBuffer(65536),
                    imgui.ImBuffer(4),
                    imgui.ImInt(-1),
                    imgui.ImBuffer(32),
                    imgui.ImBuffer(16),
                    imgui.ImBool(mainIni.chat[1]),
                    imgui.ImBool(mainIni.chat[2]),
                    imgui.ImBool(mainIni.chat[3]),
                    imgui.ImBool(mainIni.chat[4]),
                    imgui.ImBool(mainIni.chat[5]),
                    imgui.ImBool(mainIni.chat[6]),
                    imgui.ImBool(mainIni.chat[7]),
                    imgui.ImBool(mainIni.chat[8])
                   },
                   {
                    imgui.ImInt(0),
                    imgui.ImInt(0),
                    imgui.ImInt(0)
                   }}
  local check_documents = {false, false, false}
  local check_mc = false
  local stop = 0
  local update = true
  local license_number = -1
  local license = {{fa.ICON_FA_HANDSHAKE .. u8" �����������", fa.ICON_FA_FILE_ALT .. u8" �����-����", fa.ICON_FA_CAR_SIDE .. u8" ����������",
                    fa.ICON_FA_MOTORCYCLE .. u8" ��������", fa.ICON_FA_FISH .. u8" �����������", fa.ICON_FA_SHIP .. u8" ��������",
                    fa.ICON_FA_CROSSHAIRS .. u8" ������", fa.ICON_FA_SKULL_CROSSBONES .. u8" �����", fa.ICON_FA_PLANE .. u8" �����"},
                   {"����", "����", "�����������", "��������", "������", "�����"}}
  local command = {{"invite", "uninvite", "giverank", "blacklist", "unblacklist", "fwarn", "unfwarn", "fmute", "funmute" , "expel"},
                   {"�������� � �����������", "���������� �� �����������", "������ �����", "��������� � ������ ������", "��������� �� ������� ������",
                    "������ ��������", "������ ��������", "������ ����", "������ ����", "�������� �� �����������"},
                   {"[id]", "[id] [�������]", "[id] [����]", "[id] [�������]", "[id]", "[id] [�������]", "[id]", "[id] [�������]", "[id]", "[id] [�������]"}}
  local menu = {{fa.ICON_FA_CAR_SIDE .. u8" ����������", fa.ICON_FA_MOTORCYCLE .. u8" ��������", fa.ICON_FA_FISH .. u8" �����������",
                 fa.ICON_FA_SHIP .. u8" ��������", fa.ICON_FA_CROSSHAIRS .. u8" ������", fa.ICON_FA_SKULL_CROSSBONES .. u8" �����"},
                {u8"�� ������������ �������", u8"��������� ������", u8"�����������������"},
                {u8"������������� ����", u8"������������ ���������", u8"������������ �������� �������", u8"���������� ����������� ����������"},
				{u8"��������� �����", u8"������������ ���������", u8"������������ �������� �������", u8"���������� ����������� ����������"},
				{u8"1 ������", u8"5 �����", u8"10 �����", u8"15 �����", u8"30 �����", u8"60 �����", u8"999999 �����"},
				{u8"���������", u8"������ ������"}}
  setting[5][4].v = tostring(mainIni.setting.name)
  setting[5][9].v = string.gsub(mainIni.license[setting[5][8].v+1], "&", ".")
  removeBlip(mainIni.setting.blip)
  function main()
   if not isSampLoaded() or not isSampfuncsLoaded()
    then
     return
   end
   while not isSampAvailable() do wait(100) end
    sampAddChatMessage("[AS Instructor V" .. thisScript().version .. "] {FFFFFF}��������. �����: {FF9933}Artem_Williams", 0x3399FF)
    --sampShowDialog(6405, "{FFFFFF}���������� {3399FF}AutoSchool Instructor", "{FFFFFF}������ ��������: {FF0000}������", "��", "������", 0)
    _, my_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
    my_nick = sampGetPlayerNickname(my_id)
    sampSendChat("/stats")
    local buffer = ""
    local deleteblip = 0
	version = thisScript().version
	print("�������� ����������.")
	if doesFileExist("moonloader\\AS Instructor.json")
     then
	  os.remove("moonloader\\AS Instructor.json")
    end
	downloadUrlToFile("https://raw.githubusercontent.com/Tema05/AutoSchool-Instructor/master/AS%20Instructor.json", "moonloader\\AS Instructor.json", function(id, status, p1, p2)
     if status == dlstatus.STATUS_ENDDOWNLOADDATA
      then 
       if doesFileExist("moonloader\\AS Instructor.json")
	    then
		 file = io.open("moonloader\\AS Instructor.json")
		 local data = decodeJson(file:read("*a"))
         file:close()
		 version = data.version
		 text_update = data.text_update
		 os.remove("moonloader\\AS Instructor.json")
		 print("�������� ���������.")
		 if version ~= thisScript().version
	      then
		   print("���������� ���������� �� ������ V" .. version)
		  else
		   print("���������� �����������.")
	     end
		else
		 print("�� ���������� ��������� ����������.")
		 local warning = true
	   end
     end
    end)
	sampShowDialog(10001, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}����� ����������: {FF9933}" .. my_nick .. "[" .. my_id .. "]\n{FFFFFF}��� �������� �������� ���� ������� {FF9933}/as\n{FFFFFF}��� �������� ���� �������� ������� ������� {FF9933}��� {FFFFFF}������ ��\n������ � ������� ������ ����������������� � ������� {FF9933}����� ����", "����", "��", 0)
   while true do
    wait(0)
	local result, button, _, _ = sampHasDialogRespond(10001)
	if result
	 then
	  if button == 1
	   then
	    imgui_open(8)
	    imgui_open(1)
	  end
	  if version ~= thisScript().version
	   then
	    sampShowDialog(10002, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}���������� ���������� � ������ {3399FF}V" .. thisScript().version .. " {FFFFFF}�� ������ {3399FF}V" .. version ..'{FFFFFF}\n������ ��������� �� ������ ���������� � ������� "����������"\n�� ������ ������� ���� ����� ������ "������".\n����� ��������� ���������� ������� ������� {FF9933}/update', "������", "��", 0)
	   elseif warning
	    then
		 sampShowDialog(10004, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}�� ���������� ��������� ����������.\n���������� ��������� ��������:\n{3399FF}1. {FFFFFF}��������� ���������� � ����������.\n{3399FF}2. {FFFFFF}���������� ��������� ���������� ��� ���.\n{3399FF}3. {FFFFFF}������������� ������ � ���������� ��� ���.\n{3399FF}4. {FFFFFF}����������� ��������� ���������� �����.\n{3399FF}5. {FFFFFF}�������������� ������.", "��", "", 0)
	 end
	end
	local result, button, _, _ = sampHasDialogRespond(10002)
	if result and button == 1
	 then
	  imgui_open(1)
	  imgui_open(8)
	end
	local result, button, _, _ = sampHasDialogRespond(10003)
	if result and button == 1
	 then
	  sampSendChat("/update")
	end
	--if update == true and sampGetCurrentDialogId() ~= 2
	 --then
	  --sampShowDialog(10005, "����", "����", "����", "����", 0)
	--end
    for i = 1, 8 do
     if mainIni.imgui_open[i .. "_b"] ~= "" and not sampIsChatInputActive() and not sampIsDialogActive()
      then
       if string.find(mainIni.imgui_open[i .. "_b"], "&", 1, true)
        then
         if isKeyDown(string.match(mainIni.imgui_open[i .. "_b"], "(%d+)&")) and wasKeyPressed(string.match(mainIni.imgui_open[i .. "_b"], "&(%d+)"))
          then
           imgui_open(i)
         end
        elseif isKeyJustPressed(mainIni.imgui_open[i .. "_b"])
         then
          imgui_open(i)
       end
     end
    end
    for i = 1, 50 do
     if mainIni.binder[i .. "_text"] ~= nil and mainIni.binder[i .. "_text"] ~= "" and mainIni.binder[i .. "_time"] ~= "" and mainIni.binder[i .. "_type"] == 0 and not sampIsChatInputActive() and not sampIsDialogActive()
      then
       if string.find(mainIni.binder[i .. "_act"], "&", 1, true)
        then
         if isKeyDown(string.match(mainIni.binder[i .. "_act"], "(%d+)&")) and wasKeyPressed(string.match(mainIni.binder[i .. "_act"], "&(%d+)")) and check_stop()
          then
           lua_thread.create(function()
            stop = 1
            sampSendChat(u8:decode(string.match(mainIni.binder[i .. "_text"], "([^&]+)")))
            for text in string.gmatch(mainIni.binder[i .. "_text"], "&([^&]+)") do
             wait(tonumber(mainIni.binder[i .. "_time"])*1000)
             sampSendChat(u8:decode(text))
            end
            stop = 0
           end)
         end
        elseif isKeyJustPressed(mainIni.binder[i .. "_act"]) and check_stop()
         then
          lua_thread.create(function()
           stop = 1
           sampSendChat(u8:decode(string.match(mainIni.binder[i .. "_text"], "([^&]+)")))
           for text in string.gmatch(mainIni.binder[i .. "_text"], "&([^&]+)") do
            wait(tonumber(mainIni.binder[i .. "_time"])*1000)
            sampSendChat(u8:decode(text))
           end
           stop = 0
          end)
       end
     end
    end
    local result, marker = getCharPlayerIsTargeting(playerHandle)
    if result
     then
      result, marker_id = sampGetPlayerIdByCharHandle(marker)
      if result
       then
        if string.find(mainIni.setting.menu, "&", 1, true)
         then
          if isKeyDown(string.match(mainIni.setting.menu, "(%d+)&")) and wasKeyPressed(string.match(mainIni.setting.menu, "&(%d+)"))
           then
            imgui_open(9)
          end
         elseif isKeyJustPressed(mainIni.setting.menu)
          then
           imgui_open(9)
        end
        deleteblip = 0
        marker_nick = sampGetPlayerNickname(marker_id)
        if buffer ~= marker_nick
         then
          setting[1][1].v = marker_id
          setting[2][1].v = marker_id
          if setting[5][7].v
           then
            removeBlip(blip)
            blip = addBlipForChar(marker)
            mainIni.setting.blip = blip
            inicfg.save(mainIni, directIni)
            if buffer == ""
             then
              lua_thread.create(function()
               while deleteblip < 30 do
                wait(1000)
                deleteblip = deleteblip + 1
                if deleteblip == 30
                 then
                  removeBlip(blip)
                  buffer = ""
                end
               end
              end)
            end
          end
          if setting[5][6].v
           then
            sampAddChatMessage("[AS Instructor] {FFFFFF}�� ��������: {FF9933}" .. marker_nick .. "[" .. marker_id .. "]", 0x3399FF)
          end
          buffer = marker_nick
        end
      end 
    end
   end
  end
  
  local fa_font = nil
  local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
  function imgui.BeforeDrawFrame()
   if fa_font == nil
    then
     local font_config = imgui.ImFontConfig()
     font_config.MergeMode = true
     fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/AS Instructor/fa-solid-900.ttf', 13.0, font_config, fa_glyph_ranges)
   end
  end
  
  function imgui_open(id)
   if id == imgui_number or imgui.Process == false
    then
     imgui_active.v = not imgui_active.v
     imgui.Process = imgui_active.v
   end
   if id == 1 then
    imgui_size = imgui.ImVec2(266, 250)
   elseif id == 2 then
    imgui_size = imgui.ImVec2(340, 216)
   elseif id == 9 then
    imgui_size = imgui.ImVec2(266, 344)
   else
    imgui_size = imgui.ImVec2(450, 300)
   end
   if setting[5][10].v
    then
     if id == 6 or id == 7
      then
       imgui_flag = imgui.WindowFlags.NoResize + imgui.WindowFlags.MenuBar
      else
       imgui_flag = imgui.WindowFlags.NoResize
     end
    elseif id == 6 or id == 7
     then
      imgui_flag = imgui.WindowFlags.NoResize + imgui.WindowFlags.MenuBar + imgui.WindowFlags.NoMove
     else
      imgui_flag = imgui.WindowFlags.NoResize + imgui.WindowFlags.NoMove
   end
   if id == 9
    then
     imgui_flag = imgui.WindowFlags.NoResize + imgui.WindowFlags.NoMove
     x.v = w / 2 - 133
     y.v = h / 2 - 172
	 slot[6] = 0
    else
     x.v = mainIni.setting.x
     y.v = mainIni.setting.y
   end
   imgui_number = id
   if setting[5][10].v == false
    then 
     apdate_imgui_pos = true
   end
  end
  
  function check_rank(number)
   if rank == -1 then
    return false
   elseif rank == 0 then
    sampAddChatMessage("[AS Instructor] {FFFFFF}�� �� ��������� ���.", 0x3399FF)
    return false
   elseif rank < number then
    sampAddChatMessage("[AS Instructor] {FFFFFF}� " .. number .. " �����.", 0x3399FF)
    return false
   else
    return true
   end
  end
  
  function check_stop()
   if stop == 1
    then
     sampAddChatMessage("[AS Instructor] {FFFFFF}�� ��������.", 0x3399FF)
     return false
    else
     return true
   end
  end
  
  function GetPressedKeysName()
   local keys = ""
   for k, v in pairs(key) do
    if isKeyDown(v) and (v ~= VK_RBUTTON and v ~= VK_LBUTTON and v ~= VK_MENU and v ~= VK_CONTROL and v ~= VK_SHIFT and v ~= VK_ALT)
     then
      if keys == ""
       then
        keys = key.id_to_name(v)
       else
        return keys .. " + " .. key.id_to_name(v)
      end
    end
   end
   return keys
  end
  
  function GetPressedKeysNumber()
   local keys = ""
   for k, v in pairs(key) do
    if isKeyDown(v) and (v ~= VK_RBUTTON and v ~= VK_LBUTTON and v ~= VK_MENU and v ~= VK_CONTROL and v ~= VK_SHIFT and v ~= VK_ALT)
     then
      if keys == ""
       then
        keys = v
       else
        return keys .. "&" .. v
      end
    end
   end
   return tostring(keys)
  end
  
  function GetNameKeysToNumber(arg1, arg2)
   if mainIni[arg1][arg2] ~= ""
    then
     if string.find(mainIni[arg1][arg2], "&", 1, true)
      then
       local button1, button2 = string.match(mainIni[arg1][arg2], "(%d+)&(%d+)")
       return key.id_to_name(tonumber(button1)) .. " + " .. key.id_to_name(tonumber(button2))
      else
       return key.id_to_name(tonumber(mainIni[arg1][arg2]))
     end
    else
     return ""
   end
  end
  
  local hellow = true
  function sampev.onSendDeathNotification()
   hellow = false
  end

  function sampev.onSendSpawn()
   lua_thread.create(function()
    wait(100)
    if hellow == true
     then
      hellow = false
      _, my_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
      my_nick = sampGetPlayerNickname(my_id)
	  sampSendChat("/stats")
      sampAddChatMessage("[AS Instructor] {FFFFFF}����� ����������: {FF9933}" .. my_nick .. "[" .. my_id .. "]", 0x3399FF)
      sampAddChatMessage("[AS Instructor] {FFFFFF}��� �������� �������� ���� ������� {FF9933}/as", 0x3399FF)
	  sampAddChatMessage("[AS Instructor] {FFFFFF}��� �������� ���� �������� ������� ������� {FF9933}��� {FFFFFF}������ ��", 0x3399FF)
	  sampAddChatMessage("[AS Instructor] {FFFFFF}������ � ������� ������ ����������������� � ������� {FF9933}����� ����", 0x3399FF)
	  if version ~= thisScript().version
	   then
		sampAddChatMessage("[AS Instructor] {FFFFFF}���������� ���������� � ������ {3399FF}V" .. thisScript().version .. " {FFFFFF}�� ������ {3399FF}V" .. version, 0x3399FF)
	    sampAddChatMessage('[AS Instructor] {FFFFFF}������ ��������� �� ������ ���������� � ������� "����������"', 0x3399FF)
	    sampAddChatMessage("[AS Instructor] {FFFFFF}����� ��������� ���������� ������� ������� {FF9933}/update", 0x3399FF)
	  end
	  sampShowDialog(10001, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}����� ����������: {FF9933}" .. my_nick .. "[" .. my_id .. "]\n{FFFFFF}��� �������� �������� ���� ������� {FF9933}/as\n{FFFFFF}��� �������� ���� �������� ������� ������� {FF9933}��� {FFFFFF}������ ��\n������ � ������� ������ ����������������� � ������� {FF9933}����� ����", "����", "��", 0)
    end
   end)
  end
  
  rank = -1
  function sampev.onShowDialog(id, style, title, button1, button2, text)
   if rank == -1 and id == 235
    then
     hellow = false
     if string.match(text, "�����������: {B83434}%[(%D+)%]") == "�����������"
      then
       rank = tonumber(string.match(text, "���������: {B83434}%A+%((%d+)%)"))
       rank_name = string.match(text, "���������: {B83434}(%A+)%(%d+%)")
      else
       rank = 0
     end
     return false
   end
   if id == 1234
    then  
     if check_documents[1] and title == "{BFBBBA}�������" and string.match(text, "���: {FFD700}(%a+_%a+)") == sampGetPlayerNickname(setting[1][1].v)
      then
       local check = string.match(text, "��� � �����: {FFD700}(%d+)")
       if tonumber(check) < 3
        then
         lua_thread.create(function()
          sampSendChat("/me ���� ������� �������� �������� � ����� ��������� ���")
          wait(2000)
          sampSendChat("/todo � ��������� �� ��� �� ���������.*� �������������� �� ����")
          wait(2000)
          sampSendChat("�� ������ ��������� � ����� ������� 3 ����.")
          wait(2000)
          sampSendChat("/b ����� 3 �����.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       local check = string.match(text, "�����������������: {FFD700}(%d+)")
       if tonumber(check) < 35
        then
         lua_thread.create(function()
          sampSendChat("/me ���� ������� �������� �������� � ����� ��������� ���")
          wait(2000)
          sampSendChat("/todo � ��������� �� ��� �� ���������.*� �������������� �� ����")
          wait(2000)
          sampSendChat("�� �����������������.")
          wait(2000)
          sampSendChat("/b ����� 35 �����������������.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       if string.find(text, "�����������:", 1, true)
        then
         lua_thread.create(function()
          sampSendChat("/me ���� ������� �������� �������� � ����� ��������� ���")
          wait(2000)
          sampSendChat("/todo � ��������� �� ��� �� ���������.*� �������������� �� ����")
          wait(2000)
          sampSendChat("�� ��� �������� � ������ �����������.")
          wait(2000)
          sampSendChat("/b ��������� �� ����� �����������.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       if string.find(text, "���������� �������� ���. �����")
        then
         lua_thread.create(function()
          sampSendChat("/me ���� ������� �������� �������� � ����� ��������� ���")
          wait(2000)
          sampSendChat("/todo � ��������� �� ��� �� ���������.*� �������������� �� ����")
          wait(2000)
          sampSendChat("�� �������� � ��������������� ��������.")
          wait(2000)
          sampSendChat("/b �������� ���-�����.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       if string.find(text, "������� � �� {FF6200}�����������", 1, true)
        then
         lua_thread.create(function()
          sampSendChat("/do ������� � ����� ������ � �����.")
          wait(2000)
          sampSendChat("/me ����� � ���� �������� ��������")
          wait(2000)
          sampSendChat("/todo � ��������� �� ��� �� ���������.*� �������������� �� ����")
          wait(2000)
          sampSendChat("� ��� ������� �� ���.")
          wait(2000)
          sampSendChat("/b �������� ��������� �� ����� ��� ������� �� �� �� az � ������.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       lua_thread.create(function()
        sampSendChat("/me ���� ������� �������� �������� � ����� ��������� ���")
        wait(1000)
        sampSendChat("/do ������� � �����.")
        wait(1000)
        sampSendChat("/todo �� � �������.*������� ������� �������")
       end)
       check_documents[1] = false
       return false
     end
     if check_documents[2] and title == "{BFBBBA}���. �����" and string.match(text, "���: (%a+_%a+)") == sampGetPlayerNickname(setting[1][1].v)
      then
       local check = string.match(text, "{CEAD2A}����������������: (%d+)")
       if tonumber(check) > 5
        then
         lua_thread.create(function()
          sampSendChat("/me ���� ���-����� � �������� ��������")
          wait(2000)
          sampSendChat("/me ����� ��������� ��������")
          wait(2000)
          sampSendChat("/todo � ��������� �� ��� �� ���������.*� �������������� �� ����")
          wait(2000)
          sampSendChat("� ��� � ���-����� �������� ��� �� ������ ����������������.")
          wait(2000)
          sampSendChat("/b ���������� � ��������� � ��������.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       lua_thread.create(function()
        sampSendChat("/me ���� ���-����� �������� �������� � ����� ��������� �")
        wait(1000)
        sampSendChat("/do ���-����� � �����.")
        wait(1000)
        sampSendChat("/todo �� � �������.*������� ���-����� �������")
       end)
       check_documents[2] = false
       return false
     end
     if check_documents[3] and id == 1234 and title == "{BFBBBA}��������"
      then
       lua_thread.create(function()
        sampSendChat("/me ���� �������� �������� �������� � ����� ��������� ��")
        wait(1000)
        sampSendChat("/do �������� � �����.")
        wait(1000)
        sampSendChat("/todo �� � �������.*������� �������� �������")
       end)
       check_documents[3] = false
       return false
     end
   end
   if license_number ~= -1 and id == 6 and title == "{BFBBBA}�������� ��������" 
    then
     if license_number > 1
      then
       license_number = license_number + 1
     end
     sampSendDialogResponse(6, 1, license_number, -1)
     license_number = -1
     return false
   end
   if check_mc and title == "{BFBBBA}���. �����" and string.match(text, "���: (%a+_%a+)") == sampGetPlayerNickname(setting[2][1].v)
    then
     if string.find(text, "��������� ��������(��)", 1, true)
      then
       license_number = 4
       removeBlip(blip)
       lua_thread.create(function()
	    stop = 1
        sampSendChat("/me ���� ���-����� �������� �������� � ����� ��������� �")
        wait(2000)
        sampSendChat("/do ���-����� � �����.")
        wait(2000)
        sampSendChat("/todo �� � �������.*������� ���-����� �������")
        wait(2000)
        sampSendChat("/do �� ����� ����� �������� � �����.")
        wait(2000)
        sampSendChat("/me ���� ����� � �������� �������� �� ������")
        wait(2000)
        sampSendChat("/todo ���, �������.*��������� �������� �������� ��������")
        sampSendChat("/givelicense " .. setting[2][1].v)
		stop = 0
       end)
      else
       removeBlip(blip)
       lua_thread.create(function()
	    stop = 1
        sampSendChat("/me ���� ���-����� �������� �������� � ����� ��������� �")
        wait(2000)
        sampSendChat("/todo � ��������� � �� ���� ������� ��� �������� �� ������.*������� ���-����� �������")
        wait(2000)
        sampSendChat('�������� � ����� ������ � �������� "��������� ������" � ���-�����.')
		stop = 0
       end)
     end
     check_mc = false
     return false
   end
  end
  
  --function sampev.onSendChat(text) end
  
  function sampev.onServerMessage(color, text)
   if color == -10270721 and string.match(text, "%[������%] {FFFFFF}� ����� ������ ��� ���� �������� �� (%A+)!")
    then
     sampSendChat("� ��� ��� ���� �������� �� " .. string.match(text, "%[������%] {FFFFFF}� ����� ������ ��� ���� �������� �� (%A+)!") .. ".")
   end
   if setting[6][6].v == false
    then
     if color == -1 and text == "{DFCFCF}[���������] {DC4747}����� ������� ��������� ������� {DFCFCF}/engine{DC4747} ��� ������� {DFCFCF}N" or
        color == -1 and text == "{DFCFCF}[���������] {DC4747}��� ���������� ������������� ����������� �������: {DFCFCF}(NUM4/NUM6)" or 
        color == -1 and text == "{DFCFCF}[���������] {DC4747}� ���������� ������������ �����{DFCFCF} [/radio]" or
        color == -1 and string.find(text, "���� ��������� ��������������� �� ������ {9ACD32}%a+_%a+", 1, false) or 
        color == -10270721 and text == "[������] {FFFFFF}����� � ���� ��� ����������!" or
        color == -1714683649 and text == "����������� /olock ����� ������� ��������������� ���������." or
        color == 1941201407 and text == "[����������] {FFFFFF}�� ������� ���������� ��� ��" or
        color == -1800355329 and text == "[����������] {FFFFFF}����� ���������� �� ������ [/unrentcar]" or
        color == -1800355329 and text == "[����������] {FFFFFF}����� ������� ���������� ����������� [/jlock]" or
        color == 1941201407 and text == "[����������] {FFFFFF}�� ���������� �� ������ ����������" or
        color == -1104335361 and text == "�������� ������ �� ������������ �����!"
      then
       return false
     end
   end
   if setting[6][7].v == false
    then
     if color == -1029514497 and string.find(text, " %a+_%a+ �������%(�%) ����� � ����� ���������", 1, false) or
        color == -1029514497 and string.find(text, " %a+_%a+ �������� ������� ���������", 1, false) or
        color == 1182971135 and string.find(text,  " ��������� ������� ������� | %-  %a+_%a+ %.", 1, false) or
        color == 1182971135 and string.find(text, "��������� �� ������� | %-  %a+_%a+ %.", 1, false) or
        color == -1029514497 and string.find(text, " %a+_%a+ �������%(�%) ����� �� ����� ���������", 1, false) or
        color == -1029514497 and string.find(text, " %a+_%a+ ��������%(�%) ���������", 1, false)
      then
       return false
     end
   end
   if setting[6][8].v == false
    then
     if color == 1687547391 and text == "[���������] {FFFFFF}������ ��������� ��������������� �����:" or
        color == -1 and text == "{FFFFFF}1.{6495ED} 111 - {FFFFFF}��������� ������ ��������" or
        color == -1 and text == "{FFFFFF}2.{6495ED} 060 - {FFFFFF}������ ������� �������" or
        color == -1 and text == "{FFFFFF}3.{6495ED} 911 - {FFFFFF}����������� �������" or
        color == -1 and text == "{FFFFFF}4.{6495ED} 912 - {FFFFFF}������ ������" or
        color == -1 and text == "{FFFFFF}5.{6495ED} 913 - {FFFFFF}�����" or
        color == -1 and text == "{FFFFFF}6.{6495ED} 914 - {FFFFFF}�������" or
        color == -1 and text == "{FFFFFF}7.{6495ED} 8828 - {FFFFFF}���������� ������������ �����"
      then
       return false
     end
   end
   if setting[6][9].v == false
    then
     if color == -6684673 and string.find(text, "%a+_%a+ ������%(�%) .+ �� �������", 1, false)
      then
       return false
     end
   end
   if setting[6][10].v == false
    then
     if color == -89368321
      then
       return false
     end
   end
   if setting[6][11].v == false
    then
     if color == -2686721
      then
       return false
     end
   end
   if setting[6][12].v == false
    then
     if color == -1104335361
      then
       return false
     end
   end
   if setting[6][13].v == false
    then
     if color == 73381119 or color == "-1" and text == ""
      then
       return false
     end
   end
  end
  
  function sampev.onSendCommand(text)
   if text == "/reset"
    then
     thisScript():reload()
     return false
   end
   if text == "/resetpos"
    then
     setting[5][10].v = true
     mainIni.setting.move = true
     x.v = 42
     y.v = 482
     mainIni.setting.x = 42
     mainIni.setting.y = 482
     inicfg.save(mainIni, directIni)
     apdate_imgui_pos = true
     return false
   end
   if text == "/update"
    then
	 if version ~= thisScript().version
	  then
	   sampAddChatMessage("[SMIHelper] {FFFFFF}������ �������� ����������.", 0x3399FF)
	   downloadUrlToFile("https://github.com/Tema05/AutoSchool-Instructor/raw/master/AS%20Instructor.lua", thisScript().path, function(id, status, p1, p2)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA
         then 
	      sampAddChatMessage("[SMIHelper] {FFFFFF}�������� ���������� V" .. version .. " ���������.", 0x3399FF)
		  lua_thread.create(function()
		   wait(2500)
	       thisScript():reload()
		  end)
        end
       end)
	  else
	   sampAddChatMessage("[AS Instructor] {FFFFFF}���������� �����������.", 0x3399FF)
	 end
   end
   for i = 1, 8 do
    if text == "/" .. mainIni.imgui_open[i]
     then
      imgui_open(i)
      return false
    end
   end
   if stop == 0
    then
     for i = 1, 50 do
      if mainIni.binder[i .. "_text"] ~= nil and mainIni.binder[i .. "_text"] ~= "" and mainIni.binder[i .. "_time"] ~= "" and mainIni.binder[i .. "_type"] == 1 and text == mainIni.binder[i .. "_act"]
       then
        lua_thread.create(function()
         stop = 1
         sampSendChat(u8:decode(string.match(mainIni.binder[i .. "_text"], "([^&]+)")))
         for text in string.gmatch(mainIni.binder[i .. "_text"], "&([^&]+)") do
          wait(tonumber(mainIni.binder[i .. "_time"])*1000)
          sampSendChat(u8:decode(text))
         end
         stop = 0
        end)
        return false
      end
     end
     local arg1, arg2
     arg1 = tonumber(string.match(text, "/.+ (%d+)"))
     if arg1 ~= nil and arg1 < 1000 and text == "/" .. mainIni.command.invite .. " " .. arg1
      then
       if check_rank(9)
        then
         lua_thread.create(function()
          stop = 1
          sampSendChat("/do ���� �� ���������� � �������.")
          wait(2000)
          sampSendChat("/me ������ ���� �� ���������� �� �������")
          wait(2000)
          sampSendChat("/todo ����� ����������!*������� ���� �������� ��������")
          wait(2000)
          sampSendChat("���������� �� 2 �����.")
          stop = 2
          sampSendChat("/invite " .. arg1)
          stop = 0
          removeBlip(blip)
          buffer = ""
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.invite, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.invite .. " " .. command[3][1], 0x3399FF)
         stop = 0
         return false
       end
     end 
     if arg1 ~= nil and arg1 < 1000 and text == "/" .. mainIni.command.unblacklist .. " " .. arg1
      then
       if check_rank(9)
        then
         lua_thread.create(function()
          stop = 1
          sampSendChat("/do ������� � ����� ������ ����������� � �����.")
          wait(2000)
          sampSendChat('/me ����� � ������ "׸���� ������"')
          wait(2000)
          sampSendChat("/do ������ ������.")
          wait(2000)
          sampSendChat('/me ����� �������� �� ������� "׸���� ������"')
          stop = 2
          sampSendChat("/unblacklist " .. arg1)
          stop = 0
          removeBlip(blip)
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.unblacklist, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.unblacklist .. " " .. command[3][5], 0x3399FF)
         stop = 0
         return false
       end
     end
     if arg1 ~= nil and arg1 < 1000 and text == "/" .. mainIni.command.unfwarn .. " " .. arg1
      then
       if check_rank(9)
        then
         lua_thread.create(function()
          stop = 1
          sampSendChat("/do ������� � ����� ������ ����������� � �����.")
          wait(2000)
          sampSendChat('/me ����� � ������ "��������"')
          wait(2000)
          sampSendChat("/do ������ ������.")
          wait(2000)
          sampSendChat('/me ���� ������� ���������� � ������� "��������"')
          stop = 2
          sampSendChat("/unfwarn " .. arg1)
          stop = 0
          removeBlip(blip)
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.unfwarn, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.unfwarn .. " " .. command[3][7], 0x3399FF)
         stop = 0
         return false
       end
     end
     if arg1 ~= nil and arg1 < 1000 and text == "/" .. mainIni.command.funmute .. " " .. arg1
      then
       if check_rank(9)
        then
         lua_thread.create(function()
          stop = 2
          sampSendChat("/funmute " .. arg1)
          stop = 0
          removeBlip(blip)
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.funmute, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.funmute .. " " .. command[3][9], 0x3399FF)
         stop = 0
         return false
       end
     end
     arg1, arg2 = string.match(text, "/.+ (%d+) (%A+)")
     arg1 = tonumber(arg1)
     if arg1 ~= nil and arg1 < 1000 and text == "/" .. mainIni.command.uninvite .. " " .. arg1 .. " " .. arg2
      then
       if check_rank(9)
        then
         lua_thread.create(function()
          stop = 1
          sampSendChat("/do ������� � ����� ������ ����������� � �����.")
          wait(2000)
          sampSendChat('/me ����� � ������ "����������"')
          wait(2000)
          sampSendChat("/do ������ ������.")
          wait(2000)
          sampSendChat('/me ��� ���������� � ������ "����������"')
          stop = 2
          sampSendChat("/uninvite " .. arg1 .. " " .. arg2)
          stop = 0
          removeBlip(blip)
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.uninvite, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.uninvite .. " " .. command[3][2], 0x3399FF)
         stop = 0
         return false
       end
     end
     if arg1 ~= nil and arg1 < 1000 and text == "/" .. mainIni.command.blacklist .. " " .. arg1 .. " " .. arg2
      then
       if check_rank(9)
        then
         lua_thread.create(function()
          stop = 1
          sampSendChat("/do ������� � ����� ������ ����������� � �����.")
          wait(2000)
          sampSendChat('/me ����� � ������ "׸���� ������"')
          wait(2000)
          sampSendChat("/do ������ ������.")
          wait(2000)
          sampSendChat('/me ��� ������� � ������ "׸���� ������"')
          stop = 2
          sampSendChat("/blacklist " .. arg1 .. " " .. arg2)
          stop = 0
          removeBlip(blip)
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.blacklist, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.blacklist .. " " .. command[3][4], 0x3399FF)
         stop = 0
         return false
       end
     end
     if arg1 ~= nil and arg1 < 1000 and text == "/" .. mainIni.command.fwarn .. " " .. arg1 .. " " .. arg2
      then
       if check_rank(9)
        then
         lua_thread.create(function()
          stop = 1
          sampSendChat("/do ������� � ����� ������ ����������� � �����.")
          wait(2000)
          sampSendChat('/me ����� � ������ "��������"')
          wait(2000)
          sampSendChat("/do ������ ������.")
          wait(2000)
          sampSendChat('/me ����� ������� ���������� � ������� "��������"')
          stop = 2
          sampSendChat("/fwarn " .. arg1 .. " " .. arg2)
          stop = 0
          removeBlip(blip)
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.fwarn, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.fwarn .. " " .. command[3][6], 0x3399FF)
         stop = 0
         return false
       end
     end
     if arg1 ~= nil and arg1 < 1000 and text == "/" .. mainIni.command.fmute .. " " .. arg1 .. " " .. arg2
      then
       if check_rank(8)
        then
         lua_thread.create(function()
          stop = 2
          sampSendChat("/fmute " .. arg1 .. " " .. arg2)
          stop = 0
          removeBlip(blip)
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.fmute, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.fmute .. " " .. command[3][8], 0x3399FF)
         stop = 0
         return false
       end
     end
     if arg1 ~= nil and arg1 < 1000 and text == "/" .. mainIni.command.expel .. " " .. arg1 .. " " .. arg2
      then
       if check_rank(5)
        then
         lua_thread.create(function()
          stop = 1
          sampSendChat("/do ����� �� �����.")
          wait(2000)
          sampSendChat("/me ������ ����� � ������ ������ �� ���")
          wait(2000)
          sampSendChat("/do ������ ������ �������� �� �����������.")
          stop = 2
          sampSendChat("/expel " .. arg1 .. " " .. arg2)
          stop = 0
          removeBlip(blip)
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.expel, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.expel .. " " .. command[3][10], 0x3399FF)
         stop = 0
         return false
       end
     end
     arg1, arg2 = string.match(text, "/.+ (%d+) (%d)")
     arg1 = tonumber(arg1)
     arg2 = tonumber(arg2)
     if arg1 ~= nil and arg1 < 1000 and arg2 < 10 and text == "/" .. mainIni.command.giverank .. " " .. arg1 .. " " .. arg2
      then
       if check_rank(9)
        then
         lua_thread.create(function()
          stop = 1
          sampSendChat("/do ����� ������� � �������.")
          wait(2000)
          sampSendChat("/me ������ �� ������� �������")
          wait(2000)
          sampSendChat("/todo � ����������, ������� ���������*������� ������� ����������")
          wait(2000)
          sampSendChat("����������� �������� � ��� �� ����.")
          stop = 2
          sampSendChat("/giverank " .. arg1 .. " " .. arg2)
          stop = 0
          removeBlip(blip)
         end)
       end
       return false
      else
       if string.find(text, "/" .. mainIni.command.giverank, 1, true) == 1
        then
         sampAddChatMessage("[AS Instructor] {FFFFFF}/" .. mainIni.command.giverank .. " " .. command[3][3], 0x3399FF)
         stop = 0
         return false
       end
     end
    elseif stop ~= 2
     then
      local check = false
      for i = 1, 10 do
       if string.find(text, "/" .. mainIni.command[command[1][i]], 1, true) == 1
        then
         check = true
       end
      end
      for i = 1, 50 do
       if mainIni.binder[i .. "_text"] ~= nil and mainIni.binder[i .. "_text"] ~= "" and mainIni.binder[i .. "_time"] ~= "" and mainIni.binder[i .. "_type"] == 1 and string.find(text, mainIni.binder[i .. "_act"], 1, true) == 1
        then
         check = true
       end
      end
      if check
       then
        sampAddChatMessage("[AS Instructor] {FFFFFF}�� ��������.", 0x3399FF)
        return false
      end
   end
  end
  
  function imgui.OnDrawFrame()
   if imgui_active.v
    then
     imgui.SetNextWindowSize(imgui_size, imgui.Cond.FirstUseEver)
     if apdate_imgui_pos == false
      then
       imgui.SetNextWindowPos(imgui.ImVec2(x.v, y.v), imgui.Cond.FirstUseEver)
      else
       imgui.SetNextWindowPos(imgui.ImVec2(x.v, y.v))
       apdate_imgui_pos = false
     end
     imgui.Begin(imgui_name[1][imgui_number], imgui_active, imgui_flag)
     if imgui_number == 1 then
      if imgui.Button(imgui_name[1][2], imgui.ImVec2(250, 25))
       then
        imgui_open(2)
      end
      if imgui.Button(imgui_name[1][3], imgui.ImVec2(250, 25))
       then
        imgui_open(3)
      end
      if imgui.Button(imgui_name[1][4], imgui.ImVec2(250, 25))
       then
        imgui_open(4)
      end
      if imgui.Button(imgui_name[1][5], imgui.ImVec2(250, 25))
       then
        imgui_open(5)
      end
      if imgui.Button(imgui_name[1][6], imgui.ImVec2(250, 25))
       then
        imgui_open(6)
      end
      if imgui.Button(imgui_name[1][7], imgui.ImVec2(250, 25))
       then
        imgui_open(7)
      end
      if imgui.Button(imgui_name[1][8], imgui.ImVec2(250, 25))
       then
        imgui_open(8)
      end
      imgui.Text("AutoSchool Instructor V" .. thisScript().version)
     elseif imgui_number == 2 then
      imgui.BeginChild("", imgui.ImVec2(103, 156), true)
      imgui.Text(fa.ICON_FA_USER_TIMES .. u8" ������")
      imgui.Separator()
      if imgui.Selectable(u8"��� ��������") and check_rank(5) and check_stop()
       then
        removeBlip(blip)
        check_documents = {false, false, false}
        lua_thread.create(function()
         stop = 1
         sampSendChat("/todo � ��������� �� ��� �� ���������.*� �������������� �� ����")
         wait(2000)
         sampSendChat("� ��� ��� ��������.")
         wait(2000)
         sampSendChat("/b �������� ������� � �����.")
         stop = 0
        end)
      end 
      if imgui.Selectable(u8"��� ���-�����") and check_rank(5) and check_stop()
       then
        removeBlip(blip)
        check_documents = {false, false, false}
        lua_thread.create(function()
         stop = 1
         sampSendChat("/todo � ��������� �� ��� �� ���������.*� �������������� �� ����")
         wait(2000)
         sampSendChat("� ��� ��� ���-�����.")
         wait(2000)
         sampSendChat("/b �������� ���-����� � ��������.")
         stop = 0
       end)
      end
      if imgui.Selectable(u8"����� ���") and check_rank(5) and check_stop()
       then
        removeBlip(blip)
        check_documents = {false, false, false}
        lua_thread.create(function()
         stop = 1
         sampSendChat("/do ������� � ����� ������ � �����.")
         wait(2000)
         sampSendChat("/me ����� � ���� �������� ��������")
         wait(2000)
         sampSendChat("/todo � ��������� �� ��� �� ���������.*� �������������� �� ����")
         wait(2000)
         sampSendChat("� ��� �������� ���, �������� ��� ��������.")
         wait(2000)
         sampSendChat("/b ������� ��� ����� ���.")
         stop = 0
        end)
      end
      imgui.EndChild()
      imgui.SameLine()
      imgui.BeginChild(" ", imgui.ImVec2(216, 156), true)
      imgui.Text(u8"������� id ������:")
      imgui.SameLine()
      imgui.PushItemWidth(85)
      imgui.InputInt("  ", setting[1][1])
      imgui.PopItemWidth()
      if imgui.Button(fa.ICON_FA_PLAY .. u8" ������ �������������", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        if setting[5][3].v == 1 and setting[5][4].v ~= ""
         then
          sampSendChat("������������, ���� ����� " .. u8:decode(setting[5][4].v) .. ". �� ������ �� �������������?")
         else
          sampSendChat("������������, ���� ����� " .. my_nick .. ". �� ������ �� �������������?")
        end
      end
      if imgui.Button(fa.ICON_FA_FILE_ALT .. u8" ��������� ���������", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        if setting[1][1].v > -1 and setting[1][1].v < 1000
         then
          removeBlip(blip)
          check_documents = {true, true, true}
          lua_thread.create(function()
           stop = 1
           sampSendChat("�������, ����� �� ���� ������������? �������, ���-����� � ��������.")
           wait(1000)
           sampSendChat("/b ����� �������� ������������ �������: /showpass " .. my_id .. ", /showmc " .. my_id .. ", /showlic " .. my_id .. " �� ��!")
           stop = 0
          end)
         else
          sampAddChatMessage("[AS Instructor] {FFFFFF}������� id ������:", 0x3399FF)
        end
      end
      if imgui.Button(fa.ICON_FA_QUESTION .. u8" ���������� � ����", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        lua_thread.create(function()
         stop = 1
         sampSendChat("������, ������ � ����� ���� ��������.")
         wait(2000)
         sampSendChat("���������� � ����.")
         stop = 0
        end)
      end
      if imgui.Button(fa.ICON_FA_QUESTION .. u8" ������ ������ ��?", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        sampSendChat("������ �� ������ ������ ������ ����?")
      end
      if imgui.Button(fa.ICON_FA_USER_CHECK .. u8" ������������� ��������", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        removeBlip(blip)
        check_documents = {false, false, false}
        sampSendChat("/todo ����������! �� ������ �������������!* � ������� �� ����")
        if setting[5][5].v == true
         then
          lua_thread.create(function()
           wait(250)
           if check_rank(9)
            then
             if marker_id ~= nil
              then
               lua_thread.create(function()
                stop = 1
                wait(2000)
                sampSendChat("/do ���� �� ���������� � �������.")
                wait(2000)
                sampSendChat("/me ������ ���� �� ���������� �� �������")
                wait(2000)
                sampSendChat("/todo ����� ����������!*������� ���� �������� ��������")
                wait(2000)
                sampSendChat("���������� �� 2 �����.")
                stop = 2
                sampSendChat("/invite " .. marker_id)
                stop = 0
               end)
              else
              sampAddChatMessage("[AS Instructor] {FFFFFF}�������� ������.", 0x3399FF)
             end
           end
          end)
        end
      end
      imgui.EndChild()
      if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 3 then
      imgui.BeginChild("", imgui.ImVec2(110, 240), true)
      imgui.Separator()
      imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), u8"����������:")
      imgui.Separator()
      for i = 1, 2 do 
       if imgui.Selectable(license[1][i]) and check_rank(3) and check_stop()
        then
         if i == 1
          then
           lua_thread.create(function()
            stop = 1
            if setting[5][3].v == 1 and setting[5][4].v ~= ""
             then
              sampSendChat('/do �� ����� ����� ������� � �������� "' .. rank_name .. " - " .. u8:decode(setting[5][4].v) .. '"')
             else
              sampSendChat('/do �� ����� ����� ������� � �������� "' .. rank_name .. " - " .. my_nick .. '"')
            end
            wait(1000)
            sampSendChat("������������, ��� � ���� ��� ������?")
            stop = 0
           end)
          else
           lua_thread.create(function()
            stop = 1
            sampSendChat("/todo ���, �������.*��������� �����-���� �������� ��������")
            wait(2000)
            sampSendChat("/do � �����-����� ��������:")
            for i = 1, 6 do
             wait(2000)
             sampSendChat("/do �������� �� " .. license[2][i] .. " - " .. string.gsub(mainIni.license[i], "&", ".") .. "$")
            end
            stop = 0
           end)
         end
       end
      end
      imgui.Separator()
      imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), u8"��������:")
      imgui.Separator()
      for i = 3, 9 do 
       if imgui.Selectable(license[1][i]) and check_rank(3)
        then
         if i ~= 9
          then
           slot[1] = i - 2
          elseif check_stop()
           then
            sampSendChat("�������� �� ����� ����� �������� ������ � ��������� �. ���-��������.")
         end
       end
      end
      imgui.EndChild()
      imgui.SameLine()
      imgui.BeginChild(" ", imgui.ImVec2(319, 240), true)
      if slot[1] ~= 0
       then
        imgui.Text(u8"������� id ������:")
        imgui.SameLine()
        imgui.PushItemWidth(90)
        imgui.InputInt("  ", setting[2][1])
        imgui.PopItemWidth()
        if imgui.Button(fa.ICON_FA_FILE_SIGNATURE .. u8(" ������� �������� �� " .. string.match(license[2][slot[1]], "([^%d%s%-]+)")), imgui.ImVec2(235, 20)) and check_rank(3) and check_stop()
         then
          if slot[1] == 5
           then
            check_mc = true
            lua_thread.create(function()
             stop = 1
             sampSendChat("��� ������� �������� �� ������ ���������� �������� ���-�����.")
             wait(1000)
             sampSendChat("/b ����� �������� ���-����� �������: /showmc " .. my_id)
             stop = 0
            end)
           elseif setting[2][1].v > -1 and setting[2][1].v < 1000
            then
             license_number = slot[1] - 1
             removeBlip(blip)
             lua_thread.create(function()
              stop = 1
              sampSendChat("/do �� ����� ����� �������� � �����.")
              wait(2000)
              sampSendChat("/me ���� ����� � �������� �������� �� " .. string.match(license[2][license_number+1], "([^%d%s%-]+)"))
              wait(2000)
              sampSendChat("/todo ���, �������.*��������� �������� �������� ��������")
              sampSendChat("/givelicense " .. setting[2][1].v)
              stop = 0
             end)
            else
             sampAddChatMessage("[AS Instructor] {FFFFFF}������� ���������� id.", 0x3399FF)
          end
        end
        if slot[1] == 5
         then
          if imgui.Button(fa.ICON_FA_USER_TIMES .. u8" ��� ���-�����", imgui.ImVec2(150, 20)) and check_rank(3) and check_stop()
           then
            removeBlip(blip)
            lua_thread.create(function()
             stop = 1
             sampSendChat("� ��������� � �� ���� ������� ��� �������� �� �����.")
             wait(2000)
             sampSendChat("�������� � ����� ������ ��� ������� ���-�����.")
             wait(1000)
             sampSendChat("/b �������� ���-����� � ��������.")
             stop = 0
            end)
          end
        end
      end
      imgui.EndChild()
      if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 4 then
      imgui.BeginChild("", imgui.ImVec2(70, 240), true)
      for i = 1, 10 do
       if imgui.Selectable(u8"���� �" .. i)
        then
         for x = 1, 10 do
          if mainIni.lecture[x .. "_text"] == "" and x ~= id
           then
            mainIni.lecture[x .. "_text"] = nil
            mainIni.lecture[x .. "_time"] = nil
          end
         end
         if mainIni.lecture[i .. "_text"] == nil
          then
           mainIni.lecture[i .. "_text"] = ""
           mainIni.lecture[i .. "_time"] = 1
         end
         inicfg.save(mainIni, directIni)
         setting[3][1].v = tostring(mainIni.lecture[i .. "_time"])
         setting[3][2].v = string.gsub(mainIni.lecture[i .. "_text"], "&", "\n")
         slot[2] = i
       end
      end
      imgui.EndChild()
      imgui.SameLine()
      imgui.BeginChild(" ", imgui.ImVec2(359, 240), true)
      if slot[2] ~= 0
       then
        imgui.Text(u8"��������:")
        imgui.SameLine()
        imgui.PushItemWidth(30)
        if imgui.InputText(u8"������(�) ", setting[3][1], imgui.InputTextFlags.CharsDecimal)
         then
          mainIni.lecture[slot[2] .. "_time"] = setting[3][1].v
          inicfg.save(mainIni, directIni)
        end
        imgui.PopItemWidth()
        imgui.SameLine(231)
        if imgui.Button(fa.ICON_FA_TRASH_ALT .. u8" ������� ������", imgui.ImVec2(120, 20))
         then
          mainIni.lecture[slot[2] .. "_text"] = nil
          slot[2] = 0
        end
        imgui.Text(u8"������� �����:")
        if imgui.InputTextMultiline("  ", setting[3][2], imgui.ImVec2(343, 158))
         then
          mainIni.lecture[slot[2] .. "_text"] = string.gsub(setting[3][2].v, "\n", "&")
          inicfg.save(mainIni, directIni)
        end
        if imgui.Button(fa.ICON_FA_MICROPHONE .. u8" ��������� ������ �" .. slot[2], imgui.ImVec2(343, 20)) and check_stop()
         then
          if setting[3][2].v ~= ""
           then
            sampSendChat(u8:decode(string.match(mainIni.lecture[slot[2] .. "_text"], "([^&]+)")))
           else
            sampAddChatMessage("[AS Instructor] {FFFFFF}������� �����.", 0x3399FF)
          end
          lua_thread.create(function()
           stop = 1
           for text in string.gmatch(mainIni.lecture[slot[2] .. "_text"], "&([^&]+)") do
            wait(tonumber(mainIni.lecture[slot[2] .. "_time"])*1000)
            sampSendChat(u8:decode(text))
           end
           stop = 0
          end)
        end
      end
      imgui.EndChild()
      if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 5 then
      imgui.BeginChild("", imgui.ImVec2(82, 240), true, imgui.WindowFlags.NoScrollbar)
      for i = 1, 10 do
       if imgui.Selectable("/" .. mainIni.command[command[1][i]])
        then
         setting[4][1].v = mainIni.command[command[1][i]]
         slot[3] = i
       end
      end
      imgui.EndChild()
      imgui.SameLine()
      imgui.BeginChild(" ", imgui.ImVec2(347, 240), true)
      if slot[3] ~= 0
       then
        imgui.Text("/")
        imgui.SameLine()
        imgui.InputText("  ", setting[4][1])
        if imgui.Button(fa.ICON_FA_SAVE .. u8" ���������", imgui.ImVec2(100, 20))
         then
          local check = true
          for i = 1, 10 do
           if setting[4][1].v == mainIni.command[command[1][i]] and i ~= slot[3]
            then
             check = false
           end
          end
          for i = 1, 8 do
           if setting[4][1].v == mainIni.imgui_open[i]
            then
            check = false
           end
          end
          if check and setting[4][1].v ~= "reset" and setting[4][1].v ~= "resetpos" and setting[4][1].v ~= "update"
           then
            mainIni.command[command[1][slot[3]]] = setting[4][1].v
            inicfg.save(mainIni, directIni)
            sampAddChatMessage("[AS Instructor] {FFFFFF}������� {FF9933}/" .. u8:decode(setting[4][1].v) .. " {FFFFFF}��� " .. command[2][slot[3]] .. " ���������.", 0x3399FF)
           else
            sampAddChatMessage("[AS Instructor] {FFFFFF}������ ������� ��������� � ������ � �� ����� ���������.", 0x3399FF)
          end
        end
        imgui.Text(u8("������� ��� " .. command[2][slot[3]] .. "."))
        imgui.Text(u8"������: /" .. mainIni.command[command[1][slot[3]]] .. " " .. u8(command[3][slot[3]]))
      end
      imgui.EndChild()
      if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 6 then
      imgui.BeginMenuBar()
      if imgui.MenuItem(u8"���������")
       then
        imgui_menubar[1] = 1
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"�����.")
       then
        imgui_menubar[1] = 2
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"��������")
       then
        imgui_menubar[1] = 3
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"���� �������� �������")
       then
        setting[5][2].v = GetNameKeysToNumber("setting", "menu")
        imgui_menubar[1] = 4
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"������")
       then
        imgui_menubar[1] = 5
      end
      imgui.EndMenuBar()
      if imgui_menubar[1] == 0 then
       imgui.BeginChild("", imgui.ImVec2(434, 220), true)
       imgui.EndChild()
      elseif imgui_menubar[1] == 1 then
       imgui.BeginChild("", imgui.ImVec2(124, 220), true)
       for i = 1, 8 do
        if imgui.Selectable(imgui_name[1][i])
         then
          setting[5][1].v = mainIni.imgui_open[i]
          setting[5][2].v = GetNameKeysToNumber("imgui_open", i .. "_b")
          slot[4] = i
        end
       end
       imgui.EndChild()
       imgui.SameLine()
       imgui.BeginChild(" ", imgui.ImVec2(305, 220), true)
       if slot[4] ~= 0
        then
         imgui.Text(imgui_name[1][slot[4]])
         imgui.Text(u8"������� �������:")
         imgui.Text("/")
         imgui.SameLine()
         imgui.InputText("  ", setting[5][1])
         if imgui.Button(fa.ICON_FA_SAVE .. u8" ���������", imgui.ImVec2(100, 20))
          then
           if setting[5][1].v ~= ""
            then
             local check = true
             for i = 1, 10 do
              if setting[5][1].v == mainIni.command[command[1][i]]
               then
                check = false
              end
             end
             for i = 1, 8 do 
              if setting[5][1].v == mainIni.imgui_open[i] and i ~= slot[4]
               then
               check = false
              end
             end
             for i = 1, 50 do
              if mainIni.binder[i .. "_act"] ~= nil and "/" .. setting[5][1].v == mainIni.binder[i .. "_act"]
               then
                check = false
              end
             end
             if check and setting[5][1].v ~= "reset" and setting[5][1].v ~= "resetpos" and setting[5][1].v ~= "update"
              then
               mainIni.imgui_open[slot[4]] = setting[5][1].v
               inicfg.save(mainIni, directIni)
               sampAddChatMessage("[AS Instructor] {FFFFFF}������� {FF9933}/" .. u8:decode(setting[5][1].v) .. " {FFFFFF}��� �������� " .. imgui_name[2][slot[4]] .. " ���������.", 0x3399FF)
              else
               sampAddChatMessage("[AS Instructor] {FFFFFF}������ ������� ��������� � ������ � �� ����� ���������.", 0x3399FF)
             end
            else
             sampAddChatMessage("[AS Instructor] {FFFFFF}������� �������.", 0x3399FF)
           end
         end
         imgui.Text(u8"������:")
         imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), setting[5][2].v)
         if imgui.Button(fa.ICON_FA_PEN .. u8" ��������", imgui.ImVec2(100, 20))
          then
           imgui.OpenPopup("Activate")
         end
         if imgui.BeginPopup("Activate")
          then
           imgui.Text(u8"������� ������ ������.")
           imgui.Text(u8"������:")
           imgui.SameLine()
           imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), GetPressedKeysName())
           if imgui.Button(fa.ICON_FA_TIMES_CIRCLE .. u8" �������", imgui.ImVec2(100, 20))
            then
             imgui.CloseCurrentPopup()
           end
           imgui.SameLine()
           if imgui.Button(" " .. fa.ICON_FA_SAVE .. u8" ��������� ", imgui.ImVec2(100, 20))
            then
             if GetPressedKeysNumber() ~= ""
              then
               local check = true
               for i = 1, 8 do
                if GetPressedKeysNumber() == mainIni.imgui_open[i .. "_b"] and i ~= slot[4]
                 then
                  check = false
                 end
               end
               for i = 1, 50 do
                if mainIni.binder[i .. "_act"] ~= nil and GetPressedKeysNumber() == mainIni.binder[i .. "_act"]
                 then
                  check = false
                end
               end
               if check and GetPressedKeysNumber() ~= mainIni.setting.menu
                then
                 setting[5][2].v = GetPressedKeysName()
                 mainIni.imgui_open[slot[4] .. "_b"] = GetPressedKeysNumber()
                 inicfg.save(mainIni, directIni)
                 sampAddChatMessage("[AS Instructor] {FFFFFF}������ {FF9933}" .. setting[5][2].v .. " {FFFFFF}��� �������� " .. imgui_name[2][slot[4]] .. " ���������", 0x3399FF)
                 imgui.CloseCurrentPopup()
                else
                 sampAddChatMessage("[AS Instructor] {FFFFFF}������ ������ ��� ������������ � �� ����� ���������.", 0x3399FF)
               end
              else
               sampAddChatMessage("[AS Instructor] {FFFFFF}������� �� ������ ������.", 0x3399FF)
             end
           end
           imgui.EndPopup()
         end
         imgui.SameLine()
         if imgui.Button(fa.ICON_FA_TRASH_ALT .. u8" �������", imgui.ImVec2(100, 20))
          then
           setting[5][2].v = ""
           mainIni.imgui_open[slot[4] .. "_b"] = ""
           inicfg.save(mainIni, directIni)
         end
       end
       imgui.EndChild()
      elseif imgui_menubar[1] == 2 then
       imgui.BeginChild("", imgui.ImVec2(434, 220), true)
       imgui.Text(u8"��� � �����������:")
       if imgui.Combo(" ", setting[5][3], {u8"��� ��� �� �������", u8"��� � ������ ����"}, 2)
        then
         mainIni.setting.type_name = setting[5][3].v
         inicfg.save(mainIni, directIni)
       end
       if setting[5][3].v == 1
        then
         imgui.Text(u8"���� ���: (������: ���� �������)")
         if imgui.InputText("  ", setting[5][4])
          then
           mainIni.setting.name = setting[5][4].v
           inicfg.save(mainIni, directIni)
         end
       end
       if imgui.ToggleButton(u8"������������� ���������.", setting[5][5])
        then
         mainIni.setting.auto_invite = setting[5][5].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"������������� ���������.")
       if imgui.ToggleButton(u8"������ � ��� � ���������.", setting[5][6])
        then
         mainIni.setting.find = setting[5][6].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"������ � ��� � ���������.")
       if imgui.ToggleButton(u8"������ ��� ���������� �������.", setting[5][7])
        then
         removeBlip(blip)
         buffer = ""
         mainIni.setting.marker = setting[5][7].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"������ ��� ���������� �������.")
       imgui.EndChild()
      elseif imgui_menubar[1] == 3 then
       imgui.BeginChild("", imgui.ImVec2(434, 220), true)
       imgui.Text(u8"��� � �����������:")
       if imgui.Combo(" ", setting[5][3], {u8"��� ��� �� �������", u8"��� � ������ ����"}, 2)
        then
         mainIni.setting.type_name = setting[5][3].v
         inicfg.save(mainIni, directIni)
       end
       if setting[5][3].v == 1
        then
         imgui.Text(u8"���� ���: (������: ���� �������)")
         if imgui.InputText("  ", setting[5][4])
          then
           mainIni.setting.name = setting[5][4].v
           inicfg.save(mainIni, directIni)
         end
       end
       imgui.Text(u8"�����-����:")
       if imgui.Combo("   ", setting[5][8], menu[1], 6)
        then
         setting[5][9].v = string.gsub(mainIni.license[setting[5][8].v+1], "&", ".")
       end
       imgui.Text(u8"����:")
       imgui.SameLine()
       imgui.PushItemWidth(55)
       if imgui.InputText("    ", setting[5][9], imgui.InputTextFlags.CharsDecimal)
        then
         mainIni.license[setting[5][8].v+1] = string.gsub(setting[5][9].v, "%.", "&")
         inicfg.save(mainIni, directIni)
       end
       imgui.PopItemWidth()
       imgui.EndChild()
     elseif imgui_menubar[1] == 4 then
      imgui.BeginChild("", imgui.ImVec2(434, 220), true)
      imgui.Text(u8"��������� ���� �������� �������:")
      imgui.Text(u8"������� ��� ������ �� ������ � ������� ������ �����������������")
      imgui.Text(u8"� �������")
      imgui.SameLine()
      imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), setting[5][2].v)
      if imgui.Button(fa.ICON_FA_PEN .. u8" ��������", imgui.ImVec2(100, 20))
       then
        imgui.OpenPopup("Activate")
      end
      if imgui.BeginPopup("Activate")
       then
        imgui.Text(u8"������� ������ ������.")
        imgui.Text(u8"������:")
        imgui.SameLine()
        imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), GetPressedKeysName())
        if imgui.Button(fa.ICON_FA_TIMES_CIRCLE .. u8" �������", imgui.ImVec2(100, 20))
         then
          imgui.CloseCurrentPopup()
        end
        imgui.SameLine()
        if imgui.Button(" " .. fa.ICON_FA_SAVE .. u8" ��������� ", imgui.ImVec2(100, 20))
         then
          if GetPressedKeysNumber() ~= ""
           then
            local check = true
            for i = 1, 8 do
             if GetPressedKeysNumber() == mainIni.imgui_open[i .. "_b"]
              then
               check = false
              end
            end
            for i = 1, 50 do
             if mainIni.binder[i .. "_act"] ~= nil and GetPressedKeysNumber() == mainIni.binder[i .. "_act"]
              then
               check = false
             end
            end
            if check
             then
              setting[5][2].v = GetPressedKeysName()
              mainIni.setting.menu = GetPressedKeysNumber()
              inicfg.save(mainIni, directIni)
              sampAddChatMessage("[AS Instructor] {FFFFFF}������ {FF9933}" .. setting[5][2].v .. " {FFFFFF}��� �������� ���� �������� ������� ���������", 0x3399FF)
              imgui.CloseCurrentPopup()
             else
              sampAddChatMessage("[AS Instructor] {FFFFFF}������ ������ ��� ������������ � �� ����� ���������.", 0x3399FF)
            end
           else
            sampAddChatMessage("[AS Instructor] {FFFFFF}������� �� ������ ������.", 0x3399FF)
          end
        end
        imgui.EndPopup()
      end
      imgui.SameLine()
      if imgui.Button(fa.ICON_FA_TRASH_ALT .. u8" �������", imgui.ImVec2(100, 20))
       then
        setting[5][2].v = ""
        mainIni.setting.menu = ""
        inicfg.save(mainIni, directIni)
      end
      imgui.EndChild()
     elseif imgui_menubar[1] == 5 then
      imgui.BeginChild("", imgui.ImVec2(434, 220), true)
      if imgui.ToggleButton(u8"����������� ����������� ���� �������.", setting[5][10])
       then
        mainIni.setting.move = setting[5][10].v
        inicfg.save(mainIni, directIni)
        if setting[5][10].v == true
         then
          imgui_flag = imgui.WindowFlags.NoResize + imgui.WindowFlags.MenuBar
         else
          imgui_flag = imgui.WindowFlags.NoResize + imgui.WindowFlags.MenuBar + imgui.WindowFlags.NoMove
          apdate_imgui_pos = true
        end
      end
      imgui.SameLine()
      imgui.Text(u8"����������� ����������� ���� �������.")
      imgui.Text(u8"������� ����: (� ��������)")
      imgui.Text(u8"������ �� ������ ����:")
      if imgui.Button("-", imgui.ImVec2(20, 20))
       then
        x.v = x.v - 1
      end
      imgui.SameLine(28)
      imgui.PushItemWidth(378)
      imgui.SliderInt(" ", x, 1, w)
      imgui.SameLine(406)
      imgui.PopItemWidth()
      if imgui.Button("+", imgui.ImVec2(20, 20))
       then
        x.v = x.v + 1
      end
      imgui.Text(u8"������ �� �������� ����:")
      if imgui.Button(" - ", imgui.ImVec2(20, 20))
       then
        y.v = y.v - 1
      end
      imgui.SameLine(28)
      imgui.PushItemWidth(378)
      imgui.SliderInt("  ", y, 1, h)
      imgui.SameLine(406)
      imgui.PopItemWidth()
      if imgui.Button(" + ", imgui.ImVec2(20, 20))
       then
        y.v = y.v + 1
      end
      if imgui.Button(fa.ICON_FA_SAVE .. u8" ���������", imgui.ImVec2(100, 20))
       then
        mainIni.setting.x = x.v
        mainIni.setting.y = y.v
        inicfg.save(mainIni, directIni)
        apdate_imgui_pos = true
        sampAddChatMessage("[AS Instructor] {FFFFFF}����� ������� ������� ���������.", 0x3399FF)
        sampAddChatMessage("[AS Instructor] {FFFFFF}���-�� �������� ��������� ������� ������� {FF9933}/resetpos", 0x3399FF)
      end
      imgui.EndChild()
     end
      if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 7 then
      imgui.BeginMenuBar()
      if imgui.MenuItem(u8"������")
       then
        imgui_menubar[2] = 1
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"���")
       then
        imgui_menubar[2] = 2
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"3")
       then
        imgui_menubar[2] = 3
      end
      imgui.EndMenuBar()
      if imgui_menubar[2] == 0 then
       imgui.BeginChild("", imgui.ImVec2(434, 220), true)
       imgui.EndChild()
      elseif imgui_menubar[2] == 1 then
       imgui.BeginChild("", imgui.ImVec2(70, 220), true, imgui.WindowFlags.NoScrollbar)
       for i = 1, 50 do
        if imgui.Selectable(u8"���� �" .. i)
         then
          for x = 1, 50 do
           if mainIni.binder[x .. "_text"] == "" and x ~= i
            then
             mainIni.binder[x .. "_text"] = nil
             mainIni.binder[x .. "_time"] = nil
             mainIni.binder[x .. "_type"] = nil
             mainIni.binder[x .. "_act"] = nil
           end
          end
          if mainIni.binder[i .. "_text"] == nil
           then
            mainIni.binder[i .. "_text"] = ""
            mainIni.binder[i .. "_time"] = 1
            mainIni.binder[i .. "_type"] = -1
            mainIni.binder[i .. "_act"] = ""
          end
          inicfg.save(mainIni, directIni)
          setting[6][1].v = string.gsub(tostring(mainIni.binder[i .. "_text"]), "&", "\n")
          setting[6][2].v = tostring(mainIni.binder[i .. "_time"])
          setting[6][3].v = mainIni.binder[i .. "_type"]
          if mainIni.binder[i .. "_type"] == -1 then
           setting[6][4].v = ""
          elseif mainIni.binder[i .. "_type"] == 0 then
           setting[6][4].v = GetNameKeysToNumber("binder", i .. "_act")
          else
           setting[6][4].v = mainIni.binder[i .. "_act"]
          end
          slot[5] = i
        end
       end
       imgui.EndChild()
       imgui.SameLine()
       imgui.BeginChild(" ", imgui.ImVec2(359, 220), true)
       if slot[5] ~= 0
        then
         imgui.Text(u8"���������:")
         imgui.SameLine()
         imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), setting[6][4].v)
         imgui.SameLine(231)
         if imgui.Button(fa.ICON_FA_PEN .. u8" ��������", imgui.ImVec2(120, 20))
          then
           imgui.OpenPopup("Activate")
         end
         if imgui.BeginPopup("Activate")
          then
           if mainIni.binder[slot[5] .. "_type"] == -1
            then
             imgui.BeginChild("   ", imgui.ImVec2(205, 20), false)
            elseif mainIni.binder[slot[5] .. "_type"] == 0
             then
              imgui.BeginChild("   ", imgui.ImVec2(205, 80), false)
             else
              imgui.BeginChild("   ", imgui.ImVec2(205, 86), false)
           end
           imgui.PushItemWidth(205)
           if imgui.Combo("  ", setting[6][3], {u8"��������� �� ������", u8"��������� �� �������"}, 2)
            then
             mainIni.binder[slot[5] .. "_type"] = setting[6][3].v
           end
           imgui.PopItemWidth()
           if mainIni.binder[slot[5] .. "_type"] ~= -1
            then
             if mainIni.binder[slot[5] .. "_type"] == 0
              then
               imgui.Text(u8"������� �� ������ ������.")
               imgui.Text(u8"������:")
               imgui.SameLine()
               imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), GetPressedKeysName())
               if imgui.Button(fa.ICON_FA_TIMES_CIRCLE .. u8" �������", imgui.ImVec2(100, 20))
                then
                 imgui.CloseCurrentPopup()
               end
               imgui.SameLine()
               if imgui.Button(fa.ICON_FA_SAVE .. u8" ���������", imgui.ImVec2(100, 20))
                then
                 if GetPressedKeysNumber() ~= ""
                  then
                   local check = true
                   for i = 1, 8 do
                    if GetPressedKeysNumber() == mainIni.imgui_open[i .. "_b"]
                     then
                      check = false
                     end
                   end
                   for i = 1, 50 do
                    if mainIni.binder[i .. "_act"] ~= nil and GetPressedKeysNumber() == mainIni.binder[i .. "_act"] and i ~= slot[5]
                     then
                      check = false
                    end
                   end
                   if check and mainIni.setting.menu
                    then
                     setting[6][4].v = GetPressedKeysName()
                     mainIni.binder[slot[5] .. "_act"] = GetPressedKeysNumber()
                     inicfg.save(mainIni, directIni)
                     sampAddChatMessage("[AS Instructor] {FFFFFF}������ {FF9933}" .. setting[6][4].v .. " {FFFFFF}��� ��������� ����� �" .. slot[5] .. " ���������.", 0x3399FF)
                     imgui.CloseCurrentPopup()
                    else
                     sampAddChatMessage("[AS Instructor] {FFFFFF}������ ������ ��� ������������ � �� ����� ���������.", 0x3399FF)
                   end
                  else
                   sampAddChatMessage("[AS Instructor] {FFFFFF}������� �� ������ ������.", 0x3399FF)
                 end
               end
              else
               imgui.Text(u8"������� �������:")
               imgui.Text("/")
               imgui.SameLine()
               imgui.PushItemWidth(196)
               imgui.InputText("    ", setting[6][5])
               imgui.PopItemWidth()
               if imgui.Button(fa.ICON_FA_TIMES_CIRCLE .. u8" �������", imgui.ImVec2(100, 20))
                then
                 imgui.CloseCurrentPopup()
               end
               imgui.SameLine()
               if imgui.Button(fa.ICON_FA_SAVE .. u8" ���������", imgui.ImVec2(100, 20))
                then
                 if setting[6][5].v ~= ""
                  then
                   local check = true
                   for i = 1, 10 do
                    if setting[6][5].v == mainIni.command[command[1][i]]
                     then
                      check = false
                    end
                   end
                   for i = 1, 8 do 
                    if setting[6][5].v == mainIni.imgui_open[i]
                     then
                     check = false
                    end
                   end
                   for i = 1, 50 do
                    if mainIni.binder[i .. "_act"] ~= nil and "/" .. setting[6][5].v == mainIni.binder[i .. "_act"] and i ~= slot[5]
                     then
                      check = false
                    end
                   end
                   if check and setting[6][5].v ~= "reset" and setting[6][5].v ~= "resetpos" and setting[6][5].v ~= "update"
                    then
                     setting[6][4].v = "/" .. setting[6][5].v
                     mainIni.binder[slot[5] .. "_act"] = setting[6][4].v
                     inicfg.save(mainIni, directIni)
                     sampAddChatMessage("[AS Instructor] {FFFFFF}������� {FF9933}" .. setting[6][4].v .. " {FFFFFF}��� ��������� ����� �" .. slot[5] .. " ���������.", 0x3399FF)
                     imgui.CloseCurrentPopup()
                    else
                     sampAddChatMessage("[AS Instructor] {FFFFFF}������ ������� ��������� � ������ � �� ����� ���������.", 0x3399FF)
                   end
                  else
                   sampAddChatMessage("[AS Instructor] {FFFFFF}������� �������.", 0x3399FF)
                 end
               end
             end
           end
           imgui.EndChild()
           imgui.EndPopup()
         end
         imgui.Text(u8"��������:")
         imgui.SameLine()
         imgui.PushItemWidth(30)
         if imgui.InputText(u8"������(�)", setting[6][2], imgui.InputTextFlags.CharsDecimal)
          then
           mainIni.binder[slot[5] .. "_time"] = setting[6][2].v
           inicfg.save(mainIni, directIni)
         end
         imgui.PopItemWidth()
         imgui.SameLine(231)
         if imgui.Button(fa.ICON_FA_TRASH_ALT .. u8" ������� ����", imgui.ImVec2(120, 20)) and check_stop()
          then
           mainIni.binder[slot[5] .. "_text"] = nil
           mainIni.binder[slot[5] .. "_time"] = nil
           mainIni.binder[slot[5] .. "_type"] = nil
           mainIni.binder[slot[5] .. "_act"] = nil
           inicfg.save(mainIni, directIni)
           slot[5] = 0
         end
         imgui.Text(u8"������� �����:")
         if imgui.InputTextMultiline("     ", setting[6][1], imgui.ImVec2(343, 137))
          then
           mainIni.binder[slot[5] .. "_text"] = string.gsub(setting[6][1].v, "\n", "&")
           inicfg.save(mainIni, directIni)
         end
       end
       imgui.EndChild()
      elseif imgui_menubar[2] == 2 then
       imgui.BeginChild("", imgui.ImVec2(434, 220), true, imgui.WindowFlags.NoScrollbar)
       if imgui.Button(u8"�������� ���", imgui.ImVec2(100, 20))
        then
         if setting[6][13].v == true
          then
           for i = 1, 100 do
            sampAddChatMessage("", -1)
           end
          else
           setting[6][13].v = true
           for i = 1, 100 do
            sampAddChatMessage("", -1)
           end
           setting[6][13].v = false
         end
       end
       if imgui.ToggleButton("��������� ��� ������� � ������.", setting[6][6])
        then 
         mainIni.chat[1] = setting[6][6].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"��������� ��� ������� � ������.")
       if imgui.ToggleButton("��������� ���������/������.", setting[6][7])
        then 
         mainIni.chat[2] = setting[6][7].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"��������� ���������/������.")
       if imgui.ToggleButton("��������� ��� ������ ������ ��������.", setting[6][8])
        then 
         mainIni.chat[3] = setting[6][8].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"��������� ��� ������ ������ ��������.")
       if imgui.ToggleButton("��������� �������� ��������.", setting[6][9])
        then 
         mainIni.chat[4] = setting[6][9].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"��������� �������� ��������.")
       if imgui.ToggleButton("��������� �� �������.", setting[6][10])
        then 
         mainIni.chat[5] = setting[6][10].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"��������� �� �������.")
       if imgui.ToggleButton("��������� �������������.", setting[6][11])
        then 
         mainIni.chat[6] = setting[6][11].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"��������� �������������.")
       if imgui.ToggleButton("������� �������� ���������.", setting[6][12])
        then 
         mainIni.chat[7] = setting[6][12].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"������� �������� ���������.")
       if imgui.ToggleButton("��������������� �������.", setting[6][13])
        then 
         mainIni.chat[8] = setting[6][13].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"��������������� �������.")
       imgui.EndChild()
      end
      if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 8 then
	  imgui.BeginChild("", imgui.ImVec2(434, 240), true)
	  if imgui.Button(u8"��������� ����������", imgui.ImVec2(150, 20))
	   then
	    sampAddChatMessage("[AS Instructor] {FFFFFF}�������� ����������.", 0x3399FF)
	    downloadUrlToFile("https://raw.githubusercontent.com/Tema05/AutoSchool-Instructor/master/AS%20Instructor.json", "moonloader\\AS Instructor.json", function(id, status, p1, p2)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA
         then 
          if doesFileExist("moonloader\\AS Instructor.json")
	       then
		    file = io.open("moonloader\\AS Instructor.json")
		    local data = decodeJson(file:read("*a"))
            file:close()
		     version = data.version
		     text_update = data.text_update
		    os.remove("moonloader\\AS Instructor.json")
		    sampAddChatMessage("[AS Instructor] {FFFFFF}�������� ���������.", 0x3399FF)
		    if version ~= thisScript().version
	         then
			  sampAddChatMessage("[AS Instructor] {FFFFFF}���������� ���������� � ������ {3399FF}V" .. thisScript().version .. " {FFFFFF}�� ������ {3399FF}V" .. version, 0x3399FF)
	          sampAddChatMessage('[AS Instructor] {FFFFFF}������ ��������� �� ������ ���������� � ������� "����������"', 0x3399FF)
	          sampAddChatMessage("[AS Instructor] {FFFFFF}����� ��������� ���������� ������� ������� {FF9933}/update", 0x3399FF)
			  sampShowDialog(10003, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}���������� ���������� � ������ {3399FF}V" .. thisScript().version .. " {FFFFFF}�� ������ {3399FF}V" .. version ..'{FFFFFF}\n������ ��������� �� ������ ���������� � ������� "����������"\n����� ��������� ���������� ������� ������� {FF9933}/update\n{FFFFFF}��� ������� ������ "���������"', "���������", "��", 0)
			 else
		      sampAddChatMessage("[AS Instructor] {FFFFFF}���������� �����������.", 0x3399FF)
	        end
		   else
		    sampAddChatMessage("[AS Instructor] {FFFFFF}�� ���������� ��������� ����������.", 0x3399FF)
			sampShowDialog(10004, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}�� ���������� ��������� ����������.\n���������� ��������� ��������:\n{3399FF}1. {FFFFFF}��������� ���������� � ����������.\n{3399FF}2. {FFFFFF}���������� ��������� ���������� ��� ���.\n{3399FF}3. {FFFFFF}������������� ������ � ���������� ��� ���.\n{3399FF}4. {FFFFFF}����������� ��������� ���������� �����.\n{3399FF}5. {FFFFFF}�������������� ������.", "��", "", 0)
	      end
         end
        end)
      end
	  imgui.Text(u8"������ �������: V" .. thisScript().version)
	  imgui.Text(text_update)
	  imgui.EndChild()
      if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 9 then
      if slot[6] == 0 then
       if imgui.Button(fa.ICON_FA_HANDSHAKE .. u8" ���������������� ������", imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
        then
         imgui_open(9)
         lua_thread.create(function()
          stop = 1
          if setting[5][3].v == 1 and setting[5][4].v ~= ""
           then
            sampSendChat('/do �� ����� ����� ������� � �������� "' .. rank_name .. " - " .. u8:decode(setting[5][4].v) .. '"')
           else
            sampSendChat('/do �� ����� ����� ������� � �������� "' .. rank_name .. " - " .. my_nick .. '"')
          end
          wait(1000)
          sampSendChat("������������, ��� � ���� ��� ������?")
          stop = 0
         end)
       end
       if imgui.Button(fa.ICON_FA_FILE_ALT .. u8" �������� �����-����", imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
        then
         imgui_open(9)
         lua_thread.create(function()
          stop = 1
          sampSendChat("/todo ���, �������.*��������� �����-���� �������� ��������")
          wait(2000)
          sampSendChat("/do � �����-����� ��������:")
          for i = 1, 6 do
           wait(2000)
           sampSendChat("/do �������� �� " .. license[2][i] .. " - " .. string.gsub(mainIni.license[i], "&", ".") .. "$")
          end
          stop = 0
         end)
       end
       if imgui.Button(fa.ICON_FA_FILE_SIGNATURE .. u8" ������� �������� ������", imgui.ImVec2(250, 20))
        then
         setting[7][1].v = 0
         slot[6] = 1
       end
       if imgui.Button(fa.ICON_FA_USER_PLUS .. u8" ������� � �����������", imgui.ImVec2(250, 20))
        then
         imgui_open(9)
         sampSendChat("/" .. mainIni.command.uninvite .. " " .. marker_id)
       end
       if imgui.Button(fa.ICON_FA_USER_MINUS .. u8" ������� �� �����������", imgui.ImVec2(250, 20))
        then
         for i = 1, 3 do
          setting[7][i].v = 0
         end
         slot[6] = 2
       end
	   if imgui.Button(fa.ICON_FA_SORT_AMOUNT_UP .. u8" ������ ���������", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 3
	   end
	   if imgui.Button(fa.ICON_FA_USER_TIMES .. u8" ������� � ������ ������", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 4
	   end
	   if imgui.Button(fa.ICON_FA_USER_CHECK .. u8" ������ �� ������� ������", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         sampSendChat("/" .. mainIni.command.unblacklist .. " " .. marker_id)
	   end
	   if imgui.Button(fa.ICON_FA_THUMBS_DOWN .. u8" ���� ������� ����������", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 5
	   end
	   if imgui.Button(fa.ICON_FA_THUMBS_UP .. u8" ����� ������� ����������", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         sampSendChat("/" .. mainIni.command.unfwarn .. " " .. marker_id)
	   end
	   if imgui.Button(fa.ICON_FA_MICROPHONE_SLASH .. u8" ���� ��� ����������", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 6
	   end
	   if imgui.Button(fa.ICON_FA_MICROPHONE .. u8" ����� ��� ����������", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         sampSendChat("/" .. mainIni.command.funmute .. " " .. marker_id)
	   end
	   if imgui.Button(fa.ICON_FA_USER_SLASH .. u8" ������� �� �����������", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 7
	   end
      elseif slot[6] == 1 then
       imgui.Text(u8"��������:")
       imgui.SameLine()
       imgui.PushItemWidth(184)
       imgui.Combo("", setting[7][1], menu[1], 6)
       imgui.PopItemWidth()
       if imgui.Button(fa.ICON_FA_FILE_SIGNATURE .. u8(" ������� �������� �� " .. string.match(license[2][setting[7][1].v+1], "([^%d%s%-]+)")), imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
        then
         imgui_open(9)
         slot[6] = 0
         if setting[7][1].v == 4
          then
           check_mc = true
           lua_thread.create(function()
            stop = 1
            sampSendChat("��� ������� �������� �� ������ ���������� �������� ���-�����.")
            wait(1000)
            sampSendChat("/b ����� �������� ���-����� �������: /showmc " .. my_id)
            stop = 0
           end)
          else
           license_number = setting[7][1].v
           removeBlip(blip)
           lua_thread.create(function()
            stop = 1
            sampSendChat("/do �� ����� ����� �������� � �����.")
            wait(2000)
            sampSendChat("/me ���� ����� � �������� �������� �� " .. string.match(license[2][license_number+1], "([^%d%s%-]+)"))
            wait(2000)
            sampSendChat("/todo ���, �������.*��������� �������� �������� ��������")
            sampSendChat("/givelicense " .. marker_id)
            stop = 0
           end)
         end
       end
       if setting[7][1].v == 4
        then
         if imgui.Button(fa.ICON_FA_USER_TIMES .. u8" � ������ ��� ���-�����", imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
          then
           imgui_open(9)
           slot[6] = 0
           removeBlip(blip)
           lua_thread.create(function()
            stop = 1
            sampSendChat("� ��������� � �� ���� ������� ��� �������� �� �����.")
            wait(2000)
            sampSendChat("�������� � ����� ������ ��� ������� ���-�����.")
            wait(1000)
            sampSendChat("/b �������� ���-����� � ��������.")
            stop = 0
          end)
         end
       end
       if imgui.Button(fa.ICON_FA_HAND_POINT_RIGHT .. u8" �������� �� ����� � ��", imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
        then
         imgui_open(9)
         slot[6] = 0
         sampSendChat("�������� �� ����� ����� �������� ������ � ��������� �. ���-��������.")
       end
       if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
      elseif slot[6] == 2 then
       imgui.PushItemWidth(250)
       imgui.Combo("", setting[7][1], {u8"������� ��� ��", u8"������� � ��"}, 2)
       imgui.Text(u8"������� ����������:")
       imgui.Combo(" ", setting[7][2], menu[2], 3)
       imgui.PopItemWidth()
       if setting[7][1].v == 1
        then
         imgui.Text(u8"������� ��:")
         imgui.PushItemWidth(250)
         imgui.Combo("  ", setting[7][3], menu[3], 4)
         imgui.PopItemWidth()
         if imgui.Button(fa.ICON_FA_USER_MINUS .. u8" ������� �� �����������", imgui.ImVec2(250, 20))
          then
           imgui_open(9)
           slot[6] = 0
		   if check_stop() and check_rank(9)
		    then
             lua_thread.create(function()
              stop = 1
              sampSendChat("/do ������� � ����� ������ ����������� � �����.")
              wait(2000)
              sampSendChat('/me ����� � ������ "����������"')
              wait(2000)
              sampSendChat("/do ������ ������.")
              wait(2000)
              sampSendChat('/me ��� ���������� � ������ "����������"')
              wait(2000)
              sampSendChat('/me ����� � ������ "׸���� ������"')
              wait(2000)
              sampSendChat("/do ������ ������.")
              wait(2000)
              sampSendChat('/me ��� ���������� � ������ "׸���� ������"')
              stop = 2
              sampSendChat("/uninvite " .. marker_id .. " " .. u8:decode(menu[2][setting[7][2].v+1]))
              sampSendChat("/blacklist " .. marker_id .. " " .. u8:decode(menu[3][setting[7][3].v+1]))
              stop = 0
              removeBlip(blip)
             end)
           end
		 end
        else
         if imgui.Button(fa.ICON_FA_USER_MINUS .. u8" ������� �� �����������", imgui.ImVec2(250, 20))
          then
           imgui_open(9)
           slot[6] = 0
           sampSendChat("/" .. mainIni.command.uninvite .. " " .. marker_id .. " " .. u8:decode(menu[2][setting[7][2].v+1]))
         end
       end
       if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 3 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], {u8"1 ����", u8"2 ����", u8"3 ����", u8"4 ����", u8"5 ����", u8"6 ����", u8"7 ����", u8"8 ����", u8"9 ����"}, 9)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_SORT_AMOUNT_UP .. u8" ������ ���������", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         slot[6] = 0
		 sampSendChat("/" .. mainIni.command.giverank .. " " .. marker_id .. " " .. setting[7][1].v+1)
	   end
	   if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 4 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], menu[3], 4)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_USER_TIMES .. u8" ������� � ������ ������", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         slot[6] = 0
		 sampSendChat("/" .. mainIni.command.blacklist .. " " .. marker_id .. " " .. u8:decode(menu[3][setting[7][1].v+1]))
	   end
	   if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 5 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], menu[4], 4)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_THUMBS_DOWN .. u8" ���� ������� ����������", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         slot[6] = 0
		 sampSendChat("/" .. mainIni.command.fwarn .. " " .. marker_id .. " " .. u8:decode(menu[4][setting[7][1].v+1]))
	   end
	   if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 6 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], menu[5], 7)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_MICROPHONE_SLASH .. u8" ���� ��� ����������", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         slot[6] = 0
		 if setting[7][1].v == 6
		  then
		   if check_rank(9)
		    then
			 sampSendChat("/" .. mainIni.command.fmute .. " " .. marker_id .. " 999999")
		   end
		  else
		   sampSendChat("/" .. mainIni.command.fmute .. " " .. marker_id .. " " .. string.match(menu[5][setting[7][1].v+1], "(%d+)"), -1)
		 end
	   end
	   if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 7 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], menu[6], 2)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_USER_SLASH .. u8" ������� �� �����������", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         slot[6] = 0
		 sampSendChat("/" .. mainIni.command.expel .. " " .. marker_id .. " " .. u8:decode(menu[6][setting[7][1].v+1]))
	   end
	   if imgui.Button(u8"�����", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
      end
     end
     imgui.End()
    else
     imgui.Process = false
   end
  end
 else
  function main()
   if not isSampLoaded() or not isSampfuncsLoaded()
    then
     return
   end
   while not isSampAvailable() do wait(100) end
    local FileLoads = 0
    if not doesDirectoryExist("moonloader\\AS Instructor")
     then
      createDirectory("moonloader\\AS Instructor")
    end
    if not doesFileExist("moonloader\\AS Instructor\\AS Instructor.ini")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/AutoSchool-Instructor/master/AS%20Instructor.ini", "moonloader\\AS Instructor\\AS Instructor.ini", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("AS Instructor.ini")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\AS Instructor\\fa-solid-900.ttf")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://github.com/Tema05/lib/blob/master/fa-solid-900.ttf?raw=true", "moonloader\\AS Instructor\\fa-solid-900.ttf", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("fa-solid-900.ttf")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesDirectoryExist("moonloader\\lib\\samp")
     then
      createDirectory("moonloader\\lib\\samp")
    end
    if not doesDirectoryExist("moonloader\\lib\\samp\\events")
     then
      createDirectory("moonloader\\lib\\samp\\events")
    end
    if not doesFileExist("moonloader\\lib\\samp\\events\\bitstream_io.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/bitstream_io.lua", "moonloader\\lib\\samp\\events\\bitstream_io.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("bitstream_io.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\samp\\events\\core.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/core.lua", "moonloader\\lib\\samp\\events\\core.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("core.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\samp\\events\\extra_types.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/extra_types.lua", "moonloader\\lib\\samp\\events\\extra_types.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("extra_types.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\samp\\events\\handlers.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/handlers.lua", "moonloader\\lib\\samp\\events\\handlers.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("handlers.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\samp\\events\\utils.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/utils.lua", "moonloader\\lib\\samp\\events\\utils.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("utils.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\samp\\events.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/events.lua", "moonloader\\lib\\samp\\events.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("events.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\samp\\raknet.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/raknet.lua", "moonloader\\lib\\samp\\raknet.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("raknet.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\samp\\synchronization.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/synchronization.lua", "moonloader\\lib\\samp\\synchronization.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("synchronization.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    
    if not doesFileExist("moonloader\\lib\\imgui.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/imgui.lua", "moonloader\\lib\\imgui.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("imgui.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\MoonImGui.dll")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://github.com/Tema05/lib/blob/master/MoonImGui.dll?raw=true", "moonloader\\lib\\MoonImGui.dll", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("MoonImGui.dll")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\imgui_addons.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/imgui_addons.lua", "moonloader\\lib\\imgui_addons.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("imgui_addons.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
    if not doesFileExist("moonloader\\lib\\fAwesome5.lua")
     then
      FileLoads = FileLoads + 1
      downloadUrlToFile("https://raw.githubusercontent.com/Tema05/lib/master/fAwesome5.lua", "moonloader\\lib\\fAwesome5.lua", function(id, status, p1, p2)
       if status == dlstatus.STATUS_ENDDOWNLOADDATA
        then 
         print("fAwesome5.lua")
         FileLoads = FileLoads - 1
       end
      end)
    end
   while true do
    wait(100)
    if FileLoads == 0
     then
      thisScript():reload()
    end
   end
  end
  
end