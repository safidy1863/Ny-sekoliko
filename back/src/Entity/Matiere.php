<?php

namespace App\Entity;

use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\Post;
use ApiPlatform\Metadata\Delete;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Metadata\ApiResource;
use App\Repository\MatiereRepository;
use ApiPlatform\Metadata\GetCollection;
use ApiPlatform\Metadata\Patch;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: MatiereRepository::class)]
#[ApiResource(
    operations: [
        new Get(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut avoir accès à ces informations."
        ),
        new GetCollection(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut avoir accès à ces informations."
        ),
        new Post(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut ajouter des matières."
        ),
        new Delete(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut supprimer des matières."
        ),
        new Patch(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut modifier des matières."
        )
    ],
    normalizationContext: [
        'groups' => ['matiere_read']
    ],
    denormalizationContext: [
        'groups' => ['matiere_write']
    ]
)]
class Matiere
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['matiere_read' , 'cours_read'])]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Groups(['matiere_read' , 'matiere_write' , 'cours_read'])]
    private ?string $Denomination = null;

    #[ORM\OneToMany(mappedBy: 'Matiere', targetEntity: Cours::class, orphanRemoval: true)]
    private Collection $cours;

    public function __construct()
    {
        $this->cours = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDenomination(): ?string
    {
        return $this->Denomination;
    }

    public function setDenomination(string $Denomination): self
    {
        $this->Denomination = $Denomination;

        return $this;
    }

    /**
     * @return Collection<int, Cours>
     */
    public function getCours(): Collection
    {
        return $this->cours;
    }

    public function addCour(Cours $cour): self
    {
        if (!$this->cours->contains($cour)) {
            $this->cours->add($cour);
            $cour->setMatiere($this);
        }

        return $this;
    }

    public function removeCour(Cours $cour): self
    {
        if ($this->cours->removeElement($cour)) {
            // set the owning side to null (unless already changed)
            if ($cour->getMatiere() === $this) {
                $cour->setMatiere(null);
            }
        }

        return $this;
    }
}
