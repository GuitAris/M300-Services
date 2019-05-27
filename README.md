# M300-Services
Dokumentation für das Modul 300

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
2 Neue Keys erstellen
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


##K2
###GitHub oder Gitlab-Account ist erstellt
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
###Dokumentation ist als Mark Down vorhanden
Die Dokumentation ist in Visual Studio Dokumentiert. 
![Makrdown Editor](./images/markdown_documentation.png)
###Mark Down-Editor ausgewählt und eingerichtet
Als Mark Down-Editor verwende ich den Editor von Yu Zhang. Dieser Editor ist vom Design angenehm und bietet auch Shortcuts an. Ein Beispiel für so ein Shortcut wäre Ctrl+B. Hier werden gleich die ** erstellt, welche man braucht um etwas **Fett** zu schreiben. 
![Makrdown Editor](./images/markdown_editor.png)
##K3
###Bestehende vm aus Vagrant-Cloud einrichten
Um eine bestehende VM mit Vagrant einzurichten muss zuerst das Vagrantfile vorhanden sein. Dafür habe ich das Repository "M300" heruntergeladen. DAnach bin ich in das Verzeichnis in der GitBash gewechselt wo das Vagrantfile hinterlegt ist und habe VM mit folgendem Befehl erstellt.
```
    Vagrant up
```
![bestehende VM](./images/bestehende_vm_vagrant.png)
###andere, vorgefertigte vm auf eigenem Notebook aufgesetzt
Eine Vagrant-Box aus der Vagrant-Cloud zu holen und eine VM zu ersellen ist mit zwei Zeilen Befehl möglich. 
```
    vagrant init centos/7
    vagrant up
```
![Cent OS mit Vagrant](./images/vagrant_init_centos.png)
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

### Netzwerkplan (noch nicht fertig https://textik.com/#d06fea5bb443e168)
| Befehl           | Beschreibung                         |
|------------------|--------------------------------------|
| vagrant box add  | Eine Vagrant-Box wird hinzugefügt    |
| vagrant box list | Listet alle Vagrant-Boxen auf        |
| vagrant up       | Erstellt eine VM mit dem Vagrantfile |
| vagrant ssh      | Verbindet sich mit ssh auf die VM    |
| vagrant init     | Erstellt ein Vagrantfile             |



![godzilla.jpg](./images/godzilla.jpg)