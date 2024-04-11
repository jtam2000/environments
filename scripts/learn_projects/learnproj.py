#!/usr/bin/env python3

import os
import sys
import shutil
import argparse
from execute_shell_script import execute_shell_script


class ProjectManager:
    @staticmethod
    def create_project(project_dir, template_dir=None):
        # Create project directory
        os.makedirs(project_dir, exist_ok=True)

        # Copy files from templates directory if provided
        if template_dir:
            ProjectManager.copy_template_files(os.path.join(template_dir, ''), project_dir)

        ProjectManager.execute_git_init_bash_script(project_dir)

    @staticmethod
    def execute_git_init_bash_script(project_dir):
        GIT_INIT_BASH_SCRIPT_IN_SAME_PATH_AS_THIS_SCRIPT = "project_git_init.sh"
        execute_shell_script(GIT_INIT_BASH_SCRIPT_IN_SAME_PATH_AS_THIS_SCRIPT, project_dir)

    @staticmethod
    def copy_template_files(source_dir, dest_dir):
        # Copy files from source directory to destination directory
        shutil.copytree(source_dir, dest_dir)

    @staticmethod
    def create_markdown_file(project_dir):
        # Create Markdown file
        md_file = os.path.join(project_dir, f'{os.path.basename(project_dir)}.md')
        with open(md_file, 'w') as f:
            f.write(f'# {os.path.basename(project_dir)} Project\n\n')

    @staticmethod
    def delete_project(project_dir):
        # Check if project directory exists (not necessary due to preceding check)
        # Confirm with user before deleting
        confirm = input(f"Are you sure you want to delete '{project_dir}'? (yes/no): ").lower()
        if confirm == 'yes':
            # Delete the project directory and its contents
            shutil.rmtree(project_dir)
            print(f"Project '{project_dir}' deleted successfully.")
        else:
            print("Deletion cancelled.")


class ArgumentParser:
    @staticmethod
    def get_input_parser():
        # Argument parser setup
        parser = argparse.ArgumentParser(description='Create or delete a project with specified director, optionally '
                                                     'copy template files into the project.')
        parser.add_argument('-d', '--delete', action='store_true', help='Delete the specified project directory')
        parser.add_argument('-t', '-template', metavar='template_directory', dest='template',
                            help='Copy all files from the template_directory to the project directory')
        parser.add_argument('project_dir', metavar='project_directory', help='Path to the project directory')

        return parser

    @staticmethod
    def perform_action(args):
        if args.delete:
            ProjectManager.delete_project(args.project_dir)
        else:
            ProjectManager.create_project(args.project_dir, args.template)

    @staticmethod
    def check_paths(args):
        ArgumentParser.exit_on_invalid_project_creation_arguments(args)

        # for project deletion
        ArgumentParser.exit_if_delete_path_does_not_exists(args)

    @staticmethod
    def exit_on_invalid_project_creation_arguments(args):
        # for project creation
        ArgumentParser.exit_if_template_path_does_not_exists(args)
        ArgumentParser.exit_if_create_parent_path_does_not_exists(args)
        ArgumentParser.exit_if_create_project_path_already_exists(args)

    @staticmethod
    def exit_if_template_path_does_not_exists(args):
        if args.template:
            ArgumentParser.exit_if_path_does_not_exist(args.template,
                                                       f"Error: Template directory '{args.template}' does not exist.")

    @staticmethod
    def exit_if_create_parent_path_does_not_exists(args):
        if (not args.delete) and args.project_dir:
            parent_dir = os.path.dirname(args.project_dir)
            print(f"check parent path exists: create parent dir name is {parent_dir}")
            ArgumentParser.exit_if_path_does_not_exist(parent_dir, f"Error: Project's parent path '{parent_dir}' "
                                                                   f"does not exist.")

    @staticmethod
    def exit_if_create_project_path_already_exists(args):
        if (not args.delete) and args.project_dir:
            print(f"check create path does not exists: create dir name is {args.project_dir}")
            ArgumentParser.exit_if_path_exist(args.project_dir, f"Error: project path '{args.project_dir}' "
                                                                f"already exists. Must delete then create.")

    @staticmethod
    def exit_if_delete_path_does_not_exists(args):
        if args.delete and args.project_dir:
            print(f"delete dir name is {args.project_dir}")
            ArgumentParser.exit_if_path_does_not_exist(args.project_dir,
                                                       f"Error: Project directory '{args.project_dir}' does not exist.")

    @staticmethod
    def exit_if_path_does_not_exist(path, error_message):
        ArgumentParser.exit_on_path_exist_predicate(path,
                                                    ArgumentParser.path_not_exist_check,
                                                    error_message)

    @staticmethod
    def exit_if_path_exist(path, error_message):
        ArgumentParser.exit_on_path_exist_predicate(path,
                                                    ArgumentParser.path_exist_check,
                                                    error_message)

    @staticmethod
    def exit_on_path_exist_predicate(path, path_exist_predicate, error_message):
        if path_exist_predicate(path):
            print(error_message)
            sys.exit(1)

    @staticmethod
    def path_exist_check(path):
        return path and os.path.exists(path)

    @staticmethod
    def path_not_exist_check(path):
        return not ArgumentParser.path_exist_check(path)


def main():
    # Parse arguments
    print(f"sys arg in main is {sys.argv}")
    parser = ArgumentParser.get_input_parser()
    print(f"parser value is ${parser}")
    args = parser.parse_args()
    print(f"parser args are {args}")

    # Check paths
    ArgumentParser.check_paths(args)

    # Perform the action
    ArgumentParser.perform_action(args)


if __name__ == "__main__":
    main()
