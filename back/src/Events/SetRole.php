<?php

namespace App\Events;

use Symfony\Component\HttpKernel\KernelEvents;
use ApiPlatform\Symfony\EventListener\EventPriorities;
use App\Entity\Admin;
use App\Entity\Delegue;
use App\Entity\Etudiant;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\ViewEvent;

final class SetRole implements EventSubscriberInterface{

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => ['hashpassword', EventPriorities::PRE_WRITE],
        ];
    }

    public function hashpassword(ViewEvent $event){
        $Person = $event->getControllerResult();
        $Method = $event->getRequest()->getMethod(); //GET , POST , DELETE , ...

        if(($Person instanceof Admin && $Method === "POST")){
            $Person->setRoles(['ROLE_ADMIN']);
        }
    }
}