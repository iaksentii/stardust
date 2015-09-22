#include "gameconsole.h"
#include "screenmanager.h"
#include <QApplication>
#include <QTime>

GameConsole::GameConsole(QObject *parent) : QObject(parent)
{

}

void GameConsole::performCommand(QString command)
{
    qDebug() << command;
    command = command.toLower();

    if (command == "quit") {
        QApplication::quit();
    }
    if (command == "close") {
        ScreenManager::Instance()->closeWindow();
    }

    if (command == "time") {
        qDebug() << QTime::currentTime();
    }

}

