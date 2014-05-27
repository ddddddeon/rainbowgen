<?php

$searchtype=$_POST['searchtype'];
$searchterm=trim($_POST['searchterm']);

if (@!$searchtype || !@$searchterm) {
    echo 'You have not entered search details. Please go back and try again.';
    exit;
}

if (!get_magic_quotes_gpc()) {
    $searchtype = addslashes($searchtype);
    $searchterm = addslashes($searchterm);
}

$db = mysql_connect('localhost', 'username', 'password') or die("could not connect!");
mysql_select_db('rainbow');

$query = "SELECT DISTINCT word, md5hash, sha1hash FROM rainbow.rainbow WHERE " . $searchtype . " LIKE '%" . $searchterm . "%' ORDER BY word";
$result = mysql_query($query, $db);
$num_results = mysql_num_rows($result);

echo "<i>$num_results results</i><br/><br/>";

for ($i=0; $i < $num_results; $i++) {

    if ($i > 0) {
        echo "----------";
        echo "<br />";    }

    $row = @ mysql_fetch_array($result);
    $word = $row['word'];
    $md5hash = $row['md5hash'];
    $sha1hash = $row['sha1hash'];

    echo "<br /><b>" . $word . "<br /></b>";
    echo "<b>md5: </b>" . $md5hash . "<br />";
    echo "<b>sha1: </b>" . $sha1hash . "<br />";
    echo "<br />";

}

mysql_free_result($result);
mysql_close($db);

?>

<br />
