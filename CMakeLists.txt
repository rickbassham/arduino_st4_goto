########### Arduino ST4 GoTo INDI driver ##############
PROJECT(arduino_st4_goto C CXX)
cmake_minimum_required(VERSION 2.8)

include(GNUInstallDirs)

LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake_modules/")
LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../cmake_modules/")

find_package(INDI REQUIRED)
find_package(Nova REQUIRED)

set(ARDST4GOTO_VERSION_MAJOR 0)
set(ARDST4GOTO_VERSION_MINOR 1)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/config.h )
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/indi_arduino_st4_goto.xml.cmake ${CMAKE_CURRENT_BINARY_DIR}/indi_arduino_st4_goto.xml )

include_directories( ${CMAKE_CURRENT_BINARY_DIR})
include_directories( ${CMAKE_CURRENT_SOURCE_DIR})
include_directories( ${INDI_INCLUDE_DIR})
include_directories( ${NOVA_INCLUDE_DIR})

include(CMakeCommon)

add_executable(indi_arduino_st4_goto arduino_st4_goto.cpp scopesim_helper.cpp)
target_link_libraries(indi_arduino_st4_goto ${INDI_LIBRARIES} ${NOVA_LIBRARIES})
install(TARGETS indi_arduino_st4_goto RUNTIME DESTINATION bin)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/indi_arduino_st4_goto.xml DESTINATION ${INDI_DATA_DIR})
