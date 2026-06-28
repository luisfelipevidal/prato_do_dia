const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.json());

// Simulação de rota de login
app.post('/api/login', (req, res) => {
    const { email, senha } = req.body;
    if (email && senha) {
        res.status(200).json({ mensagem: "Login efetuado com sucesso!", token: "abc123xyz" });
    } else {
        res.status(400).json({ erro: "E-mail e senha são obrigatórios." });
    }
});

// Simulação de rota de ofertas
app.get('/api/caixas', (req, res) => {
    res.json([
        { id: 1, estabelecimento: "Padaria Central", descricao: "Kit Pães Diários", preco: 12.00, quantidade: 2 }
    ]);
});

app.listen(PORT, () => {
    console.log(`Servidor do PratoDoDia a correr na porta ${PORT}`);
});
