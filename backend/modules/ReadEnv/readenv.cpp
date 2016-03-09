#include "readenv.h"
#include <QDebug>
#include <QProcessEnvironment>
#include <QLatin1String>

ReadEnv::ReadEnv(QObject *parent) : QObject(parent)
{
}

QString ReadEnv::getenv(const QString envVarName) const
{
    QByteArray result = qgetenv(envVarName.toStdString().c_str());
    QString output = QString::fromLocal8Bit(result);
    qDebug() << envVarName << " value is: "  << output;
    return output;
}

QString ReadEnv::getenv1(const QString envVarName) const
{
    QProcessEnvironment environment = QProcessEnvironment::systemEnvironment();

    if (environment.contains(envVarName)) {
        return environment.value(envVarName);
    } else {
        return "";
    }
}

