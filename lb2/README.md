# M300-Services
Dokumentation für das Modul 300

## Inhaltsvverzeichnis
* Einleitung - [Einleitung](#einleitung)
* 01 - [K1](#k1)
* 02 - [K2](#k2)
* 03 - [K3](#k3)
* 04 - [K4](#k4)
* 05 - [K5](#k5)

## Einleitung
In diesem Projekt werde ich mittes Vagrant drei virtuelle Maschinen automatisiert erstellen. Dabei werde ich einen Server und zwei Clients installieren. Der Server ist ein Webserver, der mit Apache2 betrieben wird. Für die zwei Clients habe ich einen Client im selben Netz wie der Server hinzugefügt und der zweite Client ist in einem externen Netz. Die beiden Clients haben die neusten Updates installiert. Die Website kann von meinem Host aus betrachtet. 


## K1
### Virtualbox
Virtualbox ist eine Virtualisierungssoftware welches von Orace nun entwickelt wird. Die in den nächsten Schritten erstellten virtuellen Maschinen werden auf Virtualbox laufen und geöffnet.

Virtual box kann in der aktuellsten Version unter folgendem Link heruntergeladen werden. 
https://www.virtualbox.org/

### Vagrant
Mit Vagrant können schnell, einfach und unkompliziert virtuelle Maschine erstellt werden. 
Vagrant kann für unterschiedliche Betriebssysteme, unter folgendem Link heruntergeladen werden.
https://www.vagrantup.com/downloads.html

### Visualstudio-Code
Visualstudio-Code ist ein Text-Editor, welcher von Microsoft entwickelt wurde.
In diesem Modul wird die Dokumentation mit Hilfe von Visualstudio-Code dokumentiert. 

### SSH-Key für Client erstellen
Der SSH-Key wird auf dem Windows-Clinet in der Bash installiert. Die Software kann unter diesem Link installiert werden. https://git-scm.com/downloads

1. In der Bash den folgenden Befehl mit der Git-Hub E-Mailadresse ausführen.
```
    $  ssh-keygen -t rsa -b 4096 -C "beispiel@beispiel.com
```
2. Neue Keys erstellen
```
    Generating public/private rsa key pair
```
3. Bei der Frage wo und unter welchem Namen der Key gespeichert werden solll klickt man auf enter.

```
    Enter a file in which to save the key (~/.ssh/id_rsa): [Press enter]
```
4. Nun muss noch ein Passwort definiert werden. 
```
    Enter passphrase (empty for no passphrase): [Passwort]
   Enter same passphrase again: [Passwort wiederholen]
```


## K2
### GitHub oder Gitlab-Account ist erstellt
Einen Account für GitHub kann unter https://github.com/ erstellt werden.
Dort muss man die üblichen Informationen wie z.B die E-Mailadresse, der Benutzername, das Passwort angeben. Am Schluss erhaltet man noch eine E-Mail um den Account zu bestätigen.
### Git-Client wurde verwendet
Der Git-Client installer kann unter https://git-scm.com/downloads heruntergeladen und standardmässig installiert werden.
Nachfogend werden ein paar Befehle aufgelistet.

| Commands     | Beschreibung                                                                                                                                                                                |
| ------------ | -------------- |
| git branch   | Mit diesem Befehl können neue Branches erstellt werden (z.B. git branch Test123) oder alle Branches aufgelistet werden                                                                      |
| git commit   | Wird das Gespeicherte bestätigt                                                                                                                                                             |
| git checkout | Mit diesem Befehl wechselt man unter den verschiedenen Branches (z.B git checkout Test123). Auch können mittels Paramater z.B. -b einen neuen Branch erstellt und gleich gewechselt werden. |
| git clone    | Mit diese Befehl klont man ein Repository aus einem Git. |
| git push | Mit diesem Befehl wird ein Upload bzw. ein push durchgeführt|     

### Dokumentation ist als Mark Down vorhanden
Die Dokumentation ist in Visual Studio Dokumentiert. 

![Makrdown Editor](../images/markdown_documentation.png)

### Mark Down-Editor ausgewählt und eingerichtet
Als Mark Down-Editor verwende ich den Editor von Yu Zhang. Dieser Editor ist vom Design angenehm und bietet auch Shortcuts an. Ein Beispiel für so ein Shortcut wäre Ctrl+B. Hier werden gleich die ** erstellt, welche man braucht um etwas **Fett** zu schreiben. 

![Makrdown Editor](../images/markdown_editor.png)

## K3
### Bestehende vm aus Vagrant-Cloud einrichten
Um eine bestehende VM mit Vagrant einzurichten muss zuerst das Vagrantfile vorhanden sein. Dafür habe ich das Repository "M300" heruntergeladen. DAnach bin ich in das Verzeichnis in der GitBash gewechselt wo das Vagrantfile hinterlegt ist und habe die VM mit folgendem Befehl erstellt.
```
    Vagrant up
```

![bestehende VM](../images/bestehende_vm_vagrant.png)

### andere, vorgefertigte vm auf eigenem Notebook aufgesetzt
Eine Vagrant-Box aus der Vagrant-Cloud zu holen und eine VM zu ersellen ist mit zwei Zeilen Befehl möglich. 
```
    vagrant init centos/7
    vagrant up
```

![Cent OS mit Vagrant](../images/vagrant_init_centos.png)

Möchte man alle Boxen auflisten kann man das mit folgendem Befehl machen. 
```
    $ vagrant box list
    Microsoft/EdgeOnWindows10 (virtualbox, 1.0)
    centos/7                  (virtualbox, 1902.01)
    ubuntu/trusty64           (virtualbox, 20190429.0.1)
    ubuntu/xenial64           (virtualbox, 20190511.0.0)
```
### Kennt die Vagrant-Befehle
| Befehl           | Beschreibung                         |
|------------------|--------------------------------------|
| vagrant box add  | Eine Vagrant-Box wird hinzugefügt    |
| vagrant box list | Listet alle Vagrant-Boxen auf        |
| vagrant up       | Erstellt eine VM mit dem Vagrantfile |
| vagrant ssh      | Verbindet sich mit ssh auf die VM    |
| vagrant init     | Erstellt ein Vagrantfile             |

### Netzwerkplan
          +-----------------------------------------------------------------+               
          |Privates Netz - 10.0.0.0/24                                      |               
          |Externes Netz - 80.0.0.0/24                                      |               
          |                                                                 |               
          +-----------------------------------------------------------------+               
          |Web Server           |                    |Client intern         |               
          |Host: webserver      |                    |Host: client-int      |               
          |IP: 10.0.0.10        | <----------------> |IP: 10.0.0.20         |               
          |Port: 80 TCP, 443 TCP|          |         |Port: -               |               
          |NAT: 8080, 4343      |          |         |NAT: -                |               
          +---------------------+----------v---------+----------------------+               
          |Client extern                                                    |               
          |Host: Client-ext                                                 |               
          |IP: 80.0.0.20                                                    |                 
          |Port:                                                            |               
          |NAT: -                                                           |               
          +---------------------+--------------------+----------------------+               

## K4
### FireWall eingerichtet inkl. Rules
Die Firewall wurde mit folgenden Befehlen eingerichtet und konfiguriert. Ich habe mich dafür entschieden, dass Port 80 offen ist, damit man auch auf die Website gelangen kann. Auch habe ich den Port 22 geöffnet, damit mit SSh verbunden werden kann. 
```
        #firewall installieren
        sudo apt-get -y install ufw

        #firewall starten
        sudo ufw enable

        #Port 80 öffnen für alle
        sudo ufw allow 80/tcp
        
        #Port 22 öffnen
        sudo ufw allow 22/tcp
```
Möchte man die aktiven FireWall Rules anschauen, kann man das mit einem Befehl machen. 
```
    ~$ sudo ufw status
    Status: active

    To                         Action      From
    --                         ------      ----
    80/tcp                     ALLOW       Anywhere
    22/tcp                     ALLOW       Anywhere
    80/tcp (v6)                ALLOW       Anywhere (v6)
    22/tcp (v6)                ALLOW       Anywhere (v6)
```
### Reverse-Proxy eingerichtet
Den Reverse Proxy habe ich mit folgdenden Befehlen eingerichtet:  
    
```
    #Proxserver einrichten
    sudo apt-get -y install apache2-bin libxml2-dev
    sudo service apache2 restart
    sudo a2enmod proxy
    sudo service apache2 restart
    sudo a2enmod proxy_html
    sud service apache2 restart
    sudo a2enmod proxy_http

    echo "ServerName localhost" >> /etc/apache2/apache2.conf

    sudo service apache2 restart

    sudo rm /etc/apache2/sites-available/000-default.conf
    sudo touch /etc/apache2/sites-available/000-default.conf
    cat >> /etc/apache2/sites-available/000-default.conf<<EOL
    <VirtualHost *:80>
            ServerAdmin webmaster@localhost
            DocumentRoot /var/www/html

            <Directory /var/www/html/>
                Options Indexes FollowSymLinks
                AllowOverride All
                Require all granted
            </Directory>

            ErrorLog ${APACHE_LOG_DIR}/error.log
            CustomLog ${APACHE_LOG_DIR}/access.log combined

            <IfModule mod_dir.c>
                DirectoryIndex index.php index.pl index.cgi index.html index.xhtml index.htm
            </IfModule>
                        # Allgemeine Proxy Einstellungen
        ProxyRequests Off
        <Proxy *>
            Order deny,allow
            Allow from all
        </Proxy>

        # Weiterleitungen master
        ProxyPass /website http://localhost
        ProxyPassReverse / http://localhost

    </VirtualHost>
    EOL

```
Mit Cat habe ich mehrere Zeilen Inhalt in die Datei 000-default.conf hinzugefügt. 
Nun kann man im Browser die IP-Adresse vom Webserver angeben und */website* und man gelangt zur Website.

![Reverse Proxy](../images/reverse_proxy.png)


### Benutzer- und Rechtevergabe ist eingerichtet
Ich habe einen zweiten "standard" Benutzer eingerichtet, der nicht zu viele Rechte erhalten sollte. Ausserdem habe ich eine neue Gruppe erstellt, wo all die "standard" Benutzer zugewiesen werden. Zum Test habe ich auch ein File erstellt mit bestimmten Berechtigungen. 

```
    #Neuer Benutzer erstellen mit Home-Directory
    sudo useradd -m oscar

    #Neue Gruppe erstellen
    sudo addgroup --gid 2000 standard_group

    #Benutzer Gruppe hinzufügen
    sudo usermod -aG standard_group oscar
```
Parameter kurz erklärt: 
* useradd erstellt Benutzer
* -m erstellt ein Homeverzeichnis
* --gid erstellt Gruppe mit bestimmter ID
* usermod -aG fügt einen Benutzer in weiteren Gruppen hinzu

## K5
### Reflexion
Durch diese Übungen habe ich einiges dazu gelernt. So wusste ich zu beginn nicht, dass man so schnell und einfach eine Vm erstellen kann und nun erstelle ich mit wenigen Zeilen Code einen Webserver und zwei Clients. Ich finde dieses Modul eines der spannendsten Module bisher. Vorallem kann ich nun mein Wissen mit Vagrant auch gut gebrauchen. Schwierigkeiten erbrachte mir ein Wenig das Scripten mit Bash, da ich das nicht sehr oft mache. 