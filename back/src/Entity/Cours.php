<?php

namespace App\Entity;

use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\Post;
use Doctrine\DBAL\Types\Types;
use ApiPlatform\Metadata\Patch;
use ApiPlatform\Metadata\Delete;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\CoursRepository;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use Doctrine\Common\Collections\Collection;
use App\Serializer\PatchedDateTimeNormalizer;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Serializer\Annotation\Context;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: CoursRepository::class)]
#[ApiResource(
    operations: [
        new Get(
            security: "is_granted('ROLE_ETUDIANT')",
            securityMessage: "Il faut se connecter pour avoir accès à ces informations"
        ),
        new GetCollection(
            security: "is_granted('ROLE_ETUDIANT')",
            securityMessage: "Il faut se connecter pour avoir accès à ces informations"
        ),
        new Post(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut ajouter des cours.",
            validationContext: ['groups' => 'post_validation']
        ),
        new Delete(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut supprimer des cours."
        ),
        new Patch(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut modifier des cours."
        )
    ],
    normalizationContext: [
        'groups' => ['cours_read']
    ],
    denormalizationContext: [
        'groups' => ['cours_write']
    ],
    collectDenormalizationErrors: true
)]
class Cours
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['cours_read' , 'suivi_read'])]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'cours')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['cours_read' , 'cours_write'])]
    #[Assert\NotBlank(message: 'Veuillez renseigner la classe', groups: ['post_validation'])]
    private ?Classe $Classe = null;

    #[ORM\ManyToOne(inversedBy: 'cours')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['cours_read' , 'cours_write' , 'suivi_read' , 'classe_read'])]
    #[Assert\NotBlank(message: 'Veuillez renseigner la matière', groups: ['post_validation'])]
    private ?Matiere $Matiere = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    #[Groups(['cours_read' , 'cours_write' , 'suivi_read' , 'classe_read'])]
    #[Context([PatchedDateTimeNormalizer::FORMAT_KEY => 'd-m-Y'])]
    #[Assert\NotBlank(message: 'Veuillez renseigner la date', groups: ['post_validation'])]
    private ?\DateTimeInterface $Date = null;

    #[ORM\Column(type: Types::TIME_MUTABLE)]
    #[Groups(['cours_read' , 'cours_write' , 'suivi_read' , 'classe_read'])]
    #[Context([PatchedDateTimeNormalizer::FORMAT_KEY => 'H:i'])]
    #[Assert\NotBlank(message: "Veuillez renseigner l'heure de debut", groups: ['post_validation'])]
    private ?\DateTimeInterface $HeureDebut = null;

    #[ORM\Column(type: Types::TIME_MUTABLE)]
    #[Groups(['cours_read' , 'cours_write' , 'suivi_read' , 'classe_read'])]
    #[Context([PatchedDateTimeNormalizer::FORMAT_KEY => 'H:i'])]
    #[Assert\NotBlank(message: "Veuillez renseigner l'heure de fin", groups: ['post_validation'])]
    private ?\DateTimeInterface $HeureFin = null;

    #[ORM\OneToMany(mappedBy: 'Cours', targetEntity: Suivi::class, orphanRemoval: true)]
    private Collection $suivis;

    public function __construct()
    {
        $this->suivis = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getClasse(): ?Classe
    {
        return $this->Classe;
    }

    public function setClasse(?Classe $Classe): self
    {
        $this->Classe = $Classe;

        return $this;
    }

    public function getMatiere(): ?Matiere
    {
        return $this->Matiere;
    }

    public function setMatiere(?Matiere $Matiere): self
    {
        $this->Matiere = $Matiere;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->Date;
    }

    public function setDate(\DateTimeInterface $Date): self
    {
        $this->Date = $Date;

        return $this;
    }

    public function getHeureDebut(): ?\DateTimeInterface
    {
        return $this->HeureDebut;
    }

    public function setHeureDebut(\DateTimeInterface $HeureDebut): self
    {
        $this->HeureDebut = $HeureDebut;

        return $this;
    }

    public function getHeureFin(): ?\DateTimeInterface
    {
        return $this->HeureFin;
    }

    public function setHeureFin(\DateTimeInterface $HeureFin): self
    {
        $this->HeureFin = $HeureFin;

        return $this;
    }

    /**
     * @return Collection<int, Suivi>
     */
    public function getSuivis(): Collection
    {
        return $this->suivis;
    }

    public function addSuivi(Suivi $suivi): self
    {
        if (!$this->suivis->contains($suivi)) {
            $this->suivis->add($suivi);
            $suivi->setCours($this);
        }

        return $this;
    }

    public function removeSuivi(Suivi $suivi): self
    {
        if ($this->suivis->removeElement($suivi)) {
            // set the owning side to null (unless already changed)
            if ($suivi->getCours() === $this) {
                $suivi->setCours(null);
            }
        }

        return $this;
    }
}
