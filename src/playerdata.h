#ifndef PLAYERDATA_H
#define PLAYERDATA_H

#include <QObject>
#include <QMap>
#include <QString>
#include <QVariant>

class PlayerData : public QObject
{
    Q_OBJECT

public:
    PlayerData();

    Q_INVOKABLE void set(QString name, QVariant value);
    Q_INVOKABLE QVariant get(QString name);

private:


private:
    QMap<QString, QVariant> m_data;

};

#endif // PLAYERDATA_H
