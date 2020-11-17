.PHONY: lint
lint:
	shellcheck2 store/.git_template/hooks/*
