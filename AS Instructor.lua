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
  local imgui_name = {{fa.ICON_FA_BARS .. u8" Меню", fa.ICON_FA_ID_CARD .. u8" Собеседование", fa.ICON_FA_FILE_ALT .. u8" Лицензии", fa.ICON_FA_HEADSET .. u8" Лекции",
                       fa.ICON_FA_CODE .. u8" Команды", fa.ICON_FA_COGS .. u8" Настройки", fa.ICON_FA_SLIDERS_H .. u8" Доп. Функции", fa.ICON_FA_INFO .. u8" Информация",
                       fa.ICON_FA_BARS .. u8" Меню быстрого доступа"
                      },
                      {
                       "меню", "собеседования", "лицензий", "лекций", "команд", "настроек", "доп. функций", "информации"
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
  local license = {{fa.ICON_FA_HANDSHAKE .. u8" Приветствие", fa.ICON_FA_FILE_ALT .. u8" Прайс-лист", fa.ICON_FA_CAR_SIDE .. u8" Автомобиль",
                    fa.ICON_FA_MOTORCYCLE .. u8" Мотоцикл", fa.ICON_FA_FISH .. u8" Рыболовство", fa.ICON_FA_SHIP .. u8" Плаванье",
                    fa.ICON_FA_CROSSHAIRS .. u8" Оружие", fa.ICON_FA_SKULL_CROSSBONES .. u8" Охота", fa.ICON_FA_PLANE .. u8" Полёты"},
                   {"авто", "мото", "рыболовство", "плаванье", "оружие", "охоту"}}
  local command = {{"invite", "uninvite", "giverank", "blacklist", "unblacklist", "fwarn", "unfwarn", "fmute", "funmute" , "expel"},
                   {"принятия в организацию", "увольнения из организации", "выдачи ранга", "занесения в чёрный список", "вынесения из чёрного списка",
                    "выдачи выговора", "снятия выговора", "выдачи мута", "снятия мута", "изгнания из радиоцентра"},
                   {"[id]", "[id] [причина]", "[id] [ранг]", "[id] [причина]", "[id]", "[id] [причина]", "[id]", "[id] [причина]", "[id]", "[id] [причина]"}}
  local menu = {{fa.ICON_FA_CAR_SIDE .. u8" Автомобиль", fa.ICON_FA_MOTORCYCLE .. u8" Мотоцикл", fa.ICON_FA_FISH .. u8" Рыболовство",
                 fa.ICON_FA_SHIP .. u8" Плаванье", fa.ICON_FA_CROSSHAIRS .. u8" Оружие", fa.ICON_FA_SKULL_CROSSBONES .. u8" Охота"},
                {u8"По собственному желанию", u8"Нарушение устава", u8"Профнепригодность"},
                {u8"Испытательный срок", u8"Неадекватное поведение", u8"Неподчинение старшему составу", u8"Превышение должностных полномочий"},
				{u8"Нарушение устав", u8"Неадекватное поведение", u8"Неподчинение старшему составу", u8"Превышение должностных полномочий"},
				{u8"1 минута", u8"5 минут", u8"10 минут", u8"15 минут", u8"30 минут", u8"60 минут", u8"999999 минут"},
				{u8"Неадекват", u8"Помеха работе"}}
  setting[5][4].v = tostring(mainIni.setting.name)
  setting[5][9].v = string.gsub(mainIni.license[setting[5][8].v+1], "&", ".")
  removeBlip(mainIni.setting.blip)
  function main()
   if not isSampLoaded() or not isSampfuncsLoaded()
    then
     return
   end
   while not isSampAvailable() do wait(100) end
    sampAddChatMessage("[AS Instructor V" .. thisScript().version .. "] {FFFFFF}Загружен. Автор: {FF9933}Artem_Williams", 0x3399FF)
    --sampShowDialog(6405, "{FFFFFF}Установщик {3399FF}AutoSchool Instructor", "{FFFFFF}Статус загрузки: {FF0000}Ошибка", "ОК", "Отмена", 0)
    _, my_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
    my_nick = sampGetPlayerNickname(my_id)
    sampSendChat("/stats")
    local buffer = ""
    local deleteblip = 0
	version = thisScript().version
	print("Проверка обновлений.")
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
		 print("Проверка завершена.")
		 if version ~= thisScript().version
	      then
		   print("Обнаружено обновление на версию V" .. version)
		  else
		   print("Обновления отсутствуют.")
	     end
		else
		 print("Не получилось проверить обновление.")
		 local warning = true
	   end
     end
    end)
	sampShowDialog(10001, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}Добро пожаловать: {FF9933}" .. my_nick .. "[" .. my_id .. "]\n{FFFFFF}Для открытия главного меню введите {FF9933}/as\n{FFFFFF}Для открытия меню быстрого доступа зажмите {FF9933}ПКМ {FFFFFF}смотря на\nигрока с которым хотите взаимодействовать и нажмите {FF9933}Левый Альт", "Меню", "Ок", 0)
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
	    sampShowDialog(10002, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}Обнаружено обновление с версии {3399FF}V" .. thisScript().version .. " {FFFFFF}на версию {3399FF}V" .. version ..'{FFFFFF}\nСписок изменений вы можете посмотреть в разделе "Информация"\nВы можете перейти туда нажав кнопку "список".\nЧтобы загрузить обновление введите команду {FF9933}/update', "Список", "Ок", 0)
	   elseif warning
	    then
		 sampShowDialog(10004, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}Не получилось проверить обновление.\nПопробуйте следующие действия:\n{3399FF}1. {FFFFFF}Проверьте соединение с интернетом.\n{3399FF}2. {FFFFFF}Попробуйте проверить обновления ещё раз.\n{3399FF}3. {FFFFFF}Перезагрузите скрипт и попробуйте ещё раз.\n{3399FF}4. {FFFFFF}Попробуйсте проверить обновление позже.\n{3399FF}5. {FFFFFF}Переустановите скрипт.", "Ок", "", 0)
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
	  --sampShowDialog(10005, "тест", "тест", "тест", "тест", 0)
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
            sampAddChatMessage("[AS Instructor] {FFFFFF}Вы выделили: {FF9933}" .. marker_nick .. "[" .. marker_id .. "]", 0x3399FF)
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
    sampAddChatMessage("[AS Instructor] {FFFFFF}Вы не сотрудник ГЦЛ.", 0x3399FF)
    return false
   elseif rank < number then
    sampAddChatMessage("[AS Instructor] {FFFFFF}С " .. number .. " ранга.", 0x3399FF)
    return false
   else
    return true
   end
  end
  
  function check_stop()
   if stop == 1
    then
     sampAddChatMessage("[AS Instructor] {FFFFFF}Не торопись.", 0x3399FF)
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
      sampAddChatMessage("[AS Instructor] {FFFFFF}Добро пожаловать: {FF9933}" .. my_nick .. "[" .. my_id .. "]", 0x3399FF)
      sampAddChatMessage("[AS Instructor] {FFFFFF}Для открытия главного меню введите {FF9933}/as", 0x3399FF)
	  sampAddChatMessage("[AS Instructor] {FFFFFF}Для открытия меню быстрого доступа зажмите {FF9933}ПКМ {FFFFFF}смотря на", 0x3399FF)
	  sampAddChatMessage("[AS Instructor] {FFFFFF}игрока с которым хотите взаимодействовать и нажмите {FF9933}Левый Альт", 0x3399FF)
	  if version ~= thisScript().version
	   then
		sampAddChatMessage("[AS Instructor] {FFFFFF}Обнаружено обновление с версии {3399FF}V" .. thisScript().version .. " {FFFFFF}на версию {3399FF}V" .. version, 0x3399FF)
	    sampAddChatMessage('[AS Instructor] {FFFFFF}Список изменений вы можете посмотреть в разделе "Информация"', 0x3399FF)
	    sampAddChatMessage("[AS Instructor] {FFFFFF}Чтобы загрузить обновление введите команду {FF9933}/update", 0x3399FF)
	  end
	  sampShowDialog(10001, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}Добро пожаловать: {FF9933}" .. my_nick .. "[" .. my_id .. "]\n{FFFFFF}Для открытия главного меню введите {FF9933}/as\n{FFFFFF}Для открытия меню быстрого доступа зажмите {FF9933}ПКМ {FFFFFF}смотря на\nигрока с которым хотите взаимодействовать и нажмите {FF9933}Левый Альт", "Меню", "Ок", 0)
    end
   end)
  end
  
  rank = -1
  function sampev.onShowDialog(id, style, title, button1, button2, text)
   if rank == -1 and id == 235
    then
     hellow = false
     if string.match(text, "Организация: {B83434}%[(%D+)%]") == "Инструкторы"
      then
       rank = tonumber(string.match(text, "Должность: {B83434}%A+%((%d+)%)"))
       rank_name = string.match(text, "Должность: {B83434}(%A+)%(%d+%)")
      else
       rank = 0
     end
     return false
   end
   if id == 1234
    then  
     if check_documents[1] and title == "{BFBBBA}Паспорт" and string.match(text, "Имя: {FFD700}(%a+_%a+)") == sampGetPlayerNickname(setting[1][1].v)
      then
       local check = string.match(text, "Лет в штате: {FFD700}(%d+)")
       if tonumber(check) < 3
        then
         lua_thread.create(function()
          sampSendChat("/me взял паспорт человека напротив и начал проверять его")
          wait(2000)
          sampSendChat("/todo К сожалению вы нам не подходите.*с разочарованием на лице")
          wait(2000)
          sampSendChat("Вы должны проживать в штате минимум 3 года.")
          wait(2000)
          sampSendChat("/b Нужен 3 левел.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       local check = string.match(text, "Законопослушность: {FFD700}(%d+)")
       if tonumber(check) < 35
        then
         lua_thread.create(function()
          sampSendChat("/me взял паспорт человека напротив и начал проверять его")
          wait(2000)
          sampSendChat("/todo К сожалению вы нам не подходите.*с разочарованием на лице")
          wait(2000)
          sampSendChat("Вы незаконнопослушны.")
          wait(2000)
          sampSendChat("/b Нужно 35 законопослушности.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       if string.find(text, "Организация:", 1, true)
        then
         lua_thread.create(function()
          sampSendChat("/me взял паспорт человека напротив и начал проверять его")
          wait(2000)
          sampSendChat("/todo К сожалению вы нам не подходите.*с разочарованием на лице")
          wait(2000)
          sampSendChat("Вы уже состоите в другой организации.")
          wait(2000)
          sampSendChat("/b Увольтесь из вашей организации.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       if string.find(text, "Необходимо обновить мед. карту")
        then
         lua_thread.create(function()
          sampSendChat("/me взял паспорт человека напротив и начал проверять его")
          wait(2000)
          sampSendChat("/todo К сожалению вы нам не подходите.*с разочарованием на лице")
          wait(2000)
          sampSendChat("Вы лечились в психиатрической больнице.")
          wait(2000)
          sampSendChat("/b Обновите мед-карту.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       if string.find(text, "Состоит в ЧС {FF6200}Инструкторы", 1, true)
        then
         lua_thread.create(function()
          sampSendChat("/do Планшет с базой данных в руках.")
          wait(2000)
          sampSendChat("/me нашёл в базе человека напротив")
          wait(2000)
          sampSendChat("/todo К сожалению вы нам не подходите.*с разочарованием на лице")
          wait(2000)
          sampSendChat("У вас имеется ЧС ГЦЛ.")
          wait(2000)
          sampSendChat("/b Запишите заявление на форум или выйдите из ЧС за az в донате.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       lua_thread.create(function()
        sampSendChat("/me взял паспорт человека напротив и начал проверять его")
        wait(1000)
        sampSendChat("/do Паспорт в норме.")
        wait(1000)
        sampSendChat("/todo Всё в порядке.*отдавая паспорт обратно")
       end)
       check_documents[1] = false
       return false
     end
     if check_documents[2] and title == "{BFBBBA}Мед. карта" and string.match(text, "Имя: (%a+_%a+)") == sampGetPlayerNickname(setting[1][1].v)
      then
       local check = string.match(text, "{CEAD2A}Наркозависимость: (%d+)")
       if tonumber(check) > 5
        then
         lua_thread.create(function()
          sampSendChat("/me взял мед-карту у человека напротив")
          wait(2000)
          sampSendChat("/me начал проверять документ")
          wait(2000)
          sampSendChat("/todo К сожалению вы нам не подходите.*с разочарованием на лице")
          wait(2000)
          sampSendChat("У вас в мед-карте написано что вы имеете наркозависимость.")
          wait(2000)
          sampSendChat("/b Вылечитесь у нарколога в больнице.")
         end)
         removeBlip(blip)
         check_documents = {false, false, false}
         return false
       end
       lua_thread.create(function()
        sampSendChat("/me взял мед-карту человека напротив и начал проверять её")
        wait(1000)
        sampSendChat("/do Мед-карта в норме.")
        wait(1000)
        sampSendChat("/todo Всё в порядке.*отдавая мед-карту обратно")
       end)
       check_documents[2] = false
       return false
     end
     if check_documents[3] and id == 1234 and title == "{BFBBBA}Лицензии"
      then
       lua_thread.create(function()
        sampSendChat("/me взял лицензии человека напротив и начал проверять их")
        wait(1000)
        sampSendChat("/do Лицензии в норме.")
        wait(1000)
        sampSendChat("/todo Всё в порядке.*отдавая лицензии обратно")
       end)
       check_documents[3] = false
       return false
     end
   end
   if license_number ~= -1 and id == 6 and title == "{BFBBBA}Выберите лицензию" 
    then
     if license_number > 1
      then
       license_number = license_number + 1
     end
     sampSendDialogResponse(6, 1, license_number, -1)
     license_number = -1
     return false
   end
   if check_mc and title == "{BFBBBA}Мед. карта" and string.match(text, "Имя: (%a+_%a+)") == sampGetPlayerNickname(setting[2][1].v)
    then
     if string.find(text, "Полностью здоровый(ая)", 1, true)
      then
       license_number = 4
       removeBlip(blip)
       lua_thread.create(function()
	    stop = 1
        sampSendChat("/me взял мед-карту человека напротив и начал проверять её")
        wait(2000)
        sampSendChat("/do Мед-карта в норме.")
        wait(2000)
        sampSendChat("/todo Всё в порядке.*отдавая мед-карту обратно")
        wait(2000)
        sampSendChat("/do На столе лежат лицензии и ручка.")
        wait(2000)
        sampSendChat("/me взял ручку и заполнил лицензию на оружие")
        wait(2000)
        sampSendChat("/todo Вот, держите.*передавая лицензию человеку напротив")
        sampSendChat("/givelicense " .. setting[2][1].v)
		stop = 0
       end)
      else
       removeBlip(blip)
       lua_thread.create(function()
	    stop = 1
        sampSendChat("/me взял мед-карту человека напротив и начал проверять её")
        wait(2000)
        sampSendChat("/todo К сожалению я не могу продать вам лицензию на оружие.*отдавая мед-карту обратно")
        wait(2000)
        sampSendChat('Получить её можно только с отметкой "Полностью здоров" в мед-карте.')
		stop = 0
       end)
     end
     check_mc = false
     return false
   end
  end
  
  --function sampev.onSendChat(text) end
  
  function sampev.onServerMessage(color, text)
   if color == -10270721 and string.match(text, "%[Ошибка%] {FFFFFF}У этого игрока уже есть лицензия на (%A+)!")
    then
     sampSendChat("У вас уже есть лицензия на " .. string.match(text, "%[Ошибка%] {FFFFFF}У этого игрока уже есть лицензия на (%A+)!") .. ".")
   end
   if setting[6][6].v == false
    then
     if color == -1 and text == "{DFCFCF}[Подсказка] {DC4747}Чтобы завести двигатель введите {DFCFCF}/engine{DC4747} или нажмите {DFCFCF}N" or
        color == -1 and text == "{DFCFCF}[Подсказка] {DC4747}Для управления поворотниками используйте клавиши: {DFCFCF}(NUM4/NUM6)" or 
        color == -1 and text == "{DFCFCF}[Подсказка] {DC4747}В транспорте присутствует радио{DFCFCF} [/radio]" or
        color == -1 and string.find(text, "Этот транспорт зарегистрирован на жителя {9ACD32}%a+_%a+", 1, false) or 
        color == -10270721 and text == "[Ошибка] {FFFFFF}Рядом с вами нет транспорта!" or
        color == -1714683649 and text == "Используйте /olock чтобы закрыть организационный транспорт." or
        color == 1941201407 and text == "[Информация] {FFFFFF}Вы успешно арендовали это ТС" or
        color == -1800355329 and text == "[Информация] {FFFFFF}Чтобы отказаться от аренды [/unrentcar]" or
        color == -1800355329 and text == "[Информация] {FFFFFF}Чтобы закрыть автомобиль используйте [/jlock]" or
        color == 1941201407 and text == "[Информация] {FFFFFF}Вы отказались от аренды транспорта" or
        color == -1104335361 and text == "Доступно только на водительском месте!"
      then
       return false
     end
   end
   if setting[6][7].v == false
    then
     if color == -1029514497 and string.find(text, " %a+_%a+ вставил%(а%) ключи в замок зажигания", 1, false) or
        color == -1029514497 and string.find(text, " %a+_%a+ пытается завести двигатель", 1, false) or
        color == 1182971135 and string.find(text,  " Двигатель успешно завелся | %-  %a+_%a+ %.", 1, false) or
        color == 1182971135 and string.find(text, "Двигатель не завелся | %-  %a+_%a+ %.", 1, false) or
        color == -1029514497 and string.find(text, " %a+_%a+ вытащил%(а%) ключи из замка зажигания", 1, false) or
        color == -1029514497 and string.find(text, " %a+_%a+ заглушил%(а%) двигатель", 1, false)
      then
       return false
     end
   end
   if setting[6][8].v == false
    then
     if color == 1687547391 and text == "[Подсказка] {FFFFFF}Номера телефонов государственных служб:" or
        color == -1 and text == "{FFFFFF}1.{6495ED} 111 - {FFFFFF}Проверить баланс телефона" or
        color == -1 and text == "{FFFFFF}2.{6495ED} 060 - {FFFFFF}Служба точного времени" or
        color == -1 and text == "{FFFFFF}3.{6495ED} 911 - {FFFFFF}Полицейский участок" or
        color == -1 and text == "{FFFFFF}4.{6495ED} 912 - {FFFFFF}Скорая помощь" or
        color == -1 and text == "{FFFFFF}5.{6495ED} 913 - {FFFFFF}Такси" or
        color == -1 and text == "{FFFFFF}6.{6495ED} 914 - {FFFFFF}Механик" or
        color == -1 and text == "{FFFFFF}7.{6495ED} 8828 - {FFFFFF}Справочная центрального банка"
      then
       return false
     end
   end
   if setting[6][9].v == false
    then
     if color == -6684673 and string.find(text, "%a+_%a+ достал%(а%) .+ из кармана", 1, false)
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
	   sampAddChatMessage("[SMIHelper] {FFFFFF}Начало загрузки обновления.", 0x3399FF)
	   downloadUrlToFile("https://github.com/Tema05/AutoSchool-Instructor/raw/master/AS%20Instructor.lua", thisScript().path, function(id, status, p1, p2)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA
         then 
	      sampAddChatMessage("[SMIHelper] {FFFFFF}Загрузка обновления V" .. version .. " завершена.", 0x3399FF)
		  lua_thread.create(function()
		   wait(2500)
	       thisScript():reload()
		  end)
        end
       end)
	  else
	   sampAddChatMessage("[AS Instructor] {FFFFFF}Обновления отсутствуют.", 0x3399FF)
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
          sampSendChat("/do Ключ от раздевалки в кармане.")
          wait(2000)
          sampSendChat("/me достал ключ от раздевалки из кармана")
          wait(2000)
          sampSendChat("/todo Добро пожаловать!*передав ключ человеку напротив")
          wait(2000)
          sampSendChat("Раздевалка на 2 этаже.")
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
          sampSendChat("/do Планшет с базой данных сотрудников в руках.")
          wait(2000)
          sampSendChat('/me зашёл в раздел "Чёрный список"')
          wait(2000)
          sampSendChat("/do Раздел открыт.")
          wait(2000)
          sampSendChat('/me убрал человека из раздела "Чёрный список"')
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
          sampSendChat("/do Планшет с базой данных сотрудников в руках.")
          wait(2000)
          sampSendChat('/me зашёл в раздел "Выговоры"')
          wait(2000)
          sampSendChat("/do Раздел открыт.")
          wait(2000)
          sampSendChat('/me снял выговор сотруднику в разделе "Выговоры"')
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
          sampSendChat("/do Планшет с базой данных сотрудников в руках.")
          wait(2000)
          sampSendChat('/me зашёл в раздел "Увольнение"')
          wait(2000)
          sampSendChat("/do Раздел открыт.")
          wait(2000)
          sampSendChat('/me внёс сотрудника в раздел "Увольнение"')
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
          sampSendChat("/do Планшет с базой данных сотрудников в руках.")
          wait(2000)
          sampSendChat('/me зашёл в раздел "Чёрный список"')
          wait(2000)
          sampSendChat("/do Раздел открыт.")
          wait(2000)
          sampSendChat('/me внёс челвека в раздел "Чёрный список"')
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
          sampSendChat("/do Планшет с базой данных сотрудников в руках.")
          wait(2000)
          sampSendChat('/me зашёл в раздел "Выговоры"')
          wait(2000)
          sampSendChat("/do Раздел открыт.")
          wait(2000)
          sampSendChat('/me выдал выговор сотруднику в разделе "Выговоры"')
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
          sampSendChat("/do Рация на поясе.")
          wait(2000)
          sampSendChat("/me достал рацию и вызвал охрану по ней")
          wait(2000)
          sampSendChat("/do Охрана вывела человека из радиоцентра.")
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
          sampSendChat("/do Новый бейджик в кармане.")
          wait(2000)
          sampSendChat("/me достал из кармана бейджик")
          wait(2000)
          sampSendChat("/todo С повышением, дорогой сотрудник*передав бейджик сотруднику")
          wait(2000)
          sampSendChat("Продолжайте работать в том же духе.")
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
        sampAddChatMessage("[AS Instructor] {FFFFFF}Не торопись.", 0x3399FF)
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
      imgui.Text(fa.ICON_FA_USER_TIMES .. u8" Отказы")
      imgui.Separator()
      if imgui.Selectable(u8"Нет паспорта") and check_rank(5) and check_stop()
       then
        removeBlip(blip)
        check_documents = {false, false, false}
        lua_thread.create(function()
         stop = 1
         sampSendChat("/todo К сожалению вы нам не подходите.*с разочарованием на лице")
         wait(2000)
         sampSendChat("У вас нет паспорта.")
         wait(2000)
         sampSendChat("/b Получите паспорт в мэрии.")
         stop = 0
        end)
      end 
      if imgui.Selectable(u8"Нет мед-карты") and check_rank(5) and check_stop()
       then
        removeBlip(blip)
        check_documents = {false, false, false}
        lua_thread.create(function()
         stop = 1
         sampSendChat("/todo К сожалению вы нам не подходите.*с разочарованием на лице")
         wait(2000)
         sampSendChat("У вас нет мед-карты.")
         wait(2000)
         sampSendChat("/b Получите мед-карту в больнице.")
         stop = 0
       end)
      end
      if imgui.Selectable(u8"НонРП ник") and check_rank(5) and check_stop()
       then
        removeBlip(blip)
        check_documents = {false, false, false}
        lua_thread.create(function()
         stop = 1
         sampSendChat("/do Планшет с базой данных в руках.")
         wait(2000)
         sampSendChat("/me нашёл в базе человека напротив")
         wait(2000)
         sampSendChat("/todo К сожалению вы нам не подходите.*с разочарованием на лице")
         wait(2000)
         sampSendChat("У вас странное имя, возможно тут опечатка.")
         wait(2000)
         sampSendChat("/b Смените ваш НонРП ник.")
         stop = 0
        end)
      end
      imgui.EndChild()
      imgui.SameLine()
      imgui.BeginChild(" ", imgui.ImVec2(216, 156), true)
      imgui.Text(u8"Введите id игрока:")
      imgui.SameLine()
      imgui.PushItemWidth(85)
      imgui.InputInt("  ", setting[1][1])
      imgui.PopItemWidth()
      if imgui.Button(fa.ICON_FA_PLAY .. u8" Начать собеседование", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        if setting[5][3].v == 1 and setting[5][4].v ~= ""
         then
          sampSendChat("Здравствуйте, меня зовут " .. u8:decode(setting[5][4].v) .. ". Вы пришли на собеседование?")
         else
          sampSendChat("Здравствуйте, меня зовут " .. my_nick .. ". Вы пришли на собеседование?")
        end
      end
      if imgui.Button(fa.ICON_FA_FILE_ALT .. u8" Попросить документы", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        if setting[1][1].v > -1 and setting[1][1].v < 1000
         then
          removeBlip(blip)
          check_documents = {true, true, true}
          lua_thread.create(function()
           stop = 1
           sampSendChat("Отлично, можно ли вашу документацию? Паспорт, мед-карту и лицензии.")
           wait(1000)
           sampSendChat("/b Чтобы показать документацию введите: /showpass " .. my_id .. ", /showmc " .. my_id .. ", /showlic " .. my_id .. " по РП!")
           stop = 0
          end)
         else
          sampAddChatMessage("[AS Instructor] {FFFFFF}Введите id игрока:", 0x3399FF)
        end
      end
      if imgui.Button(fa.ICON_FA_QUESTION .. u8" Расскажите о себе", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        lua_thread.create(function()
         stop = 1
         sampSendChat("Хорошо, теперь я задам пару вопросов.")
         wait(2000)
         sampSendChat("Расскажите о себе.")
         stop = 0
        end)
      end
      if imgui.Button(fa.ICON_FA_QUESTION .. u8" Почему именно мы?", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        sampSendChat("Почему вы решили прийти именно сюда?")
      end
      if imgui.Button(fa.ICON_FA_USER_CHECK .. u8" Собеседование пройдено", imgui.ImVec2(200, 20)) and check_rank(5) and check_stop()
       then
        removeBlip(blip)
        check_documents = {false, false, false}
        sampSendChat("/todo Поздравляю! Вы прошли собеседование!* с улыбкой на лице")
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
                sampSendChat("/do Ключ от раздевалки в кармане.")
                wait(2000)
                sampSendChat("/me достал ключ от раздевалки из кармана")
                wait(2000)
                sampSendChat("/todo Добро пожаловать!*передав ключ человеку напротив")
                wait(2000)
                sampSendChat("Раздевалка на 2 этаже.")
                stop = 2
                sampSendChat("/invite " .. marker_id)
                stop = 0
               end)
              else
              sampAddChatMessage("[AS Instructor] {FFFFFF}Выделите игрока.", 0x3399FF)
             end
           end
          end)
        end
      end
      imgui.EndChild()
      if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 3 then
      imgui.BeginChild("", imgui.ImVec2(110, 240), true)
      imgui.Separator()
      imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), u8"Информация:")
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
              sampSendChat('/do На груди весит бейджик с надписью "' .. rank_name .. " - " .. u8:decode(setting[5][4].v) .. '"')
             else
              sampSendChat('/do На груди весит бейджик с надписью "' .. rank_name .. " - " .. my_nick .. '"')
            end
            wait(1000)
            sampSendChat("Здравствуйте, чем я могу вам помочь?")
            stop = 0
           end)
          else
           lua_thread.create(function()
            stop = 1
            sampSendChat("/todo Вот, держите.*передавая прайс-лист человеку напротив")
            wait(2000)
            sampSendChat("/do В прайс-листе написано:")
            for i = 1, 6 do
             wait(2000)
             sampSendChat("/do Лицензия на " .. license[2][i] .. " - " .. string.gsub(mainIni.license[i], "&", ".") .. "$")
            end
            stop = 0
           end)
         end
       end
      end
      imgui.Separator()
      imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), u8"Лицензии:")
      imgui.Separator()
      for i = 3, 9 do 
       if imgui.Selectable(license[1][i]) and check_rank(3)
        then
         if i ~= 9
          then
           slot[1] = i - 2
          elseif check_stop()
           then
            sampSendChat("Лицензию на полёты можно получить только в авиашколе г. Лас-Вентурас.")
         end
       end
      end
      imgui.EndChild()
      imgui.SameLine()
      imgui.BeginChild(" ", imgui.ImVec2(319, 240), true)
      if slot[1] ~= 0
       then
        imgui.Text(u8"Введите id игрока:")
        imgui.SameLine()
        imgui.PushItemWidth(90)
        imgui.InputInt("  ", setting[2][1])
        imgui.PopItemWidth()
        if imgui.Button(fa.ICON_FA_FILE_SIGNATURE .. u8(" Продать лицензию на " .. string.match(license[2][slot[1]], "([^%d%s%-]+)")), imgui.ImVec2(235, 20)) and check_rank(3) and check_stop()
         then
          if slot[1] == 5
           then
            check_mc = true
            lua_thread.create(function()
             stop = 1
             sampSendChat("Для покупки лицензии на оружие необходимо показать мед-карту.")
             wait(1000)
             sampSendChat("/b Чтобы показать мед-карту введите: /showmc " .. my_id)
             stop = 0
            end)
           elseif setting[2][1].v > -1 and setting[2][1].v < 1000
            then
             license_number = slot[1] - 1
             removeBlip(blip)
             lua_thread.create(function()
              stop = 1
              sampSendChat("/do На столе лежат лицензии и ручка.")
              wait(2000)
              sampSendChat("/me взял ручку и заполнил лицензию на " .. string.match(license[2][license_number+1], "([^%d%s%-]+)"))
              wait(2000)
              sampSendChat("/todo Вот, держите.*передавая лицензию человеку напротив")
              sampSendChat("/givelicense " .. setting[2][1].v)
              stop = 0
             end)
            else
             sampAddChatMessage("[AS Instructor] {FFFFFF}Введите корректное id.", 0x3399FF)
          end
        end
        if slot[1] == 5
         then
          if imgui.Button(fa.ICON_FA_USER_TIMES .. u8" Нет мед-карты", imgui.ImVec2(150, 20)) and check_rank(3) and check_stop()
           then
            removeBlip(blip)
            lua_thread.create(function()
             stop = 1
             sampSendChat("К сожалению я не могу продать вам лицензию на охоту.")
             wait(2000)
             sampSendChat("Получить её можно только при наличии мед-карты.")
             wait(1000)
             sampSendChat("/b Получите мед-карту в больнице.")
             stop = 0
            end)
          end
        end
      end
      imgui.EndChild()
      if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 4 then
      imgui.BeginChild("", imgui.ImVec2(70, 240), true)
      for i = 1, 10 do
       if imgui.Selectable(u8"Стол №" .. i)
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
        imgui.Text(u8"Задержка:")
        imgui.SameLine()
        imgui.PushItemWidth(30)
        if imgui.InputText(u8"секунд(а) ", setting[3][1], imgui.InputTextFlags.CharsDecimal)
         then
          mainIni.lecture[slot[2] .. "_time"] = setting[3][1].v
          inicfg.save(mainIni, directIni)
        end
        imgui.PopItemWidth()
        imgui.SameLine(231)
        if imgui.Button(fa.ICON_FA_TRASH_ALT .. u8" Удалить лекцию", imgui.ImVec2(120, 20))
         then
          mainIni.lecture[slot[2] .. "_text"] = nil
          slot[2] = 0
        end
        imgui.Text(u8"Введите текст:")
        if imgui.InputTextMultiline("  ", setting[3][2], imgui.ImVec2(343, 158))
         then
          mainIni.lecture[slot[2] .. "_text"] = string.gsub(setting[3][2].v, "\n", "&")
          inicfg.save(mainIni, directIni)
        end
        if imgui.Button(fa.ICON_FA_MICROPHONE .. u8" Прочитать лекцию №" .. slot[2], imgui.ImVec2(343, 20)) and check_stop()
         then
          if setting[3][2].v ~= ""
           then
            sampSendChat(u8:decode(string.match(mainIni.lecture[slot[2] .. "_text"], "([^&]+)")))
           else
            sampAddChatMessage("[AS Instructor] {FFFFFF}Введите текст.", 0x3399FF)
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
      if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
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
        if imgui.Button(fa.ICON_FA_SAVE .. u8" Сохранить", imgui.ImVec2(100, 20))
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
            sampAddChatMessage("[AS Instructor] {FFFFFF}Команда {FF9933}/" .. u8:decode(setting[4][1].v) .. " {FFFFFF}для " .. command[2][slot[3]] .. " сохранена.", 0x3399FF)
           else
            sampAddChatMessage("[AS Instructor] {FFFFFF}Данная команда совпадает с другой и не будет сохранена.", 0x3399FF)
          end
        end
        imgui.Text(u8("Команда для " .. command[2][slot[3]] .. "."))
        imgui.Text(u8"Пример: /" .. mainIni.command[command[1][slot[3]]] .. " " .. u8(command[3][slot[3]]))
      end
      imgui.EndChild()
      if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 6 then
      imgui.BeginMenuBar()
      if imgui.MenuItem(u8"Активация")
       then
        imgui_menubar[1] = 1
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"Собес.")
       then
        imgui_menubar[1] = 2
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"Лицензии")
       then
        imgui_menubar[1] = 3
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"Меню быстрого доступа")
       then
        setting[5][2].v = GetNameKeysToNumber("setting", "menu")
        imgui_menubar[1] = 4
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"Прочее")
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
         imgui.Text(u8"Введите команду:")
         imgui.Text("/")
         imgui.SameLine()
         imgui.InputText("  ", setting[5][1])
         if imgui.Button(fa.ICON_FA_SAVE .. u8" Сохранить", imgui.ImVec2(100, 20))
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
               sampAddChatMessage("[AS Instructor] {FFFFFF}Команда {FF9933}/" .. u8:decode(setting[5][1].v) .. " {FFFFFF}для открытия " .. imgui_name[2][slot[4]] .. " сохранена.", 0x3399FF)
              else
               sampAddChatMessage("[AS Instructor] {FFFFFF}Данная команда совпадает с другой и не будет сохранена.", 0x3399FF)
             end
            else
             sampAddChatMessage("[AS Instructor] {FFFFFF}Введите команду.", 0x3399FF)
           end
         end
         imgui.Text(u8"Кнопка:")
         imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), setting[5][2].v)
         if imgui.Button(fa.ICON_FA_PEN .. u8" Изменить", imgui.ImVec2(100, 20))
          then
           imgui.OpenPopup("Activate")
         end
         if imgui.BeginPopup("Activate")
          then
           imgui.Text(u8"Зажмите нужную кнопку.")
           imgui.Text(u8"Кнопка:")
           imgui.SameLine()
           imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), GetPressedKeysName())
           if imgui.Button(fa.ICON_FA_TIMES_CIRCLE .. u8" Закрыть", imgui.ImVec2(100, 20))
            then
             imgui.CloseCurrentPopup()
           end
           imgui.SameLine()
           if imgui.Button(" " .. fa.ICON_FA_SAVE .. u8" Сохранить ", imgui.ImVec2(100, 20))
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
                 sampAddChatMessage("[AS Instructor] {FFFFFF}Кнопка {FF9933}" .. setting[5][2].v .. " {FFFFFF}для открытия " .. imgui_name[2][slot[4]] .. " сохранена", 0x3399FF)
                 imgui.CloseCurrentPopup()
                else
                 sampAddChatMessage("[AS Instructor] {FFFFFF}Данная кнопка уже используется и не будет сохранена.", 0x3399FF)
               end
              else
               sampAddChatMessage("[AS Instructor] {FFFFFF}Нажмите на нужную кнопку.", 0x3399FF)
             end
           end
           imgui.EndPopup()
         end
         imgui.SameLine()
         if imgui.Button(fa.ICON_FA_TRASH_ALT .. u8" Удалить", imgui.ImVec2(100, 20))
          then
           setting[5][2].v = ""
           mainIni.imgui_open[slot[4] .. "_b"] = ""
           inicfg.save(mainIni, directIni)
         end
       end
       imgui.EndChild()
      elseif imgui_menubar[1] == 2 then
       imgui.BeginChild("", imgui.ImVec2(434, 220), true)
       imgui.Text(u8"Имя в приветствии:")
       if imgui.Combo(" ", setting[5][3], {u8"Ваш ник на сервере", u8"Имя в нижнем поле"}, 2)
        then
         mainIni.setting.type_name = setting[5][3].v
         inicfg.save(mainIni, directIni)
       end
       if setting[5][3].v == 1
        then
         imgui.Text(u8"Ваше имя: (Пример: Карл Джонсон)")
         if imgui.InputText("  ", setting[5][4])
          then
           mainIni.setting.name = setting[5][4].v
           inicfg.save(mainIni, directIni)
         end
       end
       if imgui.ToggleButton(u8"Автоматически принимать.", setting[5][5])
        then
         mainIni.setting.auto_invite = setting[5][5].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Автоматически принимать.")
       if imgui.ToggleButton(u8"Писать в чат о выделении.", setting[5][6])
        then
         mainIni.setting.find = setting[5][6].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Писать в чат о выделении.")
       if imgui.ToggleButton(u8"Маркер над выделенным игроком.", setting[5][7])
        then
         removeBlip(blip)
         buffer = ""
         mainIni.setting.marker = setting[5][7].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Маркер над выделенным игроком.")
       imgui.EndChild()
      elseif imgui_menubar[1] == 3 then
       imgui.BeginChild("", imgui.ImVec2(434, 220), true)
       imgui.Text(u8"Имя в приветствии:")
       if imgui.Combo(" ", setting[5][3], {u8"Ваш ник на сервере", u8"Имя в нижнем поле"}, 2)
        then
         mainIni.setting.type_name = setting[5][3].v
         inicfg.save(mainIni, directIni)
       end
       if setting[5][3].v == 1
        then
         imgui.Text(u8"Ваше имя: (Пример: Карл Джонсон)")
         if imgui.InputText("  ", setting[5][4])
          then
           mainIni.setting.name = setting[5][4].v
           inicfg.save(mainIni, directIni)
         end
       end
       imgui.Text(u8"Прайс-лист:")
       if imgui.Combo("   ", setting[5][8], menu[1], 6)
        then
         setting[5][9].v = string.gsub(mainIni.license[setting[5][8].v+1], "&", ".")
       end
       imgui.Text(u8"Цена:")
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
      imgui.Text(u8"Активация меню быстрого доступа:")
      imgui.Text(u8"Зажмите ПКМ смотря на игрока с которым хотите взаимодействовать")
      imgui.Text(u8"и нажмите")
      imgui.SameLine()
      imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), setting[5][2].v)
      if imgui.Button(fa.ICON_FA_PEN .. u8" Изменить", imgui.ImVec2(100, 20))
       then
        imgui.OpenPopup("Activate")
      end
      if imgui.BeginPopup("Activate")
       then
        imgui.Text(u8"Зажмите нужную кнопку.")
        imgui.Text(u8"Кнопка:")
        imgui.SameLine()
        imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), GetPressedKeysName())
        if imgui.Button(fa.ICON_FA_TIMES_CIRCLE .. u8" Закрыть", imgui.ImVec2(100, 20))
         then
          imgui.CloseCurrentPopup()
        end
        imgui.SameLine()
        if imgui.Button(" " .. fa.ICON_FA_SAVE .. u8" Сохранить ", imgui.ImVec2(100, 20))
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
              sampAddChatMessage("[AS Instructor] {FFFFFF}Кнопка {FF9933}" .. setting[5][2].v .. " {FFFFFF}для открытия меню быстрого доступа сохранена", 0x3399FF)
              imgui.CloseCurrentPopup()
             else
              sampAddChatMessage("[AS Instructor] {FFFFFF}Данная кнопка уже используется и не будет сохранена.", 0x3399FF)
            end
           else
            sampAddChatMessage("[AS Instructor] {FFFFFF}Нажмите на нужную кнопку.", 0x3399FF)
          end
        end
        imgui.EndPopup()
      end
      imgui.SameLine()
      if imgui.Button(fa.ICON_FA_TRASH_ALT .. u8" Удалить", imgui.ImVec2(100, 20))
       then
        setting[5][2].v = ""
        mainIni.setting.menu = ""
        inicfg.save(mainIni, directIni)
      end
      imgui.EndChild()
     elseif imgui_menubar[1] == 5 then
      imgui.BeginChild("", imgui.ImVec2(434, 220), true)
      if imgui.ToggleButton(u8"Возможность передвигать окно скрипта.", setting[5][10])
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
      imgui.Text(u8"Возможность передвигать окно скрипта.")
      imgui.Text(u8"Позиция окна: (В пикселях)")
      imgui.Text(u8"Отступ от левого края:")
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
      imgui.Text(u8"Отступ от верхнего края:")
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
      if imgui.Button(fa.ICON_FA_SAVE .. u8" Сохранить", imgui.ImVec2(100, 20))
       then
        mainIni.setting.x = x.v
        mainIni.setting.y = y.v
        inicfg.save(mainIni, directIni)
        apdate_imgui_pos = true
        sampAddChatMessage("[AS Instructor] {FFFFFF}Новая позиция скрипта сохранена.", 0x3399FF)
        sampAddChatMessage("[AS Instructor] {FFFFFF}Что-бы сбросить настройки введите команду {FF9933}/resetpos", 0x3399FF)
      end
      imgui.EndChild()
     end
      if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 7 then
      imgui.BeginMenuBar()
      if imgui.MenuItem(u8"Биндер")
       then
        imgui_menubar[2] = 1
      end
      imgui.Text("|")
      if imgui.MenuItem(u8"Чат")
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
        if imgui.Selectable(u8"Слот №" .. i)
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
         imgui.Text(u8"Активация:")
         imgui.SameLine()
         imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), setting[6][4].v)
         imgui.SameLine(231)
         if imgui.Button(fa.ICON_FA_PEN .. u8" Изменить", imgui.ImVec2(120, 20))
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
           if imgui.Combo("  ", setting[6][3], {u8"Активация на кнопку", u8"Активация по команде"}, 2)
            then
             mainIni.binder[slot[5] .. "_type"] = setting[6][3].v
           end
           imgui.PopItemWidth()
           if mainIni.binder[slot[5] .. "_type"] ~= -1
            then
             if mainIni.binder[slot[5] .. "_type"] == 0
              then
               imgui.Text(u8"Нажмите на нужную кнопку.")
               imgui.Text(u8"Кнопка:")
               imgui.SameLine()
               imgui.TextColored(imgui.ImVec4(1, 0.6, 0.2, 1), GetPressedKeysName())
               if imgui.Button(fa.ICON_FA_TIMES_CIRCLE .. u8" Закрыть", imgui.ImVec2(100, 20))
                then
                 imgui.CloseCurrentPopup()
               end
               imgui.SameLine()
               if imgui.Button(fa.ICON_FA_SAVE .. u8" Сохранить", imgui.ImVec2(100, 20))
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
                     sampAddChatMessage("[AS Instructor] {FFFFFF}Кнопка {FF9933}" .. setting[6][4].v .. " {FFFFFF}для активации банда №" .. slot[5] .. " сохранена.", 0x3399FF)
                     imgui.CloseCurrentPopup()
                    else
                     sampAddChatMessage("[AS Instructor] {FFFFFF}Данная кнопка уже используется и не будет сохранена.", 0x3399FF)
                   end
                  else
                   sampAddChatMessage("[AS Instructor] {FFFFFF}Нажмите на нужную кнопку.", 0x3399FF)
                 end
               end
              else
               imgui.Text(u8"Введите команду:")
               imgui.Text("/")
               imgui.SameLine()
               imgui.PushItemWidth(196)
               imgui.InputText("    ", setting[6][5])
               imgui.PopItemWidth()
               if imgui.Button(fa.ICON_FA_TIMES_CIRCLE .. u8" Закрыть", imgui.ImVec2(100, 20))
                then
                 imgui.CloseCurrentPopup()
               end
               imgui.SameLine()
               if imgui.Button(fa.ICON_FA_SAVE .. u8" Сохранить", imgui.ImVec2(100, 20))
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
                     sampAddChatMessage("[AS Instructor] {FFFFFF}Команда {FF9933}" .. setting[6][4].v .. " {FFFFFF}для активации банда №" .. slot[5] .. " сохранена.", 0x3399FF)
                     imgui.CloseCurrentPopup()
                    else
                     sampAddChatMessage("[AS Instructor] {FFFFFF}Данная команда совпадает с другой и не будет сохранена.", 0x3399FF)
                   end
                  else
                   sampAddChatMessage("[AS Instructor] {FFFFFF}Введите команду.", 0x3399FF)
                 end
               end
             end
           end
           imgui.EndChild()
           imgui.EndPopup()
         end
         imgui.Text(u8"Задержка:")
         imgui.SameLine()
         imgui.PushItemWidth(30)
         if imgui.InputText(u8"секунд(а)", setting[6][2], imgui.InputTextFlags.CharsDecimal)
          then
           mainIni.binder[slot[5] .. "_time"] = setting[6][2].v
           inicfg.save(mainIni, directIni)
         end
         imgui.PopItemWidth()
         imgui.SameLine(231)
         if imgui.Button(fa.ICON_FA_TRASH_ALT .. u8" Удалить бинд", imgui.ImVec2(120, 20)) and check_stop()
          then
           mainIni.binder[slot[5] .. "_text"] = nil
           mainIni.binder[slot[5] .. "_time"] = nil
           mainIni.binder[slot[5] .. "_type"] = nil
           mainIni.binder[slot[5] .. "_act"] = nil
           inicfg.save(mainIni, directIni)
           slot[5] = 0
         end
         imgui.Text(u8"Введите текст:")
         if imgui.InputTextMultiline("     ", setting[6][1], imgui.ImVec2(343, 137))
          then
           mainIni.binder[slot[5] .. "_text"] = string.gsub(setting[6][1].v, "\n", "&")
           inicfg.save(mainIni, directIni)
         end
       end
       imgui.EndChild()
      elseif imgui_menubar[2] == 2 then
       imgui.BeginChild("", imgui.ImVec2(434, 220), true, imgui.WindowFlags.NoScrollbar)
       if imgui.Button(u8"Очистить чат", imgui.ImVec2(100, 20))
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
       if imgui.ToggleButton("Подсказки при посадку в машину.", setting[6][6])
        then 
         mainIni.chat[1] = setting[6][6].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Подсказки при посадку в машину.")
       if imgui.ToggleButton("Отыгровки двигателя/ключей.", setting[6][7])
        then 
         mainIni.chat[2] = setting[6][7].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Отыгровки двигателя/ключей.")
       if imgui.ToggleButton("Подсказки при наборе номера телефона.", setting[6][8])
        then 
         mainIni.chat[3] = setting[6][8].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Подсказки при наборе номера телефона.")
       if imgui.ToggleButton("Отыгровка достатия телефона.", setting[6][9])
        then 
         mainIni.chat[4] = setting[6][9].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Отыгровка достатия телефона.")
       if imgui.ToggleButton("Сообщения от сервера.", setting[6][10])
        then 
         mainIni.chat[5] = setting[6][10].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Сообщения от сервера.")
       if imgui.ToggleButton("Сообщения администрации.", setting[6][11])
        then 
         mainIni.chat[6] = setting[6][11].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Сообщения администрации.")
       if imgui.ToggleButton("Попытки избежать наказание.", setting[6][12])
        then 
         mainIni.chat[7] = setting[6][12].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Попытки избежать наказание.")
       if imgui.ToggleButton("Государственные новости.", setting[6][13])
        then 
         mainIni.chat[8] = setting[6][13].v
         inicfg.save(mainIni, directIni)
       end
       imgui.SameLine()
       imgui.Text(u8"Государственные новости.")
       imgui.EndChild()
      end
      if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 8 then
	  imgui.BeginChild("", imgui.ImVec2(434, 240), true)
	  if imgui.Button(u8"Проверить обновления", imgui.ImVec2(150, 20))
	   then
	    sampAddChatMessage("[AS Instructor] {FFFFFF}Проверка обновлений.", 0x3399FF)
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
		    sampAddChatMessage("[AS Instructor] {FFFFFF}Проверка завершена.", 0x3399FF)
		    if version ~= thisScript().version
	         then
			  sampAddChatMessage("[AS Instructor] {FFFFFF}Обнаружено обновление с версии {3399FF}V" .. thisScript().version .. " {FFFFFF}на версию {3399FF}V" .. version, 0x3399FF)
	          sampAddChatMessage('[AS Instructor] {FFFFFF}Список изменений вы можете посмотреть в разделе "Информация"', 0x3399FF)
	          sampAddChatMessage("[AS Instructor] {FFFFFF}Чтобы загрузить обновление введите команду {FF9933}/update", 0x3399FF)
			  sampShowDialog(10003, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}Обнаружено обновление с версии {3399FF}V" .. thisScript().version .. " {FFFFFF}на версию {3399FF}V" .. version ..'{FFFFFF}\nСписок изменений вы можете посмотреть в разделе "Информация"\nЧтобы загрузить обновление введите команду {FF9933}/update\n{FFFFFF}или нажмите кнопку "Загрузить"', "Загрузить", "Ок", 0)
			 else
		      sampAddChatMessage("[AS Instructor] {FFFFFF}Обновления отсутствуют.", 0x3399FF)
	        end
		   else
		    sampAddChatMessage("[AS Instructor] {FFFFFF}Не получилось проверить обновления.", 0x3399FF)
			sampShowDialog(10004, "{3399FF}AutoSchool Instructor V" .. thisScript().version, "{FFFFFF}Не получилось проверить обновление.\nПопробуйте следующие действия:\n{3399FF}1. {FFFFFF}Проверьте соединение с интернетом.\n{3399FF}2. {FFFFFF}Попробуйте проверить обновления ещё раз.\n{3399FF}3. {FFFFFF}Перезагрузите скрипт и попробуйте ещё раз.\n{3399FF}4. {FFFFFF}Попробуйсте проверить обновление позже.\n{3399FF}5. {FFFFFF}Переустановите скрипт.", "Ок", "", 0)
	      end
         end
        end)
      end
	  imgui.Text(u8"Версия скрипта: V" .. thisScript().version)
	  imgui.Text(text_update)
	  imgui.EndChild()
      if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
       then
        imgui_open(1)
      end
     elseif imgui_number == 9 then
      if slot[6] == 0 then
       if imgui.Button(fa.ICON_FA_HANDSHAKE .. u8" Поприветствовать игрока", imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
        then
         imgui_open(9)
         lua_thread.create(function()
          stop = 1
          if setting[5][3].v == 1 and setting[5][4].v ~= ""
           then
            sampSendChat('/do На груди весит бейджик с надписью "' .. rank_name .. " - " .. u8:decode(setting[5][4].v) .. '"')
           else
            sampSendChat('/do На груди весит бейджик с надписью "' .. rank_name .. " - " .. my_nick .. '"')
          end
          wait(1000)
          sampSendChat("Здравствуйте, чем я могу вам помочь?")
          stop = 0
         end)
       end
       if imgui.Button(fa.ICON_FA_FILE_ALT .. u8" Озвучить прайс-лист", imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
        then
         imgui_open(9)
         lua_thread.create(function()
          stop = 1
          sampSendChat("/todo Вот, держите.*передавая прайс-лист человеку напротив")
          wait(2000)
          sampSendChat("/do В прайс-листе написано:")
          for i = 1, 6 do
           wait(2000)
           sampSendChat("/do Лицензия на " .. license[2][i] .. " - " .. string.gsub(mainIni.license[i], "&", ".") .. "$")
          end
          stop = 0
         end)
       end
       if imgui.Button(fa.ICON_FA_FILE_SIGNATURE .. u8" Продать лицензию игроку", imgui.ImVec2(250, 20))
        then
         setting[7][1].v = 0
         slot[6] = 1
       end
       if imgui.Button(fa.ICON_FA_USER_PLUS .. u8" Принять в организацию", imgui.ImVec2(250, 20))
        then
         imgui_open(9)
         sampSendChat("/" .. mainIni.command.uninvite .. " " .. marker_id)
       end
       if imgui.Button(fa.ICON_FA_USER_MINUS .. u8" Уволить из организации", imgui.ImVec2(250, 20))
        then
         for i = 1, 3 do
          setting[7][i].v = 0
         end
         slot[6] = 2
       end
	   if imgui.Button(fa.ICON_FA_SORT_AMOUNT_UP .. u8" Выдать повышение", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 3
	   end
	   if imgui.Button(fa.ICON_FA_USER_TIMES .. u8" Занести в чёрный список", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 4
	   end
	   if imgui.Button(fa.ICON_FA_USER_CHECK .. u8" Убрать из чёрнога списка", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         sampSendChat("/" .. mainIni.command.unblacklist .. " " .. marker_id)
	   end
	   if imgui.Button(fa.ICON_FA_THUMBS_DOWN .. u8" Дать выговор сотруднику", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 5
	   end
	   if imgui.Button(fa.ICON_FA_THUMBS_UP .. u8" Снять выговор сотруднику", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         sampSendChat("/" .. mainIni.command.unfwarn .. " " .. marker_id)
	   end
	   if imgui.Button(fa.ICON_FA_MICROPHONE_SLASH .. u8" Дать мут сотруднику", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 6
	   end
	   if imgui.Button(fa.ICON_FA_MICROPHONE .. u8" Снять мут сотруднику", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         sampSendChat("/" .. mainIni.command.funmute .. " " .. marker_id)
	   end
	   if imgui.Button(fa.ICON_FA_USER_SLASH .. u8" Выгнать из радиоцентра", imgui.ImVec2(250, 20))
	    then
		 setting[7][1].v = 0
		 slot[6] = 7
	   end
      elseif slot[6] == 1 then
       imgui.Text(u8"Лицензия:")
       imgui.SameLine()
       imgui.PushItemWidth(184)
       imgui.Combo("", setting[7][1], menu[1], 6)
       imgui.PopItemWidth()
       if imgui.Button(fa.ICON_FA_FILE_SIGNATURE .. u8(" Продать лицензию на " .. string.match(license[2][setting[7][1].v+1], "([^%d%s%-]+)")), imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
        then
         imgui_open(9)
         slot[6] = 0
         if setting[7][1].v == 4
          then
           check_mc = true
           lua_thread.create(function()
            stop = 1
            sampSendChat("Для покупки лицензии на оружие необходимо показать мед-карту.")
            wait(1000)
            sampSendChat("/b Чтобы показать мед-карту введите: /showmc " .. my_id)
            stop = 0
           end)
          else
           license_number = setting[7][1].v
           removeBlip(blip)
           lua_thread.create(function()
            stop = 1
            sampSendChat("/do На столе лежат лицензии и ручка.")
            wait(2000)
            sampSendChat("/me взял ручку и заполнил лицензию на " .. string.match(license[2][license_number+1], "([^%d%s%-]+)"))
            wait(2000)
            sampSendChat("/todo Вот, держите.*передавая лицензию человеку напротив")
            sampSendChat("/givelicense " .. marker_id)
            stop = 0
           end)
         end
       end
       if setting[7][1].v == 4
        then
         if imgui.Button(fa.ICON_FA_USER_TIMES .. u8" У игрока нет мед-карты", imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
          then
           imgui_open(9)
           slot[6] = 0
           removeBlip(blip)
           lua_thread.create(function()
            stop = 1
            sampSendChat("К сожалению я не могу продать вам лицензию на охоту.")
            wait(2000)
            sampSendChat("Получить её можно только при наличии мед-карты.")
            wait(1000)
            sampSendChat("/b Получите мед-карту в больнице.")
            stop = 0
          end)
         end
       end
       if imgui.Button(fa.ICON_FA_HAND_POINT_RIGHT .. u8" Лицензия на полёты в ЛВ", imgui.ImVec2(250, 20)) and check_rank(3) and check_stop()
        then
         imgui_open(9)
         slot[6] = 0
         sampSendChat("Лицензию на полёты можно получить только в авиашколе г. Лас-Вентурас.")
       end
       if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
      elseif slot[6] == 2 then
       imgui.PushItemWidth(250)
       imgui.Combo("", setting[7][1], {u8"Уволить без ЧС", u8"Уволить с ЧС"}, 2)
       imgui.Text(u8"Причина увольнения:")
       imgui.Combo(" ", setting[7][2], menu[2], 3)
       imgui.PopItemWidth()
       if setting[7][1].v == 1
        then
         imgui.Text(u8"Причина ЧС:")
         imgui.PushItemWidth(250)
         imgui.Combo("  ", setting[7][3], menu[3], 4)
         imgui.PopItemWidth()
         if imgui.Button(fa.ICON_FA_USER_MINUS .. u8" Уволить из организации", imgui.ImVec2(250, 20))
          then
           imgui_open(9)
           slot[6] = 0
		   if check_stop() and check_rank(9)
		    then
             lua_thread.create(function()
              stop = 1
              sampSendChat("/do Планшет с базой данной сотрудников в руках.")
              wait(2000)
              sampSendChat('/me зашёл в раздел "Увольнение"')
              wait(2000)
              sampSendChat("/do Раздел открыт.")
              wait(2000)
              sampSendChat('/me внёс сотрудника в раздел "Увольнение"')
              wait(2000)
              sampSendChat('/me зашёл в раздел "Чёрный список"')
              wait(2000)
              sampSendChat("/do Раздел открыт.")
              wait(2000)
              sampSendChat('/me внёс сотрудника в раздел "Чёрный список"')
              stop = 2
              sampSendChat("/uninvite " .. marker_id .. " " .. u8:decode(menu[2][setting[7][2].v+1]))
              sampSendChat("/blacklist " .. marker_id .. " " .. u8:decode(menu[3][setting[7][3].v+1]))
              stop = 0
              removeBlip(blip)
             end)
           end
		 end
        else
         if imgui.Button(fa.ICON_FA_USER_MINUS .. u8" Уволить из организации", imgui.ImVec2(250, 20))
          then
           imgui_open(9)
           slot[6] = 0
           sampSendChat("/" .. mainIni.command.uninvite .. " " .. marker_id .. " " .. u8:decode(menu[2][setting[7][2].v+1]))
         end
       end
       if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 3 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], {u8"1 ранг", u8"2 ранг", u8"3 ранг", u8"4 ранг", u8"5 ранг", u8"6 ранг", u8"7 ранг", u8"8 ранг", u8"9 ранг"}, 9)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_SORT_AMOUNT_UP .. u8" Выдать повышение", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         slot[6] = 0
		 sampSendChat("/" .. mainIni.command.giverank .. " " .. marker_id .. " " .. setting[7][1].v+1)
	   end
	   if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 4 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], menu[3], 4)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_USER_TIMES .. u8" Занести в чёрный список", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         slot[6] = 0
		 sampSendChat("/" .. mainIni.command.blacklist .. " " .. marker_id .. " " .. u8:decode(menu[3][setting[7][1].v+1]))
	   end
	   if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 5 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], menu[4], 4)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_THUMBS_DOWN .. u8" Дать выговор сотруднику", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         slot[6] = 0
		 sampSendChat("/" .. mainIni.command.fwarn .. " " .. marker_id .. " " .. u8:decode(menu[4][setting[7][1].v+1]))
	   end
	   if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 6 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], menu[5], 7)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_MICROPHONE_SLASH .. u8" Дать мут сотруднику", imgui.ImVec2(250, 20))
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
	   if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
        then
         slot[6] = 0
       end
	  elseif slot[6] == 7 then
	   imgui.PushItemWidth(250)
	   imgui.Combo("", setting[7][1], menu[6], 2)
	   imgui.PopItemWidth()
	   if imgui.Button(fa.ICON_FA_USER_SLASH .. u8" Выгнать из радиоцентра", imgui.ImVec2(250, 20))
	    then
		 imgui_open(9)
         slot[6] = 0
		 sampSendChat("/" .. mainIni.command.expel .. " " .. marker_id .. " " .. u8:decode(menu[6][setting[7][1].v+1]))
	   end
	   if imgui.Button(u8"Назад", imgui.ImVec2(100, 20))
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