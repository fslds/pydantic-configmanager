.PHONY: clean clean-test clean-pyc clean-build docs help

clean: clean-build clean-pyc clean-test ## remove all build, test, coverage and Python artifacts

clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test: ## remove test and coverage artifacts
	rm -f .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache

test: ## run tests quickly with the default Python
	pipenv run pytest -v

coverage: ## check code coverage quickly with the default Python
	pipenv run pytest --cov=pydantic_configmanager --cov-config=.coveragerc --cov-report xml:coverage.xml

dist: clean ## builds source and wheel package
	pipenv run python setup.py sdist
	pipenv run python setup.py bdist_wheel
	ls -l dist

install: clean ## install the package to the active Python's site-packages
	python setup.py install

setup-dev: clean
	pip install pipenv
	pipenv install --dev
