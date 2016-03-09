include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
)

set(
    ReadEnvbackend_SRCS
    modules/ReadEnv/backend.cpp
    modules/ReadEnv/mytype.cpp
    modules/ReadEnv/readenv.cpp
)

add_library(ReadEnvbackend MODULE
    ${ReadEnvbackend_SRCS}
)

set_target_properties(ReadEnvbackend PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY ReadEnv)

qt5_use_modules(ReadEnvbackend Gui Qml Quick)

# Copy qmldir file to build dir for running in QtCreator
add_custom_target(ReadEnvbackend-qmldir ALL
    COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/modules/ReadEnv/qmldir ${CMAKE_CURRENT_BINARY_DIR}/ReadEnv
    DEPENDS ${QMLFILES}
)

# Install plugin file
install(TARGETS ReadEnvbackend DESTINATION ${QT_IMPORTS_DIR}/ReadEnv/)
install(FILES   modules/ReadEnv/qmldir DESTINATION ${QT_IMPORTS_DIR}/ReadEnv/)

