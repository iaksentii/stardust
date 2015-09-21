#include "playerdata.h"

PlayerData::PlayerData()
{

}

void PlayerData::set(QString name, QVariant value)
{
    m_data.insert(name, value);
}

QVariant PlayerData::get(QString name)
{
    return m_data[name];
}


