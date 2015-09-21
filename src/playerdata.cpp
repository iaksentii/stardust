#include "playerdata.h"
#include "jsonparser.h"

PlayerData::PlayerData()
{
}

PlayerData::PlayerData(const QJsonObject &jsonObject)
{
    fillDataFromJson(jsonObject);
}

QJsonObject PlayerData::getJsonObject()
{
    QJsonObject jsonObject;
    for (QMap<QString, QVariant>::Iterator it = m_data.begin(); it != m_data.end(); it++) {
        jsonObject[it.key()] = it.value().toString();
    }

    return jsonObject;
}

void PlayerData::fillDefault()
{
    QJsonObject jsonObject = JsonParser("../data/config/default_profile.json").load();
    fillDataFromJson(jsonObject);
}

void PlayerData::set(QString name, QVariant value)
{
    m_data.insert(name, value);
}

QVariant PlayerData::get(QString name)
{
    return m_data[name];
}

void PlayerData::fillDataFromJson(const QJsonObject &jsonObject)
{
    m_data.clear();

    for (QJsonObject::const_iterator it = jsonObject.begin(); it != jsonObject.end(); it++) {
        m_data.insert(it.key(), it.value().toVariant());
    }
}


