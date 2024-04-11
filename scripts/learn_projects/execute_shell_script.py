#!/usr/bin/env python3

import os.path
import subprocess
import sys

SHELL_TYPE = "bash"


def run_bash_script(script_full_path, script_argv):

    bash_command = [SHELL_TYPE, script_full_path] + [script_argv]
    print(f"{SHELL_TYPE}_command: {bash_command}")

    return run_subprocess(bash_command)


def run_subprocess(bash_command):

    process = subprocess.Popen(bash_command,
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)

    stdout, stderr = process.communicate()

    return stdout.decode(), stderr.decode(), process.returncode


def execute_shell_script(script_full_path: str, script_argv: list):
    print(f"bash script to execute: {script_full_path}")
    stdout, stderr, return_code = run_bash_script(script_full_path, script_argv)

    if return_code == 0:
        print(f"{SHELL_TYPE} stdout:", stdout)
        print(f"{SHELL_TYPE} script executed successfully! {script_full_path}")
    else:
        print("Error executing script:", stderr)


def get_folder_of_this_script() -> str:
    this_script_path = os.path.abspath(__file__)
    this_script_folder = os.path.dirname(this_script_path)
    print(f"this script path is {this_script_folder}")
    return this_script_folder


def get_script_path_from_current_folder(script_name_in_current_folder: str) -> str:
    this_script_folder = get_folder_of_this_script()
    script_path = os.path.join(this_script_folder, script_name_in_current_folder)
    print(f"script path =  {script_path}")
    return script_path


"""
    arg1:  bash script name
    arg2:  bash script argv
"""
if __name__ == "__main__":
    bash_script_name = sys.argv[1]
    bash_script_argv = sys.argv[2:]
    print(f"script name = {bash_script_name}")

    script_to_execute_path = get_script_path_from_current_folder(bash_script_name)
    execute_shell_script(script_to_execute_path, bash_script_argv)
