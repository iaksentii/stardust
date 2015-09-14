#include "solarsystem.h"

SolarSystem::SolarSystem(QObject *parent) : QObject(parent)
{
    for(int i = 0;  i < 8; i++)
        m_planetsSlots << "/images/add.png";

    for(int i = 0; i < 5; i++)
        m_resourcesCount << 0;

    for(int i = 0; i < 8; i++)
        m_planetsName << "";
}

QString SolarSystem::getPlanetSlot(const int index)
{
    if(index < m_planetsSlots.length() && index >= 0)
        return m_planetsSlots.at(index);
    else
        return QString();
}

void SolarSystem::setPlanetSlot(const int index, const QString value)
{
    if(index < m_planetsSlots.length() && index >= 0)
        m_planetsSlots[index] = value;
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
}

QString SolarSystem::getPlanetsName(int index) const
{
    if(index < m_planetsName.length() && index >= 0)
        return m_planetsName.at(index);
    else
        return QString();
}

void SolarSystem::setPlanetsName(const int index, const QString value)
{
    if(index < m_planetsName.length() && index >= 0)
        m_planetsName[index] = value;
    else
        return;
}

