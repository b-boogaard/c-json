find_package(PkgConfig)
pkg_check_modules(PC_YAJL QUIET YAJL)

find_path(YAJL_INCLUDE_DIR
    NAMES yajl_parse.h yajl_gen.h yajl_common.h yajl_tree.h yajl_version.h
    PATHS ${PC_YAJL_INCLUDE_DIRS}
    PATH_SUFFIX yajl
    )

find_library(YAJL_LIBRARY
    NAMES yajl
    HINTS ${PC_YAJL_LIBDIR} ${PC_YAJL_LIBRARY_DIRS}
    )

set(YAJL_VERSION ${PC_YAJL_VERSION})

mark_as_advanced(YAJL_FOUND YAJL_INCLUDE_DIR YAJL_LIBRARIES YAJL_VERSION)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(YAJL
    REQUIRED_VARS YAJL_INCLUDE_DIR YAJL_LIBRARY
    VERSION_VAR YAJL_VERSION
    )

if(YAJL_FOUND)
  set(YAJL_INCLUDE_DIRS ${YAJL_INCLUDE_DIR})
  set(YAJL_LIBRARIES ${YAJL_LIBRARY})
endif()

if(YAJL_FOUND AND NOT TARGET YAJL)
  add_library(YAJL INTERFACE IMPORTED)
    set_target_properties(YAJL PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${YAJL_INCLUDE_DIR}"
        INTERFACE_LINK_LIBRARIES "${YAJL_LIBRARIES}"
        )
endif()

