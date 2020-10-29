rem : Batch to reconnect Printers when they loose connection

rundll32 printui.dll PrintUIEntry /dn /n \\SERVER\PRINTER /q
rundll32 printui.dll PrintUIEntry /in /n \\SERVER\PRINTER
