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
    path_to_search = ""
    path_pattern = ""
    if system_platform == "Windows":
        print("Platform Windows, use Windows settings...")
        path_to_search = os.path.join("C:\\", "Users")
        path_pattern = r".*AppData.Local.nvim.*"
    else:
        print("Non Windows, using Linux/Mac settings...")
        path_to_search = "/"
        path_pattern = r"/.config/nvim"

    for dirpath, _, _ in os.walk(path_to_search):
        if re.search(path_pattern, dirpath):
            print(f"nvim system path: {dirpath}")
            nvim_system_path = dirpath
            break

    for path, _, files in nvim_config_files:
        if not re.search(r"\.git", path):
            if files:
                if os.path.exists(path):
                    for f in files:
                        target_link_destination = os.path.join(
                            path.replace(config_files_path, nvim_system_path), f
                        )
                        if not os.path.exists(target_link_destination):
                            print(
                                f"symbolic link not found: {target_link_destination}, creating..."
                            )
                            # check for target directory exists...
                            if not os.path.exists(
                                path.replace(config_files_path, nvim_system_path)
                            ):
                                os.makedirs(
                                    path.replace(config_files_path, nvim_system_path)
                                )
                            os.symlink(os.path.join(path, f), target_link_destination)
                else:
                    # create dir, then make symboliclink
                    print("target destination directory not found, creating...")
                    os.makedirs(path.replace(config_files_path, nvim_system_path))
                    for f in files:
                        target_link_destination = os.path.join(
                            path.replace(config_files_path, nvim_system_path), f
                        )
                        if not os.path.exists(target_link_destination):
                            print(
                                f"symbolic link not found: {target_link_destination}, creating..."
                            )
                            os.symlink(os.path.join(path, f), target_link_destination)

    print("Done syncing symbolic links")
    print("checking if init.lua link exists...")
    if not os.path.exists(os.path.join(nvim_system_path, "init.lua")):
        print("init.lua symbolic link not found, creating...")
        os.symlink(
            os.path.join(config_files_path, "init.lua"),
            os.path.join(nvim_system_path, "init.lua"),
        )
    print("done linking init.lua")
    print("All done!")




if __name__ == "__main__":
    main()
