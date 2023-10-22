/*
  Warnings:

  - You are about to drop the column `id_endereco` on the `tb_empresa` table. All the data in the column will be lost.
  - You are about to drop the column `id_ponto` on the `tb_empresa` table. All the data in the column will be lost.
  - You are about to drop the column `id_endereco` on the `tb_usuario` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `tb_empresa` DROP FOREIGN KEY `tb_empresa_id_endereco_fkey`;

-- DropForeignKey
ALTER TABLE `tb_empresa` DROP FOREIGN KEY `tb_empresa_id_ponto_fkey`;

-- DropForeignKey
ALTER TABLE `tb_ponto` DROP FOREIGN KEY `tb_ponto_id_endereco_fkey`;

-- DropForeignKey
ALTER TABLE `tb_usuario` DROP FOREIGN KEY `tb_usuario_id_endereco_fkey`;

-- AlterTable
ALTER TABLE `tb_empresa` DROP COLUMN `id_endereco`,
    DROP COLUMN `id_ponto`;

-- AlterTable
ALTER TABLE `tb_usuario` DROP COLUMN `id_endereco`;
