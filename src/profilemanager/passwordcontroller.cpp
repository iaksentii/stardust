#include "passwordcontroller.h"
#include "profilemanager.h"


PasswordController::PasswordController(QObject *parent) : QObject(parent)
{

}

bool PasswordController::confirmPassword(const QString &password)
{
    QString crypted = ProfileManager::Instance()->loadPlayerData(m_checkedPlayer)->get("password").toString();
//    QString crypted = ProfileManager::Instance()->getPlayerData(m_checkedPlayer)->get("password").toString();
    QString decrypted = decrypt(crypted);

    return password == decrypted;
}

bool PasswordController::setPassword(const QString &player, const QString &password)
{
    QString crypted = encrypt(password);
    ProfileManager::Instance()->getPlayerData(player)->set("password", crypted);
}

QString PasswordController::gen(const QString &password)
{
    return encrypt(password);
}
QString PasswordController::checkedPlayer() const
{
    return m_checkedPlayer;
}

void PasswordController::setCheckedPlayer(const QString &checkedPlayer)
{
    m_checkedPlayer = checkedPlayer;
}

QString PasswordController::encrypt(const QString &password)
{
    // TODO
    return password;
}

QString PasswordController::decrypt(const QString &password)
{
    // TODO
    return password;
}


