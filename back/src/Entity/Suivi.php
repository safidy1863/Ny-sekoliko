<?php

namespace App\Entity;

use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\Post;
use ApiPlatform\Metadata\Delete;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\SuiviRepository;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use ApiPlatform\Metadata\Patch;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: SuiviRepository::class)]
#[ApiResource(
    operations: [
        new Get(
            security: "is_granted('ROLE_DELEGUE')",
            securityMessage: "Seul le délégué peut avoir accès à ces informations."
        ),
        new GetCollection(
            security: "is_granted('ROLE_DELEGUE')",
            securityMessage: "Seul le délégué peut avoir accès à ces informations."
        ),
        new Post(
            security: "is_granted('ROLE_DELEGUE')",
            securityMessage: "Seul le délégué peut faire la présence.",
            validationContext: ['groups' => 'post_validation']
        ),
        new Delete(
            security: "is_granted('ROLE_DELEGUE')",
            securityMessage: "Seul le délégué peut supprimer la présence."
        ),
        new Patch(
            security: "is_granted('ROLE_DELEGUE')",
            securityMessage: "Seul le délégué peut modifier la présence."
        )
    ],    
    normalizationContext: [
        'groups' => ['suivi_read']
    ],
    denormalizationContext: [
        'groups' => ['suivi_write']
    ],
    collectDenormalizationErrors: true
)]
class Suivi
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['suivi_read'])]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'suivis')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['suivi_read' , 'suivi_write'])]
    #[Assert\NotBlank(message: "Veuillez renseigner le cours", groups: ['post_validation'])]
    private ?Cours $Cours = null;

    #[ORM\Column]
    #[Groups(['suivi_read' , 'suivi_write'])]
    #[Assert\NotBlank(message: "Veuillez renseigner si l'étuiant est absent", groups: ['post_validation'])]
    private ?bool $Absent = null;

    #[ORM\ManyToOne(inversedBy: 'suivis')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['suivi_read' , 'suivi_write'])]
    #[Assert\NotBlank(message: "Veuillez renseigner l'étudiant", groups: ['post_validation'])]
    private ?Etudiant $Etudiants = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCours(): ?Cours
    {
        return $this->Cours;
    }

    public function setCours(?Cours $Cours): self
    {
        $this->Cours = $Cours;

        return $this;
    }

    public function isAbsent(): ?bool
    {
        return $this->Absent;
    }

    public function setAbsent(bool $Absent): self
    {
        $this->Absent = $Absent;

        return $this;
    }

    public function getEtudiants(): ?Etudiant
    {
        return $this->Etudiants;
    }

    public function setEtudiants(?Etudiant $Etudiants): self
    {
        $this->Etudiants = $Etudiants;

        return $this;
    }
}
