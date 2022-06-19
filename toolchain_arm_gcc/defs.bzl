load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def install_toolchain_arm_gcc():

    # Fetch the toolchain from the ARM website.
    http_archive(
        name = "arm_gcc",
        # The bazel BUILD file to add to this repository.
        build_file = "//toolchain_arm_gcc:arm_gcc.BUILD",
        # This is where the binary should be taken from.
        urls = [
            "https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-arm-none-eabi.tar.xz",
        ],
        # Remove this prefix from the path, this is needed for convenience only otherwise all files within this repository
        # would have to be accessed with 'gcc-arm-11.2-2022.02-x86_64-arm-none-eabi/bin/...' for example.
        strip_prefix = "gcc-arm-11.2-2022.02-x86_64-arm-none-eabi",
        # The SHA256 signature of the archive, to ensure reproductible builds.
        sha256 = "8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326",
    )

    # We register the toolchain defined by this newly created repository, thhis is needed for bazel
    # to know about this toolchain.
    native.register_toolchains(
        "@arm_gcc//:toolchain",
    )
