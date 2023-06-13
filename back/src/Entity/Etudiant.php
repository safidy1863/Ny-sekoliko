<?php

namespace App\Entity;

use ApiPlatform\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Metadata\ApiFilter;
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
use Symfony\Component\Validator\Constraints as Assert;
use App\State\UserPasswordHasher;

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
            processor: UserPasswordHasher::class,
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut ajouter des étudiants.",
            validationContext: ['groups' => 'post_validation']
        ),
        new Delete(
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut supprimer des étudiants."
        ),
        new Patch(
            processor: UserPasswordHasher::class,
            security: "is_granted('ROLE_ADMIN')",
            securityMessage: "Seul l'administrateur peut modifier des étudiants."
        )
    ], 
    normalizationContext: [
        "groups" => ["etudiant_read"]
    ],
    denormalizationContext: [
        "groups" => ["etudiant_write"]
    ],
    collectDenormalizationErrors: true
)]
#[ApiFilter(SearchFilter::class, properties: ['Matricule' => 'exact', 'Nom' => 'start', 'Prenom' => 'start'])]
#[ApiFilter(OrderFilter::class, properties: ['Matricule' => 'ASC'])]
class Etudiant implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['etudiant_read'])]
    private ?int $id = null;

    #[ORM\Column(length: 180, unique: true)]
    #[Groups(['etudiant_read' , "etudiant_write"])]
    #[Assert\NotBlank(message: "Veuillez renseigner l'email", groups: ['post_validation'])]
    private ?string $email = null;

    #[ORM\Column]
    #[Groups(['etudiant_write'])]
    private array $roles = [];

    /**
     * @var string The hashed password
     */
    #[ORM\Column]
    #[Groups(['etudiant_write'])]
    #[Assert\NotBlank(message: "Veuillez renseigner le mot de passe", groups: ['post_validation'])]
    #[Assert\Length(min:6, minMessage:"Le mot de passe doit contenir au moins 6 caractères")]
    private ?string $password = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write" , "suivi_read" , 'classe_read' , 'cours_read'])]
    #[Assert\NotBlank(message: "Veuillez renseigner le matricule", groups: ['post_validation'])]
    #[Assert\Length(min:4, minMessage:"Le mot de passe doit contenir au moins 4 caractères")]
    private ?string $Matricule = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write" , "suivi_read" , 'classe_read' , 'cours_read'])]
    #[Assert\NotBlank(message: "Veuillez renseigner le nom", groups: ['post_validation'])]
    private ?string $Nom = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write" , "suivi_read" , 'classe_read' , 'cours_read'])]
    #[Assert\NotBlank(message: "Veuillez renseigner le prénom", groups: ['post_validation'])]
    private ?string $Prenom = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write"])]
    #[Assert\NotBlank(message: "Veuillez renseigner l'adresse", groups: ['post_validation'])]
    private ?string $Adresse = null;

    #[ORM\Column(length: 255)]
    #[Groups(['etudiant_read' , "etudiant_write" , 'cours_read'])]
    #[Assert\NotBlank(message: "Veuillez renseigner le telephone", groups: ['post_validation'])]
    private ?string $Telephone = null;

    #[ORM\ManyToOne(inversedBy: 'Etudiants')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['etudiant_read' , "etudiant_write"])]
    #[Assert\NotBlank(message: "Veuillez renseigner la classe", groups: ['post_validation'])]
    private ?Classe $Classe = null;

    #[ORM\OneToMany(mappedBy: 'Etudiants', targetEntity: Suivi::class, orphanRemoval: true)]
    private Collection $suivis;

    public function __construct()
    {
        $this->suivis = new ArrayCollection();
    }

    #[Groups(['etudiant_read'])]
    public function getPrésence():int {
        return array_reduce($this->suivis->toArray(),function($total, $suivis){
            if($suivis->isAbsent() === true){
                return $total + 1;
            }
            return $total;
        }, 0);
    }

    #[Groups(['etudiant_read'])]
    public function getAbscence(){
        return array_reduce($this->suivis->toArray(),function($total, $suivis){
            if($suivis->isAbsent() === false){
                return $total + 1;
            }
            return $total;
        }, 0);
    }

    #[Groups(['etudiant_read'])]
    public function getNomComplet(){
        return $this->Nom . $this->Prenom;
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
