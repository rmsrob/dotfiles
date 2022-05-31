local U = require "rms.utils"
local g = vim.g
-- local bufferline = {}



-- g.bufferline.animation= true			-- Enable/disable animations
-- -- Enable/disable icons
-- -- if set to 'numbers', will show buffer index in the tabline
-- -- if set to 'both', will show buffer index and icons in the tabline
-- --g.bufferline.icons = "both"
-- g.bufferline.shadow = true			-- Show a shadow over the editor in buffer-pick mode


-- -- Configure icons on the bufferline.
-- g.bufferline.icon_separator_active = '▎'
-- g.bufferline.icon_separator_inactive = '▎'
-- g.bufferline.icon_close_tab = ''
-- g.bufferline.icon_close_tab_modified = '●'


-- g.bufferline.closable = true		-- Enable/disable close button

-- -- Enables/disable clickable tabs
-- --  - left-click: go to buffer
-- --  - middle-click: delete buffer
-- --
-- -- NOTE disabled by default because this might cause E541 (too many items)
-- --      if you have many tabs open
-- g.bufferline.clickable = true

-- -- If set, the letters for each buffer in buffer-pick mode will be
-- -- assigned based on their name. Otherwise or in case all letters are
-- -- already assigned, the behavior is to assign letters in order of
-- -- usability (see order below)
-- bufferline.semantic_letters = true

-- -- New buffer letters are assigned in this order. This order is
-- -- optimal for the qwerty keyboard layout but might need adjustement
-- -- for other layouts.
-- g.bufferline.letters = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP'

-- -- Sets the maximum padding width with which to surround each tab
-- g.bufferline.maximum_padding = 4

-- bg_current = get(nvim_get_hl_by_name('Normal',     1), 'background', '#000000')
-- bg_visible = get(nvim_get_hl_by_name('TabLineSel', 1), 'background', '#000000')
-- bg_inactive = get(nvim_get_hl_by_name('TabLine',   1), 'background', '#000000')

-- For the current active buffer
-- exec 'hi default link BufferCurrent  Normal'
-- -- For the current active buffer when modified
-- exec 'hi default link BufferCurrentMod   Normal'
-- -- For the current active buffer icon
-- exec 'hi default link BufferCurrentSign  Normal'
-- -- For the current active buffer target when buffer-picking
-- exec 'hi default BufferCurrentTarget   guifg=red gui=bold guibg=#000000'

-- -- For buffers visible but not the current one
-- exec 'hi default link BufferVisible      TabLineSel'
-- exec 'hi default link BufferVisibleMod   TabLineSel'
-- exec 'hi default link BufferVisibleSign  TabLineSel'
-- exec 'hi default BufferVisibleTarget   guifg=red gui=bold guibg=#000000'

-- -- For buffers invisible buffers
-- exec 'hi default link BufferInactive     TabLine'
-- exec 'hi default link BufferInactiveMod  TabLine'
-- exec 'hi default link BufferInactiveSign TabLine'
-- exec 'hi default BufferInactiveTarget   guifg=red gui=bold guibg=#000000'


-- -- For the shadow in buffer-picking mode
-- exec 'hi default BufferShadow guifg=#000000 guibg=#000000'

