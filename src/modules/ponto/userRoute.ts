// routes/userRoutes.ts

import { FastifyInstance, FastifyReply, FastifyRequest } from 'fastify';
import { PrismaClient } from '@prisma/client';
import { z } from 'zod';

const pontoSchemaCreate = z.object({
  nm_ponto: z.string(),
  UF: z.string(),       
  cidade: z.string(),      
  rua: z.string(),         
  numero: z.string(),     
  complemento: z.string(),
  id_empresa: z.number()
});

const updatePontoSchema = z.object({
  nm_ponto: z.string().optional(),
  UF: z.string().optional(),       
  cidade: z.string().optional(),      
  rua: z.string().optional(),         
  numero: z.string().optional(),     
  complemento: z.string().optional(),
  id_empresa: z.number().optional()
})

const prisma = new PrismaClient();

const pontoRoutes = async (fastify: FastifyInstance) => {
  fastify.get('/ponto', async (request: FastifyRequest, reply: FastifyReply) => {
    const pontos = await prisma.tb_ponto.findMany();
    reply.send(pontos);
  });
  fastify.get('/ponto/:id', async (request: FastifyRequest<{Params: { id: string }}>, reply: FastifyReply) => {
    const pontoId = parseInt(request.params.id, 10);
    const ponto = await prisma.tb_ponto.findUnique({
        where: {
          id_ponto: pontoId
        }
    })
    reply.send(ponto);
  });
  // Outras rotas relacionadas a usuários podem ser definidas aqui
  fastify.post('/ponto', async (request: FastifyRequest,reply: FastifyReply) => {
    try{
    const pontoData = pontoSchemaCreate.parse(request.body);
    const novoPonto = await prisma.tb_ponto.create({
        data: pontoData,
    });
    reply.send(novoPonto);
''} catch(e){
    console.log(e);
    reply.status(400).send('Erro de validação')
} });
  fastify.put('/ponto/:id', async (request: FastifyRequest<{Params: { id: string }}>, reply: FastifyReply) => {
    try {
        const pontoId = parseInt(request.params.id, 10);
        const pontoData = updatePontoSchema.parse(request.body);
        const ponto = await prisma.tb_ponto.update({
            where: {
                id_ponto: pontoId
            },
            data: pontoData
        })
        reply.send(ponto);
    }catch (error) {
        console.error('Erro de validação ou de atualização:', error);
        reply.status(400).send('Erro de validação ou de atualização');
    }
  })
  fastify.delete('/ponto/:id', async (request: FastifyRequest<{Params: { id: string }}>, reply: FastifyReply) => {
    const pontoId = parseInt(request.params.id, 10);
    const deletedPonto = await prisma.tb_ponto.delete({
        where: { id_ponto: pontoId },
      });
    
      reply.send({ message: 'Ponto excluída com sucesso', deletedPonto });
  })
  // ...outras rotas
};

export default pontoRoutes;
