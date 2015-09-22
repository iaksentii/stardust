#include "translator.h"

#include <QSettings>
#include <QDebug>

static const char DefaultLanguage[] = "en";

Translator::Translator(QApplication *app, const QString &source, QObject *parent) : QObject(parent), m_app(app), m_source(source)
{
}

void Translator::addTranslation(const QString &name, const QString &file)
{
    if (!m_Translations.contains(name))
        m_Translations.insert(name, file);
}
QString Translator::tr() const
{
    return "";
}
QString Translator::language() const
{
    return m_language;
}
void Translator::setSource(const QString &source)
{
    m_source = source;
}
void Translator::translate(const QString &language)
{
    qDebug() << Q_FUNC_INFO << language;

    if (m_Translations.contains(language) && m_QtTranslator.load(m_Translations.value(language).toString(), m_source)) {
        qDebug() << Q_FUNC_INFO << "Translated to: " << language;
        QSettings settings;
        settings.setValue("language", language);
        m_app->installTranslator(&m_QtTranslator);
        m_language = language;
        emit languageChanged();
    }
}

void Translator::removeTranslation()
{
    QSettings settings;
    settings.setValue("language", "DEFAULT");
    m_app->removeTranslator(&m_QtTranslator);
    m_language = DefaultLanguage;
    emit languageChanged();
}
