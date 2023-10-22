import { PrismaClient } from "@prisma/client";
import { FastifyInstance, FastifyReply, FastifyRequest } from "fastify";
import { z } from "zod";

const empresaSchemaCreate = z.object({
    nm_fantasia: z.string(),
    cnpj: z.string(),
    email: z.string(),
    senha: z.string(),
    UF: z.string(),
    cidade: z.string(),
    rua: z.string(),
    numero: z.string(),
    complemento: z.string(),
});
const updateEmpresaSchema = z.object({
    nm_fantasia: z.string().optional(),
    email: z.string().optional(),
    senha: z.string().optional(),
    UF: z.string().optional(),
    cidade: z.string().optional(),
    rua: z.string().optional(),
    numero: z.string().optional(),
    complemento: z.string().optional(),
});

const prisma = new PrismaClient();

const empresaRoutes = async (fastify: FastifyInstance) => {
    fastify.get('/empresa', async (request: FastifyRequest, reply: FastifyReply) => {
        const empresa = await prisma.tb_empresa.findMany();
        reply.send(empresa);
    });

    fastify.get('/empresa/:id', async (request: FastifyRequest<{ Params: { id: string } }>, reply: FastifyReply) => {
        const empresaId = parseInt(request.params.id, 10);
        const empresa = await prisma.tb_empresa.findUnique({
            where: {
                id_empresa: empresaId
            }
        })
        reply.send(empresa);
    });
    // Outras rotas relacionadas a usuários podem ser definidas aqui
    fastify.post('/empresa', async (request: FastifyRequest, reply: FastifyReply) => {
        try {
            const empresaData = empresaSchemaCreate.parse(request.body);
            const novaEmpresa = await prisma.tb_empresa.create({
                data: empresaData,
            });
            reply.send(novaEmpresa);
            ''
        } catch (e) {
            console.log(e);
            reply.status(400).send('Erro de validação')
        }
    });
    fastify.put('/empresa/:id', async (request: FastifyRequest<{ Params: { id: string } }>, reply: FastifyReply) => {
        try {
            const empresaId = parseInt(request.params.id, 10);
            const empresaData = updateEmpresaSchema.parse(request.body);
            const empresa = await prisma.tb_empresa.update({
                where: {
                    id_empresa: empresaId
                },
                data: empresaData
            })
            reply.send(empresa);
        } catch (error) {
            console.error('Erro de validação ou de atualização:', error);
            reply.status(400).send('Erro de validação ou de atualização');
        }
    })
    fastify.delete('/empresa/:id', async (request: FastifyRequest<{ Params: { id: string } }>, reply: FastifyReply) => {
        const empresaId = parseInt(request.params.id, 10);
        const deletedEmpresa = await prisma.tb_empresa.delete({
            where: { id_empresa: empresaId },
        });

        reply.send({ message: 'Empresa excluída com sucesso', deletedEmpresa });
    })


    // ...outras rotas
};

export default empresaRoutes;