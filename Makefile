build:
	virtualenv "venv" ;\
	venv/bin/python3 -m pip install pipx ;\
	venv/bin/python3 -m pipx ensurepath ;\
	venv/bin/pip install meltano;\
	venv/bin/meltano install ;\

run:
	venv/bin/meltano run tap-spreadsheets-anywhere target-duckdb dbt-duckdb:build
