import pytest
import os
import sys
from dbt.cli.main import dbtRunner, dbtRunnerResult

__default_target__ = 'dev'


@pytest.fixture(scope='session', autouse=True)
def change_directory(request):
    # Get the directory of the current script
    original_working_directory = os.getcwd()
    script_directory = os.path.dirname(os.path.abspath(__file__))
    dbt_project_directory = os.path.join(script_directory, '..', 'dbt')
    os.chdir(dbt_project_directory)

    # Teardown actions after all tests are done
    def teardown():
        # Restore the original working directory
        os.chdir(original_working_directory)
        print("Teardown after all tests...")

    # Register the teardown function to be called after all tests
    request.addfinalizer(teardown)


@pytest.fixture(scope='session', autouse=True)
def target_env():
    # If arguments are sent from the command line
    def parse_command_line_arguments():
        target = None
        argv = sys.argv
        for i in range(len(argv)):
            if i in ('-t', '--target'):
                target = argv[i+1]
                break
        return target

    def parse_environment_variable():
        target = os.environ.get('TARGET')
        return target

    def default_target():
        return __default_target__
    target = parse_command_line_arguments(
    ) or parse_environment_variable() or default_target()

    return target


@pytest.fixture(scope='session', autouse=True)
def ref_env():
    # If arguments are sent from the command line
    def parse_command_line_arguments():
        target = None
        argv = sys.argv
        for i in range(len(argv)):
            if i in ('-t', '--target'):
                target = argv[i+1]
                break
        return target

    def parse_environment_variable():
        target = os.environ.get('TARGET')
        return target

    def default_target():
        return __default_target__
    target = parse_command_line_arguments(
    ) or parse_environment_variable() or default_target()

    return target


@pytest.fixture(scope='session')
def dbtrunner():
    return dbtRunner()


def test_connection(dbtrunner, target_env):
    cli_args = ["debug", "--connection", "--target", target_env]
    res = dbtrunner.invoke(cli_args)
    assert res

def test_full_build(dbtrunner, target_env):
    assert dbtrunner.invoke(["deps"])
    assert dbtrunner.invoke(["seed",  "--target", target_env])
    assert dbtrunner.invoke(["build",  "--target", target_env])


def test_artifacts(dbtrunner, target_env):
    assert dbtrunner.invoke(["ls", "--select", "state:modified+",
                            "--target", target_env, "--state=../../jfrog/"+target_env])
