local M = {}

-- M.home = vim.fn.has("macunix") == 1 and "~" or "C:/Users/H0268"
-- get home path from environment variable, set before use!
M.home = os.getenv("KEVIN_NVIM_HOME")

M.config_path = vim.fn.stdpath("config"):gsub("\\", "/")
M.java_debug_path = M.config_path .. "/java-debug/"
M.vscode_java_test_path = M.config_path .. "/vscode-java-test/"
M.lombok_path = M.home .. "/lombok.jar"

M.jdtls_java_path = "C:/Program Files/OpenJDK/jdk-17.0.2/bin/java.exe"
M.jdtls_jdk11_path = "C:/Program Files/Eclipse Adoptium/jdk-11.0.13.8-hotspot/"
M.jdtls_jdk15_path = "C:/Program Files/Java/jdk-15.0.1"
M.jdtls_jdk17_path = "C:/Program Files/OpenJDK/jdk-17.0.2"
M.jdtls_jdk8_path = "C:/Program Files/Java/jdk1.8.0_281"
M.jdtls_debug_port = 8000
M.powershell_es_path = vim.fn.stdpath("data"):gsub("\\", "/") .. "/mason/packages/powershell-editor-services/"

return M
