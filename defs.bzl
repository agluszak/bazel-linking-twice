def _custom_transition_impl(settings, attr):
    _ignore = settings, attr
    print("transition")

    return {"//command_line_option:copt": ["-DFLAG"]}

custom_transition = transition(
    implementation = _custom_transition_impl,
    inputs = [],
    outputs = ["//command_line_option:copt"],
)

def _apply_custom_transition_impl(ctx):
    cc_infos = []
    for dep in ctx.attr.deps:
        cc_infos.append(dep[CcInfo])
    merged_cc_info = cc_common.merge_cc_infos(cc_infos = cc_infos)
    return merged_cc_info

apply_custom_transition = rule(
    implementation = _apply_custom_transition_impl,
    attrs = {
        "_whitelist_function_transition": attr.label(
            default = "@bazel_tools//tools/whitelists/function_transition_whitelist",
        ),
        "deps": attr.label_list(cfg = custom_transition),
    },
)
