# bootstrap-python-package
[![Stable Version](https://img.shields.io/pypi/v/bootstrap-python-package?color=blue)](https://pypi.org/project/bootstrap-python-package/)
[![stability-beta](https://img.shields.io/badge/stability-beta-33bbff.svg)](https://github.com/mkenney/software-guides/blob/master/STABILITY-BADGES.md#beta)

[![Python 3.8](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.8.yml/badge.svg?event=push)](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.8.yml)
[![Python 3.9](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.9.yml/badge.svg?event=push)](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.9.yml)
[![Python 3.10](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.10.yml/badge.svg?event=push)](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.10.yml)
[![Python 3.11](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.11.yml/badge.svg?event=push)](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.11.yml)
[![Python 3.12](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.12.yml/badge.svg?event=push)](https://github.com/febus982/bootstrap-python-package/actions/workflows/python-3.12.yml)

[![Maintainability](https://api.codeclimate.com/v1/badges/593e78ec96ed5ebb0dd3/maintainability)](https://codeclimate.com/github/febus982/bootstrap-python-package/maintainability)
<a href="https://codeclimate.com/github/febus982/bootstrap-python-package/test_coverage"><img src="https://api.codeclimate.com/v1/badges/593e78ec96ed5ebb0dd3/test_coverage" /></a>
[![Checked with mypy](https://www.mypy-lang.org/static/mypy_badge.svg)](https://mypy-lang.org/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/charliermarsh/ruff/main/assets/badge/v1.json)](https://github.com/charliermarsh/ruff)

This template repository provides the boilerplate to create a python package.
It is configured with all the following features:

* Test suite using [pytest](https://docs.pytest.org/en/7.4.x/)
* Typing using [mypy](https://mypy.readthedocs.io/en/stable/)
* Linting using [ruff](https://github.com/astral-sh/ruff)
* Code formatter using [black](https://pypi.org/project/black/)
* Integration with CodeClimate for code quality and coverage checks
* CI pipeline supporting:
    * testing against multiple python versions
    * releases on [PyPI](https://pypi.org)
    * GitHub pages documentation using [mkdocs](https://www.mkdocs.org)

This project doesn't currently use [tox](https://tox.wiki/en/4.11.4/index.html) or other matrix
testing utilities. I prefer to run the tests only against the latest python locally, and run 
previous python versions directly in the CI pipeline to catch these bugs.

## How to use this repository template to create a new package

* Create your github repository using this template. (The big green `Use this template` button)
* Rename the `bootstrap_python_package` directory
* Search and replace all the occurrences of `bootstrap-python-package` and `bootstrap_python_package`
* Configure a pending trusted publisher on [pypi](https://pypi.org/manage/account/publishing) using the following values:
    * PyPI Project Name: what you renamed the directory `bootstrap_python_package` to (Double check `_` and `-`)
    * Owner: The github repository owner (in this case `febus982`)
    * Repository name: The github repository name (in this case `bootstrap-python-package`)
    * Workflow name: `release.yml`
* Enable GitHub Actions for GitHub Pages (at URL https://github.com/GITHUB_NAME_OR_ORGANIZATION/GITHUB_REPOSITORY/settings/pages) 
* Create a GitHub Actions secret named `CODECLIMATE_REPORTER_ID` (at URL https://github.com/GITHUB_NAME_OR_ORGANIZATION/GITHUB_REPOSITORY/settings/secrets/actions) 
  containing the codeclimate reporter id (you can find it at https://codeclimate.com/repos/YOUR_REPO_ID/settings/test_reporter).
  If you don't want to use CodeClimate just delete `workflows/python-quality.yml`.
* Update the badges in `README.md`! (check [shields.io](https://shields.io/) for extra badges)

**IMPORTANT:** The repository is configured to deploy on the [test PyPI repository](https://test.pypi.org/).
It's strongly recommended to create the project in the [test PyPI repository](https://test.pypi.org/) and test
the deployment pipeline. When you're happy with the result, create the project on the official [PyPI repository](https://pypi.org/)
and remove the marked lines in `workflows/release.yml`.

## Package release

This setup uses [poetry-dynamic-versioning](https://github.com/mtkennerly/poetry-dynamic-versioning).
This means it's not necessary to commit the version in the code but the CI pipeline
will infer it from the git tag.

To release a new version, just create a new release in the github repository. It will
create a new tag and do all the magic.

**IMPORTANT:** The default configuration requires the release name and the tag to follow
the convention `vX.X.X` (semantic versioning preceded by lowercase `v`). It will publish
the correct version on Pypi, omitting the `v` (ie. `v1.0.0` will publish `1.0.0`).

This format can be customized, refer to [poetry-dynamic-versioning docs](https://github.com/mtkennerly/poetry-dynamic-versioning)

## Commands for development

All the common commands used during development can be run using make targets:

* `make dev-dependencies`: Install dev requirements
* `make test`: Run test suite
* `make check`: Run tests, code style and lint checks
* `make fix`: Run code style and lint automatic fixes (where possible)
* `make docs`: Render the mkdocs website locally
