/*
  Warnings:

  - You are about to drop the column `tipo` on the `tb_empresa` table. All the data in the column will be lost.
  - You are about to drop the column `tipo` on the `tb_ponto` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `tb_empresa` DROP COLUMN `tipo`;

-- AlterTable
ALTER TABLE `tb_ponto` DROP COLUMN `tipo`;
