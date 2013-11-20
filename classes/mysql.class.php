<?php
 
class Mysql {
    // Let's setup some variabels for the sql class
    private $db_connection;
    private $db_connections = 0;
    private $query_result;
    private $row = array();

    private $user;
    private $pass;
    private $server;
    private $database;

    public $errors;

    // Open a MySQL connection and selects a database with $db
    function __construct($user,$pass,$server,$database) {
        $this->server = $server;
        $this->user = $user;
        $this->pass = $pass;
        $this->database = $database;
        if ($this->open()) {
            return true;
        } else {
            return false;
        }
    }
    private function open() {
        if (!$this->db_connection) { 
	    $this->db_connection = mysql_connect($this->server,$this->user,$this->pass);
	}
	$result = mysql_select_db ($this->database);
	$this->db_connections++;
	return $result;
    }
    
    // Close a MySQL connection
    public function close() {
	if ($this->db_connections == 0) {
	    if ($this->db_connection) {
		if ($this->query_result) {
		    mysql_free_result($this->query_result);
		}
		mysql_close($this->db_connection);
		$this->db_connections--;
		unset($this->db_connection);
	    } else {
	    }
	} else {
    	}
    }
    
    // Makes a query to MySQL using $qstring and returns it    
    public function query($query) {
	if ($query) {
	    unset($this->query_result);
	    $this->query_result = mysql_query($query);
            if (!$this->query_result) {
                 $this->errors = mysql_error();
            }
            return $this->query_result;
    	} else {
	    return false;
	}
    }

    // Get the information from MySQL (using mysql_fethch_assoc() )
    public function num_rows($query = false) {
        if ($query) {
            if (!$this->query($query)) {
                return false;
            }
        }
	if ($this->query_result) {
	    $this->row[$this->query_result] = mysql_num_rows($this->query_result);
	    return $this->row[$this->query_result];
	} else {
	    return false;
	}
    }
    
    // Get the information from MySQL (using mysql_fethch_assoc() )
    public function fetch($query = false) {
        if ($query) {
            if (!$this->query($query)) {
                return false;
            }
        }
	if ($this->query_result) {
	    $this->row[$this->query_result] = mysql_fetch_assoc($this->query_result);
	    return $this->row[$this->query_result];
	} else {
	    return false;
	}
    }

    // Get the information from MySQL (using mysql_fethch_array() )
    public function fetch_array($query = false) {
        if ($query) {
            if (!$this->query($query)) {
                return false;
            }
        }
	if ($this->query_result) {
	    while($row = mysql_fetch_assoc($this->query_result)) {
                $this->row[$this->query_result][] = $row;
            }
	    return $this->row[$this->query_result];
	} else {
	    return false;
	}
    }

    public function insert_id($query = false) {
        if ($query) {
            if (!$this->query($query)) {
                return false;
            }
        }
        if ($this->query_result) {
            return mysql_insert_id();
        } else {
            return false;
        }
    }

    public function escape($string) {
        return mysql_real_escape_string($string);
    }
}    

/*******
 * EOF *
 *******/
?>