require("@nomicfoundation/hardhat-toolbox");
require('@openzeppelin/hardhat-upgrades');
require("@nomiclabs/hardhat-etherscan");

const GOERLI_API_KEY = "OePqh2PMkHm0pEqJJRaqjW1ASwKnHfjF";
const GOERLI_PRIVATE_KEY = "2e1e2cc4e364074a89c6c5083171ad52ae83f3fcf3ba4e7d2bc1eb62226bbca8";

const RINKEBY_API_KEY = "el5e3SpkGOL8i-XA3ZOw8tKHUryLC1zQ";
const RINKEBY_PRIVATE_KEY = "2e1e2cc4e364074a89c6c5083171ad52ae83f3fcf3ba4e7d2bc1eb62226bbca8";

const MAINNET_API_KEY = "dSZTVRWQ2dF7wSQztVQhoSde0VRNqrfq"
const MAINNET_PRIVATE_KEY = "2e1e2cc4e364074a89c6c5083171ad52ae83f3fcf3ba4e7d2bc1eb62226bbca8";

module.exports = {
  solidity: "0.8.15",
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${GOERLI_API_KEY}`,
      accounts: [`${GOERLI_PRIVATE_KEY}`]
    },
    rinkeby: {
      url: `https://eth-rinkeby.alchemyapi.io/v2/${RINKEBY_API_KEY}`,
      accounts: [`${RINKEBY_PRIVATE_KEY}`]
    },
    mainnet: {
      url: `https://eth-mainnet.g.alchemy.com/v2/${MAINNET_API_KEY}`,
      accounts: [`${MAINNET_PRIVATE_KEY}`]
    }
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: "MN2XJGUI53P31FR9QECHZWZ1QXRJ116XPS"
  }
};
