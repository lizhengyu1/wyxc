<?php
/**
 * Created by PhpStorm.
 * User: lizhengyu
 * Date: 16/4/26
 * Time: 下午10:59
 */

//不会重复包含
require_once '../../Database/functions.php';
require_once '../variableCofig.php';

//$test = 'nihao';
//$arr = array('code'=>1, "message"=>$test);
//echo json_encode($arr);

/**
 * name
 *
 */

if(isset($_POST['loginId'])) {
//
    $conn = connectDb('WYXC');
    $name = $_POST['name'];
    $loginId = $_POST['loginId'];
    $password = $_POST['password'];

    if(isset($_POST['sex'])) {

        $sex = $_POST['sex'];
    }
    $userType = $_POST['userType'];

    if($conn) {

        //就是用户名和手机号码都对的上的时候
        $result = mysqli_query($conn, "SELECT * FROM userInfo WHERE loginId=$loginId");


        if(!$result) {

            mysqli_query($conn,
                "INSERT INTO `userInfo`
                        (`id`, `loginId`, `name`, `nickname`, `sex`, `avatar`, `token`, `password`, `userType`)
                        VALUES (NULL, '$loginId', '$name', '', '$sex', '', '', '$password', '$userType')");

            //判断是否真的插入成功
            if(mysqli_query($conn, "SELECT * FROM userInfo WHERE loginId=$loginId")) {
                //必须要声明为数组,否则失败
                $returnDictionary = array('code'=>1);
                $returnDictionary['message'] = '注册成功';

                echo json_encode($returnDictionary);
            }
            else {

                $returnDictionary = array('code'=>0);
                $returnDictionary['message'] = '注册失败';

                echo json_encode($returnDictionary);
            }

        }
        else {

            $returnDictionary = array('code'=>0);
            $returnDictionary['message'] = '手机号已注册';

            echo json_encode($returnDictionary);

        }
    }
    else {
        $returnDictionary = array('code'=>0);
        $returnDictionary['message'] = '注册失败';

        echo json_encode($returnDictionary);
    }
}
else {
    $returnDictionary = array('code'=>0);
    $returnDictionary['message'] = '注册失败';

    echo json_encode($returnDictionary);
}