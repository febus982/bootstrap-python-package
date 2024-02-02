# bootstrap-python-package
![Static Badge](https://img.shields.io/badge/Python-3.8_%7C_3.9_%7C_3.10_%7C_3.11_%7C_3.12-blue?logo=python&logoColor=white)
[![Stable Version](https://img.shields.io/pypi/v/bootstrap-python-package?color=blue)](https://pypi.org/project/bootstrap-python-package/)
[![stability-beta](https://img.shields.io/badge/stability-beta-33bbff.svg)](https://github.com/mkenney/software-guides/blob/master/STABILITY-BADGES.md#beta)

[![Python tests](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-tests.yml/badge.svg?branch=main)](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-tests.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/593e78ec96ed5ebb0dd3/maintainability)](https://codeclimate.com/github/febus982/bootstrap-python-package/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/593e78ec96ed5ebb0dd3/test_coverage)](https://codeclimate.com/github/febus982/bootstrap-python-package/test_coverage)

[![Checked with mypy](https://www.mypy-lang.org/static/mypy_badge.svg)](https://mypy-lang.org/)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/charliermarsh/ruff/main/assets/badge/v1.json)](https://github.com/charliermarsh/ruff)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![security: bandit](https://img.shields.io/badge/security-bandit-yellow.svg)](https://github.com/PyCQA/bandit)

This template repository provides the boilerplate to create a python package.
It is configured with all the following features:

* Test suite using [tox](https://tox.wiki/en/latest/index.html) and [pytest](https://docs.pytest.org/en/7.4.x/)
* Typing using [mypy](https://mypy.readthedocs.io/en/stable/)
* Linting, security and code format using [ruff](https://github.com/astral-sh/ruff) (using [black](https://pypi.org/project/black/)
  code style and [bandit](https://github.com/PyCQA/bandit) security rules)
* Integration with CodeClimate for code quality and coverage checks
* CI pipeline supporting:
    * testing against multiple python versions
    * releases on [PyPI](https://pypi.org)
    * GitHub pages documentation using [mkdocs](https://www.mkdocs.org)

## How to use this repository template to create a new package

* Create your github repository using this template. (The big green `Use this template` button)
* Rename the `bootstrap_python_package` directory
* Search and replace all the occurrences of `bootstrap-python-package` and `bootstrap_python_package`
* Configure a pending trusted publisher on [pypi](https://pypi.org/manage/account/publishing) using the following values:
    * PyPI Project Name: what you renamed the directory `bootstrap_python_package` to (Double check `_` and `-`)
    * Owner: The github repository owner (in this case `febus982`)
    * Repository name: The github repository name (in this case `bootstrap-python-package`)
    * Workflow name: `release.yml`
* Create a GitHub Actions secret named `CODECLIMATE_REPORTER_ID` (at URL `https://github.com/GITHUB_NAME_OR_ORGANIZATION/GITHUB_REPOSITORY/settings/secrets/actions`)
  containing the codeclimate reporter id (you can find it at `https://codeclimate.com/repos/YOUR_REPO_ID/settings/test_reporter`).
  If you don't want to use CodeClimate just delete `workflows/python-quality.yml`.
* Update the badges in `README.md`! (check [shields.io](https://shields.io/) for extra badges)
* Setup local development:
    * Clone the repository
    * Install poetry `pip install poetry`
    * Install dev dependencies with `make dev-dependencies`
    * (optional) It is strongly recommended to install [pre-commit](https://pre-commit.com/#installation)
      and run `pre-commit install` so that formatting and linting are automatically executed during `git commit`.
* Setup GitHub pages (this need local development setup):
    * Initialise documentation branch `poetry run mike deploy dev latest --update-aliases --push`
    * Configure GitHub Pages to deploy from the `gh-pages` branch (at URL `https://github.com/GITHUB_NAME_OR_ORGANIZATION/GITHUB_REPOSITORY/settings/pages`)
    * Add the `main` branch and the `v*.*.*` tag rules to the "deployment branches and tags" list in the `gh-pages` environment (at URL `https://github.com/GITHUB_NAME_OR_ORGANIZATION/GITHUB_REPOSITORY/settings/environments`)

**IMPORTANT:** The repository is configured to deploy on the [test PyPI repository](https://test.pypi.org/).
It's strongly recommended to create the project in the [test PyPI repository](https://test.pypi.org/) and test
the deployment pipeline. When you're happy with the result, create the project on the official [PyPI repository](https://pypi.org/)
and remove the marked lines in `workflows/release.yml`.

## Package release

This setup uses [poetry-dynamic-versioning](https://github.com/mtkennerly/poetry-dynamic-versioning).
This means it's not necessary to commit the version in the code but the CI pipeline
will infer it from the git tag.

To release a new version, just create a new release and tag in the GitHub repository, to:

* Build and deploy the python package to PyPI
* Build and deploy a new version of the documentation to GitHub pages

**IMPORTANT:** The default configuration requires the release name and the tag to follow
the convention `vX.X.X` (semantic versioning preceded by lowercase `v`). It will publish
the correct version on Pypi, omitting the `v` (ie. `v1.0.0` will publish `1.0.0`).

This format can be customized, refer to [poetry-dynamic-versioning docs](https://github.com/mtkennerly/poetry-dynamic-versioning)

## Commands for development

All the common commands used during development can be run using make targets:

* `make dev-dependencies`: Install dev requirements
* `make update-dependencies`: Update dev requirements
* `make fix`: Run code style and lint automatic fixes (where possible)
* `make test`: Run test suite against system python version
* `make check`: Run tests against all available python versions, code style and lint checks
* `make type`, `make format`, `make lint`, `make bandit`: Run the relevant check
* `make docs`: Render the mkdocs website locally
