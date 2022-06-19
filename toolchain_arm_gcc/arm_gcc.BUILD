load("@bazel_tools//tools/cpp:unix_cc_toolchain_config.bzl", "cc_toolchain_config")

filegroup(
    name = "all",
    srcs = glob([
        "**/*",
    ]),
)

cc_toolchain_config(
    name = "cc_toolchain_config",
    cpu = "arm",
    compiler = "gcc",
    toolchain_identifier = "cc_toolchain_identifier_arm_gcc",
    host_system_name = "x86_64",
    target_system_name = "local",
    target_libc = "glibc_unknown",
    abi_version = "local",
    abi_libc_version = "local",
    tool_paths = {
        "gcc": "bin/arm-none-eabi-g++",
        "cpp": "bin/arm-none-eabi-cpp",
        "ar": "bin/arm-none-eabi-ar",
        "nm": "bin/arm-none-eabi-nm",
        "ld": "bin/arm-none-eabi-ld",
        "as": "bin/arm-none-eabi-as",
        "objcopy": "bin/arm-none-eabi-objcopy",
        "gcov": "bin/arm-none-eabi-gcov",
        "objdump": "bin/arm-none-eabi-objdump",
        "strip": "bin/arm-none-eabi-strip",
        "llvm-cov": "/bin/false"
    },
    compile_flags = [
        "-no-canonical-prefixes",
        "-isystem", "external/arm_gcc/arm-none-eabi/include/c++/11.2.1/arm-none-eabi",
        "-isystem", "external/arm_gcc/arm-none-eabi/include/c++/11.2.1",
        "-isystem", "external/arm_gcc/arm-none-eabi/include",
        "-isystem", "external/arm_gcc/lib/gcc/arm-none-eabi/11.2.1/include",
    ],
    link_flags = [
        "--specs=nosys.specs",
    ],
)

cc_toolchain(
    name = "cc_toolchain",
    all_files = ":all",
    ar_files = ":all",
    as_files = ":all",
    compiler_files = ":all",
    dwp_files = ":all",
    linker_files = ":all",
    objcopy_files = ":all",
    strip_files = ":all",
    dynamic_runtime_lib = ":all",
    static_runtime_lib = ":all",
    toolchain_config = ":cc_toolchain_config",
    toolchain_identifier = "cc_toolchain_identifier_arm_gcc",
)

toolchain(
    name = "toolchain",
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:none",
        "@platforms//cpu:arm",
    ],
    toolchain = ":cc_toolchain",
    toolchain_type = "@rules_cc//cc:toolchain_type",
)

platform(
    name = "platform",
    constraint_values = [
        "@platforms//os:none",
        "@platforms//cpu:arm",
    ],
)
