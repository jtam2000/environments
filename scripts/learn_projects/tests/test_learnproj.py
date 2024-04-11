import unittest
from unittest import TestCase

import sys

from learn_projects.learnproj import main


class TestMainFunction(TestCase):
    # todo: happy path tests
    #  0. learnproj --help
    #  1. learnproj learn_projects/tests/resources/my_test_learn_project1
    #  2. learnproj -t  learn_projects/tests/resources/test_templates
    #                   learn_projects/tests/resources/my_test_learn_project1
    #  3. learnproj -d learn_projects/tests/resources/my_test_learn_project1

    SCRIPT_NAME = "learnproj.py"

    def test_script_help(self):
        sys.argv = [self.SCRIPT_NAME, "-h", "somewhere"]

        print(f"sys arg is {sys.argv}")
        main()

    def test_base_case_create_project_no_templates(self):
        # given
        project_dir = "/Users/JasonTam/Development/Learning/test_project2"
        sys.argv = [self.SCRIPT_NAME, project_dir]
        # Test base case of creating a project without templates
        main()


    # @unittest.skip("reference only")
    # def test_create_project_with_delete_option(self):
    #     # Test invoking script with delete option
    #     with patch.object(ArgumentParser, 'perform_action') as mock_action:
    #         main(['-d', '~/mydir'])
    #         mock_action.assert_called_once_with(delete=True, template=None, project_dir='~/mydir')
    #
    # @unittest.skip("reference only")
    # def test_create_project_with_template_option(self):
    #     # Test invoking script with template option
    #     with patch.object(ArgumentParser, 'perform_action') as mock_action:
    #         main(['-t', '~/template', '~/mydir'])
    #         mock_action.assert_called_once_with(delete=False, template='~/template', project_dir='~/mydir')

    # Add more test methods to cover other command-line invocations


if __name__ == '__main__':
    unittest.main()
