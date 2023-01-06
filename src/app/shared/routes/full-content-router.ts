import { Routes } from '@angular/router';

export const full_content : Routes = [


  { 
    path:'home',
    loadChildren: () =>
      import('../../modules/public/home/home.module').then((m) => m.HomeModule),
  },

  { 
    path:'private-home',
    loadChildren: () =>
      import('../../modules/private/private-home/private-home.module').then((m) => m.PrivateHomeModule),
  },

  {
    path : "connexion" ,
    loadChildren : () => import('src/app/modules/public/connexion/connexion.module').then(m => m.ConnexionModule)
  }
  ,
  {
    path : "contact" ,
    loadChildren : () => import('src/app/modules/public/contact/contact.module').then(m => m.ContactModule)
  }
  ,
  {
    path : "apropos" ,
    loadChildren : () => import('src/app/modules/public/apropos/apropos.module').then(m => m.AproposModule)
  }
  ,
  {
    path : "solutions" ,
    loadChildren : () => import('src/app/modules/public/solutions/solutions.module').then(m => m.SolutionsModule)
  },
  {
    path : "services/publier-un-projet" ,
    loadChildren : () => import('src/app/modules/public/publier-un-projet/publier-un-projet.module').then(m => m.PublierUnProjetModule)
  }
  ,
  {
    path : "services/trouver-un-projet" ,
    loadChildren : () => import('src/app/modules/public/trouver-un-projet/trouver-un-projet.module').then(m => m.TrouverUnProjetModule)
  }
  ,
  {
    path : "services/trouver-une-entreprise" ,
    loadChildren : () => import('src/app/modules/public/trouver-une-entreprise/trouver-une-entreprise.module').then(m => m.TrouverUneEntrepriseModule)
  }
  ,
  {
    path : "services/services-de-nos-partenaires" ,
    loadChildren : () => import('src/app/modules/public/services-de-nos-partenaires/services-de-nos-partenaires.module').then(m => m.ServicesDeNosPartenairesModule)
  }


  ,
  {
    path : "private" ,
    loadChildren : () => import('src/app/modules/private/private.module').then(m => m.PrivateModule)
  },

  {
    path : "private/home" ,
    loadChildren : () => import('src/app/modules/private/private-home/private-home.module').then(m => m.PrivateHomeModule)
  },


  {
    path : "" ,
    loadChildren : () => import('src/app/modules/public/public.module').then(m => m.PublicModule)
  }
  ,

  {
    path : "administration",
    loadChildren : () => import('src/app/modules/private/administration/administration.module').then(m =>m.AdministrationModule)
  },

  {
    path : "administration/inscription",
    loadChildren : () => import('src/app/modules/private/administration/inscription/inscription.module').then(m =>m.InscriptionModule)
  },

  {
    path : "administration/entreprise",
    loadChildren : () => import('src/app/modules/private/administration/entreprise/entreprise.module').then(m =>m.EntrepriseModule)
  },

  {
    path : "administration/utilisateur",
    loadChildren : () => import('src/app/modules/private/administration/utilisateur/utilisateur.module').then(m =>m.UtilisateurModule)
  },

  {
    path : "administration/division",
    loadChildren : () => import('src/app/modules/private/administration/division/division.module').then(m =>m.DivisionModule)
  },
// ------------------------
  {
    path : "administration/parametre",
    loadChildren : () => import('src/app/modules/private/administration/parametre-application/parametre-application.module').then(m =>m.ParametreApplicationModule)
  },

  {
    path : "administration/typeMail",
    loadChildren : () => import('src/app/modules/private/administration/type-mail/type-mail.module').then(m =>m.TypeMailModule)
  },

  {
    path : "administration/region",
    loadChildren : () => import('src/app/modules/private/administration/region/region.module').then(m =>m.RegionModule)
  },

  {
    path : "administration/mail",
    loadChildren : () => import('src/app/modules/private/administration/mail/mail.module').then(m =>m.MailModule)
  },

  // {
  //   path : "administration/regions",
  //   loadChildren : () => import('src/app/modules/private/administration/regions/regions.module').then(m =>m.RegionsModule)
  // },
   {
    path : "administration/regions",
    loadChildren : () => import('src/app/modules/private/administration/regions/regions.module').then(m =>m.RegionsModule)
  },

] ;
