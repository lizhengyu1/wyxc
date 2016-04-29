<?php
/**
 * Created by PhpStorm.
 * User: lizhengyu
 * Date: 16/4/26
 * Time: 下午10:59
 *  验证手机号码是否注册
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

    $conn = connectDb('WYXC');
    $loginId = $_POST['loginId'];

    if($conn) {

        //就是用户名和手机号码都对的上的时候
        $result = mysqli_query($conn, "SELECT * FROM userInfo WHERE loginId=$loginId");
//        $result1 = mysqli_query($conn, "SELECT * FROM userInfo WHERE loginId=$name");
        //只需要人的名字不同就可以了,因为有可能同名
        if($result) {

            $returnDictionary = array('code'=>0);
            $returnDictionary['message'] = '手机号已注册';

            echo json_encode($returnDictionary);

        }
        else {
            $returnDictionary = array('code'=>1);
            $returnDictionary['message'] = '此手机号可以使用';

            echo json_encode($returnDictionary);
        }
    }
}