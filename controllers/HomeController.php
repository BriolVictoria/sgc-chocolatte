<?php
/*
class HomeController extends BaseController // extends => on va aller chercher toute une serie de propriété et de méthodes et home controlller va ajouter des chose par dessus, on definir ce qui change
{
    public function show() // afficher la page home, la fonction qui va être appeler automatiquement.
    { //toute notre logique va être écrite la
        echo "Ca marche !"; die();
    }
} // tous ce qui se trouve entre les {} pour créer un objet, comme une recette, on décris l'objet*/



class HomeController extends BaseController // extends => on va aller chercher toute une serie de propriété et de méthodes et home controlller va ajouter des chose par dessus, on definir ce qui change
{
    public function show() // afficher la page home, la fonction qui va être appeler automatiquement.
    { //toute notre logique va être écrite la


        return $this->view('home', [
            'pre' => 'Bienvenue chez',
            'title' => 'Chocolatte', // -> accesseur, => asignation de tableaux
            'employees' => Employee::getHomepageEmployees(),
        ]);
    }


} // tous ce qui se trouve entre les {} pour créer un objet, comme une recette, on décris l'objet