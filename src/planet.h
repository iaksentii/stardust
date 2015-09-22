#ifndef PLANET_H
#define PLANET_H

#include <QObject>

class Planet
{

public:
    Planet(QString planetSlot, QString planetName);
    Planet();
    ~Planet();
    QString m_planetSlot;
    QString m_planetName;

};

#endif // PLANET_H
