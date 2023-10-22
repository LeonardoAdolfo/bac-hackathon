import fastify from 'fastify';
import empresaRoutes from './modules/empresa/userRoute';
import pontoRoutes from './modules/ponto/userRoute';

const app = fastify();

app.register(require("fastify-cors"),{
    origin: "*",
    allowedHeaders:[
        "X-Requested-With",
        "Content-Type",
        "Accept",
        "Origin",
        "Authorization",
    ]
});

// Registre as rotas relacionadas aos usuários
app.register(pontoRoutes);
app.register(empresaRoutes);

app.listen(3001, (err, address) => {
  if (err) throw err;
  console.log(`Server listening on ${address}`);
});





