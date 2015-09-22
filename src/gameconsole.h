#ifndef GAMECONSOLE_H
#define GAMECONSOLE_H

#include <QObject>
#include <QString>
#include <QDebug>

class GameConsole : public QObject
{
    Q_OBJECT
public:
    explicit GameConsole(QObject *parent = 0);

    Q_INVOKABLE void performCommand(QString command);

signals:

public slots:
};

#endif // GAMECONSOLE_H
