<h2>RAINBOW</h2>

  <form action="" method="post">
    Choose Search Type:<br />
    <select name="searchtype">
      <option value="word">cleartext</option>
      <option value="md5hash">md5</option>
      <option value="sha1hash">sha1</option>
      </select>
      <br />
    Enter Search Term:<br />
      <input name="searchterm" type="text" size="40">
      <br />
      <input type="submit" value="Search">
      </form>
      <br />

<?php
    if (!empty($_POST))
        {
            include("rainbow.php");
        }
?>
