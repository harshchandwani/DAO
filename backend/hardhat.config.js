require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({ path: ".env" });

const MANTLE_DEPLOYMENT_URL = process.env.MANTLE_DEPLOYMENT_URL;

const PRIVATE_KEY = process.env.PRIVATE_KEY;
module.exports = {
  solidity: "0.8.9",
  defaultNetwork: "mantle-testnet",
  networks: {
    "mantle-testnet": {
      url: process.env.MANTLE_DEPLOYMENT_URL,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};