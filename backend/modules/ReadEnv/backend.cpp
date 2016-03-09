#include <QtQml>
#include <QtQml/QQmlContext>
#include "backend.h"
#include "mytype.h"
#include "readenv.h"


void BackendPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(uri == QLatin1String("ReadEnv"));

    qmlRegisterType<MyType>(uri, 1, 0, "MyType");
    qmlRegisterType<ReadEnv>(uri, 1, 0, "ReadEnv");
}

void BackendPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    QQmlExtensionPlugin::initializeEngine(engine, uri);
}

