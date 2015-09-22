#include "item.h"
#include <QDebug>

Item::Item():QObject(nullptr) {
    getRandomIcon();
}

Item::Item(const Item & item):QObject(nullptr) {
    m_type = item.getType();
    m_flag = item.getFlag();
    m_Icon = item.getIcon();
    m_visible = item.getVisible();
}

Item::Item(bool visible)
{
    getRandomIcon();
    m_visible = visible;
    m_type = 10;
    m_Icon = "shield.png";
}

int Item::getType() const {
    return m_type;
}

void Item::setType(int name) {
    m_type = name;
}

QString Item::getIcon() const {
    return m_Icon;
}

bool Item::getFlag() const {
    return m_flag;
}

void Item::setFlag(bool flag) {
    m_flag = flag;
    emit flagChanged();
}

bool Item::getVisible() const
{
    return m_visible;
}

void Item::setVisible(bool visible)
{
    m_visible = visible;
}



Item &Item::operator =(const Item & item) {
    m_type = item.getType();
    m_flag = item.getFlag();
    m_Icon = item.getIcon();
    m_visible = item.getVisible();
    return *this;
}

void Item::getRandomIcon() {
    int n = rand()% 5 + 1;
    m_type = n;
    m_flag = false;
    m_visible = true;
    switch (m_type) {
    case 1:
        m_Icon = "apple.png";
        break;
    case 2:
        m_Icon = "pepper.png";
        break;
    case 3:
        m_Icon = "pear.png";
        break;
    case 4:
        m_Icon = "carrot.png";
        break;
    case 5:
        m_Icon = "watermelon.png";
        break;
    }
}

void Item::refresh() {
    getRandomIcon();
}




