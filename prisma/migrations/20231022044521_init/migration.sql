/*
  Warnings:

  - You are about to drop the `tb_usuario` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `id_empresa` to the `tb_ponto` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `tb_ponto` ADD COLUMN `id_empresa` INTEGER NOT NULL;

-- DropTable
DROP TABLE `tb_usuario`;

-- AddForeignKey
ALTER TABLE `tb_ponto` ADD CONSTRAINT `tb_ponto_id_empresa_fkey` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa`(`id_empresa`) ON DELETE RESTRICT ON UPDATE CASCADE;
