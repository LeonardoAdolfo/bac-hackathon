-- CreateTable
CREATE TABLE `tb_usuario` (
    `id_user` INTEGER NOT NULL AUTO_INCREMENT,
    `id_endereco` INTEGER NOT NULL,
    `nm_user` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `tb_usuario_id_endereco_key`(`id_endereco`),
    UNIQUE INDEX `tb_usuario_email_key`(`email`),
    PRIMARY KEY (`id_user`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_empresa` (
    `id_empresa` INTEGER NOT NULL AUTO_INCREMENT,
    `nm_fantasia` VARCHAR(191) NOT NULL,
    `cnpj` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `id_endereco` INTEGER NOT NULL,
    `id_ponto` INTEGER NOT NULL,

    UNIQUE INDEX `tb_empresa_cnpj_key`(`cnpj`),
    UNIQUE INDEX `tb_empresa_id_endereco_key`(`id_endereco`),
    UNIQUE INDEX `tb_empresa_id_ponto_key`(`id_ponto`),
    PRIMARY KEY (`id_empresa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_ponto` (
    `id_ponto` INTEGER NOT NULL AUTO_INCREMENT,
    `nm_ponto` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `id_endereco` INTEGER NOT NULL,

    UNIQUE INDEX `tb_ponto_id_endereco_key`(`id_endereco`),
    PRIMARY KEY (`id_ponto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_endereco` (
    `id_endereco` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo` INTEGER NOT NULL,
    `UF` VARCHAR(191) NOT NULL,
    `cidade` VARCHAR(191) NOT NULL,
    `rua` VARCHAR(191) NOT NULL,
    `numero` VARCHAR(191) NOT NULL,
    `complemento` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_endereco`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `tb_usuario` ADD CONSTRAINT `tb_usuario_id_endereco_fkey` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco`(`id_endereco`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tb_empresa` ADD CONSTRAINT `tb_empresa_id_endereco_fkey` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco`(`id_endereco`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tb_empresa` ADD CONSTRAINT `tb_empresa_id_ponto_fkey` FOREIGN KEY (`id_ponto`) REFERENCES `tb_ponto`(`id_ponto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tb_ponto` ADD CONSTRAINT `tb_ponto_id_endereco_fkey` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco`(`id_endereco`) ON DELETE RESTRICT ON UPDATE CASCADE;
