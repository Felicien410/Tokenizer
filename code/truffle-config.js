require('dotenv').config();
const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  networks: {
    bscTestnet: {
      provider: () => new HDWalletProvider(
        process.env.MNEMONIC,
        'https://data-seed-prebsc-1-s1.binance.org:8545'
      ),
      network_id: 97,
      confirmations: 10,
      timeoutBlocks: 200,
      skipDryRun: true
    },
  },
  compilers: {
    solc: {
      version: "0.8.28",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    }
  }
};