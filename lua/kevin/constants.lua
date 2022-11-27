local M = {}

-- M.home = vim.fn.has("macunix") == 1 and "~" or "C:/Users/H0268"
-- get home path from environment variable, set before use!
M.home = os.getenv("KEVIN_NVIM_HOME")

M.config_path = vim.fn.stdpath("config"):gsub("\\", "/")
M.java_debug_path = M.config_path .. "/java-debug/"
M.vscode_java_test_path = M.config_path .. "/vscode-java-test/"
M.lombok_path = M.home .. "/lombok.jar"

M.jdtls_java_path = "/usr/local/opt/openjdk@17/bin/java"
M.jdtls_jdk11_path = "/usr/local/opt/openjdk@11"
M.jdtls_jdk17_path = "/usr/local/opt/openjdk@17"
M.jdtls_debug_port = 8000

return M
