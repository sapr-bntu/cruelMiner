#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QtDeclarative/QDeclarativeContext>
#include <QDir>
#include <QDirModel>
//#include <QSqlDatabase>
//#include <QSqlTableModel>
//#include <QSqlRecord>
//#include <QDebug>
//#include "msqltablemodel.h"


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

//    QSqlDatabase db;
//    db = QSqlDatabase::addDatabase("QSQLITE");
//    db.setDatabaseName("save.s3db");
//    db.open();
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/untitled/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
