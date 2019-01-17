clone:
	git submodule init
	@make checkout

checkout:
	git submodule update

