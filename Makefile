
#
# Binaries.
#

metalsmith := ./node_modules/.bin/metalsmith

#
# Default.
#

default: build

#
# Tasks.
#

# Remove shit.
clean:
	@rm -rf ./node_modules
	find . -type f -name '/docs/*.html' -delete

# Build client.
build:
	@node ./lib/build.js
	@$(metalsmith)

# Run server.
server:
	python -m SimpleHTTPServer 8000

# Deploy.
deploy:
	./deploy.sh

#
# Phonies.
#

.PHONY: clean build server deploy