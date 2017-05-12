<?php
namespace Think;
class Jssdk {
  private $appId;
  private $appSecret;
  const BOYAA_ACCESS="dfqp_boyaa_accesstoken";//博雅棋牌公众号的 access_token key
  const BOYAA_JSAPITIKET="dfqp_boyaa_jsapiticket";//博雅棋牌公众号 jsapi_ticket key

  public function __construct($appId, $appSecret) {
    $this->appId = $appId;
    $this->appSecret = $appSecret;
  }

  public function getSignPackage($url='') {
    $jsapiTicket = $this->getJsApiTicket();

    // 注意 URL 一定要动态获取，不能 hardcode.
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    $url = !empty($url) ? $url : "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

    $timestamp = time();
    $nonceStr = $this->createNonceStr();

    // 这里参数的顺序要按照 key 值 ASCII 码升序排序
    $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";

    $signature = sha1($string);

    $signPackage = array(
      "appId"     => $this->appId,
      "nonceStr"  => $nonceStr,
      "timestamp" => $timestamp,
      "url"       => $url,
      "signature" => $signature,
      "rawString" => $string
    );
    return $signPackage; 
  }

  private function createNonceStr($length = 16) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    $str = "";
    for ($i = 0; $i < $length; $i++) {
      $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
    }
    return $str;
  }

  private function getJsApiTicket() {
//	$redis = REDIS("master");
//	$key=  self::BOYAA_JSAPITIKET;
//	// jsapi_ticket 应该全局存储与更新
//	if($redis->get($key)=="" || !$redis->exists($key)){
		$accessToken = $this->getAccessToken();
		$url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=$accessToken";
		$res = json_decode($this->httpGet($url));
		$ticket = $res->ticket;
//		if ($ticket) {
//			$redis->setex($key, $ticket,7000);
//		}
//	}else{
//		$ticket = $redis->get($key);
//	}
    return $ticket;
  }

  private function getAccessToken() {
//	$redis = REDIS("master");
//	$key=  self::BOYAA_ACCESS;
//	// access_token 应该全局存储与更新，写入redis缓存
//	if($redis->get($key)=="" || !$redis->exists($key)){
		 $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appId&secret=$this->appSecret";
		 $res = json_decode($this->httpGet($url));
		 $access_token = $res->access_token;
//		 if ($access_token) {
//			 $redis->setex($key, $access_token,7000);
//		 }
//	}else{
//	   $access_token=$redis->get($key);
//	}
    return $access_token;
  }
  private function httpGet($url) {
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_TIMEOUT, 500);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($curl, CURLOPT_URL, $url);

    $res = curl_exec($curl);
    curl_close($curl);

    return $res;
  }
}

