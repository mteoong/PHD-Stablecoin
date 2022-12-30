const { ethers, upgrades } = require("hardhat");

async function main() {
  const V1 = await ethers.getContractFactory("PHDTokenV1");
  const v1 = await upgrades.deployProxy(V1, [
    "PHD Coin",
    "MC",
    "PHD",
    6,
    "0xD2BD2253799A3351c65977dFEC5D08D03415a715",
    "0xD2BD2253799A3351c65977dFEC5D08D03415a715",
    "0xD2BD2253799A3351c65977dFEC5D08D03415a715",
    "0xD2BD2253799A3351c65977dFEC5D08D03415a715",
    0
  ]);
  await v1.deployed();
  console.log("V1 deployed to:", v1.address);
}

main();