// server.js
const jsonServer = require('json-server');
const auth = require('json-server-auth');
const path = require('path');

const server = jsonServer.create();
const router = jsonServer.router(path.join(__dirname, 'db.json'));
const middlewares = jsonServer.defaults();

// Bind the router database
server.db = router.db;

server.use(middlewares);
// Opcional: rutas personalizadas de autorización
const rules = auth.rewriter({
  // Permisos: colección : código (ejemplo)
  users: 600,
  clientes: 664
});
server.use(rules);
server.use(auth);
server.use(router);

const port = process.env.PORT || 3000;
server.listen(port, () => {
  console.log(`JSON Server with auth is running on port ${port}`);
});
