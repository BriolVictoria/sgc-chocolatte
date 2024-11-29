<?php

require_once('config.php'); // vient inclure tout le contenu du fichier qu'on a mis entre (), seul les éléments qu'on charge existe tout le reste n'existe pas
//objet instant presque la même chose

// Charger toutes les dépendances de code

require_once('controllers/BaseController.php'); //d'abbord charger base et puis home car on en parle avant donc on fait dans le bonne ordre
require_once('controllers/HomeController.php');
require_once('models/BaseModel.php');
require_once('models/Employee.php');
require_once('models/Review.php');

$controller = new HomeController(); // on crée un nouvelle objet qui s'appelle homecontroller, dans le sens programmation orienté objet, on veut un controller pour la page home qu'on va appeller homecontrolller et on va mettre une instante

$controller->handle(); // on va lui dire de géré la requêtre en cours, la => c'est l'accesseur d'objet, permet d'accéder a une methode d'objet, on appellle un objet de la methode controller

// dès que un fichier représente un objet on lui donne une majuscule comme ça on le sait de base, et l'objet s'appel de la même maniére.