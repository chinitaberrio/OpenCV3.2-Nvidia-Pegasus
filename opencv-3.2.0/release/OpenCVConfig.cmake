# ===================================================================================
#  The OpenCV CMake configuration file
#
#             ** File generated automatically, do not modify **
#
#  Usage from an external project:
#    In your CMakeLists.txt, add these lines:
#
#    find_package(OpenCV REQUIRED)
#    include_directories(${OpenCV_INCLUDE_DIRS}) # Not needed for CMake >= 2.8.11
#    target_link_libraries(MY_TARGET_NAME ${OpenCV_LIBS})
#
#    Or you can search for specific OpenCV modules:
#
#    find_package(OpenCV REQUIRED core videoio)
#
#    You can also mark OpenCV components as optional:

#    find_package(OpenCV REQUIRED core OPTIONAL_COMPONENTS viz)
#
#    If the module is found then OPENCV_<MODULE>_FOUND is set to TRUE.
#
#    This file will define the following variables:
#      - OpenCV_LIBS                     : The list of all imported targets for OpenCV modules.
#      - OpenCV_INCLUDE_DIRS             : The OpenCV include directories.
#      - OpenCV_COMPUTE_CAPABILITIES     : The version of compute capability.
#      - OpenCV_ANDROID_NATIVE_API_LEVEL : Minimum required level of Android API.
#      - OpenCV_VERSION                  : The version of this OpenCV build: "3.2.0"
#      - OpenCV_VERSION_MAJOR            : Major version part of OpenCV_VERSION: "3"
#      - OpenCV_VERSION_MINOR            : Minor version part of OpenCV_VERSION: "2"
#      - OpenCV_VERSION_PATCH            : Patch version part of OpenCV_VERSION: "0"
#      - OpenCV_VERSION_STATUS           : Development status of this build: ""
#
#    Advanced variables:
#      - OpenCV_SHARED                   : Use OpenCV as shared library
#      - OpenCV_INSTALL_PATH             : OpenCV location
#      - OpenCV_LIB_COMPONENTS           : Present OpenCV modules list
#      - OpenCV_USE_MANGLED_PATHS        : Mangled OpenCV path flag
#
#    Deprecated variables:
#      - OpenCV_VERSION_TWEAK            : Always "0"
#
# ===================================================================================

# ======================================================
#  Version variables:
# ======================================================
SET(OpenCV_VERSION 3.2.0)
SET(OpenCV_VERSION_MAJOR  3)
SET(OpenCV_VERSION_MINOR  2)
SET(OpenCV_VERSION_PATCH  0)
SET(OpenCV_VERSION_TWEAK  0)
SET(OpenCV_VERSION_STATUS "")

include(FindPackageHandleStandardArgs)

if(NOT CMAKE_VERSION VERSION_LESS 2.8.8
    AND OpenCV_FIND_COMPONENTS  # prevent excessive output
)
  # HANDLE_COMPONENTS was introduced in CMake 2.8.8
  list(APPEND _OpenCV_FPHSA_ARGS HANDLE_COMPONENTS)
  # The missing components will be handled by the FindPackageHandleStandardArgs
  # module.
  set(_OpenCV_HANDLE_COMPONENTS_MANUALLY FALSE)
else()
  # The missing components will be handled by this config.
  set(_OpenCV_HANDLE_COMPONENTS_MANUALLY TRUE)
endif()

