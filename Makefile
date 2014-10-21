# Copyright 2011-2014 Arthur Noel
#
# This file is part of Yanc.
#
# Yanc is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# Yanc is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# Yanc. If not, see <http://www.gnu.org/licenses/>.

MAKEENV_VERSION = master
MAKEENV_ROOT = .makeenv-$(MAKEENV_VERSION)
MAKEENV_CORE = $(MAKEENV_ROOT)/makeenv.mak
ifeq ($(wildcard $(MAKEENV_CORE)),)
CURL ?= curl --fail --location
_BOOTSTRAP = mkdir -p $(MAKEENV_ROOT) && $(CURL) \
	https://github.com/0compute/makeenv/archive/$(MAKEENV_VERSION).tar.gz \
	| tar -C $(MAKEENV_ROOT) --strip-components=1 -xz
$(if $(shell (echo "$(_BOOTSTRAP)" && $(_BOOTSTRAP)) 1>&2 || echo x), \
	$(error Could not bootstrap makeenv))
endif
include $(MAKEENV_CORE)
