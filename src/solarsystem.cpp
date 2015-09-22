#include <QDebug>
#include "solarsystem.h"

SolarSystem::SolarSystem()
{
    for(int i = 0; i < 8; i++)
        m_planet << Planet(get("add.png", "playField"), "");

    for(int i = 0; i < 5; i++)
        m_resourcesCount << 0;
}

QString SolarSystem::getPlanetsSlot(int index) const
{
    if(index < m_planet.length() && index >= 0)
        return m_planet.at(index).m_planetSlot;
    else
        return QString();
}

void SolarSystem::setPlanetsSlot(const int index, const QString value)
{
    if(index < m_planet.length() && index >= 0) {
        m_planet[index].m_planetSlot = value;

        emit planet1Changed();
        emit planet2Changed();
        emit planet3Changed();
        emit planet4Changed();
        emit planet5Changed();
        emit planet6Changed();
        emit planet7Changed();
        emit planet8Changed();
    }
    else
        return;
}

QString SolarSystem::getPlanetsName(int index) const
{
    if(index < m_planet.length() && index >= 0)
        return m_planet.at(index).m_planetName;
    else
        return QString();
}

void SolarSystem::setPlanetsName(const int index, const QString value)
{
    if(index < m_planet.length() && index >= 0) {
        m_planet[index].m_planetName = value;
        emit planetName1Changed();
        emit planetName2Changed();
        emit planetName3Changed();
        emit planetName4Changed();
        emit planetName5Changed();
        emit planetName6Changed();
        emit planetName7Changed();
        emit planetName8Changed();
    }
    else
        return;
}

int SolarSystem::getResourcesCount(int index) const
{
    if(index < m_resourcesCount.length() && index >= 0)
        return m_resourcesCount.at(index);
    else
        return 0;
}

void SolarSystem::setResourcesCount(const int index, const int value)
{
    if(index < m_resourcesCount.length() && index >= 0)
        m_resourcesCount[index] = value;
    else
        return;
}

void SolarSystem::addResourses()
{
    for(int index = 0; index < m_resourcesCount.length(); index++)
        m_resourcesCount[index] += 1;

    emit resource1Changed();
    emit resource2Changed();
    emit resource3Changed();
    emit resource4Changed();
    emit resource5Changed();
}

int SolarSystem::resource1() const
{
    return m_resourcesCount.at(0);
}

void SolarSystem::setResource1(const int &resource1)
{
    m_resourcesCount[0] = resource1;
    emit resource1Changed();
}
int SolarSystem::resource2() const
{
    return m_resourcesCount.at(1);
}

void SolarSystem::setResource2(const int &resource2)
{
    m_resourcesCount[1] = resource2;
    emit resource2Changed();
}
int SolarSystem::resource3() const
{
    return m_resourcesCount.at(2);
}

void SolarSystem::setResource3(const int &resource3)
{
    m_resourcesCount[2] = resource3;
    emit resource3Changed();
}
int SolarSystem::resource4() const
{
    return m_resourcesCount.at(3);
}

void SolarSystem::setResource4(const int &resource4)
{
    m_resourcesCount[3] = resource4;
    emit resource4Changed();
}
int SolarSystem::resource5() const
{
    return m_resourcesCount.at(4);
}

void SolarSystem::setResource5(const int &resource5)
{
    m_resourcesCount[4] = resource5;
    emit resource5Changed();
}

QString SolarSystem::planet1() const
{
    return m_planet.at(0).m_planetSlot;
}

void SolarSystem::setPlanet1(const QString &planet1)
{
    m_planet[0].m_planetSlot = planet1;
    emit planet1Changed();
}
QString SolarSystem::planet2() const
{
    return m_planet.at(1).m_planetSlot;
}

void SolarSystem::setPlanet2(const QString &planet2)
{
    m_planet[1].m_planetSlot = planet2;
    emit planet2Changed();
}
QString SolarSystem::planet3() const
{
    return m_planet.at(2).m_planetSlot;
}

void SolarSystem::setPlanet3(const QString &planet3)
{
    m_planet[2].m_planetSlot = planet3;
    emit planet3Changed();
}
QString SolarSystem::planet4() const
{
    return m_planet.at(3).m_planetSlot;
}

void SolarSystem::setPlanet4(const QString &planet4)
{
    m_planet[3].m_planetSlot = planet4;
    emit planet4Changed();
}
QString SolarSystem::planet5() const
{
    return m_planet.at(4).m_planetSlot;
}

void SolarSystem::setPlanet5(const QString &planet5)
{
    m_planet[4].m_planetSlot = planet5;
    emit planet5Changed();
}
QString SolarSystem::planet6() const
{
    return m_planet.at(5).m_planetSlot;
}

void SolarSystem::setPlanet6(const QString &planet6)
{
    m_planet[5].m_planetSlot = planet6;
    emit planet6Changed();
}
QString SolarSystem::planet7() const
{
    return m_planet.at(6).m_planetSlot;
}

void SolarSystem::setPlanet7(const QString &planet7)
{
    m_planet[6].m_planetSlot = planet7;
    emit planet7Changed();
}
QString SolarSystem::planet8() const
{
    return m_planet.at(7).m_planetSlot;
}

void SolarSystem::setPlanet8(const QString &planet8)
{
    m_planet[7].m_planetSlot = planet8;
    emit planet8Changed();
}

QString SolarSystem::planetName1() const
{
    return m_planet.at(0).m_planetSlot;
}

void SolarSystem::setPlanetName1(const QString &planetName1)
{
    m_planet[0].m_planetName = planetName1;
    emit planetName1Changed();
}
QString SolarSystem::planetName2() const
{
    return m_planet.at(1).m_planetName;
}

void SolarSystem::setPlanetName2(const QString &planetName2)
{
    m_planet[1].m_planetName = planetName2;
    emit planetName2Changed();
}
QString SolarSystem::planetName3() const
{
    return m_planet.at(2).m_planetName;
}

void SolarSystem::setPlanetName3(const QString &planetName3)
{
    m_planet[2].m_planetName = planetName3;
    emit planetName3Changed();
}
QString SolarSystem::planetName4() const
{
    return m_planet.at(3).m_planetName;
}

void SolarSystem::setPlanetName4(const QString &planetName4)
{
    m_planet[3].m_planetName = planetName4;
    emit planetName4Changed();
}
QString SolarSystem::planetName5() const
{
    return m_planet.at(4).m_planetName;
}

void SolarSystem::setPlanetName5(const QString &planetName5)
{
    m_planet[4].m_planetName = planetName5;
    emit planetName5Changed();
}
QString SolarSystem::planetName6() const
{
    return m_planet.at(5).m_planetName;
}

void SolarSystem::setPlanetName6(const QString &planetName6)
{
    m_planet[5].m_planetName = planetName6;
    emit planetName6Changed();
}
QString SolarSystem::planetName7() const
{
    return m_planet.at(6).m_planetName;
}

void SolarSystem::setPlanetName7(const QString &planetName7)
{
    m_planet[6].m_planetName = planetName7;
    emit planetName7Changed();
}
QString SolarSystem::planetName8() const
{
    return m_planet.at(7).m_planetName;
}

void SolarSystem::setPlanetName8(const QString &planetName8)
{
    m_planet[7].m_planetName = planetName8;
    emit planetName8Changed();
}
