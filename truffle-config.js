module.exports = {
  networks: {
    // Rede local (Ganache)
    development: {
      host: "127.0.0.1",     // Localhost
      port: 7545,            // Porta padrão do Ganache GUI
      network_id: "5777",    // ID padrão do Ganache
    }
  },

  // Configurações do Mocha (testes)
  mocha: {
    // timeout: 100000
  },

  // Compilador Solidity
  compilers: {
    solc: {
      version: "0.8.19",      // Versão do Solidity usada no contrato
    }
  }
};
