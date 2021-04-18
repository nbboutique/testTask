cmake_minimum_required(VERSION 3.17)
project(client-server)

set(CMAKE_CXX_STANDARD 11)
set(Boost_INCLUDE_DIR C:/CLI/vcpkg/installed/x64-windows/include)
find_package(Boost COMPONENTS system thread REQUIRED)

add_library(chat_message STATIC chat_message.hpp chat_message.cpp)

add_executable(chat_server chat_server.cpp)
target_link_libraries(chat_server
    PUBLIC
        chat_message
        Boost::system
        Boost::thread)

add_executable(chat_client chat_client.cpp)
target_link_libraries(chat_client
    PUBLIC
        chat_message
        Boost::system
        Boost::thread)
