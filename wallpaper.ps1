# URL de l’image
$url = "https://i.pinimg.com/736x/7e/88/e2/7e88e27cfca500ef5d60fc03ddab8d04.jpg"

# Chemin local pour sauvegarder l’image
$imagePath = "$env:TEMP\wallpaper.jpg"

# Télécharger l’image
Invoke-WebRequest -Uri $url -OutFile $imagePath

# Ajouter un petit type C# pour changer le fond d’écran
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Définir l’image comme fond d’écran
[Wallpaper]::SystemParametersInfo(20, 0, $imagePath, 0x01 -bor 0x02)
