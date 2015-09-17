#include "jsonparser.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QVariantList>
#include <QFile>
#include <QDir>

#include <QDebug>


JsonParser::JsonParser(const QString &fileName) :
    m_fileName(fileName)
{
}


QJsonObject JsonParser::load()
{
    QFile jsonFile(m_fileName);

    if (!jsonFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "can't open file " << m_fileName;
        return QJsonObject();
    }

    QJsonParseError parseError;
    QJsonDocument json_doc = QJsonDocument::fromJson(jsonFile.readAll(), &parseError);

    if (parseError.error != QJsonParseError::NoError) {
        jsonFile.close();
        qDebug() << "problems with parsing file " << m_fileName;
        return QJsonObject();
    }

    if (json_doc.isEmpty()) {
        jsonFile.close();
        qDebug() << "JsonDocument of file " << m_fileName << "  is empty";
        return QJsonObject();
    }

    jsonFile.close();

    return json_doc.object();
}

void JsonParser::save(QJsonObject &jsonObject)
{
    QFile jsonFile(m_fileName);

    // will create if such file don't existing
    if (!jsonFile.open(QFile::WriteOnly | QIODevice::Text))
        qDebug() << "file saving error (#" << jsonFile.error() << ")";


    QJsonDocument jsonDoc;
    jsonDoc.setObject(jsonObject);
    jsonFile.write(jsonDoc.toJson());

    jsonFile.close();
}

