/*
  Warnings:

  - You are about to drop the `tb_endereco` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `UF` to the `tb_empresa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cidade` to the `tb_empresa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `complemento` to the `tb_empresa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numero` to the `tb_empresa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rua` to the `tb_empresa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipo` to the `tb_empresa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `UF` to the `tb_ponto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cidade` to the `tb_ponto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `complemento` to the `tb_ponto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numero` to the `tb_ponto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rua` to the `tb_ponto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipo` to the `tb_ponto` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `tb_empresa` ADD COLUMN `UF` VARCHAR(191) NOT NULL,
    ADD COLUMN `cidade` VARCHAR(191) NOT NULL,
    ADD COLUMN `complemento` VARCHAR(191) NOT NULL,
    ADD COLUMN `numero` VARCHAR(191) NOT NULL,
    ADD COLUMN `rua` VARCHAR(191) NOT NULL,
    ADD COLUMN `tipo` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `tb_ponto` ADD COLUMN `UF` VARCHAR(191) NOT NULL,
    ADD COLUMN `cidade` VARCHAR(191) NOT NULL,
    ADD COLUMN `complemento` VARCHAR(191) NOT NULL,
    ADD COLUMN `numero` VARCHAR(191) NOT NULL,
    ADD COLUMN `rua` VARCHAR(191) NOT NULL,
    ADD COLUMN `tipo` INTEGER NOT NULL;

-- DropTable
DROP TABLE `tb_endereco`;
