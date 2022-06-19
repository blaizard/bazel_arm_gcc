load("@bazel_tools//tools/cpp:unix_cc_toolchain_config.bzl", "cc_toolchain_config")

# Make all the files of the toolchain available.
# We could be more selective here but this is used for demonstration purpose
# to simplify the content of this file.
filegroup(
    name = "all",
    srcs = glob([
        "**/*",
    ]),
)

# This creates a CcToolchainConfigInfo provider, which containts information about the C/C++ toolchain in order to
# generate correct command lines for C/C++ actions.
cc_toolchain_config(
    name = "cc_toolchain_config",
    # The target architecture string.
    cpu = "arm",
    # The compiler version string (e.g. "gcc-4.1.1").
    compiler = "gcc-11.2",
    # Unique identifier of the toolchain.
    toolchain_identifier = "arm_gcc",
    # Required but ignored.
    host_system_name = "local",
    # The GNU System Name.
    target_system_name = "local",
    # The libc version string.
    target_libc = "unknown",
    # The abi in use, which is a gcc version."
    abi_version = "unknown",
    # The glibc version used by the abi we're using.
    abi_libc_version = "unknown",
    # Mapping of tool identifiers and their path.
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
    # Flags used during compilation.
    compile_flags = [
        "-no-canonical-prefixes",
        "-isystem", "external/arm_gcc/arm-none-eabi/include/c++/11.2.1/arm-none-eabi",
        "-isystem", "external/arm_gcc/arm-none-eabi/include/c++/11.2.1",
        "-isystem", "external/arm_gcc/arm-none-eabi/include",
        "-isystem", "external/arm_gcc/lib/gcc/arm-none-eabi/11.2.1/include",
    ],
    # Flags used during linkage.
    link_flags = [
        "--specs=nosys.specs",
    ],
)

# Represents a C/C++ toolchain, it is used to collect all artifacts needed for C/C++ actions to run.
# This is done by attributes such as all_files, compiler_files, linker_files, or other attributes ending with _files).
cc_toolchain(
    name = "cc_toolchain",
    # All the bellow tells bazel what files it should bring in its hermetic environment when perfirming a given action,
    # for example, when compiling a file, the files associated wtih `compiler_files` will be collected and used.
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
    # The label of the rule providing CcToolchainConfigInfo.
    toolchain_config = ":cc_toolchain_config",
)

# This rule associates the previously defined toolchain with a type (here a C/C++ toolchain) and constraints so that
# it can be selected during toolchain resolution.
toolchain(
    name = "toolchain",
    # This toolchain must be executed on Linux x86_64 machines.
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    # This toolchain is targeting ARM CPUs.
    target_compatible_with = [
        "@platforms//os:none",
        "@platforms//cpu:arm",
    ],
    toolchain = ":cc_toolchain",
    toolchain_type = "@rules_cc//cc:toolchain_type",
)

# Define a platform that matches the ARM CPU.
platform(
    name = "platform",
    constraint_values = [
        "@platforms//os:none",
        "@platforms//cpu:arm",
    ],
)
