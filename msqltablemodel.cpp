#include "msqltablemodel.h"
#include <QSqlTableModel>

MSqlTableModel::MSqlTableModel(QObject *parent) :
    QSqlTableModel(parent)
{
    int idx = 0;
    int max = 100;
    QHash<int, QByteArray> roleNames;
    while( idx<max) {
        roleNames[Qt::UserRole + idx + 1] = QString("column%1").arg(idx).toLocal8Bit();
            idx++;
    }
    setRoleNames(roleNames);
//    refresh();
}
QVariant MSqlTableModel::data(const QModelIndex &index, int role) const
{
    QVariant value = QSqlQueryModel::data(index, role);
    if(role < Qt::UserRole)
    {
        value = QSqlQueryModel::data(index, role);
    }
    else
    {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
    return value;
}

