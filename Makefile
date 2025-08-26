# -------- Makefile for auto-stack --------
.PHONY: help setup pyenv py run node install node-test node-start all clean

help:
	@echo "Targets:"
	@echo "  make setup      - one-time: create venv, install Python + Node deps"
	@echo "  make py         - run Python app"
	@echo "  make node-test  - run Node test script"
	@echo "  make node       - run Node app"
	@echo "  make all        - run Python then Node"
	@echo "  make clean      - remove caches/builds"

setup: pyenv install

pyenv:
	python3 -m venv .venv

install: 
	. .venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt
	npm install

py:
	. .venv/bin/activate && python main.py

node-test:
	npm test

node:
	npm start

all: py node

clean:
	rm -rf node_modules **/__pycache__ */__pycache__ .pytest_cache *.pyc dist build
