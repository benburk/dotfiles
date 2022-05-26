"""Pyinvoke tasks: http://www.pyinvoke.org/index.html

Some custom functionality.
"""
import logging
import os
import subprocess
import sys
from pathlib import Path

from invoke import Context, task  # type: ignore[import]
from invoke.exceptions import Failure  # type: ignore[import]

logging.basicConfig(stream=sys.stdout, level=logging.INFO)
logger = logging.getLogger(__name__)

CONFIG_FILE = "pyproject.toml"

LINTING_DEPENDENCIES = (
    "black>=21.8b0",
    "invoke>=1.6.0",
    "isort>=5.9.3",
    "mypy>=0.910",
    "pylint>=2.10.2",
    "pytest>=6.2.5",
    "pytest-cov",
)


def find_pyproject() -> Path:
    """Find pyproject.toml config file by ascending through parent directories.

    :return: The path to the config file
    :raises FileNotFoundError: If a pyproject.toml file cannot be found
    """
    sentinel = Path(os.getcwd())
    for _ in range(10):
        candidate = sentinel.joinpath(CONFIG_FILE)
        if candidate.exists() or candidate.is_symlink():
            return candidate
        if sentinel == Path.home():
            raise FileNotFoundError

        sentinel = sentinel.parent

    raise FileNotFoundError


def get_python_files() -> list[str]:
    """Get all python files in the current directory, recursively.

    :return: A list of python file paths
    """
    cmd = r"find . | grep '\.py$'"
    with subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True) as process:
        stdout, _ = process.communicate()
    paths = stdout.decode().split()
    # paths = ["."]
    return paths


def run_commands(ctx: Context, *commands: str) -> None:
    """Run shell commands.

    :param ctx: The invoke context.
    :param commands: The commands to run
    """
    for command in commands:
        try:
            ctx.run(command, echo=True, pty=True)
        except Failure:
            pass


@task
def check(ctx):  # type: ignore[no-untyped-def]
    """Run style and typing checks.

    :param ctx: The invoke context
    :type ctx: Context
    """
    config = find_pyproject()
    paths = " ".join(get_python_files())
    commands = (
        f"black --config '{config}' --diff " + paths,
        # f"isort --settings-path '{config}' --diff " + paths,
        f"isort --profile='black' --multi-line=3 --float-to-top --diff {paths}",
        f"pylint --rcfile='{config}' " + paths,
        f"mypy --config-file '{config}' " + paths,
    )
    run_commands(ctx, *commands)


@task(name="format", aliases=["fmt"])
def format_(ctx):  # type: ignore[no-untyped-def]
    """Run formatters.

    :param ctx: The invoke context
    :type ctx: Context
    """
    config = find_pyproject()
    paths = " ".join(get_python_files())
    commands = (
        f"black --config '{config}' " + paths,
        # f"isort --settings-path '{config}' .",
        f"isort --profile='black' --multi-line=3 --float-to-top {paths}",
    )
    run_commands(ctx, *commands)


@task
def bootstrap(ctx):  # type: ignore[no-untyped-def]
    """Install requirements.

    :param ctx: The invoke context
    :type ctx: Context
    """
    linting_dependencies = "'" + "' '".join(LINTING_DEPENDENCIES) + "'"
    run_commands(ctx, f"pip install {linting_dependencies}")
    requirements_path = Path("requirements.txt")
    if requirements_path.exists():
        run_commands(ctx, f"pip install -r {requirements_path}")
    else:
        logger.info("No %s file found.", requirements_path)


@task
def install(ctx):  # type: ignore[no-untyped-def]
    """Install the package.

    :param ctx: The invoke context
    :type ctx: Context
    """
    run_commands(ctx, "python -m pip install .")


@task
def develop(ctx):  # type: ignore[no-untyped-def]
    """Install for developing.

    :param ctx: The invoke context
    :type ctx: Context
    """
    run_commands(ctx, "python -m pip install --no-use-pep517 --editable .")


@task
def test(ctx):  # type: ignore[no-untyped-def]
    """Run pytest.

    :param ctx: The invoke context
    :type ctx: Context
    """
    run_commands(ctx, "pytest")
