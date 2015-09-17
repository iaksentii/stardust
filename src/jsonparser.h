#ifndef JSONPARSER_H
#define JSONPARSER_H

#include <QJsonObject>
#include <QString>

class JsonParser
{
public:
    JsonParser(const QString &fileName);

    QJsonObject load();
    void save(QJsonObject &jsonObject);

private:
    QString m_fileName;

};

#endif // JSONPARSER_H
