import sys
import os

working_dir = sys.argv[0]
project_name = sys.argv[1]

def find_apk_file(directory):
    print("workdin_dir = " + working_dir)
    print("project_name = " + project_name)

    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".apk"):
                final_file_name = str.join('.', file.split(".")[:-1])
                return final_file_name
    return None

apk_name = find_apk_file((working_dir + "\\.decompiled\\" + project_name + "\\unknown\\"))

if apk_name is not None:
    print(apk_name)
else:
    print(f"{working_dir} {project_name} {working_dir}\\.decompiled\\{project_name}\\unknown\\{apk_name}")