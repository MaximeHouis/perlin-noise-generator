# add_compile_definitions(FMT_HEADER_ONLY)

if (UNIX)
    if (NOT APPLE)
        link_libraries(pthread stdc++fs tbb)
        add_compile_definitions(TBB_SUPPRESS_DEPRECATED_MESSAGES=1) # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101228
    endif ()

    add_compile_options(-Wall -Wextra)

    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        add_compile_options(-Weffc++)
    endif ()
endif ()

if (${CMAKE_BUILD_TYPE} MATCHES "Debug")
    add_compile_definitions(DEBUG=1)
else ()
    add_compile_definitions(RELEASE=1)
endif ()

if (${PENGEN_WITH_PROFILER})
    add_compile_definitions(PENGEN_WITH_PROFILER=1)
else ()
    add_compile_definitions(PENGEN_WITH_PROFILER=0)
endif ()

if (MSVC)
    add_link_options(/ignore:4099)
    #    link_libraries(legacy_stdio_definitions)
endif ()
