local M = {}

-- M.home = vim.fn.has("macunix") == 1 and "~" or "C:/Users/H0268"
-- get home path from environment variable, set before use!
M.home = os.getenv("KEVIN_NVIM_HOME")

M.config_path = vim.fn.stdpath("config"):gsub("\\", "/")
M.java_debug_path = M.config_path .. "/java-debug/"
M.vscode_java_test_path = M.config_path .. "/vscode-java-test/"
M.lombok_path = M.home .. "/lombok.jar"

M.jdtls_java_path = "/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home/bin/java"
-- M.jdtls_java_path = "/opt/homebrew/opt/java/bin/java"
M.jdtls_jdk11_path = "/opt/homebrew/opt/openjdk@11"
-- M.jdtls_jdk15_path = "C:/openjdk-15.0.2_windows-x64_bin/jdk-15.0.2"
M.jdtls_jdk17_path = "/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
-- M.jdtls_jdk8_path = "C:/Program Files/Zulu/zulu-8"
M.jdtls_debug_port = 8000
M.powershell_es_path = vim.fn.stdpath("data"):gsub("\\", "/") .. "/mason/packages/powershell-editor-services/"

return M
