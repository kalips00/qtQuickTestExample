cmake_minimum_required(VERSION 3.16)

project(testExample VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick QuickTest)

qt_standard_project_setup()

qt_add_executable(apptestExample
    test/main.cpp
)

qt_add_qml_module(apptestExample
    URI testExample
    VERSION 1.0
    QML_FILES
        src/qml/Main.qml
        src/qml/component/MyButton.qml
        test/qml/component/tst_MyButton.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptestExample PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptestExample
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptestExample
    PRIVATE Qt6::Quick Qt6::QuickTest
)

include(GNUInstallDirs)
install(TARGETS apptestExample
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
