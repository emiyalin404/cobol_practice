#include <mysql.h>
#include <stdio.h>
#include <stdlib.h>

void connect_to_database() {
    MYSQL *conn;
    MYSQL_RES *res;
    MYSQL_ROW row;

    const char *server = "localhost";
    const char *user = "root";
    const char *password = "hin@893229"; 
    const char *database = "world";

    conn = mysql_init(NULL);

    // 连接到数据库
    if (!mysql_real_connect(conn, server, user, password, database, 0, NULL, 0)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        exit(1);
    }

    // 执行 SQL 查询示例
    if (mysql_query(conn, "SHOW TABLES")) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        exit(1);
    }

    res = mysql_use_result(conn);

    // 输出查询的结果
    printf("MySQL Tables in mysql database:\n");
    while ((row = mysql_fetch_row(res)) != NULL)
        printf("%s \n", row[0]);

    //  清理
    mysql_free_result(res);
    mysql_close(conn);
}

int main() {
    connect_to_database();
    return 0;
}