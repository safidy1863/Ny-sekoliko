<?php

namespace App\Entity;

use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\Post;
use ApiPlatform\Metadata\Patch;
use ApiPlatform\Metadata\Delete;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Metadata\ApiFilter;
use App\Repository\ClasseRepository;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use Doctrine\Common\Collections\Collection;
use phpDocumentor\Reflection\Types\Nullable;
use Doctrine\Common\Collections\ArrayCollection;
use ApiPlatform\Doctrine\Orm\Filter\SearchFilter;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: ClasseRepository::class)]
#[ApiResource(
    operations: [
        new Get(
            security: "is_granted('ROLE_DELEGUE')",
            securityMessage: "Seul l'administrateur et les délégués peuvent avoir accès à ces informations."
        ),
        new GetCollection(
            security: "is_granted('ROLE_DELEGUE')",
            securityMessage: "Seul l'administrateur et les délégués peuvent avoir accès à ces informations."
        ),
        new Post(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut ajouter des classes.",
            validationContext: ['groups' => 'post_validation']
        ),
        new Delete(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut supprimer des classes."
        ),
        new Patch(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut modifier des classes."
        )
    ],    
    normalizationContext: [
        'groups' => ['classe_read']
    ],
    denormalizationContext: [
        'groups' => ['classe_write']
    ],
    collectDenormalizationErrors: true
)]
#[ApiFilter(SearchFilter::class, properties: ['Niveau' => 'exact', 'Parcours' => 'exact', 'Groupe' => 'exact'])]
class Classe
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['classe_read' , 'etudiant_read' , 'delegue_read' , 'cours_read'])]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Groups(['classe_read' , 'classe_write' , 'etudiant_read' , 'delegue_read' , 'cours_read'])]
    #[Assert\NotBlank(message: 'Veuillez renseigner le parcours', groups: ['post_validation'])]
    private ?string $Parcours = null;

    #[ORM\Column(length: 255)]
    #[Groups(['classe_read' , 'classe_write' , 'etudiant_read' , 'delegue_read' , 'cours_read'])]
    #[Assert\NotBlank(message: 'Veuillez renseigner le niveau', groups: ['post_validation'])]
    private ?string $Niveau = null;

    #[ORM\Column(length: 255, nullable: true)]
    #[Groups(['classe_read' , 'classe_write' , 'etudiant_read' , 'delegue_read' , 'cours_read'])]
    private ?string $Groupe = null;

    #[ORM\OneToMany(mappedBy: 'Classe', targetEntity: Cours::class, orphanRemoval: true)]    
    #[Groups(['classe_read'])]
    private Collection $cours;

    #[ORM\OneToMany(mappedBy: 'Classe', targetEntity: Etudiant::class, orphanRemoval: true)]
    #[Groups(['classe_read'])]
    private Collection $Etudiants;

    public function __construct()
    {
        $this->cours = new ArrayCollection();
        $this->Etudiants = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getParcours(): ?string
    {
        return $this->Parcours;
    }

    public function setParcours(string $Parcours): self
    {
        $this->Parcours = $Parcours;

        return $this;
    }

    public function getNiveau(): ?string
    {
        return $this->Niveau;
    }

    public function setNiveau(string $Niveau): self
    {
        $this->Niveau = $Niveau;

        return $this;
    }

    public function getGroupe(): ?string
    {
        return $this->Groupe;
    }

    public function setGroupe(string $Groupe): self
    {
        $this->Groupe = $Groupe;

        return $this;
    }

    /**
     * @return Collection<int, Cours>
     */
    public function getCours(): Collection
    {
        return $this->cours;
    }

    public function addCours(Cours $cours): self
    {
        if (!$this->cours->contains($cours)) {
            $this->cours->add($cours);
            $cours->setClasse($this);
        }

        return $this;
    }

    public function removeCours(Cours $cours): self
    {
        if ($this->cours->removeElement($cours)) {
            // set the owning side to null (unless already changed)
            if ($cours->getClasse() === $this) {
                $cours->setClasse(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Etudiant>
     */
    public function getEtudiants(): Collection
    {
        return $this->Etudiants;
    }

    public function addEtudiant(Etudiant $etudiant): self
    {
        if (!$this->Etudiants->contains($etudiant)) {
            $this->Etudiants->add($etudiant);
            $etudiant->setClasse($this);
        }

        return $this;
    }

    public function removeEtudiant(Etudiant $etudiant): self
    {
        if ($this->Etudiants->removeElement($etudiant)) {
            // set the owning side to null (unless already changed)
            if ($etudiant->getClasse() === $this) {
                $etudiant->setClasse(null);
            }
        }

        return $this;
    }
}
