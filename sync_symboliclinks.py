import re
import os
import platform

def main():
    system_platform = platform.system()
    config_files_path = ""
    nvim_system_path = ""

    # get nvim config files path
    nvim_config_files = os.walk(os.getcwd())
    for file in nvim_config_files:
        if len(config_files_path) == 0:
            config_files_path = file[0]
            break

    print(f"config files path: {config_files_path}")
    print(f"platform: {system_platform}")

    # figure out platform and search for nvim installation path
    if system_platform == "Windows":
        print("Platform Windows, use Windows settings...")
        for dirpath, _, _ in os.walk(os.path.join("C:\\", "Users")):
            if re.search(r".*AppData.Local.nvim.*", dirpath):
                print(f"nvim system path: {dirpath}")
                nvim_system_path = dirpath
                break
    else:
        print("Non Windows, using Linux/Mac settings...")
        nvim_system_path = "~/.config/nvim"

    for path, _, files in nvim_config_files:
        if not re.search(r"\.git", path):
            if files:
                if os.path.exists(path):
                    for f in files:
                        target_link_destination = os.path.join(path.replace(config_files_path, nvim_system_path), f)
                        if not os.path.exists(target_link_destination):
                            print(f"symbolic link not found: {target_link_destination}, creating...")
                            os.symlink(os.path.join(path, f), target_link_destination)
                else:
                    # create dir, then make symboliclink
                    print("target destination directory not found, creating...")
                    os.makedirs(path.replace(config_files_path, nvim_system_path))
                    for f in files:
                        target_link_destination = os.path.join(path.replace(config_files_path, nvim_system_path), f)
                        if not os.path.exists(target_link_destination):
                            print(f"symbolic link not found: {target_link_destination}, creating...")
                            os.symlink(os.path.join(path, f), target_link_destination)

    print("Done syncing symbolic links")


if __name__ == "__main__":
    main()
