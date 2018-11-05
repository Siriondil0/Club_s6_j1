# THP Semaine 6 Jour 1

Exercice provenant de [The Hacking Project](https://www.thehackingproject.org/)
                         
## Club privé : :cool:

### Enoncé

Le site sera un club privé. La page d'accueil affichera un lien vers la page du club, puis on pourra trouver une navbar pour permettre d'afficher soit son profil si l'on est login, soit les liens de login et register si l'on n'est pas login.

### Tests

Tester les views :

* Il faut tester la page d'accueil, et faire en sorte qu'elle affiche les bons liens, en fonction si la personne est connectée ou non :white_check_mark:
* Ensuite tu vas tester la page d'inscription, qui doit évidemment retourner une erreur si la personne n'a pas rentré les bons champs (email en double, paramètre manquant) :white_check_mark:
* Il faut tester la page de login, qui doit login la personne si elle rentre un bon ID, et lui renvoyer un message d'erreur si elle ne renvoie pas un bon paramètre :white_check_mark:
* Il faut tester la navbar, qui doit afficher les bons liens :white_check_mark:
* Il faut tester la page du club, qui ne doit être accessible qu'aux personnes login. La page doit renvoyer la liste des personnes inscrites au site, donc il faut tester cela :white_check_mark:
* Implémentation d'une feature en TDD :white_check_mark:
* Implémentation d'une autre feature :white_check_mark:
    
:exclamation: Nous n'avons pas utilisé MiniTests mais Rspec :exclamation:
Donc pour tester en local:
* Commence par un bundle install
* Fait ensuite un rails db:create puis db:migrate
* Entre alors rspec

## Lien Heroku :
[Lien Club-project sur Heroku](https://fight-club-thp.herokuapp.com/)

## Projet de groupe :tea: :

* :heavy_dollar_sign: Guillaume Pichot   slack/  @Guillaume
* :heavy_dollar_sign: Hai-Dang Ha-Thuc  slack/  @Hai-Dang 


     :end: :end: :end: :end: :end: :end: :end: :end: :end:
