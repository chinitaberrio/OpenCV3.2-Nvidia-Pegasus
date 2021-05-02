# Install script for directory: /home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/user/Downloads/FindCUDA/opencv-3.2.0/release/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibsx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so.3.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so.3.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/home/user/Downloads/FindCUDA/opencv-3.2.0/release/install/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib/stubs")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY OPTIONAL FILES
    "/home/user/Downloads/FindCUDA/opencv-3.2.0/release/lib/libopencv_flann.so.3.2.0"
    "/home/user/Downloads/FindCUDA/opencv-3.2.0/release/lib/libopencv_flann.so.3.2"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so.3.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so.3.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/usr/local/cuda-10.2/targets/aarch64-linux/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib/stubs:/home/user/Downloads/FindCUDA/opencv-3.2.0/release/lib::::::::"
           NEW_RPATH "/home/user/Downloads/FindCUDA/opencv-3.2.0/release/install/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib/stubs")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/home/user/nvidia/nvidia_sdk/DRIVE_OS_5.2.0_SDK_Linux_OS_DDPX/DRIVEOS/toolchains/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so"
         RPATH "/home/user/Downloads/FindCUDA/opencv-3.2.0/release/install/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib/stubs")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/release/lib/libopencv_flann.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so"
         OLD_RPATH "/usr/local/cuda-10.2/targets/aarch64-linux/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib/stubs:/home/user/Downloads/FindCUDA/opencv-3.2.0/release/lib::::::::"
         NEW_RPATH "/home/user/Downloads/FindCUDA/opencv-3.2.0/release/install/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib:/usr/local/cuda-10.2/targets/aarch64-linux/lib/stubs")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/home/user/nvidia/nvidia_sdk/DRIVE_OS_5.2.0_SDK_Linux_OS_DDPX/DRIVEOS/toolchains/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_flann.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/all_indices.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/allocator.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/any.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/autotuned_index.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/composite_index.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/config.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/defines.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/dist.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/dummy.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/dynamic_bitset.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/flann.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/flann_base.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/general.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/ground_truth.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/hdf5.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/heap.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/hierarchical_clustering_index.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/index_testing.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/kdtree_index.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/kdtree_single_index.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/kmeans_index.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/linear_index.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/logger.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/lsh_index.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/lsh_table.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/matrix.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/miniflann.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/nn_index.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/object_factory.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/params.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/random.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/result_set.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/sampling.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/saving.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/simplex_downhill.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/flann" TYPE FILE OPTIONAL FILES "/home/user/Downloads/FindCUDA/opencv-3.2.0/modules/flann/include/opencv2/flann/timer.h")
endif()

