cmake_minimum_required(VERSION 4.2)

project(CPP_DEMOS)

set(CMAKE_CXX_STANDARD 20)

file(GLOB_RECURSE CPP_SOURCES CONFIGURE_DEPENDS
        src/*.cpp
)

add_executable(${PROJECT_NAME}
        app/main.cpp
        ${CPP_SOURCES}
)

target_include_directories(${PROJECT_NAME} PRIVATE include)
