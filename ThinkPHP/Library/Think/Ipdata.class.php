<?php
/**
* @desc IP归属
* @author JasonChen
* @date 2017-4-28
*/

namespace Think;

class Ipdata{
	private $_ip     = NULL;
	private $_fp     = NULL;
	private $_offset = NULL;
	private $_index  = NULL;
	
	private $_cached = array();
	
	public function __construct($ipDataDir){
		$this->_fp = fopen($ipDataDir, 'rb');
		if ($this->_fp === FALSE){
			throw new Exception("Invalid $ipDataDir file!");
		}
		$this->_offset = unpack('Nlen', fread($this->_fp, 4));
		if ($this->_offset['len'] < 4){
			throw new Exception("Invalid $ipDataDir file!");
		}
		$this->_index = fread($this->_fp, $this->_offset['len'] - 4);
	}
	/**
	 * 查找IP
	 * @param string $ip
	 * @return string|false:
	 */
	public function find($nip){
		$ret = array(
				'country'=>'',
				'province'=>'',
				'city'=>'',
				'operator'=>'',
				);
		if (empty($nip) === TRUE){
            return $ret;
        }
        $ipdot = explode('.', $nip);
        if ($ipdot[0] < 0 || $ipdot[0] > 255 || count($ipdot) !== 4){
            return $ret;
        }
        if (isset($this->_cached[$nip]) === TRUE){
            return $this->_cached[$nip];
        }
        $nip2 = pack('N', ip2long($nip));
        $tmp_offset = ((int)$ipdot[0] * 256 + (int)$ipdot[1]) * 4;
        $start      = unpack('Vlen', $this->_index[$tmp_offset] . $this->_index[$tmp_offset + 1] . $this->_index[$tmp_offset + 2] . $this->_index[$tmp_offset + 3]);
        $index_offset = $index_length = NULL;
        $max_comp_len = $this->_offset['len'] - 262144 - 4;
        for ($start = $start['len'] * 9 + 262144; $start < $max_comp_len; $start += 9){
            if ($this->_index[$start] . $this->_index[$start + 1] . $this->_index[$start + 2] . $this->_index[$start + 3] >= $nip2){
                $index_offset = unpack('Vlen', $this->_index[$start + 4] . $this->_index[$start + 5] . $this->_index[$start + 6] . "\x0");
                $index_length = unpack('nlen', $this->_index[$start + 7] . $this->_index[$start + 8]);
                break;
            }
        }
        if ($index_offset === NULL){
            return false;
        }
        fseek($this->_fp, $this->_offset['len'] + $index_offset['len'] - 262144);
        $temp = explode("\t", fread($this->_fp, $index_length['len']));
        $ret['country']		= $temp[0];
        $ret['province']	= $temp[1];
        $ret['city']		= $temp[2];
        $ret['operator']	= $temp[4];
        $this->_cached[$nip] = $ret;
        return $ret;
		
	}
	/**
	 * 析构函数-结束时关闭句柄
	 */
	public function __destruct(){
		if( $this->_fp ){
			fclose($this->_fp);
		}
	}
	
}