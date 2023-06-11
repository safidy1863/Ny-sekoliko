<?php

namespace App\Entity;

use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\Post;
use ApiPlatform\Metadata\Patch;
use ApiPlatform\Metadata\Delete;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Metadata\ApiResource;
use App\Repository\EtudiantRepository;
use ApiPlatform\Metadata\GetCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;

#[ORM\Entity(repositoryClass: EtudiantRepository::class)]
#[ApiResource(
    operations: [
        new Get(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur et les délégués peuvent avoir accès à ces informations."
        ),
        new GetCollection(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur et les délégués peuvent avoir accès à ces informations."
        ),
        new Post(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut ajouter des étudiants."
        ),
        new Delete(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut supprimer des étudiants."
        ),
        new Patch(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut modifier des étudiants."
        )
    ], 
    normalizationContext: [
        "groups" => ["etudiant_read"]
    ],
    denormalizationContext: [
        "groups" => ["etudiant_write"]
    ]
)]
class Etudiant implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['etudiant_read'])]
    private ?int $id = null;

    #[ORM\Column(length: 180, unique: true)]
    #[Groups(['etudiant_read' , "etudiant_write"])]
    private ?string $email = null;

    #[ORM\Column]
    #[Groups(['etudiant_write'])]
    private array $roles = [];

    /**
     * @var string The hashed password
     */
    #[ORM\Column]
    #[Groups(['etudiant_write'])]
    private ?string $password = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write" , "suivi_read" , 'classe_read'])]
    private ?string $Matricule = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write" , "suivi_read" , 'classe_read'])]
    private ?string $Nom = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write" , "suivi_read" , 'classe_read'])]
    private ?string $Prenom = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write"])]
    private ?string $Adresse = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write"])]
    private ?string $Telephone = null;

    #[ORM\ManyToOne(inversedBy: 'Etudiants')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['etudiant_read' , "etudiant_write"])]
    private ?Classe $Classe = null;

    #[ORM\OneToMany(mappedBy: 'Etudiants', targetEntity: Suivi::class, orphanRemoval: true)]
    private Collection $suivis;

    public function __construct()
    {
        $this->suivis = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_ETUDIANT
        $roles[] = 'ROLE_ETUDIANT';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getMatricule(): ?string
    {
        return $this->Matricule;
    }

    public function setMatricule(string $Matricule): self
    {
        $this->Matricule = $Matricule;

        return $this;
    }

    public function getNom(): ?string
    {
        return $this->Nom;
    }

    public function setNom(string $Nom): self
    {
        $this->Nom = $Nom;

        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->Prenom;
    }

    public function setPrenom(string $Prenom): self
    {
        $this->Prenom = $Prenom;

        return $this;
    }

    public function getAdresse(): ?string
    {
        return $this->Adresse;
    }

    public function setAdresse(string $Adresse): self
    {
        $this->Adresse = $Adresse;

        return $this;
    }

    public function getTelephone(): ?string
    {
        return $this->Telephone;
    }

    public function setTelephone(string $Telephone): self
    {
        $this->Telephone = $Telephone;

        return $this;
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
            $suivi->setEtudiants($this);
        }

        return $this;
    }

    public function removeSuivi(Suivi $suivi): self
    {
        if ($this->suivis->removeElement($suivi)) {
            // set the owning side to null (unless already changed)
            if ($suivi->getEtudiants() === $this) {
                $suivi->setEtudiants(null);
            }
        }

        return $this;
    }
}
