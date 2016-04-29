<?php
/**
 * Created by PhpStorm.
 * User: lizhengyu
 * Date: 16/4/23
 * Time: 下午9:55
 */

require_once 'config.php';

function connectDb($mysqlDb) {

    $conn = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PW, $mysqlDb);
    if(!$conn) {
        die('Can not connect');
    }
    else {
    //    echo 'connect success!';
        return mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PW, $mysqlDb);
    }

}