This fork of [riak_api](https://github.com/basho/riak_api) from
[Basho](https://basho.com) removes Riak-specific code so that the protobuf
service infrastructure can be reused for other `riak_core` projects.

It is based off [tag 1.4.10](https://github.com/basho/riak_api/tree/1.4.10).

One slightly thorny change was disentangling (generic) error handling in
`riak_api_pb_server` from `riak_pb_codec`. Since errors can (and do, in tests)
occur before services are registered, we use an application environment
variable to set up the module that should handle error encoding.

    {ok, ErrorService} = application:get_env(riak_api, error_service),

Typically, you will add the `encode_error/1` callback (which just takes a
string message) to one of your `riak_api_pb_service` modules.

# `riak_api` - Riak Client APIs

This OTP application encapsulates services for presenting Riak's
public-facing interfaces. Currently this means a generic interface for
exposing Protocol Buffers-based services; HTTP services via Webmachine
will be moved here at a later time.

[![Build Status](https://secure.travis-ci.org/basho/riak_api.png?branch=master)](http://travis-ci.org/basho/riak_api)

## Contributing

We encourage contributions to `riak_api` from the community.

1. Fork the [`riak_api`](https://github.com/basho/riak_api) repository
   on Github.
2. Clone your fork or add the remote if you already have a clone of
   the repository.

    ```
    git clone git@github.com:yourusername/riak_kv.git
    # or
    git remote add mine git@github.com:yourusername/riak_kv.git
    ```

3. Create a topic branch for your change.

    ```
    git checkout -b some-topic-branch
    ```

4. Make your change and commit. Use a clear and descriptive commit
   message, spanning multiple lines if detailed explanation is needed.
5. Push to your fork of the repository and then send a pull-request
   through Github.

    ```
    git push mine some-topic-branch
    ```

6. A Basho engineer or community maintainer will review your patch and
   merge it into the main repository or send you feedback.
