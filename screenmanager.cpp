#include "screenmanager.h"

#include <QDebug>
#include <QQuickView>

ScreenManager::ScreenManager(QObject *parent) : QObject(parent)
{
    initMap();
}

void ScreenManager::loadWindow(const QString &windowName)
{
    QString temp = mapOfFiles[windowName];

    if (temp.size()) {
        emit openWindowSignal(temp);
    }
    else {
        emit openWindowSignal("EmptyPage.qml");
    }
}

void ScreenManager::initMap()
{
//    mapOfFiles["StartGame"]  = "qrc:/StartGame.qml";
    mapOfFiles["Options"]    = "Options.qml";
//    mapOfFiles["MoreInfo"]   = "qrc:/MoreInfo.qml";
//    mapOfFiles["Profile"]    = "qrc:/Profile.qml";
//    mapOfFiles["Test"]       = "qrc:/Test.qml";
}

void ScreenManager::closeWindow()
{
    emit closeWindowSignal();
}

