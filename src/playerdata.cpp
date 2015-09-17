#include "playerdata.h"

PlayerData::PlayerData() :
    m_score(0),
    m_soundLevel(0)
{

}
int PlayerData::score() const
{
    return m_score;
}

void PlayerData::setScore(int score)
{
    m_score = score;
    emit scoreChanged();
}
int PlayerData::soundLevel() const
{
    return m_soundLevel;
}

void PlayerData::setSoundLevel(int soundLevel)
{
    m_soundLevel = soundLevel;
    emit soundLevelChanged();
}


