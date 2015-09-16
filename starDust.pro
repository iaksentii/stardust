TEMPLATE = app

QT += qml quick widgets

# making building in target dir
DESTDIR = build
MOC_DIR = build
OBJECTS_DIR = build
RCC_DIR = build

SOURCES += src/main.cpp \
    src/graphicmanager.cpp \
    src/screenmanager.cpp \
    src/solarsystem.cpp


RESOURCES += src/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    src/graphicmanager.h \
    src/screenmanager.h \
    src/solarsystem.h

DISTFILES += \
    main.qml \
    Options.qml \
    styles/StyleForCheckBox.qml \
    styles/StyleForRadioButton.qml \
    styles/StyleForSlider.qml \
    Options.qml \
    styles/Button.qml \
    styles/StyleForComboBox.qml \
    styles/TextLabel.qml \
    Loader.qml \
    EmptyPage.qml \
    sceneEngine.js \
    SolarSystem.qml \
    CreateNewPlanet.qml \
    Galaxy.qml \
    data/CreateNewPlanet.qml \
    data/EmptyPage.qml \
    data/Galaxy.qml \
    data/Loader.qml \
    data/main.qml \
    data/Options.qml \
    data/SolarSystem.qml \
    data/styles/Button.qml \
    data/styles/StyleForCheckBox.qml \
    data/styles/StyleForComboBox.qml \
    data/styles/StyleForRadioButton.qml \
    data/styles/StyleForSlider.qml \
    data/styles/TextLabel.qml \
    data/fonts/font.ttf
