#ifndef PLAYERDATA_H
#define PLAYERDATA_H

#include <QObject>
#include <QMap>
#include <QString>
#include <QVariant>
#include <QJsonObject>

class PlayerData : public QObject
{
    Q_OBJECT

public:
    PlayerData();
    PlayerData(const QJsonObject &jsonObject);

    QJsonObject getJsonObject();
    void fillDefault();

    Q_INVOKABLE void set(QString name, QVariant value);
    Q_INVOKABLE QVariant get(QString name);


private:
    void fillDataFromJson(const QJsonObject &jsonObject);

private:
    QMap<QString, QVariant> m_data;

};

#endif // PLAYERDATA_H
