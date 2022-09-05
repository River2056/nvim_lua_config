function compileRun()
    vim.cmd('exec "w"')

    local filetype = vim.bo.filetype
    local path = vim.fn.expand("%")
    local directoryprefix = vim.fn.getcwd()
    if filetype == "java" then
        print(path)
        vim.cmd("!javac -cp src -d bin " .. path)
        print("compile success: " .. path)

        path = path:gsub(directoryprefix, ""):gsub("\\", "."):gsub("/", "."):gsub(".java", ""):gsub("src.", "")
        print(path)
        vim.cmd("!java -cp ./bin " .. path)
    elseif filetype == "javascript" then
        vim.cmd(":!node " .. path)
    elseif filetype == "sh" then
        vim.cmd(":!bash " .. path .. "<cr>")
    elseif filetype == "go" then
        vim.cmd("!go run " .. path .. "<cr>")
    elseif filetype == "c" then
        local filename = path:sub(1, #path - 1)
        vim.cmd("!gcc " .. path .. " -o " .. filename .. " && " .. filename .. ".exe")
    elseif filetype == "cpp" then
        local filename = path:sub(1, #path - 3)
        vim.cmd("!g++ " .. path .. " -o " .. filename .. " && " .. filename .. ".exe")
    elseif filetype == "rust" then
        local filename = path:sub(1, #path - 4)
        vim.cmd("!rustc " .. path .. " && " .. filename .. ".exe")
    else
        vim.cmd("!" .. filetype .. " " .. path)
    end
end

vim.keymap.set("n", "<Leader>r", ":lua compileRun()<Return>")

-- run lua filter
vim.keymap.set("v", "<Leader>r", ":'<,'>!lua<Return>")

function changeCase()
    word = vim.fn.expand("<cword>")
    if word:find("[_\\w0-9]") ~= nil then
        -- has underscore, change to camelCase
        word = word:gsub("_[a-zA-Z0-9]", function(c)
            return c:upper():gsub("_", "")
        end)
        vim.cmd("norm! ciw" .. word)
    else
        -- has no underscore, change to snake_case
        word = word:gsub("[A-Z]", function(c)
            return "_" .. c:lower()
        end)
        vim.cmd("norm! ciw" .. word)
    end
end

vim.keymap.set("n", "<Leader>cc", ":lua changeCase()<Return>")
