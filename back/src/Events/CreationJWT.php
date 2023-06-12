<?php

namespace App\Events;

use App\Entity\Etudiant;
use Lexik\Bundle\JWTAuthenticationBundle\Event\JWTCreatedEvent;

class CreationJWT{
    public function onJWTCreated(JWTCreatedEvent $event){
        $user = $event->getUser();

        if($user instanceof Etudiant){
            $data = $event->getData();
            $data['Matricule'] = $user->getMatricule();
            $data['Nom Complet'] = $user->getNomComplet();
            $data['Niveau'] = $user->getClasse()->getNiveau();
            $data['Parcours'] = $user->getClasse()->getParcours();
            $data['Groupe'] = $user->getClasse()->getGroupe();

            $event->setData($data);
        }
    }
}