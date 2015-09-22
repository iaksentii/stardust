TEMPLATE = app

QT += qml quick widgets

# making building in target dir
DESTDIR = build
MOC_DIR = build
OBJECTS_DIR = build
RCC_DIR = build

CONFIG += c++11

SOURCES += src/main.cpp \
    src/graphicmanager.cpp \
    src/screenmanager.cpp \
    src/solarsystem.cpp \
    src/playerdata.cpp \
    src/profilemanager.cpp \
    src/jsonparser.cpp \
    src/gameconsole.cpp \
    src/match3/modellist.cpp \
    src/match3/item.cpp \
    src/match3/gameconfig.cpp \
    src/translator.cpp
TRANSLATIONS = data/languages/starDust_en.ts\
    data/languages/starDust_ru.ts\
    data/languages/starDust_ua.ts\


RESOURCES += src/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    src/graphicmanager.h \
    src/screenmanager.h \
    src/solarsystem.h \
    src/playerdata.h \
    src/profilemanager.h \
    src/jsonparser.h \
    src/gameconsole.h \
    src/match3/modellist.h \
    src/match3/item.h \
    src/match3/gameconfig.h \
    src/translator.h

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
    data/fonts/font.ttf \
    data/Profile.qml \
    data/MainWindow.qml \
    data/Console.qml \
    data/main.qml \
    data/Match3.qml \
    data/styles/SideBar.qml \
    data/config.json
lupdate_only{
SOURCES = *.qml \
          *.js \
          data/*.qml \
          data/*.js
}
