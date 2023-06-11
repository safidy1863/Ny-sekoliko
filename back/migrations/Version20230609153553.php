<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230609153553 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE suivi ADD etudiants_id INT NOT NULL');
        $this->addSql('ALTER TABLE suivi ADD CONSTRAINT FK_2EBCCA8FA873A5C6 FOREIGN KEY (etudiants_id) REFERENCES etudiant (id)');
        $this->addSql('CREATE INDEX IDX_2EBCCA8FA873A5C6 ON suivi (etudiants_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE suivi DROP FOREIGN KEY FK_2EBCCA8FA873A5C6');
        $this->addSql('DROP INDEX IDX_2EBCCA8FA873A5C6 ON suivi');
        $this->addSql('ALTER TABLE suivi DROP etudiants_id');
    }
}
