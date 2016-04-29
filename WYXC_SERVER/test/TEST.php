<?php
/**
 * Created by PhpStorm.
 * User: lizhengyu
 * Date: 16/4/26
 * Time: 下午11:11
 */

echo 'nihao';


require_once '../Database/functions.php';

$conn = connectDb('WYXC');
$loginId = $_POST['loginId'];
$password = $_POST['password'];


if($conn) {
    $result = mysqli_query($conn, "SELECT * FROM userInfo WHERE loginId=13660249975");

    mysqli_query($conn,"INSERT INTO `userInfo`
                        (`id`, `loginId`, `name`, `nickname`, `sex`, `avatar`, `token`, `password`, `userType`)
                        VALUES (NULL, 'q', 'q', '', 'NAN', '', '', 'q', '1')");

    if($result) {

        echo '成功';
    }
    else {
        echo 'fail';
    }
}
