.PHONY: deps

all: deps compile

deps:
	@rebar get-deps

compile:
	@rebar compile

clean:
	@rebar clean

distclean: clean
	rm -rf deps

test: compile
	@rebar eunit skip_deps=true
