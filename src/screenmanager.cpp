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
    mapOfFiles["MainMenu"]   = "MainWindow.qml";
    mapOfFiles["StartGame"]  = "Galaxy.qml";
    mapOfFiles["Options"]    = "Options.qml";
    mapOfFiles["Match3"]    = "Match3.qml";
//    mapOfFiles["MoreInfo"]   = "qrc:/MoreInfo.qml";
    mapOfFiles["Profile"]    = "Profile.qml";
    //    mapOfFiles["Test"]       = "qrc:/Test.qml";
}

ScreenManager *ScreenManager::Instance()
{
    static ScreenManager theSingleManager;
    return &theSingleManager;
}

void ScreenManager::closeWindow()
{
    emit closeWindowSignal();
}