# Extract directory name from full path of the file currently being processed.
# Note that CMake 2.8.3 introduced CMAKE_CURRENT_LIST_DIR. We reimplement it
# for older versions of CMake to support these as well.
if(CMAKE_VERSION VERSION_LESS "2.8.3")
  get_filename_component(CMAKE_CURRENT_LIST_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
endif()

# Extract the directory where *this* file has been installed (determined at cmake run-time)
# Get the absolute path with no ../.. relative marks, to eliminate implicit linker warnings
set(OpenCV_CONFIG_PATH "${CMAKE_CURRENT_LIST_DIR}")
get_filename_component(OpenCV_INSTALL_PATH "${OpenCV_CONFIG_PATH}/" REALPATH)

# Search packages for host system instead of packages for target system.
# in case of cross compilation thess macro should be defined by toolchain file
if(NOT COMMAND find_host_package)
    macro(find_host_package)
        find_package(${ARGN})
    endmacro()
endif()
if(NOT COMMAND find_host_program)
    macro(find_host_program)
        find_program(${ARGN})
    endmacro()
endif()


# Version Compute Capability from which OpenCV has been compiled is remembered
set(OpenCV_COMPUTE_CAPABILITIES "-gencode;arch=compute_72,code=sm_72;-D_FORCE_INLINES")

set(OpenCV_CUDA_VERSION "10.2")
set(OpenCV_USE_CUBLAS   "")
set(OpenCV_USE_CUFFT    "1")
set(OpenCV_USE_NVCUVID  "")

if(NOT CUDA_FOUND)
  find_host_package(CUDA ${OpenCV_CUDA_VERSION} EXACT REQUIRED)
else()
  if(NOT CUDA_VERSION_STRING VERSION_EQUAL OpenCV_CUDA_VERSION)
    message(FATAL_ERROR "OpenCV static library was compiled with CUDA ${OpenCV_CUDA_VERSION} support. Please, use the same version or rebuild OpenCV with CUDA ${CUDA_VERSION_STRING}")
  endif()
endif()

set(OpenCV_CUDA_LIBS_ABSPATH ${CUDA_LIBRARIES})

if(${CUDA_VERSION} VERSION_LESS "5.5")
  list(APPEND OpenCV_CUDA_LIBS_ABSPATH ${CUDA_npp_LIBRARY})
else()
  find_cuda_helper_libs(nppc)
  find_cuda_helper_libs(nppial)
  find_cuda_helper_libs(nppicc)
  find_cuda_helper_libs(nppicom)
  find_cuda_helper_libs(nppidei)
  find_cuda_helper_libs(nppif)
  find_cuda_helper_libs(nppig)
  find_cuda_helper_libs(nppim)
  find_cuda_helper_libs(nppist)
  find_cuda_helper_libs(nppisu)
  find_cuda_helper_libs(nppitc)
  find_cuda_helper_libs(npps)
  list(APPEND OpenCV_CUDA_LIBS_ABSPATH ${CUDA_nppc_LIBRARY} ${CUDA_nppi_LIBRARY} ${CUDA_npps_LIBRARY})
endif()

if(OpenCV_USE_CUBLAS)
  list(APPEND OpenCV_CUDA_LIBS_ABSPATH ${CUDA_CUBLAS_LIBRARIES})
endif()

if(OpenCV_USE_CUFFT)
  list(APPEND OpenCV_CUDA_LIBS_ABSPATH ${CUDA_CUFFT_LIBRARIES})
endif()

if(OpenCV_USE_NVCUVID)
  list(APPEND OpenCV_CUDA_LIBS_ABSPATH ${CUDA_nvcuvid_LIBRARIES})
endif()

if(WIN32)
  list(APPEND OpenCV_CUDA_LIBS_ABSPATH ${CUDA_nvcuvenc_LIBRARIES})
endif()

set(OpenCV_CUDA_LIBS_RELPATH "")
foreach(l ${OpenCV_CUDA_LIBS_ABSPATH})
  get_filename_component(_tmp ${l} PATH)
  if(NOT ${_tmp} MATCHES "-Wl.*")
    list(APPEND OpenCV_CUDA_LIBS_RELPATH ${_tmp})
  endif()
endforeach()

list(REMOVE_DUPLICATES OpenCV_CUDA_LIBS_RELPATH)
link_directories(${OpenCV_CUDA_LIBS_RELPATH})





# Some additional settings are required if OpenCV is built as static libs
set(OpenCV_SHARED ON)

# Enables mangled install paths, that help with side by side installs
set(OpenCV_USE_MANGLED_PATHS FALSE)

set(OpenCV_LIB_COMPONENTS opencv_calib3d;opencv_core;opencv_cudaarithm;opencv_cudabgsegm;opencv_cudastereo;opencv_cudawarping;opencv_cudev;opencv_features2d;opencv_flann;opencv_imgcodecs;opencv_imgproc;opencv_ml;opencv_objdetect;opencv_photo;opencv_shape;opencv_superres;opencv_video;opencv_videostab;opencv_aruco;opencv_bioinspired;opencv_dpm;opencv_face;opencv_fuzzy;opencv_reg;opencv_surface_matching;opencv_text;opencv_xphoto)
set(OpenCV_INCLUDE_DIRS "/home/user/Downloads/FindCUDA/opencv-3.2.0/release" "/home/user/Downloads/FindCUDA/opencv-3.2.0/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/include/opencv" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/cudev/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/core/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/cudaarithm/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/imgproc/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/ml/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/objdetect/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/photo/include" "/home/user/Downloads/FindCUDA/opencv_contrib-3.2.0/modules/reg/include" "/home/user/Downloads/FindCUDA/opencv_contrib-3.2.0/modules/surface_matching/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/video/include" "/home/user/Downloads/FindCUDA/opencv_contrib-3.2.0/modules/xphoto/include" "/home/user/Downloads/FindCUDA/opencv_contrib-3.2.0/modules/bioinspired/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/cudabgsegm/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/cudawarping/include" "/home/user/Downloads/FindCUDA/opencv_contrib-3.2.0/modules/dpm/include" "/home/user/Downloads/FindCUDA/opencv_contrib-3.2.0/modules/face/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/features2d/include" "/home/user/Downloads/FindCUDA/opencv_contrib-3.2.0/modules/fuzzy/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/imgcodecs/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/shape/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/superres/include" "/home/user/Downloads/FindCUDA/opencv_contrib-3.2.0/modules/text/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/calib3d/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/cudastereo/include" "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/videostab/include" "/home/user/Downloads/FindCUDA/opencv_contrib-3.2.0/modules/aruco/include")

if(NOT TARGET opencv_core)
  include(${CMAKE_CURRENT_LIST_DIR}/OpenCVModules${OpenCV_MODULES_SUFFIX}.cmake)
endif()

if(NOT CMAKE_VERSION VERSION_LESS "2.8.11")
  # Target property INTERFACE_INCLUDE_DIRECTORIES available since 2.8.11:
  # * http://www.cmake.org/cmake/help/v2.8.11/cmake.html#prop_tgt:INTERFACE_INCLUDE_DIRECTORIES
  foreach(__component ${OpenCV_LIB_COMPONENTS})
    if(TARGET ${__component})
      set_target_properties(
          ${__component}
          PROPERTIES
          INTERFACE_INCLUDE_DIRECTORIES "${OpenCV_INCLUDE_DIRS}"
      )
    endif()
  endforeach()
endif()

# ==============================================================
#  Form list of modules (components) to find
# ==============================================================
if(NOT OpenCV_FIND_COMPONENTS)
  set(OpenCV_FIND_COMPONENTS ${OpenCV_LIB_COMPONENTS})
  list(REMOVE_ITEM OpenCV_FIND_COMPONENTS opencv_java)
  if(GTest_FOUND OR GTEST_FOUND)
    list(REMOVE_ITEM OpenCV_FIND_COMPONENTS opencv_ts)
  endif()
endif()

set(OpenCV_WORLD_COMPONENTS )

# expand short module names and see if requested components exist
foreach(__cvcomponent ${OpenCV_FIND_COMPONENTS})
  # Store the name of the original component so we can set the
  # OpenCV_<component>_FOUND variable which can be checked by the user.
  set (__original_cvcomponent ${__cvcomponent})
  if(NOT __cvcomponent MATCHES "^opencv_")
    set(__cvcomponent opencv_${__cvcomponent})
  endif()
  list(FIND OpenCV_LIB_COMPONENTS ${__cvcomponent} __cvcomponentIdx)
  if(__cvcomponentIdx LESS 0)
    if(_OpenCV_HANDLE_COMPONENTS_MANUALLY)
      # Either the component is required or the user did not set any components at
      # all. In the latter case, the OpenCV_FIND_REQUIRED_<component> variable
      # will not be defined since it is not set by this config. So let's assume
      # the implicitly set components are always required.
      if(NOT DEFINED OpenCV_FIND_REQUIRED_${__original_cvcomponent} OR
          OpenCV_FIND_REQUIRED_${__original_cvcomponent})
        message(FATAL_ERROR "${__cvcomponent} is required but was not found")
      elseif(NOT OpenCV_FIND_QUIETLY)
        # The component was marked as optional using OPTIONAL_COMPONENTS
        message(WARNING "Optional component ${__cvcomponent} was not found")
      endif()
    endif(_OpenCV_HANDLE_COMPONENTS_MANUALLY)
    #indicate that module is NOT found
    string(TOUPPER "${__cvcomponent}" __cvcomponentUP)
    set(${__cvcomponentUP}_FOUND "${__cvcomponentUP}_FOUND-NOTFOUND")
    set(OpenCV_${__original_cvcomponent}_FOUND FALSE)
  else()
    # Not using list(APPEND) here, because OpenCV_LIBS may not exist yet.
    # Also not clearing OpenCV_LIBS anywhere, so that multiple calls
    # to find_package(OpenCV) with different component lists add up.
    set(OpenCV_LIBS ${OpenCV_LIBS} "${__cvcomponent}")
    #indicate that module is found
    string(TOUPPER "${__cvcomponent}" __cvcomponentUP)
    set(${__cvcomponentUP}_FOUND 1)
    set(OpenCV_${__original_cvcomponent}_FOUND TRUE)
  endif()
  if(OpenCV_SHARED AND ";${OpenCV_WORLD_COMPONENTS};" MATCHES ";${__cvcomponent};" AND NOT TARGET ${__cvcomponent})
    get_target_property(__implib_dbg opencv_world IMPORTED_IMPLIB_DEBUG)
    get_target_property(__implib_release opencv_world  IMPORTED_IMPLIB_RELEASE)
    get_target_property(__location_dbg opencv_world IMPORTED_LOCATION_DEBUG)
    get_target_property(__location_release opencv_world  IMPORTED_LOCATION_RELEASE)
    add_library(${__cvcomponent} SHARED IMPORTED)
    if(__location_dbg)
      set_property(TARGET ${__cvcomponent} APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
      set_target_properties(${__cvcomponent} PROPERTIES
        IMPORTED_IMPLIB_DEBUG "${__implib_dbg}"
        IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG ""
        IMPORTED_LOCATION_DEBUG "${__location_dbg}"
      )
    endif()
    if(__location_release)
      set_property(TARGET ${__cvcomponent} APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
      set_target_properties(${__cvcomponent} PROPERTIES
        IMPORTED_IMPLIB_RELEASE "${__implib_release}"
        IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE ""
        IMPORTED_LOCATION_RELEASE "${__location_release}"
      )
    endif()
  endif()
endforeach()

# ==============================================================
# Compatibility stuff
# ==============================================================
set(OpenCV_LIBRARIES ${OpenCV_LIBS})

#
# Some macroses for samples
#
macro(ocv_check_dependencies)
  set(OCV_DEPENDENCIES_FOUND TRUE)
  foreach(d ${ARGN})
    if(NOT TARGET ${d})
      message(WARNING "OpenCV: Can't resolve dependency: ${d}")
      set(OCV_DEPENDENCIES_FOUND FALSE)
      break()
    endif()
  endforeach()
endmacro()

# adds include directories in such way that directories from the OpenCV source tree go first
function(ocv_include_directories)
  set(__add_before "")
  file(TO_CMAKE_PATH "${OpenCV_INSTALL_PATH}" __baseDir)
  foreach(dir ${ARGN})
    get_filename_component(__abs_dir "${dir}" ABSOLUTE)
    if("${__abs_dir}" MATCHES "^${__baseDir}")
      list(APPEND __add_before "${dir}")
    else()
      include_directories(AFTER SYSTEM "${dir}")
    endif()
  endforeach()
  include_directories(BEFORE ${__add_before})
endfunction()

macro(ocv_include_modules)
  include_directories(BEFORE "${OpenCV_INCLUDE_DIRS}")
endmacro()

macro(ocv_include_modules_recurse)
  include_directories(BEFORE "${OpenCV_INCLUDE_DIRS}")
endmacro()

macro(ocv_target_link_libraries)
  target_link_libraries(${ARGN})
endmacro()

# remove all matching elements from the list
macro(ocv_list_filterout lst regex)
  foreach(item ${${lst}})
    if(item MATCHES "${regex}")
      list(REMOVE_ITEM ${lst} "${item}")
    endif()
  endforeach()
endmacro()

# We do not actually need REQUIRED_VARS to be checked for. Just use the
# installation directory for the status.
find_package_handle_standard_args(OpenCV REQUIRED_VARS OpenCV_INSTALL_PATH
                                  VERSION_VAR OpenCV_VERSION ${_OpenCV_FPHSA_ARGS})
