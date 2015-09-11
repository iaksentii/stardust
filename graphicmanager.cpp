#include "graphicmanager.h"

#include <QFile>
#include <QDebug>
#include <QDir>
GraphicManager::GraphicManager(): m_currentDirectory ("../starDust")
{

}

GraphicManager::GraphicManager(QString currentDirectory): m_currentDirectory (currentDirectory)
{

}

QString GraphicManager::search(QString name, QString screen)
{
    //if (screen != "styles")
    QDir::setCurrent(m_currentDirectory);
  //  else  QDir::setCurrent("../");
    QString str = "data/textures/screens/";
    str.append(screen);
    QDir directory(str);
    if (directory.exists(name)) {
      //   qDebug() << directory.filePath(name);
        return directory.filePath(name);
    }
    else {
        str.clear();
        str = "data/textures/common";
        directory = str;
        if (directory.exists(name)) {
      //      qDebug() << directory.filePath(name);
        return directory.filePath(name);
        }
        else {
            qDebug() << "File :" <<name << " doesn`t exist in " <<screen;
            return "defaultTextures/defaultTextures.png";
        }
    }
}

QString GraphicManager::get(QString name, QString screen)
{
    return search(name,screen);
}

