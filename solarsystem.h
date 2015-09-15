#ifndef SOLARSYSTEM_H
#define SOLARSYSTEM_H

#include <QObject>
#include <QList>

// CREATE NEW CLASS FOR PLANETS!!!

class SolarSystem : public QObject
{
    Q_OBJECT
public:
    explicit SolarSystem(QObject *parent = 0);

    Q_INVOKABLE QString getPlanetSlot(const int index);
    Q_INVOKABLE void setPlanetSlot(const int index, const QString value);

    Q_INVOKABLE int getResourcesCount(int index) const;
    Q_INVOKABLE void setResourcesCount(const int index, const int value);

    Q_INVOKABLE void addResourses();

    Q_INVOKABLE QString getPlanetsName(int index) const;
    Q_INVOKABLE void setPlanetsName(const int index, const QString value);

private:
    QList <QString> m_planetsSlots;
    QList <QString> m_planetsName;

    QList <int> m_resourcesCount;

public slots:


signals:
    void resourcesCountChanged();
};
#endif // SOLARSYSTEM_H
