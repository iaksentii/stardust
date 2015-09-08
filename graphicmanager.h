#ifndef GRAPHICMANAGER_H
#define GRAPHICMANAGER_H

#include <QString>
#include <QObject>

class GraphicManager: public QObject
{
    Q_OBJECT
public:
    GraphicManager();
    GraphicManager(QString currentDirectory);
    Q_INVOKABLE QString get(QString name, QString screen);
     QString search(QString name, QString screen);
private:
    QString m_currentDirectory;

};

#endif // GRAPHICMANAGER_H
