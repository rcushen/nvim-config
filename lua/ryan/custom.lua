local api = vim.api
local fn = vim.fn

-- Create the content for our custom buffer
local function create_centered_text(text)
    local width = api.nvim_get_option("columns")
    local shift = math.floor((width - #text) / 2)
    return string.rep(" ", shift) .. text
end

local function create_clock()
    return create_centered_text(os.date("%H:%M:%S"))
end

-- Function to create our custom buffer
local function create_custom_start_screen()
    -- Create a new buffer
    local buf = api.nvim_create_buf(false, true)

    -- Set buffer options
    api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    api.nvim_buf_set_option(buf, 'swapfile', false)
    api.nvim_buf_set_option(buf, 'modifiable', true)

    -- Get the window height
    local win_height = api.nvim_get_option("lines")

    -- Calculate vertical centering
    local content_height = 5  -- Number of lines in our content
    local start_line = math.floor((win_height - content_height) / 2)

    -- Create empty lines for top padding
    local lines = {}
    for _ = 1, start_line do
        table.insert(lines, "")
    end

    -- Add the centered content
    table.insert(lines, create_centered_text("EVERY SECOND COUNTS"))
    table.insert(lines, "")
    table.insert(lines, create_clock())

    -- Set the buffer content
    api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Make the buffer readonly
    api.nvim_buf_set_option(buf, 'modifiable', false)
    api.nvim_buf_set_option(buf, 'modified', false)

    -- Switch to the buffer
    api.nvim_set_current_buf(buf)

    -- Get the current window and set options
    local win = api.nvim_get_current_win()
    api.nvim_win_set_option(win, 'number', false)
    api.nvim_win_set_option(win, 'relativenumber', false)
    api.nvim_win_set_option(win, 'cursorline', false)
    api.nvim_win_set_option(win, 'signcolumn', 'no')

    -- Set up clock update
    local timer = vim.loop.new_timer()
    timer:start(0, 1000, vim.schedule_wrap(function()
        if api.nvim_buf_is_valid(buf) then
            api.nvim_buf_set_option(buf, 'modifiable', true)
            api.nvim_buf_set_lines(buf, start_line + 2, start_line + 3, false, {create_clock()})
            api.nvim_buf_set_option(buf, 'modifiable', false)
        else
            timer:stop()
        end
    end))

    -- Set buffer-local autocmd to close on certain events
    local group = api.nvim_create_augroup("CustomStartScreen", { clear = true })
    api.nvim_create_autocmd({"BufEnter"}, {
        group = group,
        buffer = buf,
        callback = function()
            local total_bufs = #vim.tbl_filter(function(b)
                return api.nvim_buf_get_option(b, 'buflisted')
            end, api.nvim_list_bufs())

            if total_bufs > 1 then
                api.nvim_buf_delete(buf, {force = true})
            end
        end
    })
end

-- Set up autocmd to show our start screen
api.nvim_create_autocmd({"VimEnter"}, {
    callback = function()
        if fn.argc() == 0 and fn.line2byte('$') == -1 then
            create_custom_start_screen()
        end
    end
})

-- Command to manually show the start screen
api.nvim_create_user_command("ShowStartScreen", create_custom_start_screen, {})
