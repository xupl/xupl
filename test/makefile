
test: ../xupl
	@cat ../VERSION.txt >README.md
	@for test in $(wildcard *.xupl); do \
		printf '\n# %s\n\ninput:\n\n' $$test; cat $$test | sed 's/^/    /'; \
		printf '\n\noutput:\n\n'; ../xupl $$test | sed 's/^/    /'; done \
		| tee -a README.md

../xupl:
	@cd ../make