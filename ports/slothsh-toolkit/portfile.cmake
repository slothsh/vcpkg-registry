vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SoulXP/slothsh-toolkit
    REF a8d542bf1800e8e1ab526fe0753c0af28540afe1
    SHA512 1a0d395e8577418f0fe0fe678e1cf4f4b16e1cf24a3ecf1b67f867a4a2f9035ef30947113133b661bfdf71a9cfea9aa834bbd6074fa799888df87f6825ff2c45
    HEAD_REF main
    )

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DSLOTHSH_TOOLKIT_OPT_BUILD_BENCHMARKS=OFF
        -DSLOTHSH_TOOLKIT_OPT_BUILD_EXAMPLES=OFF
        -DSLOTHSH_TOOLKIT_OPT_BUILD_TESTS=OFF
        -DSLOTHSH_TOOLKIT_OPT_INSTALLL=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(PACKAGE_NAME slothshtoolkit)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)
