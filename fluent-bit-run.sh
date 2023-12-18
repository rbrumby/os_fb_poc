#!/bin/bash
docker run -it --rm --network search -v $HOME/dev/os_fb_poc/fluent-bit.conf:/fluent-bit.conf -v $HOME/dev/os_fb_poc/fluent-test.log:/fluent-test.log -v $HOME/dev/os_fb_poc/fluent-parsers.conf:/fluent-parsers.conf -v $HOME/dev/os_fb_poc/fluent-os-index.lua:/fluent-os-index.lua cr.fluentbit.io/fluent/fluent-bit:2.2.0 -c /fluent-bit.conf
