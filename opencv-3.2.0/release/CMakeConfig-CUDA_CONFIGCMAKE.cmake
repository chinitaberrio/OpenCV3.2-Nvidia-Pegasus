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
