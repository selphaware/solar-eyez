"""Project-wide pytest fixtures for the Datara (D++) language project.

This file defines reusable fixtures that can be used across the entire
`tests/` suite. Add new fixtures here as needed to avoid duplication.

Author
------
Usman Ahmad, Selphaware
"""

from __future__ import annotations

from typing import Any, Generator

import pathlib
import tempfile

import pytest


@pytest.fixture(scope="session")
def project_root() -> pathlib.Path:
    """Return the absolute path to the project root directory.

    The path is determined by ascending two directories from this file’s
    location (`tests/conftest.py`). This can be useful for opening example
    files or ensuring test isolation with temporary directories.
    """

    return pathlib.Path(__file__).resolve().parent.parent


@pytest.fixture()
def tmp_workspace(tmp_path: pathlib.Path) -> Generator[pathlib.Path, Any, None]:
    """Provide a temporary workspace directory for tests.

    Yields a *copy* of :pyclass:`pathlib.Path` that tests can freely read
    from and write to without affecting the real project files.
    """

    # Create a temporary directory inside pytest-managed tmp_path
    workspace = tmp_path / "workspace"
    workspace.mkdir(parents=True, exist_ok=True)
    yield workspace

    # Cleanup is automatic for tmp_path at the end of test run.
