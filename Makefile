###########################################################
# Thesis Generator for Creative Informatics
# Author: Yuki Furuta <furushchev@jsk.imi.i.u-tokyo.ac.jp>
# Date: 2015/11/12
###########################################################


.PHONY: all open clean wipe forever preinstall pub publish
OS=$(shell uname -s)
ifeq ($(OS), Linux)
	OMAKE_INSTALL=sudo apt-get install -y -qq omake fam
	TEX_INSTALL=sudo apt-get install -y -qq texlive texlive-lang-cjk texlive-science texlive-fonts-recommended texlive-fonts-extra xdvik-ja dvipsk-ja gv
endif
ifeq ($(OS), Darwin)
	OMAKE_INSTALL=brew install -y opam && opam init -y -j4 -q && eval `opam config env` && opam install omake -y -j4 -q
	TEX_INSTALL=brew install -y caskroom/cask/brew-cask && brew cask install -y mactex && sudo tlmgr update --self --all
endif

all: preinstall
	omake

forever: preinstall
	omake -P

open: preinstall
	omake preview

publish: preinstall
	omake publish
pub: publish

clean: preinstall
	omake clean

wipe: clean
	git clean -X -f -i -e '.tex'

preinstall:
	@if ! which omake > /dev/null; then $(OMAKE_INSTALL); fi
	@if ! which platex > /dev/null; then $(TEX_INSTALL); fi
