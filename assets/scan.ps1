1..254 | ForEach-Object {
    $ip = "10.10.10.$_"
    if (Test-Connection -ComputerName $ip -Count 1 -Quiet) {
        $hostname = try { [System.Net.Dns]::GetHostEntry($ip).HostName } catch { "Unknown" }
        "$ip - $hostname" | Out-File -Append -FilePath lan_hosts.txt
    }
}

