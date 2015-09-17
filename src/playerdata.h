#ifndef PLAYERDATA_H
#define PLAYERDATA_H

#include <QObject>


class PlayerData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int score READ score WRITE setScore NOTIFY scoreChanged)
    Q_PROPERTY(int soundLevel READ soundLevel WRITE setSoundLevel NOTIFY soundLevelChanged)

public:
    PlayerData();

    int score() const;
    void setScore(int score);

    int soundLevel() const;
    void setSoundLevel(int soundLevel);

signals:
    void scoreChanged();
    void soundLevelChanged();

private:
    int m_score;
    int m_soundLevel;

};

#endif // PLAYERDATA_H
