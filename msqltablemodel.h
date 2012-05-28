#ifndef MSQLTABLEMODEL_H
#define MSQLTABLEMODEL_H

#include <QtSql/QSqlTableModel>

class MSqlTableModel : public QSqlTableModel
{
    Q_OBJECT
public:
    explicit MSqlTableModel(QObject *parent = 0);
    void refresh();
    QVariant data(const QModelIndex &index, int role) const;
    
signals:
    
public slots:
private:
};

#endif // MSQLTABLEMODEL_H
