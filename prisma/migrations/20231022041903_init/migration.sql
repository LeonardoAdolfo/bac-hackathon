/*
  Warnings:

  - You are about to drop the column `id_endereco` on the `tb_ponto` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `tb_ponto_id_endereco_key` ON `tb_ponto`;

-- AlterTable
ALTER TABLE `tb_ponto` DROP COLUMN `id_endereco`;
