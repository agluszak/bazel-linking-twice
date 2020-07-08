load("//:defs.bzl", "apply_custom_transition")

cc_binary(
    name = "main",
    srcs = ["main.cc"],
    linkstatic = 1,
    deps = [
        "dep1",
        "dep2",
    ],
)

apply_custom_transition(
    name = "dep1",
    deps = [":dep2"],
)

cc_library(
    name = "dep2",
    srcs = ["test.cc"],
    hdrs = ["test.h"],
)
