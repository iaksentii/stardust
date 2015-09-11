TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    graphicmanager.cpp \
    screenmanager.cpp


RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
HEADERS += \
    graphicmanager.h \
    screenmanager.h

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
    EmptyPage.qml
