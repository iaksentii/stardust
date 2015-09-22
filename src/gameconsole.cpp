#include "gameconsole.h"
#include "screenmanager.h"
#include "profilemanager.h"
#include <QApplication>
#include <QTime>
#include <QStringList>

GameConsole::GameConsole(QObject *parent) : QObject(parent)
{

}

void GameConsole::performCommand(QString command)
{
    qDebug() << command;
    command = command.toLower();
    QStringList commandList = command.split(' ');

    if (commandList[0] == "quit" || commandList[0] == "q") {
        QApplication::quit();
    }
    if (commandList[0] == "close") {
        ScreenManager::Instance()->closeWindow();
    }

    if (commandList[0] == "time") {
        qDebug() << QTime::currentTime();
    }

    if (commandList[0] == "setscore") {
        bool isNumeric;
        commandList[1].toInt(&isNumeric);

        if (isNumeric)
            ProfileManager::Instance()->currentPlayerData()->set("score", commandList[1]);
    }

}

