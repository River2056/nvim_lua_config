local M = {}

M.home = vim.fn.has("macunix") == 1 and "~" or "C:/Users/H0268"
M.config_path = vim.fn.stdpath("config"):gsub("\\", "/")
M.java_debug_path = M.config_path .. "/java-debug/"
M.vscode_java_test_path = M.config_path .. "/vscode-java-test/"
M.lombok_path = M.home .. "/lombok.jar"

return M
