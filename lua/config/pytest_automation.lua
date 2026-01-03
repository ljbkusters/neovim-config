vim.api.nvim_create_user_command('PytestAdd', function()
    -- 1. Get the current file path relative to the project root
    local current_file = vim.fn.expand('%')

    -- Guard: Ensure it's a python file and not already a test
    if current_file == "" or vim.bo.filetype ~= "python" then
        print("Error: Current buffer is not a Python file")
        return
    end

    if current_file:match("^tests/") then
        print("Error: You are already in the tests directory")
        return
    end

    -- 2. Extract directory and filename
    local dir = vim.fn.fnamemodify(current_file, ':h')
    local filename = vim.fn.fnamemodify(current_file, ':t')
    -- 3. Build the target path: tests/mymodule/core/forms/test_form.py
    local logic_dir = dir:gsub("^src/", "")
    local test_dir = "tests/" .. logic_dir
    local test_filename = "test_" .. filename
    local test_path = test_dir .. "/" .. test_filename

    -- 4. Create directory structure if missing
    if vim.fn.isdirectory(test_dir) == 0 then
        vim.fn.mkdir(test_dir, "p")
    end

    -- 5. Open the test file
    vim.cmd("edit " .. test_path)

    -- 6. Add boilerplate if the file is brand new
    if vim.fn.line('$') == 1 and vim.fn.getline(1) == "" then
        local lines = {
            "import pytest",
            "",
            "def test_logic():",
            "    # TODO: Implement tests for " .. filename,
            "    assert True",
        }
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
        -- Save the new file immediately so it exists on disk
        vim.cmd("write")
    end

    print("Created test file: " .. test_path)
end, { desc = "Create a matching pytest file under tests/" })
