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
//$arr = array('code'=>1, "message"=>'123');
//echo json_encode($arr);

if(isset($_POST['loginId'])) {

    $conn = connectDb('WYXC');
    $loginId = $_POST['loginId'];
    $password = $_POST['password'];


    if($conn) {
        $result = mysqli_query($conn, "SELECT * FROM userInfo WHERE loginId=$loginId");

        if($result) {

            $result_arr = mysqli_fetch_assoc($result);

            if($result_arr['password']==$password) {

               // $token = rand(1,1000000).'' ;
               // echo $token;
                //获得设备token
                $token = $_POST['deviceToken'];

                //如何没有错误显示这种颜色,有错误,直接就是字符串的颜色
                mysqli_query($conn, "UPDATE userInfo SET token='$token' WHERE loginId=$loginId");
                $returnDictionary = array('code'=>1);
                $returnDictionary['message'] = 'Login success!';



                //返回的item对象
                $returnItem = array();
                $returnItem['accessToken'] = $token;


                //userInfo对象
                $returnUserInfo = array();
                $returnUserInfo['userType'] = $result_arr['userType'];
                $returnUserInfo['loginId'] = $result_arr['loginId'];
                $returnUserInfo['name'] = $result_arr['name'];
                $returnUserInfo['sex'] = $result_arr['sex'];

                $returnItem['userInfo'] = $returnUserInfo;
                $returnDictionary['item'] = $returnItem;

                echo json_encode($returnDictionary);
            }
            else {
                $returnDictionary = array('code'=>0);
                $returnDictionary['message'] = '密码错误!';
                echo json_encode($returnDictionary);
                //          $returnDictionary['accessToken'] = $token;
            }

        }
        else {
            $returnDictionary = array('code'=>0);
            $returnDictionary['message'] = '用户名或密码错误!';
            echo json_encode($returnDictionary);
  //          $returnDictionary['accessToken'] = $token;
        }
    }
    else {
        $returnDictionary = array('code'=>0);
        $returnDictionary['message'] = 'Login fail!';
        echo json_encode($returnDictionary);
    }
}