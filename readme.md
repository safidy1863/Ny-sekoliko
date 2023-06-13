# Ny Sekoliko

## API Reference

#### Get all Etudiants

```http
  GET /api/etudiants
```

#### Get Etudiants

```http
  GET /api/etudiants/{id}
```
| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of the etudiant  |

#### Get Etudiant (recherche)

```http
  GET /api/etudiants?Propriété=valeur&Propriété=valeur
```

| Parameter  | Description                       |
| :--------  | :-------------------------------- |
| `Propriété`| Attribut à rechercher ex: Nom     |
| `valeur`   | valeur du champ                   |

Valeur possible de propriété: Matricule, Nom, Prénom
Déjà trier par matricule

#### Delete Etudiant

```http
  DELETE /api/etudiants/{id}
```
  
| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of the etudiant  |

#### Modifier Etudiant

```http
  PATCH /api/etudiants/{id}
```
  
| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of the etudiant  |

#### Get all Classes

```http
  GET /api/classes
```

#### Get Classe

```http
  GET /api/classes/{id}
```
| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of the classes   |

#### Get classes (recherche)

```http
  GET /api/classes?Propriété=valeur&Propriété=valeur
```

| Parameter  | Description                       |
| :--------  | :-------------------------------- |
| `Propriété`| Attribut à rechercher ex: Nom     |
| `valeur`   | valeur du champ                   |

Valeur possible de propriété: Niveau, Parcours, Groupe

#### Delete classe

```http
  DELETE /api/classes/{id}
```
  
| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of the classe    |

#### Modifier classe

```http
  PATCH /api/classes/{id}
```
  
| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of the classe    |
