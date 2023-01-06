import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  actualites :any[] = [

    {
      "imageUrl":"../../../assets/images/projets/projet-building.jpeg",
      "titre":"Québec prévoit 2,2 milliards de plus pour le REM.",
      "datePublication":"Publié le 2 avril 2021",
      "contenu":"Le gouvernement du Québec a inscrit dans ses documents budgétaires une somme de 18,7 milliards pour la construction des deux lignes du Réseau express métropolitain."
    },

    {
      "imageUrl":"../../../assets/images/projets/projet-building.jpeg",
      "titre":"Québec prévoit 2,2 milliards de plus pour le REM.",
      "datePublication":"Publié le 2 avril 2021",
      "contenu":"Le gouvernement du Québec a inscrit dans ses documents budgétaires une somme de 18,7 milliards pour la construction des deux lignes du Réseau express métropolitain."
    },

  ] ;

  constructor() { }

  ngOnInit(): void {
  }

}
