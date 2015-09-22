#include "graphicmanager.h"

#include <QFile>
#include <QDebug>
#include <QDir>
GraphicManager::GraphicManager(): m_currentDirectory (".")
{

}

GraphicManager::GraphicManager(QString currentDirectory): m_currentDirectory (currentDirectory)
{

}

QString GraphicManager::search(QString name, QString screen)
{

  //  QDir::setCurrent(m_currentDirectory);
    QString str = "../data/textures/screens/";
    str.append(screen);
    QDir directory(str);
    if (directory.exists(name)) {
        // qDebug() << directory.filePath(name);
        return directory.filePath(name);
    }
    else {
        str.clear();
        str = "../data/textures/common";
        directory = str;
        if (directory.exists(name)) {
      //      qDebug() << directory.filePath(name);
        return directory.filePath(name);
        }
        else {
            qDebug() << "File :" <<name << " doesn`t exist in " <<screen;
            return "../data/defaultTextures/defaultTextures.png";
        }
    }
}

QString GraphicManager::get(QString name, QString screen)
{
    return search(name,screen);
}

