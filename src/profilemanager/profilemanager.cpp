#include "profilemanager.h"
#include "../jsonparser.h"

#include <QDir>
#include <QFile>

#include <QDebug>


ProfileManager::ProfileManager(QObject *parent) :
    QObject(parent),
    m_playersListModel(NULL)
{
    QJsonObject globalConf = JsonParser("../data/config/global_config.json").load();
    m_pathToProfiles = globalConf["profilesPath"].toString();

    QJsonObject localConf = JsonParser("../data/config/config.json").load();
    m_currentPlayer = localConf["currentPlayer"].toString();

    QDir dir(m_pathToProfiles);
    if (!dir.exists())
        QDir().mkpath(m_pathToProfiles);


    dir.setNameFilters(QStringList() << "*.json");

    QFileInfoList list = dir.entryInfoList();

    for (int i = 0; i < list.size(); ++i) {
        QFileInfo fileInfo = list.at(i);
        QString playerName = fileInfo.fileName().split(".")[0];

        JsonParser profParser(pathToProfile(playerName));

        if (playerName == m_currentPlayer) {
            QJsonObject jsonObject = profParser.load();
            m_playersList.insert(playerName, QSharedPointer<PlayerData>(new PlayerData(jsonObject)));
        }
        else {
            m_playersList.insert(playerName, QSharedPointer<PlayerData>(new PlayerData()));
        }
    }

    m_passwordController = QSharedPointer<PasswordController>(new PasswordController());

    m_playersListModel = QSharedPointer<QStringListModel>(new QStringListModel());
    setPlayersListModel(m_playersList.keys());
    loadPlayer(m_currentPlayer);
}

ProfileManager *ProfileManager::Instance()
{
    static ProfileManager profileManager;
    return &profileManager;
}

void ProfileManager::newPlayer(const QString &newPlayer, const QString &password)
{
    if (!validName(newPlayer))
        return;

    QDir dir(m_pathToProfiles);
    dir.setNameFilters(QStringList() << "*.json");

    QFileInfoList list = dir.entryInfoList();

    for (int i = 0; i < list.size(); ++i) {
        QFileInfo fileInfo = list.at(i);
        QString playerName = fileInfo.fileName().split(".")[0];

        if (playerName == newPlayer)
            return;
    }

    m_playersList.insert(newPlayer, QSharedPointer<PlayerData>(new PlayerData()));
    m_playersList[newPlayer]->fillDefault();

    QJsonObject jsonObject = m_playersList[newPlayer]->getJsonObject();
    jsonObject["password"] = m_passwordController->gen(password);


    JsonParser profParser(pathToProfile(newPlayer));
    profParser.save(jsonObject);


    setPlayersListModel(m_playersList.keys());
    loadPlayer(newPlayer);

    emit hasPlayersChanged();
}


void ProfileManager::deletePlayer(QString delPlayer)
{
    if (m_playersList.find(delPlayer) != m_playersList.end()) {
        m_playersList.remove(delPlayer);
        setPlayersListModel(QStringList(m_playersList.keys()));

        QFile(pathToProfile(delPlayer)).remove();

        if (m_currentPlayer == delPlayer) {
            if (m_playersList.empty()) {
                m_currentPlayer = "";
                JsonParser confParser("../data/config/config.json");
                QJsonObject jsonConfig = confParser.load();
                jsonConfig["currentPlayer"] = "";
                confParser.save(jsonConfig);
            }
            else {
                loadPlayer(m_playersList.begin().key());
            }
        }
    }

    emit hasPlayersChanged();
    emit currentPlayerDataChanged();
}

void ProfileManager::loadPlayer(QString playerName)
{
    if (m_playersList.empty())
        return;

    setCurrentPlayer(playerName);

    JsonParser confParser("../data/config/config.json");
    QJsonObject jsonConfig = confParser.load();
    jsonConfig["currentPlayer"] = playerName;
    confParser.save(jsonConfig);

    m_playersList[playerName] = loadPlayerData(playerName);

    m_currentPlayerIndex = m_playersListModel->stringList().indexOf(m_currentPlayer);

    emit currentPlayerDataChanged();
    emit currentPlayerIndexChanged(currentPlayerIndex());
}

void ProfileManager::saveCurrentPlayer()
{
    if (m_playersList.find(m_currentPlayer) == m_playersList.end())
        return;

    JsonParser profParser(pathToProfile(m_currentPlayer));
    QJsonObject jsonObject = m_playersList[m_currentPlayer]->getJsonObject();

    profParser.save(jsonObject);

    emit currentPlayerDataChanged();
}

QSharedPointer<PlayerData> ProfileManager::loadPlayerData(const QString &playerName)
{
    JsonParser profParser(pathToProfile(playerName));
    QJsonObject jsonObject = profParser.load();
    return QSharedPointer<PlayerData>(new PlayerData(jsonObject));
}

bool ProfileManager::validName(QString playerName)
{
    size_t name_size = playerName.size();
    if (!name_size || name_size > 12)
        return false;

    if (!playerName[0].isLetter())
        return false;

    return true;
}

QString ProfileManager::pathToProfile(QString playerName)
{
    return m_pathToProfiles + "/" + playerName + ".json";
}

PasswordController *ProfileManager::passwordController() const
{
    return m_passwordController.data();
}

int ProfileManager::currentPlayerIndex() const
{
    return m_currentPlayerIndex;
}

PlayerData* ProfileManager::currentPlayerData() const
{
    return m_playersList[m_currentPlayer].data();
}

QSharedPointer<PlayerData> ProfileManager::getPlayerData(const QString &playerName) const
{
    return m_playersList[playerName];
}

bool ProfileManager::hasPlayers()
{
    return !m_playersList.empty();
}

void ProfileManager::setPlayersListModel(const QStringList &playersListModel)
{
    m_playersListModel->setStringList(playersListModel);
    emit playersListModelChanged();
}

QStringListModel *ProfileManager::playersListModel()
{
    return m_playersListModel.data();
}


QString ProfileManager::currentPlayer() const
{
    return m_currentPlayer;
}

void ProfileManager::setCurrentPlayer(const QString &playerName)
{
    m_currentPlayer = playerName;
}


